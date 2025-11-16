# Work Item Cleanup Script - Quick Start Guide

This guide helps you get started with the work item cleanup automation.

## What Does It Do?

The cleanup script performs two important tasks at the end of each iteration:

1. **Iteration Path Assignment**: Automatically assigns work items to the correct iteration based on when they were closed
2. **Rank Synchronization**: Updates child work item ranks to match their parent items, maintaining consistent prioritization

## Prerequisites

- PowerShell 5.1+ or PowerShell Core
- Azure DevOps Personal Access Token (PAT) with **Work Items (Read & Write)** permissions
- Access to the OS project in Azure DevOps

## Quick Start

### 1. Set Up Your PAT

First time setup:

```powershell
# Set your organization
$env:AZURE_DEVOPS_ORG = "your-organization-name"

# Set your PAT (with Read & Write permissions for Work Items)
$env:AZURE_DEVOPS_PAT = "your-personal-access-token"
```

To set permanently (Windows):

```powershell
[Environment]::SetEnvironmentVariable("AZURE_DEVOPS_ORG", "your-org", "User")
[Environment]::SetEnvironmentVariable("AZURE_DEVOPS_PAT", "your-pat", "User")
```

### 2. Run a Dry Run (Recommended)

Always start with a dry run to see what changes would be made:

```powershell
.\Cleanup-WorkItems.ps1 -DryRun
```

This will:
- Find the most recently completed iteration
- Identify work items that need updates
- Show you exactly what would be changed
- Generate a report file (but make no actual changes)

### 3. Review the Output

The script will show:
- Which iteration was selected
- How many items need iteration path updates
- How many items need rank updates
- Details of each proposed change

Example output:
```
=== Work Item Cleanup Script ===
Project: OS
Team: ft_buses
Mode: DRY RUN (no changes will be made)

Step 1: Querying iteration information...
Found iteration: 2025.09 Sprint 3
  Start: 2025-09-01T00:00:00Z
  End: 2025-09-14T23:59:59Z

Step 2: Querying work items that need cleanup...
  Task 1: Finding closed items within iteration dates...
  Found 15 closed items with incorrect iteration path
  Task 2: Finding child items with mismatched rank...
  Found 8 child items with mismatched rank

...
```

### 4. Run the Cleanup (Live Mode)

Once you're satisfied with the dry run results:

```powershell
.\Cleanup-WorkItems.ps1
```

The script will:
1. Display a summary of changes to be made
2. **Prompt for confirmation** before applying any changes
3. Wait for you to enter 'Y' to proceed or any other key to cancel
4. Apply the changes only after confirmation
5. Generate a detailed report

Example confirmation prompt:
```
=== CONFIRMATION REQUIRED ===
You are about to make changes to Azure DevOps work items:
  - 15 items will have iteration path updated
  - 8 items will have rank updated
  - Total: 23 work items will be modified

Do you want to proceed with these changes? (Y/N): 
```

**Important**: You must type `Y` (or `y`) and press Enter to proceed. Any other input will cancel the operation.

### 5. Review the Report

Find the generated report in the `output` folder:
- `cleanup-report-YYYY-MM-DD_HHmmss.json`

The report contains:
- Iteration information
- Summary of changes made
- Detailed list of all updated work items
- Any errors encountered

## Common Usage Scenarios

### Scenario 1: Regular End-of-Sprint Cleanup

At the end of each sprint:

```powershell
# Preview changes
.\Cleanup-WorkItems.ps1 -DryRun

# Review output, then apply
.\Cleanup-WorkItems.ps1
```

### Scenario 2: Clean Up a Specific Past Iteration

```powershell
.\Cleanup-WorkItems.ps1 -SpecificIteration "2025.08 Sprint 2" -DryRun
.\Cleanup-WorkItems.ps1 -SpecificIteration "2025.08 Sprint 2"
```

### Scenario 3: Clean Up Current Iteration

