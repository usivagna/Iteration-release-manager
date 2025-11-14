# Generate-ReleaseNotes.ps1
# Automation script to generate iteration release notes for Buses team
# Uses GitHub Copilot with ADO MCP to query work items and generate summaries

param(
    [string]$ProjectName = "OS",
    [string]$TeamName = "ft_buses",
    [string]$OutputDir = ".\output",
    [switch]$UseCurrentIteration = $true,
    [string]$SpecificIteration = ""
)

# Configuration
$AreaPaths = @(
    "OS\Core\Connectivity Platform\Buses",
    "OS\Core\Connectivity Platform\Sensors"
)

Write-Host "=== Iteration Release Notes Generator ===" -ForegroundColor Cyan
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

Write-Host "Step 1: Querying iteration information..." -ForegroundColor Cyan
Write-Host "This requires GitHub Copilot with ADO MCP tools to be active in VS Code." -ForegroundColor Yellow
Write-Host ""
Write-Host "Please use GitHub Copilot Chat with the following prompt:" -ForegroundColor Magenta
Write-Host ""
Write-Host "---COPILOT PROMPT START---" -ForegroundColor DarkGray

$prompt1 = "Using ADO MCP tools:`n" +
"1. Get the list of team iterations for project '$ProjectName' and team '$TeamName'`n" +
"2. Identify the previous completed iteration (not the current one)`n" +
"3. Extract the start date and end date for that iteration`n" +
"4. Save this information to a file called 'iteration-info.json' in the output folder with this structure:`n" +
"{`n" +
"  `"iterationId`": `"<iteration_id>`",`n" +
"  `"iterationName`": `"<iteration_name>`",`n" +
"  `"startDate`": `"<start_date>`",`n" +
"  `"endDate`": `"<end_date>`",`n" +
"  `"project`": `"$ProjectName`",`n" +
"  `"team`": `"$TeamName`"`n" +
"}"

Write-Host $prompt1 -ForegroundColor White
Write-Host "---COPILOT PROMPT END---" -ForegroundColor DarkGray
Write-Host ""

# Wait for user to complete step 1
Read-Host "Press Enter after Copilot has generated iteration-info.json"

# Check if iteration info file exists
$iterationInfoPath = Join-Path $OutputDir "iteration-info.json"
if (-not (Test-Path $iterationInfoPath)) {
    Write-Host "ERROR: iteration-info.json not found in output folder!" -ForegroundColor Red
    Write-Host "Please run the Copilot prompt above first." -ForegroundColor Red
    exit 1
}

$iterationInfo = Get-Content $iterationInfoPath | ConvertFrom-Json
Write-Host "Loaded iteration: $($iterationInfo.iterationName)" -ForegroundColor Green
Write-Host "  Start: $($iterationInfo.startDate)" -ForegroundColor Gray
Write-Host "  End: $($iterationInfo.endDate)" -ForegroundColor Gray
Write-Host ""

Write-Host "Step 2: Querying completed work items..." -ForegroundColor Cyan
Write-Host "Please use GitHub Copilot Chat with the following prompt:" -ForegroundColor Magenta
Write-Host ""
Write-Host "---COPILOT PROMPT START---" -ForegroundColor DarkGray

