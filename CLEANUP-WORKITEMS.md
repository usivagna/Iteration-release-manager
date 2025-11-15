# Work Item Cleanup Automation

Automated tool to clean up work items at the end of iterations for the Buses & Sensors team using GitHub Copilot with Azure DevOps MCP tools.

## Overview

This automation helps engineering managers maintain work item hygiene by:
1. **Assigning closed items to the correct iteration**: If an item was closed within the start and end dates of an iteration, it automatically sets the iteration path to that iteration
2. **Synchronizing rank fields**: Makes the rank field of child items match their parent item's rank

## Prerequisites

### Required Tools
- **PowerShell 5.1+** (Windows PowerShell or PowerShell Core)
- **VS Code** with the following extensions:
  - GitHub Copilot
  - GitHub Copilot Chat
- **Azure DevOps MCP Server** configured and connected to GitHub Copilot

### Azure DevOps Access
- Access to the **OS** project in Azure DevOps
- Permissions to:
  - Read work items in the specified area paths
  - Read team iterations
  - **Update work items** (Iteration Path and Rank fields)

### Area Paths Covered
- `OS\Core\Connectivity Platform\Buses`
- `OS\Core\Connectivity Platform\Sensors`

## How to Run

### Testing with Example Data (Recommended First)

1. Open PowerShell in VS Code (Terminal → New Terminal)
2. Navigate to the repository folder
3. Run the test script:
   ```powershell
   .\Test-WorkItemCleanup.ps1
   ```
4. Review the output to understand what the cleanup script will do

### Running the Real Cleanup

⚠️ **WARNING**: This script will modify work items in Azure DevOps. Make sure you understand the changes before proceeding.

1. Open PowerShell in VS Code
2. Navigate to the repository folder:
   ```powershell
   cd c:\Users\<username>\source\repos\Iteration-release-manager
   ```
3. Run the script:
   ```powershell
   .\Cleanup-WorkItems.ps1
   ```
4. Follow the prompts - the script will guide you through three steps:
   - **Step 1**: Query iteration information
   - **Step 2**: Find work items to clean up
   - **Step 3**: Perform cleanup operations

### Custom Parameters

```powershell
.\Cleanup-WorkItems.ps1 -ProjectName "OS" -TeamName "ft_buses" -OutputDir ".\output"
```

### Parameters

| Parameter | Description | Default | Required |
|-----------|-------------|---------|----------|
| `-ProjectName` | Azure DevOps project name | `"OS"` | No |
| `-TeamName` | Team name in ADO | `"ft_buses"` | No |
| `-OutputDir` | Output directory for generated files | `".\output"` | No |

## How It Works

### Step 1: Query Iteration Information
The script prompts you to use GitHub Copilot to query ADO for:
- Previous completed iteration details
- Start and end dates
- Full iteration path for assignment

**Output**: `cleanup-iteration-info.json`

### Step 2: Find Work Items to Clean Up
Copilot queries ADO for:
- All work items closed within the iteration date range
- Filtering by area paths (Buses and Sensors)
- Only items in "Closed", "Done", or "Completed" state
- Parent work item relationships
- Current rank values and parent rank values

**Output**: `cleanup-work-items.json`

### Step 3: Perform Cleanup Operations
Copilot performs two types of updates:

#### A. Assign Iteration Path
For each work item:
- If the item's iteration path is not set or is different from the target iteration
- AND the item was closed within the iteration dates
- Update the Iteration Path field to the correct iteration

#### B. Sync Rank with Parent
For each work item that has a parent:
- If the item's rank differs from the parent's rank
- Update the Rank field to match the parent's rank
- This ensures consistent ranking within work item hierarchies

**Output**: `cleanup-summary-{timestamp}.json`

## Output Files

All generated files are saved in the `output` folder:

```
output/
├── cleanup-iteration-info.json           # Iteration metadata
├── cleanup-work-items.json               # Work items to process
└── cleanup-summary-2024-11-15_103045.json # Cleanup results
```

## Example Workflow

### End-of-Iteration Cleanup

1. **After iteration close**, ensure all work items are properly closed
2. **Run the cleanup script**:
   ```powershell
   .\Cleanup-WorkItems.ps1
   ```
