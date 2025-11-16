# Cleanup-WorkItems.ps1
# Automation script to clean up work items at the end of iterations
# Uses GitHub Copilot with ADO MCP to query and update work items

param(
    [string]$ProjectName = "OS",
    [string]$TeamName = "ft_buses",
    [string]$OutputDir = ".\output"
)

# Configuration - shared with Generate-ReleaseNotes.ps1
$AreaPaths = @(
    "OS\Core\Connectivity Platform\Buses",
    "OS\Core\Connectivity Platform\Sensors"
)

Write-Host "=== Work Item Cleanup Automation ===" -ForegroundColor Cyan
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
"3. Extract the start date, end date, and iteration path for that iteration`n" +
"4. Save this information to a file called 'cleanup-iteration-info.json' in the output folder with this structure:`n" +
"{`n" +
"  `"iterationId`": `"<iteration_id>`",`n" +
"  `"iterationName`": `"<iteration_name>`",`n" +
"  `"iterationPath`": `"<full_iteration_path>`",`n" +
"  `"startDate`": `"<start_date>`",`n" +
"  `"endDate`": `"<end_date>`",`n" +
"  `"project`": `"$ProjectName`",`n" +
"  `"team`": `"$TeamName`"`n" +
"}"

Write-Host $prompt1 -ForegroundColor White
Write-Host "---COPILOT PROMPT END---" -ForegroundColor DarkGray
Write-Host ""

# Wait for user to complete step 1
Read-Host "Press Enter after Copilot has generated cleanup-iteration-info.json"

# Check if iteration info file exists
$iterationInfoPath = Join-Path $OutputDir "cleanup-iteration-info.json"
if (-not (Test-Path $iterationInfoPath)) {
    Write-Host "ERROR: cleanup-iteration-info.json not found in output folder!" -ForegroundColor Red
    Write-Host "Please run the Copilot prompt above first." -ForegroundColor Red
    exit 1
}

$iterationInfo = Get-Content $iterationInfoPath | ConvertFrom-Json
Write-Host "Loaded iteration: $($iterationInfo.iterationName)" -ForegroundColor Green
Write-Host "  Start: $($iterationInfo.startDate)" -ForegroundColor Gray
Write-Host "  End: $($iterationInfo.endDate)" -ForegroundColor Gray
Write-Host "  Path: $($iterationInfo.iterationPath)" -ForegroundColor Gray
Write-Host ""

Write-Host "Step 2: Finding work items to clean up..." -ForegroundColor Cyan
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
"   - ID, Title, Type, State`n" +
"   - Area Path`n" +
"   - Current Iteration Path (if set)`n" +
"   - Closed Date`n" +
"   - Parent work item ID (from relations/links)`n" +
"   - Current Rank field value`n" +
"3. For work items that have a parent, also retrieve the parent work item details including:`n" +
"   - Parent ID`n" +
"   - Parent Rank field value`n" +
"4. Save all this data to 'cleanup-work-items.json' in the output folder with this structure:`n" +
"{`n" +
"  `"iterationName`": `"$($iterationInfo.iterationName)`",`n" +
"  `"iterationPath`": `"$($iterationInfo.iterationPath)`",`n" +
"  `"startDate`": `"$($iterationInfo.startDate)`",`n" +
"  `"endDate`": `"$($iterationInfo.endDate)`",`n" +
"  `"workItems`": [`n" +
"    {`n" +
"      `"id`": <work_item_id>,`n" +
"      `"title`": `"<work_item_title>`",`n" +
"      `"type`": `"<work_item_type>`",`n" +
"      `"state`": `"<state>`",`n" +
"      `"areaPath`": `"<area_path>`",`n" +
"      `"iterationPath`": `"<current_iteration_path_or_null>`",`n" +
"      `"closedDate`": `"<closed_date>`",`n" +
"      `"rank`": `"<current_rank_value>`",`n" +
"      `"parentId`": <parent_id_or_null>,`n" +
"      `"parentRank`": `"<parent_rank_value_or_null>`"`n" +
"    }`n" +
"  ]`n" +
"}"

Write-Host $prompt2 -ForegroundColor White
Write-Host "---COPILOT PROMPT END---" -ForegroundColor DarkGray
Write-Host ""

Read-Host "Press Enter after Copilot has generated cleanup-work-items.json"

# Check if work items file exists
$workItemsPath = Join-Path $OutputDir "cleanup-work-items.json"
if (-not (Test-Path $workItemsPath)) {
    Write-Host "ERROR: cleanup-work-items.json not found in output folder!" -ForegroundColor Red
    exit 1
}

$workItemsData = Get-Content $workItemsPath | ConvertFrom-Json
Write-Host "Loaded $($workItemsData.workItems.Count) work items to process" -ForegroundColor Green
Write-Host ""

