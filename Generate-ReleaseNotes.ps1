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
    [switch]$UseAI
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
            # Add Content-Type to headers instead of using ContentType parameter
            # to ensure it works alongside Authorization header
            $params.Headers = $headers.Clone()
            $params.Headers["Content-Type"] = "application/json"
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
You are generating an internal engineering iteration summary from Azure DevOps data.

CONTEXT: After this prompt you'll see "===== CONTEXT DATA =====" followed by:
- Iteration name and date range
- A flat text listing of Work Items with Pull Requests, including PR titles, descriptions, repo, area path

TASK
Create a concise, executive-ready Markdown document where section headings are **derived dynamically** from the PRs and work items provided—no hardcoded headings.

AUDIENCE
Engineering managers and technical leadership.

TONE
Professional, concise, action-oriented; use active voice and plain technical English.

OUTPUT FORMAT (Markdown only; no front-matter, no extra commentary)

# Buses (Input, Low Power Buses, USB) & Windows Driver Frameworks (WDF)

**Period:** [iteration start date] to [iteration end date]

## Executive Overview
2–3 bullets (1–2 lines each): scope, major themes, and notable deliveries for this iteration.

## [Dynamic Topic Section Name]
**Dynamic topic sections** (H2) generated from the PRs/work items you analyze:
- Derive topic names by clustering PR titles/descriptions/area paths.
- Use up to 5 sections, ordered by impact (first) then count.
- Include 3–6 bullets per section.
- Each bullet: WHAT changed (specific), WHY it matters (impact), optionally WHERE (component).

## Key Accomplishments
Bulleted list (4–6 items): one-liners that surface the highest-value work; each ends with a short "why it matters".

## Risks / Blocks / Next Steps _(optional)_
3–5 bullets, only if explicitly evidenced in the context (shipping notes, follow-ups, validation plans). Do **not** invent.

## Release & Delivery Notes
Bullets that pull concrete delivery signals (e.g., "CD 2601/2602", "EnabledByDefault", "AlwaysEnabled/Disabled", branch mentions). Summarize succinctly.

DYNAMIC TOPIC DISCOVERY (strict rules)
- Build topics by clustering on these signals (union, not intersection):
  • Area path leaf (e.g., Buses, Sensors)
  • Repository names (e.g., USBXHCI, UCX, usbhub3, WDF)
  • Keywords in PR titles/descriptions
- Use this mapping to normalize topic **labels** (examples, not exhaustive):
  • /(usb4|usb3|type[- ]c|ucx|xhci|usbhub3|ucm(cx)?)/i → "USB & USB4"
  • /(i3c|hidi3c|wini3c|supermitt)/i → "I3C (Low Power Bus)"
  • /(wdf|kmdf|umdf|netcx|hlk|driver verifier)/i → "WDF & Frameworks"
  • /(des|display enhancements|brightness|sensors)/i → "Power & Sensors"
  • /(telemetry|diagnostics|logging)/i → "Diagnostics & Observability"
  • /(uma|security|hardening|cfg)/i → "Security Hardening"
  • /(drips|c[- ]states|power|latency|performance)/i → "Power & Performance"
- If a cluster has < 2 concrete items, merge it into "Other Platform Improvements".
- Prefer the **most specific** normalized label that matches the majority of items in the cluster.

WHAT TO EXTRACT FROM PR DATA
- Concrete technical changes (algorithms, flags, interfaces, DDIs, tests)
- Delivery levers (EnabledByDefault, AlwaysEnabled/Disabled, CFRs, backports/branches)
- Validation signals (HLK/tests run, partner validation, perf/compat checks)
- Partner/Platform scope (Intel/AMD/QC/Surface/DIS)

STRICT CONTENT RULES
- **No invention**: only use facts present in the context.
- If a fact is uncertain, omit it.
- Summaries must be **specific** (e.g., "captured secondary data to blame Tunnel/VPP for 0x15F DRIPS" > "improved reliability").
- Use one sentence (two max) per bullet.
- Do not list raw PR numbers in section headers; inside bullets, format PR references as **PR #12345** (bold).
- Use inline code for files/APIs/symbols (e.g., `Usb4HostRouter.sys`, `WudfRd.sys`, `IOCTL_I3C_TARGET_RESET`).

