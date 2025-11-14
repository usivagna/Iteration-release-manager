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

$prompt1 = @"
Using ADO MCP tools:
1. Get the list of team iterations for project '$ProjectName' and team '$TeamName'
2. Identify the previous completed iteration (not the current one)
3. Extract the start date and end date for that iteration
4. Save this information to a file called 'iteration-info.json' in the output folder with this structure:
{
  "iterationId": "<iteration_id>",
  "iterationName": "<iteration_name>",
  "startDate": "<start_date>",
  "endDate": "<end_date>",
  "project": "$ProjectName",
  "team": "$TeamName"
}
"@

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
Write-Host "✓ Loaded iteration: $($iterationInfo.iterationName)" -ForegroundColor Green
Write-Host "  Start: $($iterationInfo.startDate)" -ForegroundColor Gray
Write-Host "  End: $($iterationInfo.endDate)" -ForegroundColor Gray
Write-Host ""

Write-Host "Step 2: Querying completed work items..." -ForegroundColor Cyan
Write-Host "Please use GitHub Copilot Chat with the following prompt:" -ForegroundColor Magenta
Write-Host ""
Write-Host "---COPILOT PROMPT START---" -ForegroundColor DarkGray

$areaPathsFormatted = ($AreaPaths | ForEach-Object { "'$_'" }) -join " OR "
$prompt2 = @"
Using ADO MCP tools:
1. Search for all work items in project '$ProjectName' that meet ALL these criteria:
   - Area path is $areaPathsFormatted
   - State is 'Closed' or 'Done' or 'Completed'
   - Closed date is between '$($iterationInfo.startDate)' and '$($iterationInfo.endDate)'
2. For each work item found, get the full details including:
   - ID, Title, Type, State, Area Path
   - Description
   - All linked pull requests (use the relations/links to find PR artifacts)
3. For each linked PR, get the PR details including:
   - PR ID, Title, Description
   - Repository name
   - Source and target branches
4. Save all this data to 'work-items-with-prs.json' in the output folder with this structure:
{
  "iterationName": "$($iterationInfo.iterationName)",
  "startDate": "$($iterationInfo.startDate)",
  "endDate": "$($iterationInfo.endDate)",
  "workItems": [
    {
      "id": <work_item_id>,
      "title": "<work_item_title>",
      "type": "<work_item_type>",
      "state": "<state>",
      "areaPath": "<area_path>",
      "description": "<description>",
      "pullRequests": [
        {
          "id": <pr_id>,
          "title": "<pr_title>",
          "description": "<pr_description>",
          "repository": "<repo_name>",
          "sourceBranch": "<source>",
          "targetBranch": "<target>"
        }
      ]
    }
  ]
}
"@

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
Write-Host "✓ Loaded $($workItemsData.workItems.Count) work items" -ForegroundColor Green
Write-Host ""

Write-Host "Step 3: Generating internal summary for engineering managers..." -ForegroundColor Cyan
Write-Host "Please use GitHub Copilot Chat with the following prompt:" -ForegroundColor Magenta
Write-Host ""
Write-Host "---COPILOT PROMPT START---" -ForegroundColor DarkGray

$prompt3 = @"
Based on the data in 'work-items-with-prs.json', create an internal iteration summary document for engineering managers.

Target Audience: Engineering managers and technical leads
Tone: Professional, technical, data-driven

The document should include:

# Iteration Summary: $($iterationInfo.iterationName)
**Period:** $($iterationInfo.startDate) to $($iterationInfo.endDate)
**Team:** $TeamName
**Areas:** Buses & Sensors

## Executive Summary
- Total work items completed: [count]
- Breakdown by type (User Story, Bug, Task, etc.)
- Breakdown by area (Buses vs Sensors)
- Key themes and focus areas

## Completed Work Items

For each area path, organize work items and provide:
- Work item ID and title
- Brief technical description based on work item description and PR descriptions
- Key changes/implementations from the PRs
- Any notable technical challenges or solutions mentioned

### Buses Component
[List work items from OS\Core\Connectivity Platform\Buses]

### Sensors Component
[List work items from OS\Core\Connectivity Platform\Sensors]

## Technical Highlights
- Major features implemented
- Critical bugs fixed
- Infrastructure/tooling improvements
- Technical debt addressed

## Pull Request Summary
- Total PRs merged: [count]
- Most active repositories
- Code review metrics (if available)

## Risks and Dependencies
- Any blocking issues mentioned in work items
- Cross-team dependencies identified
- Technical risks or concerns

Save this to '$OutputDir\internal-summary-$timestamp.md'
"@

Write-Host $prompt3 -ForegroundColor White
Write-Host "---COPILOT PROMPT END---" -ForegroundColor DarkGray
Write-Host ""

Read-Host "Press Enter after Copilot has generated the internal summary"

Write-Host "Step 4: Generating Windows Insider release notes..." -ForegroundColor Cyan
Write-Host "Please use GitHub Copilot Chat with the following prompt:" -ForegroundColor Magenta
Write-Host ""
Write-Host "---COPILOT PROMPT START---" -ForegroundColor DarkGray

$prompt4 = @"
Based on the data in 'work-items-with-prs.json', create release notes for the Windows Insider audience.

Target Audience: Windows Insiders (technical enthusiasts, developers, early adopters)
Tone: Friendly, informative, user-focused (not too technical)

The document should include:

# What's New in Buses & Sensors - $($iterationInfo.iterationName)

## Overview
Brief introduction about what changed in this iteration for connectivity and sensors.

## New Features
Describe new features in user-friendly language:
- What the feature does
- Why it matters to users
- How to try it out (if applicable)

## Improvements
List improvements and enhancements:
- Performance improvements
- Reliability enhancements
- Better error handling
- UX improvements

## Bug Fixes
Notable bug fixes that users would care about:
- What was broken
- What's now fixed
- Impact on user experience

## Known Issues
Any known issues or limitations to be aware of.

## For Developers
Technical details for developers working with these APIs:
- API changes
- Breaking changes
- New capabilities
- Sample code or documentation links (if applicable)

## What's Next
Tease upcoming work or features in development (be cautious about commitments).

---
**Note:** These features are available to Windows Insiders in [specify builds/rings if known].

Guidelines:
- Use clear, user-friendly language
- Focus on user impact, not implementation details
- Group related changes together
- Use active voice
- Keep it concise but informative
- Avoid internal jargon or code names

Save this to '$OutputDir\insider-release-notes-$timestamp.md'
"@

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
