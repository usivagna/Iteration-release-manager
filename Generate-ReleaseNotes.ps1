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
    [string]$SpecificIteration = "",
    [switch]$UseAI = $true
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
            # Debug: Show all relation types for first few items
            $prLinks = $wi.relations | Where-Object { 
                $_.rel -eq 'ArtifactLink' -and $_.url -match 'vstfs:///Git/PullRequestId/'
            }
            
            if ($prLinks.Count -gt 0) {
                Write-Host "    Found $($prLinks.Count) PR link(s)" -ForegroundColor Cyan
                # Debug: Show first PR link URL format
                Write-Host "      Sample URL: $($prLinks[0].url)" -ForegroundColor Gray
            }
            
            foreach ($prLink in $prLinks) {
                # Extract PR ID from artifact link - URL decode first as GUIDs may be encoded
                $decodedUrl = [System.Web.HttpUtility]::UrlDecode($prLink.url)
                
                # Match pattern: vstfs:///Git/PullRequestId/{projectId}/{repoId}/{prId}
                if ($decodedUrl -match 'vstfs:///Git/PullRequestId/([^/]+)/([^/]+)/([^/]+)') {
                    $prProjectId = $matches[1]
                    $prRepoId = $matches[2]
                    $prId = $matches[3]
                    
                    Write-Host "      Fetching PR #$prId from repo $prRepoId..." -ForegroundColor Gray
                    
                    $cacheKey = "$prProjectId-$prRepoId-$prId"
                    
                    if (-not $prCache.ContainsKey($cacheKey)) {
                        # Get PR details
                        $prUrl = "$baseUrl/$ProjectName/_apis/git/repositories/$prRepoId/pullrequests/$prId`?api-version=7.1-preview.1"
                        $pr = Invoke-ADORestAPI -Uri $prUrl
                        
                        if ($pr) {
                            Write-Host "        Retrieved PR: $($pr.title)" -ForegroundColor Green
                            if ($pr.description) {
                                Write-Host "        Description length: $($pr.description.Length) chars" -ForegroundColor Green
                            } else {
                                Write-Host "        Warning: PR has no description" -ForegroundColor Yellow
                            }
                            
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
                        } else {
                            Write-Host "        Error: Failed to retrieve PR details" -ForegroundColor Red
                        }
                    } else {
                        Write-Host "        Using cached PR data" -ForegroundColor Gray
                    }
                    
                    if ($prCache.ContainsKey($cacheKey)) {
                        $workItem.pullRequests += $prCache[$cacheKey]
                    }
                }
            }
        }
        
        $processedWorkItems += $workItem
    }
    
    # Summary statistics
    $workItemsWithPRs = ($processedWorkItems | Where-Object { $_.pullRequests.Count -gt 0 }).Count
    $totalPRs = ($processedWorkItems | ForEach-Object { $_.pullRequests.Count } | Measure-Object -Sum).Sum
    Write-Host ""
    Write-Host "Summary:" -ForegroundColor Cyan
    Write-Host "  Total work items: $($processedWorkItems.Count)" -ForegroundColor Green
    Write-Host "  Work items with PRs: $workItemsWithPRs" -ForegroundColor Green
    Write-Host "  Total PRs found: $totalPRs" -ForegroundColor Green
    Write-Host ""
    
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