3. When prompted, **open GitHub Copilot Chat** (Ctrl+Shift+I)
4. **Copy the prompt** displayed in the terminal
5. **Paste into Copilot Chat** and press Enter
6. **Wait for Copilot** to complete the task
7. **Press Enter in the terminal** to continue to the next step
8. Repeat for all three steps
9. **Review the summary** to verify all expected updates

## Understanding the Updates

### Iteration Path Assignment Example

**Before Cleanup:**
- Work Item #12345: "Fix USB bug"
  - Closed Date: 2025-09-10
  - Iteration Path: (not set)

**After Cleanup:**
- Work Item #12345: "Fix USB bug"
  - Closed Date: 2025-09-10
  - Iteration Path: "OS\ft_buses\2025.09 Sprint 3"

### Rank Synchronization Example

**Before Cleanup:**
- Parent #100: "USB4 Feature"
  - Rank: 500000
- Child #101: "Implement power management" (parent: #100)
  - Rank: 1000000

**After Cleanup:**
- Parent #100: "USB4 Feature"
  - Rank: 500000
- Child #101: "Implement power management" (parent: #100)
  - Rank: 500000 (now matches parent)

## Regular Use

Run this script at the end of each iteration (sprint) to:
1. Ensure all closed work items are assigned to the correct iteration
2. Maintain consistent ranking across parent-child relationships
3. Keep work item data clean for reporting and planning

## Tips and Best Practices

### For Best Results
- **Run after iteration close**: Wait until all work items are properly closed
- **Review the summary**: Always check the cleanup summary before considering the job done
- **Backup strategy**: The summary file provides a record of all changes made

### Troubleshooting

**Problem**: Copilot doesn't respond or times out
- Check that ADO MCP server is connected
- Try breaking down the query into smaller parts
- Ensure you have network access to Azure DevOps

**Problem**: No work items found
- Verify the iteration dates are correct
- Check that work items are in "Closed", "Done", or "Completed" state
- Confirm area paths are correct
- Verify you have read permissions

**Problem**: Updates failed
- Ensure you have update permissions for work items
- Check that the Iteration Path exists and is valid
- Verify the Rank field is accessible and updateable

**Problem**: Some work items weren't updated
- Review the cleanup summary to see which items were skipped
- Check if those items had conditions that prevented updates
- Verify parent-child relationships are correctly established

## Relationship with Other Scripts

### Shared Configuration
This script shares configuration with `Generate-ReleaseNotes.ps1`:
- Same `$ProjectName` default ("OS")
- Same `$TeamName` default ("ft_buses")
- Same `$AreaPaths` array
- Same `$OutputDir` default (".\output")

This reduces duplication and ensures consistency across automation scripts.

### Complementary Workflows
1. **End of Iteration**:
   - Run `Cleanup-WorkItems.ps1` to clean up work items
   - Then run `Generate-ReleaseNotes.ps1` to create documentation
2. **Both scripts** can use the same iteration data
3. **Both scripts** work with the same area paths and team

## ADO MCP Tools Used

This automation leverages the following ADO MCP capabilities:
- `mcp_ado_work_list_team_iterations` - Get iteration dates
- `mcp_ado_search_workitem` - Search for closed work items
- `mcp_ado_wit_get_work_item` - Get work item details with relations
- `mcp_ado_wit_get_work_items_batch_by_ids` - Batch retrieve work items
- `mcp_ado_wit_update_work_item` - Update work item fields

## Safety Considerations

⚠️ **Important**: This script modifies work items in Azure DevOps.

### Before Running in Production
1. Test with the test script first
2. Run against a small test iteration to verify behavior
3. Ensure you have backups or can revert changes if needed
4. Review the cleanup summary carefully

### What Gets Updated
- **Iteration Path**: Only updated if the work item was closed in the iteration date range
- **Rank**: Only updated for child items that have a parent with a different rank
- **No other fields** are modified

### Audit Trail
- All changes are tracked in the cleanup summary JSON file
- The summary includes old and new values for each field
- Keep these summary files for audit purposes

## Support and Feedback

For issues or suggestions:
1. Check the troubleshooting section above
2. Review ADO MCP server logs
3. Verify GitHub Copilot connection
4. Contact your team's DevOps administrator

## License

Internal use only for Microsoft teams.

---

**Last Updated**: November 15, 2025
**Version**: 1.0
**Maintained by**: Your Team
