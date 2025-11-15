# Generate-ReleaseNotes.ps1
# Fully automated script to generate iteration release notes for Buses team
# Uses Azure DevOps REST API to query work items and generate summaries

param(
    [string]$ProjectName = "OS",
    [string]$TeamName = "ft_buses",
    [string]$Organization = "",
    [string]$PAT = "",
    [string]$OutputDir = ".\output",
    [switch]$UseCurrentIteration = $false,
    [string]$SpecificIteration = ""
)

# Configuration
$AreaPaths = @(
    "OS\Core\Connectivity Platform\Buses",
    "OS\Core\Connectivity Platform\Sensors"
)

Write-Host "=== Automated Iteration Release Notes Generator ===" -ForegroundColor Cyan
Write-Host "Project: $ProjectName" -ForegroundColor Yellow
Write-Host "Team: $TeamName" -ForegroundColor Yellow
Write-Host ""

# Create output directory if it doesn't exist
if (-not (Test-Path $OutputDir)) {
    New-Item -ItemType Directory -Path $OutputDir | Out-Null
    Write-Host "Created output directory: $OutputDir" -ForegroundColor Green
}

# Generate timestamp for output files
$timestamp = Get-Date -Format "yyyy-MM-dd_HHmmss"

# Get Azure DevOps credentials from environment or parameters
if ([string]::IsNullOrEmpty($Organization)) {
    $Organization = $env:AZURE_DEVOPS_ORG
    if ([string]::IsNullOrEmpty($Organization)) {
        Write-Host "ERROR: Azure DevOps organization not specified!" -ForegroundColor Red
        Write-Host "Please provide via -Organization parameter or set AZURE_DEVOPS_ORG environment variable" -ForegroundColor Yellow
        exit 1
    }
}

if ([string]::IsNullOrEmpty($PAT)) {
    $PAT = $env:AZURE_DEVOPS_PAT
    if ([string]::IsNullOrEmpty($PAT)) {
        Write-Host "ERROR: Azure DevOps Personal Access Token (PAT) not specified!" -ForegroundColor Red
        Write-Host "Please provide via -PAT parameter or set AZURE_DEVOPS_PAT environment variable" -ForegroundColor Yellow
        Write-Host ""
        Write-Host "To create a PAT:" -ForegroundColor Cyan
        Write-Host "1. Go to https://dev.azure.com/$Organization/_usersSettings/tokens" -ForegroundColor Gray
        Write-Host "2. Create a new token with 'Work Items (Read)' and 'Code (Read)' scopes" -ForegroundColor Gray
        Write-Host "3. Set it as environment variable: `$env:AZURE_DEVOPS_PAT = 'your-pat-here'" -ForegroundColor Gray
        exit 1
    }
}

# Create authorization header
$encodedPAT = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$PAT"))
$headers = @{
    "Authorization" = "Basic $encodedPAT"
    "Content-Type" = "application/json"
}

$baseUrl = "https://dev.azure.com/$Organization"

# Function to invoke Azure DevOps REST API
function Invoke-ADORestAPI {
    param(
        [string]$Uri,
        [string]$Method = "GET",
        [object]$Body = $null
    )
    
    try {
        $params = @{
            Uri = $Uri
            Method = $Method
            Headers = $headers
        }
        
        if ($Body) {
            $params.Body = ($Body | ConvertTo-Json -Depth 10)
        }
        
        $response = Invoke-RestMethod @params
        return $response
    }
    catch {
        Write-Host "ERROR calling API: $Uri" -ForegroundColor Red
        Write-Host $_.Exception.Message -ForegroundColor Red
        return $null
    }
}

# Step 1: Get iteration information
Write-Host "Step 1: Querying iteration information..." -ForegroundColor Cyan

$iterationsUrl = "$baseUrl/$ProjectName/$TeamName/_apis/work/teamsettings/iterations?api-version=7.1-preview.1"
$iterations = Invoke-ADORestAPI -Uri $iterationsUrl