```powershell
.\Cleanup-WorkItems.ps1 -UseCurrentIteration -DryRun
.\Cleanup-WorkItems.ps1 -UseCurrentIteration
```

### Scenario 4: One-Time Use with Custom Credentials

```powershell
.\Cleanup-WorkItems.ps1 `
    -Organization "myorg" `
    -PAT "my-pat-token" `
    -DryRun
```

## Understanding the Changes

### Task 1: Iteration Path Updates

**Why**: Work items might be assigned to the wrong iteration, or not assigned at all, even though they were closed during a specific iteration.

**How it works**:
- Script looks for closed work items (state = Closed/Done/Completed)
- Checks if the closed date falls within the iteration dates
- Updates the iteration path if it doesn't match

**Example**:
- Work Item #12345 was closed on 2025-09-10
- Sprint 3 dates: 2025-09-01 to 2025-09-14
- Current iteration path: "OS\Sprint 2"
- ✅ Updated to: "OS\Sprint 3"

### Task 2: Rank Synchronization

**Why**: Child work items should typically have the same priority/rank as their parent items to maintain consistent backlog prioritization.

**How it works**:
- Script finds parent-child relationships
- Compares the StackRank field of child and parent
- Updates child rank to match parent if different

**Example**:
- Parent Item #12340 has rank: 1000
- Child Item #12345 has rank: 500
- ✅ Child updated to rank: 1000

## Safety Features

1. **Dry Run Mode**: Preview all changes before applying
2. **User Confirmation**: Prompts for explicit Y/N confirmation before applying changes in live mode
3. **Detailed Logging**: See exactly what's being changed and why
4. **Error Handling**: Script continues even if individual updates fail
5. **Audit Trail**: JSON report of all changes for compliance
6. **Scoped Updates**: Only touches items in configured area paths (Buses, Sensors)

## Troubleshooting

### Issue: "PAT does not have write permissions"

**Solution**: Your PAT needs **Write** permissions, not just Read. Create a new PAT:
1. Go to https://dev.azure.com/{your-org}/_usersSettings/tokens
2. Create new token
3. Select scope: **Work Items (Read, Write)**
4. Update your environment variable with the new PAT

### Issue: "No items found that need cleanup"

This is normal if:
- All items are already correctly assigned
- You're running on an iteration that just started
- No work items were closed in the previous iteration

### Issue: Script runs but no changes appear in Azure DevOps

Check:
1. Are you running in `-DryRun` mode? (Remove the flag)
2. Check the JSON report for errors
3. Verify PAT has not expired
4. Ensure you have permissions on the work items

## Best Practices

1. ✅ Always run dry run first
2. ✅ Run at the end of each sprint
3. ✅ Keep the cleanup reports for audit
4. ✅ Review the changes in Azure DevOps after running
5. ✅ Rotate your PAT regularly (every 90 days)
6. ✅ Use environment variables instead of parameters for security

## Getting Help

If you encounter issues:
1. Check this guide
2. Review the main README.md
3. Run `.\Test-CleanupScript.ps1` to validate the script
4. Check Azure DevOps permissions
5. Verify your PAT is valid and has correct scopes

## Example: Complete Workflow

```powershell
# First time setup (one time only)
$env:AZURE_DEVOPS_ORG = "microsoft"
$env:AZURE_DEVOPS_PAT = "your-pat-with-write-permissions"

# At the end of Sprint 3

# Step 1: Preview what would change
.\Cleanup-WorkItems.ps1 -DryRun

# Review the output...
# Output shows: 15 iteration updates, 8 rank updates

# Step 2: Apply the changes
.\Cleanup-WorkItems.ps1

# Output shows: Successfully updated 23 items

# Step 3: Review the report
notepad .\output\cleanup-report-2025-09-14_150322.json

# Step 4: Verify in Azure DevOps
# Open Azure DevOps and spot-check a few updated items

# Done! ✅
```

---

**Remember**: Always start with `-DryRun` to preview changes before applying them!