# Function to generate AI-powered summary using GitHub Copilot
function Invoke-CopilotSummary {
    param(
        [string]$Prompt,
        [hashtable]$Data,
        [string]$OutputFile
    )
    
    try {
        Write-Host "  Generating AI-powered content..." -ForegroundColor Gray
        
        # Check if GITHUB_TOKEN or COPILOT_API_KEY is available
        $githubToken = $env:GITHUB_TOKEN
        $copilotKey = $env:COPILOT_API_KEY
        
        if ([string]::IsNullOrEmpty($githubToken) -and [string]::IsNullOrEmpty($copilotKey)) {
            Write-Host "  No AI API credentials found (GITHUB_TOKEN or COPILOT_API_KEY)" -ForegroundColor Yellow
            Write-Host "  Falling back to template-based generation" -ForegroundColor Yellow
            return $null
        }
        
        # Prepare the context with PR descriptions prominently featured
        # Filter to only include work items with PRs
        $workItemsWithPRs = $Data.workItems | Where-Object { $_.pullRequests.Count -gt 0 }
        
        $contextText = @"
Iteration: $($Data.iterationName)
Period: $($Data.startDate) to $($Data.endDate)

Work Items with Pull Requests: $($workItemsWithPRs.Count)

Work Items and Pull Requests:
$( ($workItemsWithPRs | ForEach-Object {
    $wi = $_
    $prDetails = ($wi.pullRequests | ForEach-Object {
        "  - PR #$($_.id): $($_.title) [$($_.repository)]`n    Description: $($_.description)"
    }) -join "`n"
    "Work Item [$($wi.id)] - $($wi.title) ($($wi.type), $($wi.areaPath))`n  Description: $($wi.description)`n  Pull Requests:`n$prDetails"
}) -join "`n`n" )
"@

        # For now, save the prompt and context to a file for manual or automated use
        # This can be enhanced to call an AI API directly if credentials are available
        $promptFile = $OutputFile -replace '\.md$', '-prompt.txt'
        $fullPrompt = @"
$Prompt

===== CONTEXT DATA =====
$contextText
"@
        $fullPrompt | Out-File $promptFile -Encoding utf8
        
        Write-Host "  AI prompt saved to: $promptFile" -ForegroundColor Gray
        Write-Host "  You can use this with GitHub Copilot Chat or any AI tool" -ForegroundColor Gray
        
        # Return null to fallback to template generation
        # In the future, this can call an API directly
        return $null
    }
    catch {
        Write-Host "  Error preparing AI generation: $($_.Exception.Message)" -ForegroundColor Yellow
        return $null
    }
}

# Step 3: Generate internal summary
Write-Host "Step 3: Generating internal summary..." -ForegroundColor Cyan

$internalSummaryPath = Join-Path $OutputDir "internal-summary-$timestamp.md"

if ($UseAI) {
    $aiPrompt = @"
Based on the provided Azure DevOps work item and pull request data, create a comprehensive internal iteration summary document for engineering managers.

Target Audience: Engineering managers and technical leads
Tone: Professional, technical, data-driven

The document should include:

# Iteration Summary: $($iterationInfo.iterationName)

**Period:** $($iterationInfo.startDate) to $($iterationInfo.endDate)
**Team:** $TeamName
**Areas:** Buses & Sensors

## Executive Summary
- Total work items completed: [count from data]
- Breakdown by type (User Story, Bug, Task, etc.)
- Breakdown by area (Buses vs Sensors)
- Key themes and focus areas derived from PR descriptions and work item titles

## Completed Work Items

For each area path (Buses and Sensors), organize work items and provide:
- Work item ID and title
- Technical description synthesized from work item description and PR descriptions
- Key changes/implementations from the PRs (use PR titles and descriptions)
- Notable technical achievements

### Buses Component
[Analyze work items with area path containing 'Buses']

### Sensors Component
[Analyze work items with area path containing 'Sensors']

## Technical Highlights
Based on PR descriptions and work item data:
- Major features implemented (focus on User Stories/Features)
- Critical bugs fixed (describe what was fixed using PR descriptions)
- Infrastructure/tooling improvements
- Technical debt addressed

## Pull Request Summary
- Total PRs merged: [count from data]
- Most active repositories
- Key changes by repository (synthesize from PR descriptions to provide meaningful insights)

## Notes
This summary was automatically generated from Azure DevOps work item and PR data.

---
*Generated on $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")*

IMPORTANT: Use the actual PR descriptions and titles from the provided data to create meaningful, specific summaries. Focus on what was actually accomplished based on the PR descriptions.
"@

    $aiSummary = Invoke-CopilotSummary -Prompt $aiPrompt -Data $workItemsData -OutputFile $internalSummaryPath
    
    if ($aiSummary) {
        $aiSummary | Out-File $internalSummaryPath -Encoding utf8
        Write-Host "Generated AI-powered internal summary: $internalSummaryPath" -ForegroundColor Green
    } else {
        Write-Host "Using enhanced template-based generation for internal summary" -ForegroundColor Yellow
        $UseAI = $false  # Fallback to template for remaining sections
    }
}