if (-not $iterations) {
    Write-Host "ERROR: Failed to retrieve iterations" -ForegroundColor Red
    exit 1
}

# Find the appropriate iteration
$targetIteration = $null
if ($SpecificIteration) {
    $targetIteration = $iterations.value | Where-Object { $_.name -eq $SpecificIteration }
    if (-not $targetIteration) {
        Write-Host "ERROR: Specified iteration '$SpecificIteration' not found" -ForegroundColor Red
        exit 1
    }
}
elseif ($UseCurrentIteration) {
    # Get current iteration
    $now = Get-Date
    $targetIteration = $iterations.value | Where-Object {
        $start = [DateTime]$_.attributes.startDate
        $end = [DateTime]$_.attributes.finishDate
        $now -ge $start -and $now -le $end
    } | Select-Object -First 1
}
else {
    # Get the most recently completed iteration
    $now = Get-Date
    $targetIteration = $iterations.value | Where-Object {
        $end = [DateTime]$_.attributes.finishDate
        $end -lt $now
    } | Sort-Object { [DateTime]$_.attributes.finishDate } -Descending | Select-Object -First 1
}

if (-not $targetIteration) {
    Write-Host "ERROR: No suitable iteration found" -ForegroundColor Red
    exit 1
}

$iterationInfo = @{
    iterationId = $targetIteration.id
    iterationName = $targetIteration.name
    iterationPath = $targetIteration.path
    startDate = $targetIteration.attributes.startDate
    endDate = $targetIteration.attributes.finishDate
    project = $ProjectName
    team = $TeamName
}

$iterationInfoPath = Join-Path $OutputDir "iteration-info.json"
$iterationInfo | ConvertTo-Json -Depth 10 | Out-File $iterationInfoPath -Encoding utf8

Write-Host "Found iteration: $($iterationInfo.iterationName)" -ForegroundColor Green
Write-Host "  Start: $($iterationInfo.startDate)" -ForegroundColor Gray
Write-Host "  End: $($iterationInfo.endDate)" -ForegroundColor Gray
Write-Host ""

# Step 2: Query completed work items
Write-Host "Step 2: Querying completed work items..." -ForegroundColor Cyan

# Build WIQL query
$areaPathConditions = ($AreaPaths | ForEach-Object { "[System.AreaPath] UNDER '$_'" }) -join " OR "
$wiql = @"
SELECT [System.Id], [System.Title], [System.WorkItemType], [System.State], [System.AreaPath], [System.Description]
FROM WorkItems
WHERE ($areaPathConditions)
AND (
    [System.IterationPath] UNDER '$($iterationInfo.iterationPath)'
    OR (
        [System.State] IN ('Closed', 'Done', 'Completed')
        AND [Microsoft.VSTS.Common.ClosedDate] >= '$($iterationInfo.startDate)'
        AND [Microsoft.VSTS.Common.ClosedDate] <= '$($iterationInfo.endDate)'
    )
)
AND [System.State] IN ('Closed', 'Done', 'Completed')
ORDER BY [System.Id]
"@

$wiqlQuery = @{
    query = $wiql
}

$wiqlUrl = "$baseUrl/$ProjectName/_apis/wit/wiql?api-version=7.1-preview.2"
$wiqlResult = Invoke-ADORestAPI -Uri $wiqlUrl -Method POST -Body $wiqlQuery

