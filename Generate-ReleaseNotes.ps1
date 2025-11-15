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
Based on the provided Azure DevOps work item and pull request data, create a structured technical progress report for engineering leadership.

TARGET AUDIENCE: Engineering managers, technical leads, and leadership
TONE: Professional, concise, engineering-focused with active voice
PURPOSE: Progress report for iteration $($iterationInfo.iterationName)

REQUIRED STRUCTURE:

# [Main Component Areas in Parentheses]

Start with a header that lists the main technical areas covered, e.g.:
"Buses (Input, Low Power Buses, USB) & Windows Driver Frameworks (WDF)"

Analyze the area paths in the work item data to determine the specific component areas.

## Iteration $($iterationInfo.iterationName) Summary

**Period:** $($iterationInfo.startDate) to $($iterationInfo.endDate)

### Overview

Write ONE introductory paragraph (3-5 sentences) that summarizes:
- Overall engagement scope and progress for this iteration
- Total work items/PRs completed with breakdown by type
- Major themes identified from the data (e.g., platform defects, partner collaboration, feature enablement, security hardening)
- High-level impact on reliability, performance, or security

Example tone: "This iteration focused on [X] platform defects, [Y] partner engagements, and [Z] strategic initiatives. We completed [N] work items across USB, I3C, and WDF components, with emphasis on [major theme]. Key deliverables include [highlight 1-2 major items]."

---

## Major Initiatives & Technical Progress

For each significant technical initiative found in the PR data, create a subsection with:

### [Initiative Name] (e.g., "DMA Support for UMDF Drivers", "I3C Platform Adoption", "Rust Integration for WDF")

**Background & Context:**
- Why this initiative matters (business/technical drivers)
- Goals and expected outcomes
- Any relevant standards, specifications, or partner dependencies

**Current Iteration Progress:**
- Specific technical actions completed (use PR descriptions)
- Key implementations, discussions, or decisions made
- Partnerships or collaborations (with OEMs, IHVs, or internal teams)
- Technical challenges addressed

**Next Steps:**
- Ongoing investigations or follow-up work
- Upcoming milestones or dependencies
- Areas requiring attention

ANALYZE THE PR DESCRIPTIONS to identify major initiatives. Look for:
- Features spanning multiple PRs or work items
- Strategic technical directions (new frameworks, security improvements, performance optimizations)
- Partner-driven work (OEM/IHV engagements)
- Platform improvements (test infrastructure, tooling, SDK updates)

---

## Technical Depth & Standards

Throughout the document, include:
- Specific technologies: USB ESS, eUSB2, USB4, I3C/I2C, Thunderbolt
- Framework details: UMDF, KMDF, NetCx, WDF
- Standards and compliance: WHCP, HLK, HIDI3C specifications
- Architecture terms: DMA, IBI, power management (D-states), PCI-e
- Security topics: UMA (usermode access), driver hardening, CFG

Use technical acronyms and terminology appropriate for engineering leadership.

---

## Delivery Highlights

Provide bulleted lists organized by category:

### Features & Capabilities Delivered

- [Feature name]: [Brief technical description and benefit]
- Include work item IDs in parentheses for reference

### Bug Fixes & Reliability Improvements

- [Component]: [What was fixed and impact]
- Mention Watson failures resolved, crash fixes, stability improvements

### CD Releases & Bundles

- List any continuous delivery releases, bugfix bundles, or feature rollouts
- Include version numbers or build identifiers if available

### Test Infrastructure & Quality

- Test coverage improvements, HLK updates, validation framework enhancements
- Mention specific test scenarios added

### Partner Engagements

- OEM/IHV collaborations, device certifications, issue resolutions
- Workarounds provided for partner-reported issues

---

## Metrics Summary

**Work Item Breakdown:**

- Total completed: [N]
- By type: [X] Bug fixes, [Y] Features, [Z] Tasks
- By component: [breakdown by area path]

**Pull Requests:**

- Total merged: [N]
- Repositories: [list key repos with counts]