$areaPathsFormatted = ($AreaPaths | ForEach-Object { "'$_'" }) -join " OR "
$prompt2 = "Using ADO MCP tools:`n" +
"1. Search for all work items in project '$ProjectName' that meet ALL these criteria:`n" +
"   - Area path is $areaPathsFormatted`n" +
"   - State is 'Closed' or 'Done' or 'Completed'`n" +
"   - Closed date is between '$($iterationInfo.startDate)' and '$($iterationInfo.endDate)'`n" +
"2. For each work item found, get the full details including:`n" +
"   - ID, Title, Type, State, Area Path`n" +
"   - Description`n" +
"   - All linked pull requests (use the relations/links to find PR artifacts)`n" +
"3. For each linked PR, get the PR details including:`n" +
"   - PR ID, Title, Description`n" +
"   - Repository name`n" +
"   - Source and target branches`n" +
"4. Save all this data to 'work-items-with-prs.json' in the output folder with this structure:`n" +
"{`n" +
"  `"iterationName`": `"$($iterationInfo.iterationName)`",`n" +
"  `"startDate`": `"$($iterationInfo.startDate)`",`n" +
"  `"endDate`": `"$($iterationInfo.endDate)`",`n" +
"  `"workItems`": [`n" +
"    {`n" +
"      `"id`": <work_item_id>,`n" +
"      `"title`": `"<work_item_title>`",`n" +
"      `"type`": `"<work_item_type>`",`n" +
"      `"state`": `"<state>`",`n" +
"      `"areaPath`": `"<area_path>`",`n" +
"      `"description`": `"<description>`",`n" +
"      `"pullRequests`": [`n" +
"        {`n" +
"          `"id`": <pr_id>,`n" +
"          `"title`": `"<pr_title>`",`n" +
"          `"description`": `"<pr_description>`",`n" +
"          `"repository`": `"<repo_name>`",`n" +
"          `"sourceBranch`": `"<source>`",`n" +
"          `"targetBranch`": `"<target>`"`n" +
"        }`n" +
"      ]`n" +
"    }`n" +
"  ]`n" +
"}"

Write-Host $prompt2 -ForegroundColor White
Write-Host "---COPILOT PROMPT END---" -ForegroundColor DarkGray
Write-Host ""

Read-Host "Press Enter after Copilot has generated work-items-with-prs.json"

# Check if work items file exists
$workItemsPath = Join-Path $OutputDir "work-items-with-prs.json"
if (-not (Test-Path $workItemsPath)) {
    Write-Host "ERROR: work-items-with-prs.json not found in output folder!" -ForegroundColor Red
    exit 1
}

$workItemsData = Get-Content $workItemsPath | ConvertFrom-Json
Write-Host "Loaded $($workItemsData.workItems.Count) work items" -ForegroundColor Green
Write-Host ""

Write-Host "Step 3: Generating internal summary for engineering managers..." -ForegroundColor Cyan
Write-Host "Please use GitHub Copilot Chat with the following prompt:" -ForegroundColor Magenta
Write-Host ""
Write-Host "---COPILOT PROMPT START---" -ForegroundColor DarkGray

$prompt3 = "Based on the data in 'work-items-with-prs.json', create an internal iteration summary document for engineering managers.`n`n" +
"Target Audience: Engineering managers and technical leads`n" +
"Tone: Professional, technical, data-driven`n`n" +
"The document should include:`n`n" +
"# Iteration Summary: $($iterationInfo.iterationName)`n" +
"**Period:** $($iterationInfo.startDate) to $($iterationInfo.endDate)`n" +
"**Team:** $TeamName`n" +
"**Areas:** Buses & Sensors`n`n" +
"## Executive Summary`n" +
"- Total work items completed: [count]`n" +
"- Breakdown by type (User Story, Bug, Task, etc.)`n" +
"- Breakdown by area (Buses vs Sensors)`n" +
"- Key themes and focus areas`n`n" +
"## Completed Work Items`n`n" +
"For each area path, organize work items and provide:`n" +
"- Work item ID and title`n" +
"- Brief technical description based on work item description and PR descriptions`n" +
"- Key changes/implementations from the PRs`n" +
"- Any notable technical challenges or solutions mentioned`n`n" +
"### Buses Component`n" +
"[List work items from OS\Core\Connectivity Platform\Buses]`n`n" +
"### Sensors Component`n" +
"[List work items from OS\Core\Connectivity Platform\Sensors]`n`n" +
"## Technical Highlights`n" +
"- Major features implemented`n" +
"- Critical bugs fixed`n" +
"- Infrastructure/tooling improvements`n" +
"- Technical debt addressed`n`n" +
"## Pull Request Summary`n" +
"- Total PRs merged: [count]`n" +
"- Most active repositories`n" +
"- Code review metrics (if available)`n`n" +
"## Risks and Dependencies`n" +
"- Any blocking issues mentioned in work items`n" +
"- Cross-team dependencies identified`n" +
"- Technical risks or concerns`n`n" +
"Save this to '$OutputDir\internal-summary-$timestamp.md'"

Write-Host $prompt3 -ForegroundColor White
Write-Host "---COPILOT PROMPT END---" -ForegroundColor DarkGray
Write-Host ""

Read-Host "Press Enter after Copilot has generated the internal summary"

Write-Host "Step 4: Generating Windows Insider release notes..." -ForegroundColor Cyan
Write-Host "Please use GitHub Copilot Chat with the following prompt:" -ForegroundColor Magenta
Write-Host ""
Write-Host "---COPILOT PROMPT START---" -ForegroundColor DarkGray

$prompt4 = "Based on the data in 'work-items-with-prs.json', create release notes for the Windows Insider audience.`n`n" +
"Target Audience: Windows Insiders (technical enthusiasts, developers, early adopters)`n" +
"Tone: Friendly, informative, user-focused (not too technical)`n`n" +
"The document should include:`n`n" +
"# What's New in Buses & Sensors - $($iterationInfo.iterationName)`n`n" +
"## Overview`n" +
"Brief introduction about what changed in this iteration for connectivity and sensors.`n`n" +
"## New Features`n" +
"Describe new features in user-friendly language:`n" +
"- What the feature does`n" +
"- Why it matters to users`n" +
"- How to try it out (if applicable)`n`n" +
"## Improvements`n" +
"List improvements and enhancements:`n" +
"- Performance improvements`n" +
"- Reliability enhancements`n" +
"- Better error handling`n" +
"- UX improvements`n`n" +
"## Bug Fixes`n" +
"Notable bug fixes that users would care about:`n" +
"- What was broken`n" +
"- What's now fixed`n" +
"- Impact on user experience`n`n" +
"## Known Issues`n" +
"Any known issues or limitations to be aware of.`n`n" +
"## For Developers`n" +
"Technical details for developers working with these APIs:`n" +
"- API changes`n" +
"- Breaking changes`n" +
"- New capabilities`n" +
"- Sample code or documentation links (if applicable)`n`n" +
"## What's Next`n" +
"Tease upcoming work or features in development (be cautious about commitments).`n`n" +
"---`n" +
"**Note:** These features are available to Windows Insiders in [specify builds/rings if known].`n`n" +
"Guidelines:`n" +
"- Use clear, user-friendly language`n" +
"- Focus on user impact, not implementation details`n" +
"- Group related changes together`n" +
"- Use active voice`n" +
"- Keep it concise but informative`n" +
"- Avoid internal jargon or code names`n`n" +
"Save this to '$OutputDir\insider-release-notes-$timestamp.md'"

Write-Host $prompt4 -ForegroundColor White
Write-Host "---COPILOT PROMPT END---" -ForegroundColor DarkGray
Write-Host ""

Read-Host "Press Enter after Copilot has generated the release notes"

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
Write-Host "Review the documents and make any necessary edits before distribution." -ForegroundColor Yellow