if (-not $wiqlResult -or -not $wiqlResult.workItems) {
    Write-Host "No work items found for the specified criteria" -ForegroundColor Yellow
    $workItemsData = @{
        iterationName = $iterationInfo.iterationName
        startDate = $iterationInfo.startDate
        endDate = $iterationInfo.endDate
        workItems = @()
    }
}
else {
    $workItemIds = $wiqlResult.workItems | ForEach-Object { $_.id }
    Write-Host "Found $($workItemIds.Count) work items" -ForegroundColor Green
    
    # Get detailed work item information in batches
    $batchSize = 200
    $allWorkItems = @()
    
    for ($i = 0; $i -lt $workItemIds.Count; $i += $batchSize) {
        $batchIds = $workItemIds[$i..[Math]::Min($i + $batchSize - 1, $workItemIds.Count - 1)]
        $idsParam = $batchIds -join ","
        
        $workItemsUrl = "$baseUrl/$ProjectName/_apis/wit/workitems?ids=$idsParam&`$expand=relations&api-version=7.1-preview.3"
        $workItemsBatch = Invoke-ADORestAPI -Uri $workItemsUrl
        
        if ($workItemsBatch -and $workItemsBatch.value) {
            $allWorkItems += $workItemsBatch.value
        }
    }
    
    Write-Host "Retrieved details for $($allWorkItems.Count) work items" -ForegroundColor Green
    
    # Process work items and get linked PRs
    $processedWorkItems = @()
    $prCache = @{}
    
    foreach ($wi in $allWorkItems) {
        Write-Host "  Processing work item $($wi.id)..." -ForegroundColor Gray
        
        $workItem = @{
            id = $wi.id
            title = $wi.fields.'System.Title'
            type = $wi.fields.'System.WorkItemType'
            state = $wi.fields.'System.State'
            areaPath = $wi.fields.'System.AreaPath'
            description = if ($wi.fields.'System.Description') { $wi.fields.'System.Description' } else { "" }
            pullRequests = @()
        }
        
        # Find linked pull requests
        if ($wi.relations) {
            $prLinks = $wi.relations | Where-Object { 
                $_.rel -eq 'ArtifactLink' -and $_.url -match 'vstfs:///Git/PullRequestId/'
            }
            
            foreach ($prLink in $prLinks) {
                # Extract PR ID from artifact link
                if ($prLink.url -match 'vstfs:///Git/PullRequestId/([^/]+)/([^/]+)/([^/]+)') {
                    $prProjectId = $matches[1]
                    $prRepoId = $matches[2]
                    $prId = $matches[3]
                    
                    $cacheKey = "$prProjectId-$prRepoId-$prId"
                    
                    if (-not $prCache.ContainsKey($cacheKey)) {
                        # Get PR details
                        $prUrl = "$baseUrl/$ProjectName/_apis/git/repositories/$prRepoId/pullrequests/$prId`?api-version=7.1-preview.1"
                        $pr = Invoke-ADORestAPI -Uri $prUrl
                        
                        if ($pr) {
                            # Get repository name
                            $repoUrl = "$baseUrl/$ProjectName/_apis/git/repositories/$prRepoId`?api-version=7.1-preview.1"
                            $repo = Invoke-ADORestAPI -Uri $repoUrl
                            
                            $prInfo = @{
                                id = $pr.pullRequestId
                                title = $pr.title
                                description = if ($pr.description) { $pr.description } else { "" }
                                repository = if ($repo) { $repo.name } else { "Unknown" }
                                sourceBranch = $pr.sourceRefName -replace 'refs/heads/', ''
                                targetBranch = $pr.targetRefName -replace 'refs/heads/', ''
                            }
                            
                            $prCache[$cacheKey] = $prInfo
                        }
                    }
                    
                    if ($prCache.ContainsKey($cacheKey)) {
                        $workItem.pullRequests += $prCache[$cacheKey]
                    }
                }
            }
        }
        
        $processedWorkItems += $workItem
    }
    
    $workItemsData = @{
        iterationName = $iterationInfo.iterationName
        startDate = $iterationInfo.startDate
        endDate = $iterationInfo.endDate
        workItems = $processedWorkItems
    }
}

$workItemsPath = Join-Path $OutputDir "work-items-with-prs.json"
$workItemsData | ConvertTo-Json -Depth 10 | Out-File $workItemsPath -Encoding utf8

