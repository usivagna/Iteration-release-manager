# Cleanup Script Features

## Overview
The `Cleanup-WorkItems.ps1` script has been enhanced with two key features for safer operation and better traceability.

## 1. Dry Run Mode

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

## 2. Automated Tagging

### Tag Name
`AutomatedCleanup`

### Description
- **Purpose**: Track all work items modified by the cleanup script
- **Behavior**:
  - Every work item modified by the script receives the `AutomatedCleanup` tag
  - Tags are appended to existing tags (no tags are lost)
  - Multiple runs of the script won't duplicate the tag
  - The tag is added along with the actual changes in a single API call

### Benefits
1. **Audit Trail**: Easy to find all items touched by automation
2. **Troubleshooting**: Quickly identify items to review if issues arise
3. **Reporting**: Create queries to analyze the impact of automated cleanup
4. **Rollback Support**: If needed, you can query by tag to find items to review/revert

### Finding Tagged Items
In Azure DevOps, you can query for items with this tag:

```
System.Tags Contains "AutomatedCleanup"
```

Or combine with other filters:
```
System.Tags Contains "AutomatedCleanup" 
AND System.ChangedDate >= @Today - 7
```

## Implementation Details

### Changes Applied by Script

All four types of changes add the tag:

1. **Iteration Path Updates** (Task 1)
   - Updates: `System.IterationPath`
   - Adds: `AutomatedCleanup` tag
   - Adds: History comment

2. **Rank Updates** (Task 2)
   - Updates: `Microsoft.VSTS.Common.StackRank`
   - Adds: `AutomatedCleanup` tag
   - Adds: History comment

3. **Move to Backlog** (Task 3)
   - Updates: `System.IterationPath`
   - Adds: `AutomatedCleanup` tag
   - Adds: History comment

4. **Mark as Completed** (Task 4)
   - Updates: `System.State`
   - Adds: `AutomatedCleanup` tag
   - Adds: History comment
   - Adds: Partner comments

### Tag Preservation
The script preserves existing tags by:
1. Reading current tags from the work item
2. Appending the new tag with semicolon separator
3. Updating the tags field with the combined value

Example:
- Before: `"Bug; Critical"`
- After: `"Bug; Critical; AutomatedCleanup"`

## Example Usage

### First Time: Preview Changes
```powershell
.\Cleanup-WorkItems.ps1 -DryRun -Organization "myorg"
```

### Apply Changes After Review
```powershell
.\Cleanup-WorkItems.ps1 -Organization "myorg"
```

### Target Specific Iteration
```powershell
.\Cleanup-WorkItems.ps1 -SpecificIteration "Sprint 42" -DryRun
```

## Reports

Both dry run and live modes generate JSON reports in the `output` folder:
- Filename: `cleanup-report-YYYY-MM-DD_HHMMSS.json`
- Contains: Summary statistics and detailed change log
- Includes: `dryRun` flag to indicate if changes were applied

## Safety Features

1. **Dry Run Mode**: Test without risk
2. **Confirmation Prompt**: Required before applying changes (unless dry run)
3. **Tagging**: Audit trail for all changes
4. **History Comments**: Each change documented in work item history
5. **Error Handling**: Failed updates don't block other updates
6. **Detailed Logging**: Console output shows each operation's status

## Best Practices

1. **Always start with -DryRun** to preview changes
2. **Review the generated report** before running in live mode
3. **Use tags** to monitor the impact of automated changes
4. **Keep reports** for historical reference
5. **Schedule regular runs** at iteration boundaries
6. **Monitor tagged items** for any unexpected patterns