Write-Host "Step 3: Performing cleanup operations..." -ForegroundColor Cyan
Write-Host "Please use GitHub Copilot Chat with the following prompt:" -ForegroundColor Magenta
Write-Host ""
Write-Host "---COPILOT PROMPT START---" -ForegroundColor DarkGray

$prompt3 = "Using ADO MCP tools, perform the following cleanup operations based on data in 'cleanup-work-items.json':`n`n" +
"For each work item in the list, perform these updates:`n`n" +
"**Task 1: Assign Iteration Path**`n" +
"- If the work item's current iterationPath is null or different from '$($iterationInfo.iterationPath)'`n" +
"- Update the work item's Iteration Path field to: '$($iterationInfo.iterationPath)'`n" +
"- This assigns closed items to the iteration they were completed in`n`n" +
"**Task 2: Sync Rank with Parent**`n" +
"- If the work item has a parentId (parentId is not null)`n" +
"- AND the parentRank is not null`n" +
"- AND the work item's current rank is different from the parentRank`n" +
"- Update the work item's Rank field to match the parentRank value`n" +
"- This ensures child items have the same rank as their parent`n`n" +
"For each work item that is updated, track:`n" +
"- Work item ID`n" +
"- Which fields were updated (Iteration Path, Rank, or both)`n" +
"- Old values and new values`n`n" +
"After completing all updates, save a summary to 'cleanup-summary-$timestamp.json' with this structure:`n" +
"{`n" +
"  `"timestamp`": `"$timestamp`",`n" +
"  `"iterationName`": `"$($iterationInfo.iterationName)`",`n" +
"  `"iterationPath`": `"$($iterationInfo.iterationPath)`",`n" +
"  `"totalWorkItems`": <count>,`n" +
"  `"updatedWorkItems`": <count>,`n" +
"  `"updates`": [`n" +
"    {`n" +
"      `"workItemId`": <id>,`n" +
"      `"title`": `"<title>`",`n" +
"      `"updatedFields`": [`"Iteration Path`", `"Rank`"],`n" +
"      `"changes`": {`n" +
"        `"iterationPath`": {`"old`": `"<old_value>`", `"new`": `"<new_value>`"},`n" +
"        `"rank`": {`"old`": `"<old_value>`", `"new`": `"<new_value>`"}`n" +
"      }`n" +
"    }`n" +
"  ]`n" +
"}`n`n" +
"Note: Use the ADO MCP work item update capabilities to modify the fields. Make sure to handle errors gracefully and report any failures."

Write-Host $prompt3 -ForegroundColor White
Write-Host "---COPILOT PROMPT END---" -ForegroundColor DarkGray
Write-Host ""

Read-Host "Press Enter after Copilot has completed the cleanup operations"

# Check if summary file exists
$summaryPath = Join-Path $OutputDir "cleanup-summary-$timestamp.json"
if (-not (Test-Path $summaryPath)) {
    Write-Host "WARNING: cleanup-summary-$timestamp.json not found!" -ForegroundColor Yellow
    Write-Host "Cleanup may have been completed, but summary file was not generated." -ForegroundColor Yellow
} else {
    $summary = Get-Content $summaryPath | ConvertFrom-Json
    Write-Host ""
    Write-Host "=== Cleanup Summary ===" -ForegroundColor Green
    Write-Host "Iteration: $($summary.iterationName)" -ForegroundColor White
    Write-Host "Total work items processed: $($summary.totalWorkItems)" -ForegroundColor White
    Write-Host "Work items updated: $($summary.updatedWorkItems)" -ForegroundColor White
    Write-Host ""
    
    if ($summary.updatedWorkItems -gt 0) {
        Write-Host "Updated work items:" -ForegroundColor Cyan
        foreach ($update in $summary.updates) {
            Write-Host "  [$($update.workItemId)] $($update.title)" -ForegroundColor White
            Write-Host "    Fields updated: $($update.updatedFields -join ', ')" -ForegroundColor Gray
            if ($update.changes.iterationPath) {
                Write-Host "    Iteration Path: '$($update.changes.iterationPath.old)' -> '$($update.changes.iterationPath.new)'" -ForegroundColor Gray
            }
            if ($update.changes.rank) {
                Write-Host "    Rank: '$($update.changes.rank.old)' -> '$($update.changes.rank.new)'" -ForegroundColor Gray
            }
        }
    }
}

Write-Host ""
Write-Host "=== Cleanup Complete ===" -ForegroundColor Green
Write-Host "Output files are in: $OutputDir" -ForegroundColor Yellow
Write-Host ""
Write-Host "Files generated:" -ForegroundColor Cyan
Write-Host "  - cleanup-iteration-info.json (iteration metadata)" -ForegroundColor Gray
Write-Host "  - cleanup-work-items.json (work items data)" -ForegroundColor Gray
Write-Host "  - cleanup-summary-$timestamp.json (cleanup results)" -ForegroundColor Gray
Write-Host ""
Write-Host "Review the summary to verify all expected updates were completed." -ForegroundColor Yellow