MARKDOWN STYLE (enforced)
- H1 (#) for the main title only
- H2 (##) for all major sections (Executive Overview, dynamic topics, Key Accomplishments, Risks/Blocks, Release Notes)
- NO H3 or deeper headings - keep it flat and scannable
- Blank line before/after every heading and list.
- Bullets start with a **bold focus** phrase, then a colon, then the summary.
  Example: **USB4 DRIPS classification:** Captures tunnel/VPP secondary data to correctly assign blame; reduces misdiagnosis in GE/CD.
- Where helpful, end a bullet with "*Why it matters:* …" (short phrase).
- Keep total length ≈ 300–450 words (not counting PR refs formatted inline).

QUALITY BAR (self-check before returning)
- Are headings truly data-driven (not hardcoded)?
- Are bullets specific and impact-oriented?
- Are delivery signals (CD/branch/feature flags) summarized succinctly?
- Is there zero invented content? If a section would be empty, omit it rather than inventing.
- Are there no tables, images, or links unless present in context?
- Does every list and heading follow the spacing rules above?

Now read the CONTEXT DATA below and produce the final Markdown.

========== CONTEXT DATA =====

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
    
    # Helper function to format HTML and markdown properly
    function Format-MarkdownText {
        param([string]$Text)
        if ([string]::IsNullOrWhiteSpace($Text)) { return "" }
        
        # Remove HTML tags
        $cleaned = $Text -replace '<div[^>]*>', '' -replace '</div>', '' `
                        -replace '<br\s*/?>', ' ' -replace '<span[^>]*>', '' -replace '</span>', '' `
                        -replace '<b>', '**' -replace '</b>', '**' `
                        -replace '<h\d[^>]*>', '' -replace '</h\d>', '' `
                        -replace '<img[^>]*>', '' -replace '<ol[^>]*>', '' -replace '</ol>', '' `
                        -replace '&nbsp;', ' ' -replace '&quot;', '"' -replace '&lt;', '<' -replace '&gt;', '>'
        
        # Remove hard tabs
        $cleaned = $cleaned -replace "`t", '    '
        
        # Normalize whitespace
        $cleaned = $cleaned -replace '\s+', ' '
        $cleaned = $cleaned.Trim()
        
        # Fix emphasis style (underscores to asterisks for italic/bold)
        $cleaned = $cleaned -replace '\b_([^_]+)_\b', '*$1*'
        
        return $cleaned
    }

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

## Buses Component

$(
$busesItems = $workItemsWithPRs | Where-Object { $_.areaPath -like '*\Buses*' }
if ($busesItems) {
    ($busesItems | ForEach-Object {
        $wi = $_
        $cleanTitle = Format-MarkdownText -Text $wi.title
        $cleanDesc = Format-MarkdownText -Text $wi.description
@"
**[$($wi.id)] $cleanTitle**

- **Type:** $($wi.type)
- **State:** $($wi.state)
- **Description:** $cleanDesc
- **Pull Requests:**
$(($wi.pullRequests | ForEach-Object { 
    $pr = $_
    $cleanPrTitle = Format-MarkdownText -Text $pr.title
    $prDesc = if ($pr.description) { 
        $cleanPrDesc = Format-MarkdownText -Text $pr.description
        if ($cleanPrDesc) {
            # Remove heading punctuation issues
            $cleanPrDesc = $cleanPrDesc -replace '(##\s+[^?!]+)[.!?]+\s', '$1 '
            # Split by sentences and limit length
            if ($cleanPrDesc.Length -gt 2000) {
                $cleanPrDesc = $cleanPrDesc.Substring(0, 1997) + "..."
            }
            "`n    **Repository:** $($pr.repository)`n`n    **Description:**`n`n    $cleanPrDesc"
        } else {
            "`n    **Repository:** $($pr.repository)"
        }
    } else { 
        "`n    **Repository:** $($pr.repository)" 
    }
    "  - **PR #$($pr.id):** $cleanPrTitle$prDesc"
}) -join "`n`n")

"@
    }) -join "`n---`n`n"
} else {
    "No work items with PRs completed in Buses component."
}
)

## Sensors Component

$(
$sensorsItems = $workItemsWithPRs | Where-Object { $_.areaPath -like '*\Sensors*' }
if ($sensorsItems) {
    ($sensorsItems | ForEach-Object {
        $wi = $_
        $cleanTitle = Format-MarkdownText -Text $wi.title
        $cleanDesc = Format-MarkdownText -Text $wi.description
@"
**[$($wi.id)] $cleanTitle**

- **Type:** $($wi.type)
- **State:** $($wi.state)
- **Description:** $cleanDesc
- **Pull Requests:**
$(($wi.pullRequests | ForEach-Object { 
    $pr = $_
    $cleanPrTitle = Format-MarkdownText -Text $pr.title
    $prDesc = if ($pr.description) { 
        $cleanPrDesc = Format-MarkdownText -Text $pr.description
        if ($cleanPrDesc) {
            # Remove heading punctuation issues
            $cleanPrDesc = $cleanPrDesc -replace '(##\s+[^?!]+)[.!?]+\s', '$1 '
            # Split by sentences and limit length
            if ($cleanPrDesc.Length -gt 2000) {
                $cleanPrDesc = $cleanPrDesc.Substring(0, 1997) + "..."
            }
            "`n    **Repository:** $($pr.repository)`n`n    **Description:**`n`n    $cleanPrDesc"
        } else {
            "`n    **Repository:** $($pr.repository)"
        }
    } else { 
        "`n    **Repository:** $($pr.repository)" 
    }
    "  - **PR #$($pr.id):** $cleanPrTitle$prDesc"
}) -join "`n`n")

"@
    }) -join "`n---`n`n"
} else {
    "No work items with PRs completed in Sensors component."
}
)

## Technical Highlights

**Major Features Implemented:**
$(
$features = $workItemsWithPRs | Where-Object { $_.type -in @('User Story', 'Feature') }
if ($features) {
    ($features | ForEach-Object { "- [$($_.id)] $($_.title)" }) -join "`n"
} else {
    "- No major features with PRs in this iteration"
}
)

**Critical Bugs Fixed:**
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
    
    $aiPromptInsider = @"
You are generating **Windows Insider** (EXTERNAL) release notes from Azure DevOps work item + PR context.

AFTER THIS PROMPT you will see "===== CONTEXT DATA =====" followed by:
- Iteration name and period
- A flat text listing of Work Items WITH PRs (titles, descriptions, repositories, area paths, and narrative snippets)

GOAL
Produce a concise, friendly, user‑facing Markdown post that explains improvements in plain language. Headings and categories must be **derived dynamically** from the data (no hardcoding).

AUDIENCE & TONE
- Audience: Windows Insiders (enthusiasts, IT pros, early adopters)
- Tone: Friendly, professional, and **benefit‑first**
- Length: **≤ 500 words** (excluding the "For Developers" section)

STRICT REDACTION (external‑safe)
- ❌ Do NOT include PR numbers/titles or commit messages.
- ❌ Do NOT include internal paths, codenames, Watson/UMA/CFR/branch internals, or build IDs.
- ❌ Do NOT include private links.
- ✅ You MAY include **work item IDs** only in the **For Developers** section, grouped by area, as `#12345` style.
- ✅ Translate technical terms into user benefits (see "Term Translator" below).

DYNAMIC CATEGORY SYNTHESIS
Cluster items by keywords (in titles/descriptions/repo names/area paths). Normalize to user‑friendly section labels (examples; choose only those that actually apply):
- **Camera & USB**  → usb, usb4, usb3, type‑c, xhci, ucx, usbhub3, connectivity, enumeration, bandwidth
- **Display & Brightness** → display, DES, brightness, hotkeys, monitors
- **Security** → security, hardening, validation, protective checks
- **System Stability** → crash, failure, reliability, reset/recovery, hang, lock‑up
- **Power & Battery** → c‑states, idle, DRIPS, power management, efficiency
- **Performance** → performance, latency, throughput
- **Sensors & I3C** → i3c, hidi3c, supermitt, sensor
- **Networking** → netcx, usb‑ncm, network adapter
- **Diagnostics & Observability** → telemetry, diagnostics, logging
- If a cluster has < 2 concrete items, fold into **Other Improvements** (or omit if empty).
- Order categories by **user impact** (first) then by **item count**.

TERM TRANSLATOR (examples)
- "eUSB2v1 double isochronous bandwidth" → "support for higher‑bandwidth built‑in cameras (clearer video)"
- "PLDR/FLDR" → "automatic device recovery without restarting"
- "race condition / IBI DPC ordering" → "timing issue that could cause intermittent failures"
- "DRIPS / package C‑state" → "deeper sleep states for better battery life"
- "UMA hardening" → "stronger driver security checks"
- "telemetry / CFR" → "diagnostics and error reporting"

OUTPUT STRUCTURE (Markdown only)
# Hello Windows Insiders!

Short welcome (1–2 sentences) citing total count and 2–3 high‑level focus areas in plain language.

## 🚀 Overview
One paragraph (3–4 sentences) that explains the theme and **user benefits**.
Then add:
**What's improved:**
- **<Key area>**: Specific benefit in one sentence.
- **<Key area>**: Specific benefit in one sentence.
- **<Key area>**: Specific benefit in one sentence.
(3–4 bullets max; no duplication.)

## 🔧 Improvements & Bug Fixes
Create **only the categories that apply** (from "Dynamic Category Synthesis"), each as a `###` heading.
Under each category add 2–4 bullets. Each bullet MUST follow:
- **<Feature/Area>**: WHAT changed (plain language) + WHY it matters (concrete user benefit or scenario).
Examples:
- **USB device reliability**: Improved how Windows handles sleep/wake for certain USB controllers, reducing unexpected disconnects after your PC wakes.
- **Built‑in cameras**: Added support for higher‑bandwidth camera modes, enabling sharper video in calls and recordings.

## ⚠️ Known Issues  _(optional; include only if clearly present in the context)_
- Brief description — simple workaround or status.

## 👨‍💻 For Developers
One sentence intro: "This build includes updates across …"
Then grouped summaries (no PR titles, no paths):
- **Device Connectivity:** X updates (**#12345, #23456, #34567** …)
- **Sensors & I3C:** Y updates (**#…**)
(Show up to 3 IDs per category followed by "…" if more.)

## 📦 Availability
One short paragraph about Dev/Canary channels and how to join (insider.windows.com).

## 💬 Feedback
One short paragraph about using Feedback Hub (Win + F) and the right category.

WRITING GUARDRAILS (must‑do)
- **No invention**: only facts present in the context.
- **FORBIDDEN PHRASES** - NEVER use these generic phrases:
  * "Improved device connectivity and reliability"
  * "Enhanced security to protect against potential vulnerabilities"
  * "General improvements to system functionality"
  * "Enhanced sensor performance and accuracy"
  * "Better system stability"
  * "Optimized performance"
  ANY generic phrase = FAILURE. You MUST extract specific details from PR descriptions.
- De‑duplicate aggressively; avoid repeating the same benefit.
- Use short, concrete sentences with SPECIFIC technical details translated to benefits.
- Prefer active voice ("We fixed…", "Windows now handles…", "Added support for…").
- Keep bullets to **1 sentence** (2 max).
- Do not paste raw identifiers or file names into external sections.
- Each bullet must be UNIQUE - no two bullets should say the same thing.

MANDATORY ANALYSIS PROCESS:
1. Read EVERY PR description in the context data
2. Extract the SPECIFIC change (e.g., "added eUSB2v1 support", "fixed race condition in IBI DPC", "enabled FLDR reset capability")
3. Translate that specific change to a user benefit
4. Group by category based on keywords
5. Write ONE unique bullet per distinct improvement

QUALITY CHECK (before returning)
- Have you read ALL PR descriptions and extracted specific changes?
- Are all bullets UNIQUE with NO repetition?
- Did you avoid ALL forbidden generic phrases?
- Are categories actually present in data and ordered by impact?
- Do bullets explain both WHAT changed (specifically) and WHY it matters?
- Is all internal jargon removed or translated?
- Is the post ≤ 500 words (excluding developer section)?
- Are headings and lists spaced correctly (blank line before/after)?

IF YOU GENERATE GENERIC PHRASES OR REPETITIVE CONTENT, THE OUTPUT IS REJECTED.
You must provide SPECIFIC, CONCRETE improvements extracted from the actual PR descriptions.

Now read the CONTEXT DATA below and produce the final Markdown post.

===== CONTEXT DATA =====
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