**Impact Areas:**

- Reliability: [count of crash/stability fixes]
- Security: [count of security-related work]
- Performance: [count of optimization work]
- Compliance: [count of certification/HLK work]

---

## Notes

This is an engineering progress report generated from Azure DevOps data for iteration $($iterationInfo.iterationName).

---

**Generated: $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")** 

CRITICAL INSTRUCTIONS:
1. Analyze PR descriptions thoroughly to identify major technical initiatives
2. Group related work items into coherent technical narratives
3. Use active voice and emphasize impact (e.g., "Implemented X to improve Y by Z%")
4. Include specific technical details, standards, and acronyms
5. Structure should flow: Overview → Initiatives → Deliverables → Metrics
6. Each initiative section should have Background → Progress → Next Steps
7. Use engineering terminology appropriate for technical leadership
8. Quantify improvements where possible (e.g., "resolved 15 Watson failures")

MARKDOWN FORMATTING RULES:
- Add blank line before and after ALL lists
- Add blank line before and after ALL headings (except document title)
- Use **bold** not *italic* for emphasis in footer
- Escape square brackets in text with backslash if not links: \[text\]
- End file with single newline character
"@

    $aiSummary = Invoke-CopilotSummary -Prompt $aiPrompt -Data $workItemsData -OutputFile $internalSummaryPath
    
    if ($aiSummary) {
        $utf8WithBom = New-Object System.Text.UTF8Encoding $true
        $writer = New-Object System.IO.StreamWriter($internalSummaryPath, $false, $utf8WithBom)
        $writer.Write($aiSummary)
        $writer.Close()
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

$utf8WithBom = New-Object System.Text.UTF8Encoding $true
$writer = New-Object System.IO.StreamWriter($internalSummaryPath, $false, $utf8WithBom)
$writer.Write($internalSummary)
$writer.Close()
Write-Host "Generated internal summary: $internalSummaryPath" -ForegroundColor Green
}

Write-Host ""

# Step 4: Generate Windows Insider release notes
Write-Host "Step 4: Generating Windows Insider release notes..." -ForegroundColor Cyan

$insiderNotesPath = Join-Path $OutputDir "insider-release-notes-$timestamp.md"