Write-Host "Saved work items data to $workItemsPath" -ForegroundColor Green
Write-Host ""

# Step 3: Generate internal summary
Write-Host "Step 3: Generating internal summary..." -ForegroundColor Cyan

$internalSummaryPath = Join-Path $OutputDir "internal-summary-$timestamp.md"
$internalSummary = @"
# Iteration Summary: $($iterationInfo.iterationName)

**Period:** $($iterationInfo.startDate) to $($iterationInfo.endDate)
**Team:** $TeamName
**Areas:** Buses & Sensors

## Executive Summary

- Total work items completed: $($workItemsData.workItems.Count)
- Breakdown by type:
$(($workItemsData.workItems | Group-Object type | ForEach-Object { "  - $($_.Name): $($_.Count)" }) -join "`n")
- Breakdown by area:
$(($workItemsData.workItems | Group-Object { $_.areaPath -replace '.*\\', '' } | ForEach-Object { "  - $($_.Name): $($_.Count)" }) -join "`n")

## Completed Work Items

### Buses Component

$(
$busesItems = $workItemsData.workItems | Where-Object { $_.areaPath -like '*\Buses' }
if ($busesItems) {
    ($busesItems | ForEach-Object {
@"
#### [$($_.id)] $($_.title)

**Type:** $($_.type) | **State:** $($_.state)

**Description:**
$($_.description)

**Pull Requests:**
$(if ($_.pullRequests.Count -gt 0) {
    ($_.pullRequests | ForEach-Object { 
        $prDesc = if ($_.description) { "`n  *Description:* $($_.description)" } else { "" }
        "- **PR #$($_.id):** $($_.title) [$($_.repository)]$prDesc"
    }) -join "`n"
} else {
    "No linked pull requests"
})

---
"@
    }) -join "`n`n"
} else {
    "No work items completed in Buses component."
}
)

### Sensors Component

$(
$sensorsItems = $workItemsData.workItems | Where-Object { $_.areaPath -like '*\Sensors' }
if ($sensorsItems) {
    ($sensorsItems | ForEach-Object {
@"
#### [$($_.id)] $($_.title)

**Type:** $($_.type) | **State:** $($_.state)

**Description:**
$($_.description)

**Pull Requests:**
$(if ($_.pullRequests.Count -gt 0) {
    ($_.pullRequests | ForEach-Object { 
        $prDesc = if ($_.description) { "`n  *Description:* $($_.description)" } else { "" }
        "- **PR #$($_.id):** $($_.title) [$($_.repository)]$prDesc"
    }) -join "`n"
} else {
    "No linked pull requests"
})

---
"@
    }) -join "`n`n"
} else {
    "No work items completed in Sensors component."
}
)

## Technical Highlights

### Major Features Implemented
$(
$features = $workItemsData.workItems | Where-Object { $_.type -in @('User Story', 'Feature') }
if ($features) {
    ($features | ForEach-Object { "- [$($_.id)] $($_.title)" }) -join "`n"
} else {
    "- No major features in this iteration"
}
)

### Critical Bugs Fixed
$(
$bugs = $workItemsData.workItems | Where-Object { $_.type -eq 'Bug' }
if ($bugs) {
    ($bugs | ForEach-Object { "- [$($_.id)] $($_.title)" }) -join "`n"
} else {
    "- No critical bugs fixed in this iteration"
}
)

## Pull Request Summary

- Total PRs merged: $(($workItemsData.workItems | ForEach-Object { $_.pullRequests } | Measure-Object).Count)
- Most active repositories:
$(
$prsByRepo = $workItemsData.workItems | ForEach-Object { $_.pullRequests } | Group-Object repository
if ($prsByRepo) {
    ($prsByRepo | Sort-Object Count -Descending | Select-Object -First 5 | ForEach-Object { "  - $($_.Name): $($_.Count) PRs" }) -join "`n"
} else {
    "  - No PR data available"
}
)

