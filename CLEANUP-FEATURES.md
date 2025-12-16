# Cleanup Script Features

## Overview
The `Cleanup-WorkItems.ps1` script has been enhanced with multiple features for safer operation, better control, and improved traceability.

## 1. Interactive Task Selection

### Usage
Run the script without task switches to get an interactive menu:

```powershell
.\Cleanup-WorkItems.ps1 -DryRun
```

### Description
- **Purpose**: Allow users to choose which cleanup tasks to run without specifying command-line parameters
- **Behavior**:
  - Shows a menu with 6 options when no task switches are provided
  - Option 1: Run ALL cleanup tasks
  - Options 2-5: Run individual tasks (Task 1-4)
  - Option 6: Select multiple tasks (custom combination)
  - Validates user input and provides clear feedback
  - Exits with error if no tasks are selected

### When to Use
- When you want to run cleanup interactively
- When you're unsure which tasks you need to run
- For ad-hoc cleanup operations
- For learning and exploring the script capabilities

## 2. Task Selection Switches

### Usage
```powershell
# Run only Task 1
.\Cleanup-WorkItems.ps1 -Task1 -DryRun

# Run multiple tasks
.\Cleanup-WorkItems.ps1 -Task1 -Task3 -DryRun

# Run all tasks explicitly
.\Cleanup-WorkItems.ps1 -AllTasks -DryRun
```

### Description
- **Purpose**: Enable automation and scripting with specific task selection
- **Available Switches**:
  - `-Task1` or `-UpdateIterationPaths`: Update iteration paths for closed items
  - `-Task2` or `-SyncRanks`: Sync child item ranks with parents
  - `-Task3` or `-MoveToBacklog`: Move incomplete items to backlog
  - `-Task4` or `-MarkCompleted`: Mark deliverables as completed
  - `-AllTasks`: Run all tasks (equivalent to specifying all four task switches)
- **Behavior**:
  - Can be combined (e.g., `-Task1 -Task3`)
  - Skips interactive menu when any task switch is provided
  - Shows which tasks are selected before execution
  - If no task switches are provided, shows interactive menu

### When to Use
- In automated scripts and CI/CD pipelines
- When you know exactly which tasks you need
- For scheduled/recurring cleanup operations
- For documenting cleanup procedures

## 3. Bug Filtering

### Usage
```powershell
# Exclude bugs (default behavior)
.\Cleanup-WorkItems.ps1 -DryRun

# Include bugs explicitly
.\Cleanup-WorkItems.ps1 -IncludeBugs -DryRun
```

### Description
- **Purpose**: Control whether "Bug" work item types are included in cleanup operations
- **Default Behavior**: Bugs are **EXCLUDED** by default
- **Switches**:
  - `-ExcludeBugs`: Explicitly exclude bugs (this is the default, so optional)
  - `-IncludeBugs`: Include bugs in cleanup operations
- **Implementation**:
  - Modifies WIQL queries to filter out `[System.WorkItemType] <> 'Bug'`
  - Applied to Task 1 (iteration path updates)
  - Applied to Task 2 (rank synchronization)
  - Applied to Task 3 (move to backlog)
  - Task 4 not affected (deliverables are rarely bugs)

### When to Use
- **Exclude bugs (default)**: Most common scenario - bugs typically have different lifecycle management
- **Include bugs**: When you want bugs to follow the same cleanup rules as other work items

### Benefits
1. **Cleaner Backlog**: Keeps bug tracking separate from feature/task management
2. **Better Control**: Explicit control over bug inclusion
3. **Flexibility**: Can include bugs when needed without code changes
4. **Safe Default**: Bugs excluded by default prevents accidental modifications

## 4. Dry Run Mode

### Usage
```powershell
.\Cleanup-WorkItems.ps1 -DryRun
```

### Description
- **Purpose**: Preview all changes without making any modifications to Azure DevOps
- **Behavior**: 
  - Shows exactly which work items would be modified
  - Displays the proposed changes for each item
  - No API calls are made to update work items
  - No confirmation prompts (since no changes are made)
  - Generates a report file showing what would have been changed

### Output
When running in dry run mode, you'll see:
- `[DRY RUN] Would update iteration path`
- `[DRY RUN] Would update rank`
- `[DRY RUN] Would move to backlog`
- `[DRY RUN] Would mark as Completed`

The final summary will indicate: `[DRY RUN MODE] No changes were made`

### When to Use
- Before running the script for the first time
- After making configuration changes
- To verify the scope of changes before applying them
- To generate reports for review by stakeholders

## 5. Automated Tagging

### Tag Names
- `AutomatedCleanup` - Identifies all items modified by the script
- `AutomatedCleanup-YYYY-MM-DD` - Date-based tag for correlation and analysis

### Description
- **Purpose**: Track all work items modified by the cleanup script with both general and date-specific tags
- **Behavior**:
  - Every work item modified by the script receives both the `AutomatedCleanup` tag and a date-based tag
  - The date-based tag format is `AutomatedCleanup-YYYY-MM-DD` (e.g., `AutomatedCleanup-2025-12-16`)
  - Tags are appended to existing tags (no tags are lost)
  - Multiple runs of the script won't duplicate the tag
  - Both tags are added along with the actual changes in a single API call