if (-not $UseAI) {
    # Enhanced template-based generation with PR descriptions
    # Filter to only include work items with PRs
    $workItemsWithPRs = $workItemsData.workItems | Where-Object { $_.pullRequests.Count -gt 0 }
    
$internalSummary = @"
# Iteration Summary: $($iterationInfo.iterationName)

**Period:** $($iterationInfo.startDate) to $($iterationInfo.endDate)
**Team:** $TeamName
**Areas:** Buses & Sensors

## Executive Summary

- Total work items completed: $($workItemsData.workItems.Count)
- Work items with PRs: $($workItemsWithPRs.Count)
- Breakdown by type (with PRs):
$(($workItemsWithPRs | Group-Object type | ForEach-Object { "  - $($_.Name): $($_.Count)" }) -join "`n")
- Breakdown by area (with PRs):
$(($workItemsWithPRs | Group-Object { $_.areaPath -replace '.*\\', '' } | ForEach-Object { "  - $($_.Name): $($_.Count)" }) -join "`n")

## Completed Work Items

### Buses Component

$(
$busesItems = $workItemsWithPRs | Where-Object { $_.areaPath -like '*\Buses*' }
if ($busesItems) {
    ($busesItems | ForEach-Object {
@"
#### [$($_.id)] $($_.title)

**Type:** $($_.type) | **State:** $($_.state)

**Description:**
$($_.description)

**Pull Requests:**
$(($_.pullRequests | ForEach-Object { 
    $prDesc = if ($_.description) { "`n  *Description:* $($_.description)" } else { "" }
    "- **PR #$($_.id):** $($_.title) [$($_.repository)]$prDesc"
}) -join "`n")

---
"@
    }) -join "`n`n"
} else {
    "No work items with PRs completed in Buses component."
}
)

### Sensors Component

$(
$sensorsItems = $workItemsWithPRs | Where-Object { $_.areaPath -like '*\Sensors*' }
if ($sensorsItems) {
    ($sensorsItems | ForEach-Object {
@"
#### [$($_.id)] $($_.title)

**Type:** $($_.type) | **State:** $($_.state)

**Description:**
$($_.description)

**Pull Requests:**
$(($_.pullRequests | ForEach-Object { 
    $prDesc = if ($_.description) { "`n  *Description:* $($_.description)" } else { "" }
    "- **PR #$($_.id):** $($_.title) [$($_.repository)]$prDesc"
}) -join "`n")

---
"@
    }) -join "`n`n"
} else {
    "No work items with PRs completed in Sensors component."
}
)

## Technical Highlights

### Major Features Implemented
$(
$features = $workItemsWithPRs | Where-Object { $_.type -in @('User Story', 'Feature') }
if ($features) {
    ($features | ForEach-Object { "- [$($_.id)] $($_.title)" }) -join "`n"
} else {
    "- No major features with PRs in this iteration"
}
)

### Critical Bugs Fixed
$(
$bugs = $workItemsWithPRs | Where-Object { $_.type -eq 'Bug' }
if ($bugs) {
    ($bugs | ForEach-Object { "- [$($_.id)] $($_.title)" }) -join "`n"
} else {
    "- No critical bugs with PRs fixed in this iteration"
}
)

## Pull Request Summary

- Total PRs merged: $(($workItemsWithPRs | ForEach-Object { $_.pullRequests } | Measure-Object).Count)
- Most active repositories:
$(
$prsByRepo = $workItemsWithPRs | ForEach-Object { $_.pullRequests } | Group-Object repository
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
}

Write-Host ""

# Step 4: Generate Windows Insider release notes
Write-Host "Step 4: Generating Windows Insider release notes..." -ForegroundColor Cyan

$insiderNotesPath = Join-Path $OutputDir "insider-release-notes-$timestamp.md"

if ($UseAI) {
    $aiPromptInsider = @"
Based on the provided Azure DevOps work item and pull request data, create Windows Insider release notes.

Target Audience: Windows Insiders (technical enthusiasts, developers, early adopters)
Tone: Friendly, informative, technical but accessible

The document should include:

# What's New in Buses & Sensors - $($iterationInfo.iterationName)

## Overview
Write a brief, engaging introduction about what changed in this iteration for connectivity and sensors. Focus on user benefits derived from the PR descriptions.

## New Features
For each User Story or Feature work item, describe in user-friendly language:
- What the feature does (use FULL PR descriptions to be specific)
- Why it matters to users
- How it improves their experience
- Include the "Why is this change being made?" and "What changed?" sections from PR descriptions
Synthesize information from the PR descriptions to make features tangible and real.

## Improvements
List improvements and enhancements from Tasks and other work items:
- Performance improvements (cite specific PRs with details)
- Reliability enhancements (cite specific PRs with details)
- Better error handling
- UX improvements
Include substantial details from PR descriptions - what specifically improved, how it was tested.

## Bug Fixes
For Bug work items, describe fixes that users would care about:
- What issue was affecting users (from work item description)
- What's now fixed (include "Why is this change being made?" from PR)
- Technical details of the fix (include "What changed?" from PR)
- How it was tested (include "How was the change tested?" from PR)
Include meaningful excerpts from PR descriptions to show the depth of the fix.

## For Developers
Technical details for developers working with these APIs:
- API changes (derive from PR descriptions with specifics)
- New capabilities (from PR descriptions with examples)
- Breaking changes (if any mentioned in PRs)
- Implementation details that matter
List all work item IDs for reference.

---

**Note:** These features are available to Windows Insiders in the latest builds.

For more information about the Windows Insider Program, visit [https://insider.windows.com](https://insider.windows.com)

---
*Generated on $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")*

CRITICAL REQUIREMENTS: 
- Include substantial portions of PR descriptions (not just summaries)
- PR descriptions contain "Why is this change being made?", "What changed?", and "How was the change tested?" - include these sections
- Show the actual technical depth from the PRs - Windows Insiders appreciate detail
- Each bug fix should include meaningful excerpts from the PR description
- Don't oversimplify - Insiders want to understand what actually changed
- Group related PRs together when describing features
- Aim for 3-5 sentences minimum per work item, drawing from PR descriptions
"@

    $aiNotesInsider = Invoke-CopilotSummary -Prompt $aiPromptInsider -Data $workItemsData -OutputFile $insiderNotesPath
    
    if ($aiNotesInsider) {
        $aiNotesInsider | Out-File $insiderNotesPath -Encoding utf8
        Write-Host "Generated AI-powered Windows Insider release notes: $insiderNotesPath" -ForegroundColor Green
    } else {
        Write-Host "Using enhanced template-based generation for Windows Insider notes" -ForegroundColor Yellow
        $UseAI = $false
    }
}

if (-not $UseAI) {
    # Enhanced template-based generation with PR descriptions
    # Filter to only include work items with PRs
    $workItemsWithPRsInsider = $workItemsData.workItems | Where-Object { $_.pullRequests.Count -gt 0 }
    
$insiderNotes = @"
# What's New in Buses & Sensors - $($iterationInfo.iterationName)

## Overview

This release includes $($workItemsWithPRsInsider.Count) improvements to Windows connectivity and sensor capabilities, focusing on enhanced reliability, performance, and user experience.

## New Features

$(
$features = $workItemsWithPRsInsider | Where-Object { $_.type -in @('User Story', 'Feature') }
if ($features) {
    ($features | ForEach-Object {
        $wi = $_
        $title = $wi.title
        $desc = if ($wi.description) { 
            # Strip HTML tags and get first few sentences
            $cleanDesc = $wi.description -replace '<[^>]+>', '' -replace '\s+', ' '
            if ($cleanDesc.Length -gt 200) {
                $cleanDesc.Substring(0, 197) + "..."
            } else {
                $cleanDesc
            }
        } else { 
            "Enhanced functionality in the connectivity platform." 
        }
        # Include PR descriptions for more context
        $prContext = if ($wi.pullRequests.Count -gt 0) {
            "`n`n**Technical implementation:**"
            ($wi.pullRequests | ForEach-Object {
                $prDesc = if ($_.description) {
                    $cleanPrDesc = $_.description -replace '<[^>]+>', '' -replace '\s+', ' '
                    if ($cleanPrDesc.Length -gt 300) {
                        $cleanPrDesc.Substring(0, 297) + "..."
                    } else {
                        $cleanPrDesc
                    }
                } else {
                    $_.title
                }
                "`n- $prDesc"
            }) -join ""
        } else {
            ""
        }
@"
### $title

$desc$prContext

"@
    }) -join "`n"
} else {
    "No new features with PRs in this release."
}
)

## Improvements

$(
$tasks = $workItemsWithPRsInsider | Where-Object { $_.type -eq 'Task' }
if ($tasks) {
    ($tasks | ForEach-Object { "- $($_.title)" }) -join "`n"
} else {
    "- No tasks with PRs in this release"
}
)

## Bug Fixes

$(
$bugs = $workItemsWithPRsInsider | Where-Object { $_.type -eq 'Bug' }
if ($bugs) {
    ($bugs | ForEach-Object {
        $wi = $_
        $title = $wi.title
        $desc = if ($wi.description) {
            $cleanDesc = $wi.description -replace '<[^>]+>', '' -replace '\s+', ' '
            if ($cleanDesc.Length -gt 150) {
                $cleanDesc.Substring(0, 147) + "..."
            } else {
                $cleanDesc
            }
        } else {
            "Resolved an issue affecting system reliability."
        }
        # Include PR fix descriptions
        $prFixes = if ($wi.pullRequests.Count -gt 0) {
            "`n`n**Fix details:**"
            ($wi.pullRequests | ForEach-Object {
                $fixDesc = if ($_.description) {
                    $cleanFixDesc = $_.description -replace '<[^>]+>', '' -replace '\s+', ' '
                    if ($cleanFixDesc.Length -gt 500) {
                        $cleanFixDesc.Substring(0, 497) + "..."
                    } else {
                        $cleanFixDesc
                    }
                } else {
                    $_.title
                }
                "`n- $fixDesc"
            }) -join ""
        } else {
            ""
        }
@"
### $title

$desc$prFixes

"@
    }) -join "`n"
} else {
    "No major bug fixes with PRs in this release."
}
)

## For Developers

### API Changes

Please review the work items and pull requests for detailed information about any API changes or new capabilities.

### Work Items Included

$(($workItemsWithPRsInsider | ForEach-Object { "- Work Item $($_.id): $($_.title)" }) -join "`n")

---

**Note:** These features are available to Windows Insiders in the latest builds.

For more information about the Windows Insider Program, visit [https://insider.windows.com](https://insider.windows.com)

---
*Generated on $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")*
"@

$insiderNotes | Out-File $insiderNotesPath -Encoding utf8
Write-Host "Generated Windows Insider release notes: $insiderNotesPath" -ForegroundColor Green
}

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