## Notes

This summary was automatically generated from Azure DevOps work item data.
Please review and enhance with additional context as needed.

---
*Generated on $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")*
"@

$internalSummary | Out-File $internalSummaryPath -Encoding utf8
Write-Host "Generated internal summary: $internalSummaryPath" -ForegroundColor Green
Write-Host ""

# Step 4: Generate Windows Insider release notes
Write-Host "Step 4: Generating Windows Insider release notes..." -ForegroundColor Cyan

$insiderNotesPath = Join-Path $OutputDir "insider-release-notes-$timestamp.md"
$insiderNotes = @"
# What's New in Buses & Sensors - $($iterationInfo.iterationName)

## Overview

This release includes $($workItemsData.workItems.Count) improvements to Windows connectivity and sensor capabilities, focusing on enhanced reliability, performance, and user experience.

## New Features

$(
$features = $workItemsData.workItems | Where-Object { $_.type -in @('User Story', 'Feature') }
if ($features) {
    ($features | ForEach-Object {
        $title = $_.title
        $desc = if ($_.description) { 
            # Strip HTML tags and get first few sentences
            $cleanDesc = $_.description -replace '<[^>]+>', '' -replace '\s+', ' '
            if ($cleanDesc.Length -gt 200) {
                $cleanDesc.Substring(0, 197) + "..."
            } else {
                $cleanDesc
            }
        } else { 
            "Enhanced functionality in the connectivity platform." 
        }
@"
### $title

$desc

"@
    }) -join "`n"
} else {
    "No new features in this release."
}
)

## Improvements

$(
$tasks = $workItemsData.workItems | Where-Object { $_.type -eq 'Task' }
if ($tasks) {
    ($tasks | ForEach-Object { "- $($_.title)" }) -join "`n"
} else {
    "- General stability and performance improvements"
}
)

## Bug Fixes

$(
$bugs = $workItemsData.workItems | Where-Object { $_.type -eq 'Bug' }
if ($bugs) {
    ($bugs | ForEach-Object { 
        $title = $_.title
        $desc = if ($_.description) {
            $cleanDesc = $_.description -replace '<[^>]+>', '' -replace '\s+', ' '
            if ($cleanDesc.Length -gt 150) {
                $cleanDesc.Substring(0, 147) + "..."
            } else {
                $cleanDesc
            }
        } else {
            "Resolved an issue affecting system reliability."
        }
@"
### $title

$desc

"@
    }) -join "`n"
} else {
    "No major bug fixes in this release."
}
)

## For Developers

### API Changes

Please review the work items and pull requests for detailed information about any API changes or new capabilities.

### Work Items Included

$(($workItemsData.workItems | ForEach-Object { "- Work Item $($_.id): $($_.title)" }) -join "`n")

---

**Note:** These features are available to Windows Insiders in the latest builds.

For more information about the Windows Insider Program, visit [https://insider.windows.com](https://insider.windows.com)

---
*Generated on $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")*
"@

$insiderNotes | Out-File $insiderNotesPath -Encoding utf8
Write-Host "Generated Windows Insider release notes: $insiderNotesPath" -ForegroundColor Green
Write-Host ""

Write-Host "=== Generation Complete ===" -ForegroundColor Green
Write-Host "Output files are in: $OutputDir" -ForegroundColor Yellow
Write-Host ""
Write-Host "Files generated:" -ForegroundColor Cyan
Write-Host "  - iteration-info.json (iteration metadata)" -ForegroundColor Gray
Write-Host "  - work-items-with-prs.json (raw data)" -ForegroundColor Gray
Write-Host "  - internal-summary-$timestamp.md (engineering summary)" -ForegroundColor Gray
Write-Host "  - insider-release-notes-$timestamp.md (public release notes)" -ForegroundColor Gray
Write-Host ""
Write-Host "Review the documents and enhance with additional context as needed." -ForegroundColor Yellow