### Benefits
1. **Audit Trail**: Easy to find all items touched by automation
2. **Troubleshooting**: Quickly identify items to review if issues arise
3. **Reporting**: Create queries to analyze the impact of automated cleanup
4. **Rollback Support**: If needed, you can query by tag to find items to review/revert
5. **Date-Based Correlation**: The date-based tag enables tracking changes by specific dates
6. **Improved Analysis**: Filter and analyze changes made on particular days

### Finding Tagged Items
In Azure DevOps, you can query for items with these tags:

**Find all items modified by the script:**
```
System.Tags Contains "AutomatedCleanup"
```

**Find items modified on a specific date:**
```
System.Tags Contains "AutomatedCleanup-2025-12-16"
```

**Combine with other filters:**
```
System.Tags Contains "AutomatedCleanup" 
AND System.ChangedDate >= @Today - 7
```

## Implementation Details

### Changes Applied by Script

All four types of changes add the tag:

1. **Iteration Path Updates** (Task 1)
   - Updates: `System.IterationPath`
   - Adds: `AutomatedCleanup` and `AutomatedCleanup-YYYY-MM-DD` tags
   - Adds: History comment

2. **Rank Updates** (Task 2)
   - Updates: `Microsoft.VSTS.Common.StackRank`
   - Adds: `AutomatedCleanup` and `AutomatedCleanup-YYYY-MM-DD` tags
   - Adds: History comment

3. **Move to Backlog** (Task 3)
   - Updates: `System.IterationPath`
   - Adds: `AutomatedCleanup` and `AutomatedCleanup-YYYY-MM-DD` tags
   - Adds: History comment

4. **Mark as Completed** (Task 4)
   - Updates: `System.State`
   - Adds: `AutomatedCleanup` and `AutomatedCleanup-YYYY-MM-DD` tags
   - Adds: History comment
   - Adds: Partner comments

### Tag Preservation
The script preserves existing tags by:
1. Reading current tags from the work item
2. Appending the new tag with semicolon separator
3. Updating the tags field with the combined value

Example:
- Before: `"Bug; Critical"`
- After: `"Bug; Critical; AutomatedCleanup; AutomatedCleanup-2025-12-16"`

## Example Usage

### Interactive Mode: Preview All Changes
```powershell
.\Cleanup-WorkItems.ps1 -DryRun
# Will prompt to select tasks interactively
```

### Run Specific Tasks
```powershell
# Run only Task 1
.\Cleanup-WorkItems.ps1 -Task1 -DryRun

# Run Tasks 1 and 3
.\Cleanup-WorkItems.ps1 -Task1 -Task3 -DryRun

# Run all tasks explicitly
.\Cleanup-WorkItems.ps1 -AllTasks -DryRun
```

### Include Bugs in Cleanup
```powershell
# Include bugs (not default)
.\Cleanup-WorkItems.ps1 -AllTasks -IncludeBugs -DryRun

# Run specific task with bugs
.\Cleanup-WorkItems.ps1 -Task3 -IncludeBugs -DryRun
```

### Apply Changes After Review
```powershell
# Interactive mode
.\Cleanup-WorkItems.ps1

# Specific tasks
.\Cleanup-WorkItems.ps1 -Task1 -Task3

# All tasks with bugs
.\Cleanup-WorkItems.ps1 -AllTasks -IncludeBugs
```

### Target Specific Iteration
```powershell
.\Cleanup-WorkItems.ps1 -SpecificIteration "Sprint 42" -Task1 -DryRun
```

## Reports

Both dry run and live modes generate JSON reports in the `output` folder:
- Filename: `cleanup-report-YYYY-MM-DD_HHMMSS.json`
- Contains: Summary statistics and detailed change log
- Includes: `dryRun` flag to indicate if changes were applied

## Safety Features

1. **Interactive Menu**: Clear task selection before execution
2. **Task Selection**: Run only the tasks you need
3. **Bug Filtering**: Bugs excluded by default to prevent unintended changes
4. **Dry Run Mode**: Test without risk
5. **Confirmation Prompt**: Required before applying changes (unless dry run)
6. **Tagging**: Audit trail for all changes
7. **History Comments**: Each change documented in work item history
8. **Error Handling**: Failed updates don't block other updates
9. **Detailed Logging**: Console output shows each operation's status

## Best Practices

1. **Always start with -DryRun** to preview changes
2. **Use interactive mode** when exploring or learning
3. **Use task switches** for automation and scripting
4. **Keep bugs excluded** unless you have a specific reason to include them
5. **Run specific tasks** when you only need certain cleanup operations
6. **Review the generated report** before running in live mode
7. **Use tags** to monitor the impact of automated changes
8. **Keep reports** for historical reference
9. **Schedule regular runs** at iteration boundaries
10. **Monitor tagged items** for any unexpected patterns