if ($UseAI) {
    # Extract key themes and categories from PR descriptions dynamically
    $workItemsWithPRs = $workItemsData.workItems | Where-Object { $_.pullRequests.Count -gt 0 }
    
    $bugCount = ($workItemsWithPRs | Where-Object { $_.workItemType -eq "Bug" }).Count
    $taskCount = ($workItemsWithPRs | Where-Object { $_.workItemType -eq "Task" }).Count
    $featureCount = ($workItemsWithPRs | Where-Object { $_.workItemType -in @("User Story", "Feature") }).Count
    
    # Extract common themes from PR descriptions
    $themes = @()
    foreach ($item in $workItemsWithPRs) {
        foreach ($pr in $item.pullRequests) {
            if ($pr.description) {
                # Look for key improvement areas
                if ($pr.description -match "(?i)(usb|connectivity|device)") { $themes += "USB/Device Connectivity" }
                if ($pr.description -match "(?i)(i3c|sensor)") { $themes += "I3C/Sensors" }
                if ($pr.description -match "(?i)(reliability|crash|failure|watson)") { $themes += "System Reliability" }
                if ($pr.description -match "(?i)(security|uma|usermode)") { $themes += "Security" }
                if ($pr.description -match "(?i)(performance|optimization|speed)") { $themes += "Performance" }
                if ($pr.description -match "(?i)(telemetry|diagnostics|logging)") { $themes += "Diagnostics" }
            }
        }
    }
    $uniqueThemes = $themes | Select-Object -Unique | Select-Object -First 5
    
    $aiPromptInsider = @"
Based on the provided Azure DevOps work item and pull request data, create Windows Insider Blog-style release notes for EXTERNAL AUDIENCES.

DATA SUMMARY:
- Total updates with code changes: $($workItemsWithPRs.Count)
- Bug fixes: $bugCount
- Improvements/Tasks: $taskCount
- New features: $featureCount
- Key improvement areas: $($uniqueThemes -join ", ")

TARGET AUDIENCE: External Windows Insiders (enthusiasts, IT professionals, early adopters) - NOT internal Microsoft engineers
TONE: Friendly, professional, user-focused
WORD LIMIT: 500 words maximum (excluding Developer section)

ANALYSIS REQUIRED:
1. Read through EVERY pull request description thoroughly
2. Identify the actual technical changes made
3. Translate those changes into user-facing benefits
4. Group related improvements together
5. Eliminate vague, repetitive statements like "general improvements"

CRITICAL REQUIREMENTS FOR EXTERNAL AUDIENCE:
❌ DO NOT include:
- PR numbers, PR titles, or PR descriptions verbatim
- File paths (e.g., "onecore\drivers\input\hid...")
- Internal identifiers like "[Watson Failure]", "[UMA]", build numbers
- Technical jargon without translation (A/V, telemetry, CFR, etc.)
- Work item titles as written (simplify and humanize them)
- Vague statements like "General improvements to system functionality" (be specific!)
- Duplicate/repetitive bullet points

✅ DO include:
- Specific plain language summaries with technical details translated to benefits
- User impact explained: HOW will this improve their experience?
- Real-world scenarios: video conferencing, battery life, security, etc.
- Concrete examples of what changed
- Work item IDs only in Developer section (format: #12345, #67890)

REQUIRED STRUCTURE:

# Hello Windows Insiders!

Brief welcome (1-2 sentences) mentioning the COUNT and SPECIFIC focus areas (e.g., "camera support, display brightness controls, and system security" not just "device connectivity").

## 🚀 Overview

Write ONE paragraph (3-4 sentences) that explains the theme of this release in plain language. Focus on user benefits and real-world scenarios.

Then add "What's improved:" section with 3-4 specific bullet points. Each bullet should:
- Start with a bold key area
- Include the actual improvement/benefit
- Be specific enough that users understand what changed

EXAMPLE:
**What's improved:**

- **Enhanced camera support:** Better video quality through improved USB bandwidth handling for high-resolution cameras
- **More reliable brightness controls:** Fixed intermittent issues where brightness hotkeys weren't recognized
- **Better USB device connectivity:** Improved power management means fewer unexpected disconnections
- **Stronger security:** Enhanced protections in hardware drivers to keep your system safe

Analyze the PR descriptions and work item data to identify the REAL improvements - don't be generic.

## 🔧 Improvements & Bug Fixes

CRITICAL: Group improvements by category with subsection headers (###). For each category, provide 2-4 detailed bullet points that explain:
1. WHAT changed (in plain language)
2. WHY it matters to users (real-world benefit)
3. HOW it improves their experience (concrete examples)

Use this structure:
### [Category Name]

- **[Feature/Area]:** [Detailed description with user benefit]. [Explain the real-world impact or use case].

CATEGORIES TO USE (analyze PR descriptions to determine which apply):
- **Camera & USB Improvements:** For USB bandwidth, camera support, device enumeration, connectivity reliability
- **Display & Brightness:** For monitor controls, brightness, display-related sensor improvements  
- **Security Enhancements:** For UMA hardening, driver security, vulnerability fixes
- **System Stability:** For crash fixes, error recovery, device reset capabilities
- **Power Management:** For battery life, low-power states, idle behavior
- **Performance:** For speed optimizations, reduced latency

EXAMPLE OF GOOD DETAIL:
❌ BAD: "Enhanced security to protect against potential vulnerabilities"
✅ GOOD: "Updated user-mode hardware drivers with the latest security practices, adding additional validation to protect against potential exploits. This affects HID (Human Interface Device) and virtual function drivers."

❌ BAD: "Improved device connectivity and reliability"
✅ GOOD: "Added support for eUSB2v1 Double Isochronous Bandwidth, enabling built-in cameras to stream at higher resolutions and bandwidth. This particularly benefits video conferencing and content creation scenarios."

TRANSLATE TECHNICAL TERMS:
- "eUSB2v1 Double Isochronous Bandwidth" → "high-bandwidth camera support for better video quality"
- "Watson Failure"/"A/V" → "system crash" or "stability issue"
- "UMA usermode access" → "security hardening for drivers"
- "telemetry" → "diagnostic capabilities" or "error reporting"
- "I3C IBI DPC" → "sensor communication timing"
- "PLDR/FLDR device reset" → "automatic device recovery without restarting your PC"
- "Race condition" → "timing issue that occasionally caused..."

## ⚠️ Known Issues (optional, only if relevant)

Include only if there are known limitations users should be aware of. Format:
- Brief description - Workaround or status

## 👨‍💻 For Developers

Brief intro (1 sentence): "This release includes updates across [areas]."

Summary format (NO PR details, NO PR titles):
- **[Category]:** X updates (#12345, #67890, #11111)
- Example: "**Device Connectivity:** 5 updates (#48522963, #54529555, #56414704)"

Add: "For detailed technical information, refer to the work items in Azure DevOps."

## 📦 Availability

Write 1-2 sentences about Dev/Canary channels and how to join at insider.windows.com.

## 💬 Feedback

Write 1-2 sentences about using Feedback Hub (Win + F) under appropriate category, with thank you message.

---

**Generated: November 14, 2025 | Iteration: 2510 | Updates: $($workItemsWithPRs.Count)**

FINAL QUALITY CHECKS:
✅ Have you analyzed PR descriptions to extract SPECIFIC improvements?
✅ Have you eliminated ALL repetitive/duplicate statements?
✅ Have you translated technical jargon into user benefits?
✅ Have you grouped related improvements together with subsection headers (###)?
✅ Does each bullet point explain WHAT changed, WHY it matters, and HOW it helps users?
✅ Have you provided concrete examples and real-world scenarios?
✅ Have you avoided vague statements like "general improvements"?
✅ Is the content under 500 words (excluding Developer section)?
✅ Have you added blank lines before and after ALL lists and headings?
✅ Have you escaped square brackets in text that aren't links?

REMEMBER: 
- This is for EXTERNAL audiences - no internal jargon, PR details, or file paths
- Focus on USER IMPACT with specific details, not generic statements
- Each improvement should be unique and meaningful
- Translate technical changes into benefits users will notice
- Developer section: Work item IDs only, no PR titles
"@

    $aiNotesInsider = Invoke-CopilotSummary -Prompt $aiPromptInsider -Data $workItemsData -OutputFile $insiderNotesPath
    
    if ($aiNotesInsider) {
        $utf8WithBom = New-Object System.Text.UTF8Encoding $true
        $writer = New-Object System.IO.StreamWriter($insiderNotesPath, $false, $utf8WithBom)
        $writer.Write($aiNotesInsider)
        $writer.Close()
        Write-Host "Generated Windows Insider release notes: $insiderNotesPath" -ForegroundColor Green
    } else {
        Write-Host "Using enhanced template-based generation for Windows Insider notes" -ForegroundColor Yellow
        $UseAI = $false
    }
}

if (-not $UseAI) {
    # External-audience template - clean, user-focused
    $workItemsWithPRsInsider = $workItemsData.workItems | Where-Object { $_.pullRequests.Count -gt 0 }
    
    # Helper function to create user-friendly summaries from PR descriptions
    function Get-UserFriendlySummary {
        param([string]$TechnicalDesc, [string]$Title)
        
        # Extract user-friendly explanation from PR description
        if ($TechnicalDesc -match 'Why is this change being made\?(.+?)(?:##|$)') {
            $why = $matches[1].Trim() -replace '<[^>]+>', '' -replace '\s+', ' '
            # Translate technical jargon to plain language
            $why = $why -replace '(?i)A/V', 'crash' -replace '(?i)telemetry', 'diagnostics' -replace '(?i)Watson', 'system failure' -replace '(?i)UMA', 'security vulnerability'
            if ($why.Length -gt 150) { $why = $why.Substring(0, 147) + "..." }
            return $why
        }
        
        # Fallback based on title keywords
        if ($Title -match '(?i)crash|failure|watson') { return "Resolved issues that could cause system instability" }
        if ($Title -match '(?i)uma|security') { return "Enhanced security to protect against potential vulnerabilities" }
        if ($Title -match '(?i)usb|connectivity|device') { return "Improved device connectivity and reliability" }
        if ($Title -match '(?i)i3c|sensor') { return "Enhanced sensor performance and accuracy" }
        if ($Title -match '(?i)power|battery|c-state') { return "Optimized power management for better battery life" }
        if ($Title -match '(?i)performance|speed') { return "Improved system performance" }
        return "General improvements to system functionality"
    }
    
    # Categorize improvements by impact area
    function Get-ImpactCategory {
        param([string]$Title, [string]$Description)
        $combined = "$Title $Description"
        if ($combined -match '(?i)usb|connectivity|device|enumeration') { return 'Device Connectivity' }
        if ($combined -match '(?i)i3c|sensor') { return 'Sensors & I3C' }
        if ($combined -match '(?i)uma|security|vulnerability') { return 'Security' }
        if ($combined -match '(?i)crash|failure|watson|reliability') { return 'System Reliability' }
        if ($combined -match '(?i)power|battery|c-state|idle') { return 'Power Management' }
        if ($combined -match '(?i)performance|speed|optimization') { return 'Performance' }
        return 'General'
    }
    
    # Group improvements by category
    $categorized = @{}
    foreach ($wi in $workItemsWithPRsInsider) {
        $desc = if ($wi.pullRequests.Count -gt 0) { $wi.pullRequests[0].description } else { "" }
        $category = Get-ImpactCategory -Title $wi.title -Description $desc
        if (-not $categorized.ContainsKey($category)) {
            $categorized[$category] = @()
        }
        $categorized[$category] += $wi
    }
    
    # Get top 2-3 items per category (max 8 total for conciseness)
    $selectedItems = @()
    $categoryOrder = @('Device Connectivity', 'System Reliability', 'Security', 'Sensors & I3C', 'Power Management', 'Performance', 'General')
    foreach ($cat in $categoryOrder) {
        if ($categorized.ContainsKey($cat) -and $selectedItems.Count -lt 8) {
            $selectedItems += $categorized[$cat] | Select-Object -First 2
        }
    }
    
    # Extract themes for overview
    $themes = @{}
    $themes['connectivity'] = ($workItemsWithPRsInsider | Where-Object { $_.title -match '(?i)usb|device|connectivity' }).Count
    $themes['sensors'] = ($workItemsWithPRsInsider | Where-Object { $_.title -match '(?i)i3c|sensor' }).Count
    $themes['security'] = ($workItemsWithPRsInsider | Where-Object { $_.title -match '(?i)uma|security' }).Count
    $themes['reliability'] = ($workItemsWithPRsInsider | Where-Object { $_.title -match '(?i)watson|crash|failure|reliability' }).Count
    
    $topThemes = $themes.GetEnumerator() | Sort-Object Value -Descending | Where-Object { $_.Value -gt 0 } | Select-Object -First 3 | ForEach-Object { 
        switch ($_.Key) {
            'connectivity' { 'device connectivity' }
            'sensors' { 'sensor performance' }
            'security' { 'security' }
            'reliability' { 'system reliability' }
        }
    }
    
$insiderNotes = @"
# Hello Windows Insiders!

We're excited to share **$($workItemsWithPRsInsider.Count) improvements** to Windows 11 Buses & Sensors, focusing on $($topThemes -join ', ') and performance.

## $([System.Char]::ConvertFromUtf32(0x1F680)) Overview

This release brings meaningful enhancements to how Windows handles device connectivity and sensors. Whether you're connecting USB devices, using modern sensors, or relying on system stability, these improvements work behind the scenes to make your experience more reliable and secure.

**What's improved:**
$(
$overviewPoints = @()
if ($themes['connectivity'] -gt 2) { $overviewPoints += "- Better USB and device connectivity with fewer connection issues" }
if ($themes['sensors'] -gt 2) { $overviewPoints += "- Enhanced I3C sensor communication for improved accuracy" }
if ($themes['security'] -gt 2) { $overviewPoints += "- Stronger security protections for driver components" }
if ($themes['reliability'] -gt 2) { $overviewPoints += "- Resolved critical issues affecting system stability" }
if ($overviewPoints.Count -eq 0) { $overviewPoints += "- General improvements to connectivity, performance, and reliability" }
$overviewPoints[0..2] -join "`n"
)

## $([System.Char]::ConvertFromUtf32(0x1F527)) Improvements & Bug Fixes

$(
$bulletPoints = @()
foreach ($wi in $selectedItems) {
    $benefit = Get-UserFriendlySummary -TechnicalDesc ($wi.pullRequests[0].description) -Title $wi.title
    $category = Get-ImpactCategory -Title $wi.title -Description ($wi.pullRequests[0].description)
    $bulletPoints += "- **${category}:** $benefit"
}
if ($bulletPoints.Count -eq 0) {
    "- General reliability and performance improvements across connectivity components"
} else {
    $bulletPoints[0..7] -join "`n"
}
)

$(
# Add known issues section only if there are active issues to report
$knownIssues = @()
# You can populate this from work items tagged as "Known Issue" or similar
if ($knownIssues.Count -gt 0) {
@"

## $([System.Char]::ConvertFromUtf32(0x26A0))$([System.Char]::ConvertFromUtf32(0xFE0F)) Known Issues

$(($knownIssues | ForEach-Object { "- $_" }) -join "`n")
"@
} else { "" }
)

## $([System.Char]::ConvertFromUtf32(0x1F468))$([System.Char]::ConvertFromUtf32(0x200D))$([System.Char]::ConvertFromUtf32(0x1F4BB)) For Developers

This release includes updates across USB, I3C, and driver framework components. Key areas of change:

$(
$devCategories = $categorized.Keys | Where-Object { $_ -ne 'General' } | Sort-Object
$devSummary = @()
foreach ($cat in $devCategories) {
    $count = $categorized[$cat].Count
    if ($count -gt 0) {
        $workItemIds = ($categorized[$cat] | Select-Object -First 3 | ForEach-Object { "#$($_.id)" }) -join ", "
        $plural = if ($count -gt 1) { 's' } else { '' }
        $extra = if ($categorized[$cat].Count -gt 3) { ', ...' } else { '' }
        $devSummary += "- **${cat}:** $count update$plural ($workItemIds$extra)"
    }
}
if ($devSummary.Count -eq 0) {
    "- Multiple updates across connectivity and sensor components"
} else {
    $devSummary -join "`n"
}
)

For detailed technical information, refer to the work items listed above in Azure DevOps.

---

## $([System.Char]::ConvertFromUtf32(0x1F4E6)) Availability

These improvements are available to Windows Insiders in the **Dev** and **Canary** Channels. Join at [insider.windows.com](https://insider.windows.com) and check **Settings > Windows Update**.

## $([System.Char]::ConvertFromUtf32(0x1F4AC)) Feedback

Use **Feedback Hub** (Win + F) under **Hardware, Devices, and Drivers** to report issues or suggestions. Thank you for being a Windows Insider! $([System.Char]::ConvertFromUtf32(0x1F389))

---
*Generated: $(Get-Date -Format "MMMM dd, yyyy") | Iteration: $($iterationInfo.iterationName) | Updates: $($workItemsWithPRsInsider.Count)*
"@

$utf8WithBom = New-Object System.Text.UTF8Encoding $true
$writer = New-Object System.IO.StreamWriter($insiderNotesPath, $false, $utf8WithBom)
$writer.Write($insiderNotes)
$writer.Close()
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
