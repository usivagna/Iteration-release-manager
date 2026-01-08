# Iteration Release Notes Generator

Fully automated tool to generate iteration release notes and summaries for the Buses & Sensors team using Azure DevOps REST API with optional AI-powered content generation.

## Overview

This automation queries Azure DevOps for completed work items in a previous iteration, retrieves linked pull request details, and generates two types of documentation:

1. **Internal Summary**: Technical summary for engineering managers
2. **Windows Insider Release Notes**: User-friendly release notes for public consumption

**NEW**: Supports AI-powered summary generation using GitHub Copilot for better, audience-tailored content that leverages PR descriptions.

## Key Features

- ✅ **Fully Automated**: No manual intervention required - runs from start to finish
- ✅ **Fast Execution**: Direct API calls significantly faster than manual Copilot interactions
- ✅ **Accurate Data**: Retrieves all work items and PR descriptions from the specified iteration
- ✅ **AI-Powered (Optional)**: Use GitHub Copilot to generate tailored summaries from PR data
- ✅ **PR-Focused**: Summaries reflect actual completed PRs with their descriptions
- ✅ **Comprehensive**: Generates both technical and user-friendly documentation

## Prerequisites

### Required Tools

- **PowerShell 5.1+** (Windows PowerShell or PowerShell Core)
- **Azure CLI** (recommended for secure authentication)

### Azure DevOps Access

- Access to the **OS** project in Azure DevOps
- **Authentication** (choose one):
  - **Option 1 (Recommended)**: Azure CLI authentication (`az login`)
  - **Option 2**: Personal Access Token (PAT) with the following scopes:
    - Work Items (Read)
    - Code (Read)
- Permissions to read:
  - Work items in the specified area paths
  - Team iterations
  - Pull requests
  - Commit history

### Area Paths

The scripts will prompt you to specify Area Paths when you run them. You can enter one or more Area Paths to query work items from specific areas.

**Example Area Paths:**
- `OS\Core\Connectivity Platform\Buses`
- `OS\Core\Connectivity Platform\Sensors`

You can also pass Area Paths as a parameter to skip the interactive prompt:
```powershell
.\Generate-ReleaseNotes.ps1 -AreaPaths @("Your\Area\Path")
```

## Setup

### User Input Collection

The scripts now collect all required inputs at the start in a consistent manner:

1. **Organization**: Can be provided via parameter, environment variable, or interactive prompt
2. **Area Paths**: Can be provided via parameter or interactive prompt  
3. **Authentication**: Automatically tries Azure CLI, falls back to PAT (from parameter, environment, or interactive prompt)

This ensures a smooth, uninterrupted execution after all inputs are collected.

### 1. Configure Azure DevOps Organization (Optional)

You can optionally set the organization name as an environment variable to skip the prompt:

```powershell
$env:AZURE_DEVOPS_ORG = "your-organization-name"
```

Or set it permanently (Windows):

```powershell
[Environment]::SetEnvironmentVariable("AZURE_DEVOPS_ORG", "your-organization-name", "User")
```

**Note**: If not set, the script will prompt you to enter it when run.

### 2. Set Up Authentication

**Option A: Azure CLI Authentication (Recommended)**

This is the most secure method as it avoids storing credentials:

1. Install Azure CLI if not already installed: <https://aka.ms/installazurecliwindows>
2. Login to Azure:

   ```powershell
   az login
   ```

3. Configure Azure DevOps defaults:

   ```powershell
   az devops configure --defaults organization=https://dev.azure.com/your-organization-name
   ```

4. That's it! The scripts will automatically use your Azure CLI credentials.

**Option B: Personal Access Token (PAT) (Optional)**

If Azure CLI is not available, you can optionally set a PAT:

1. Go to <https://dev.azure.com/[your-organization]/_usersSettings/tokens>
2. Click "New Token"
3. Give it a descriptive name (e.g., "Release Notes Generator")
4. Set expiration (recommended: 90 days or custom)
5. Select scopes based on which script you'll use:
   - **For Generate-ReleaseNotes.ps1**: Work Items (Read), Code (Read)
   - **For Cleanup-WorkItems.ps1**: Work Items (Read & Write), Code (Read)
6. Click "Create" and **copy the token** (you won't see it again!)
7. Optionally set the PAT as an environment variable:

   ```powershell
   # For current session only
   $env:AZURE_DEVOPS_PAT = "your-personal-access-token"
   
   # Or set permanently (Windows)
   [Environment]::SetEnvironmentVariable("AZURE_DEVOPS_PAT", "your-personal-access-token", "User")
   ```

   **Security Note**: The PAT is handled as a SecureString internally and never echoed to console or logs.

**Note**: If neither Azure CLI nor environment PAT is available, the script will prompt you to enter the PAT securely when run.

### 3. (Optional) AI-Powered Generation

For better, audience-tailored summaries using GitHub Copilot:

**Option A: Set GitHub Token (for future API integration):**

```powershell
$env:GITHUB_TOKEN = "your-github-token"
```

**Option B: Use the generated prompt files:**
The script generates `-prompt.txt` files alongside the summaries containing rich context from all PR descriptions. You can use these with any AI tool including GitHub Copilot Chat.

## Usage

### Basic Usage (Recommended)

```powershell
.\Generate-ReleaseNotes.ps1
```

The script will collect all necessary inputs at the start:

1. **Organization**: Prompts if not set via environment variable or parameter
2. **Area Paths**: Prompts if not provided as a parameter
3. **Authentication**: Attempts Azure CLI, then environment PAT, then prompts for PAT if needed

After inputs are collected, the script runs uninterrupted to:

4. Query the most recently completed iteration
5. Collect all work items and PR descriptions
6. Generate enhanced summaries with PR details (template-based by default)
7. Create AI prompt files for optional AI-powered generation

### AI-Powered Generation (Default)

```powershell
.\Generate-ReleaseNotes.ps1 -UseAI
```

The script will:

1. Collect all data (iterations, work items, PRs with descriptions)
2. Create AI prompts with full context from PR descriptions
3. Save prompts to files for use with GitHub Copilot or other AI tools
4. Fall back to enhanced templates if AI is not available

The generated `-prompt.txt` files contain:

- All work item details
- Complete PR descriptions
- Structured prompts for engineering managers and Windows Insiders
- These can be used with GitHub Copilot Chat, ChatGPT, or any AI tool

### Template-Based Generation Only

```powershell
.\Generate-ReleaseNotes.ps1 -UseAI:$false
```

Uses enhanced templates that include PR descriptions directly in the output.

### Generate Pull Request Summary (Work Item tree)

Use this when you want a fast PR rollup for a specific work item and its descendants (JSON + Markdown outputs):

```powershell
.\Generate-PRSummary.ps1 -RootWorkItemId 12345 -ProjectName "OS" -Organization "your-org" -OutputDir "./output"
```

Input collection order mirrors the other scripts:

1. Organization: parameter > `AZURE_DEVOPS_ORG` > prompt
2. Authentication: Azure CLI (`az login`) > `AZURE_DEVOPS_EXT_PAT` (from `az devops login`) > `AZURE_DEVOPS_PAT` > secure prompt
3. Root work item ID: parameter > prompt

Outputs (timestamped) land in `output/` by default:

- `pr-summary-<ID>_<timestamp>.json` — full details including linked work items and unique PRs
- `pr-summary-<ID>_<timestamp>.md` — Markdown table of unique PRs plus a work item summary table

### Advanced Usage

**Specify Area Paths directly (skip prompting):**

```powershell
.\Generate-ReleaseNotes.ps1 -AreaPaths @("OS\Core\Connectivity Platform\Buses", "OS\Core\Connectivity Platform\Sensors")
```

**Specify organization directly:**

```powershell
.\Generate-ReleaseNotes.ps1 -Organization "myorg"
```

**Pass PAT as SecureString (most secure):**

```powershell
$securePAT = Read-Host -AsSecureString -Prompt "Enter PAT"
.\Generate-ReleaseNotes.ps1 -Organization "myorg" -PAT $securePAT
```

**Use current iteration instead of previous:**

```powershell
.\Generate-ReleaseNotes.ps1 -UseCurrentIteration
```

**Target a specific iteration:**

```powershell
.\Generate-ReleaseNotes.ps1 -SpecificIteration "2025.09 Sprint 3"
```

**Custom output directory:**

```powershell
.\Generate-ReleaseNotes.ps1 -OutputDir "C:\ReleaseNotes\2025-Q4"
```

**Full example with all parameters:**

```powershell
$securePAT = Read-Host -AsSecureString -Prompt "Enter PAT"
.\Generate-ReleaseNotes.ps1 `
    -Organization "microsoft" `
    -PAT $securePAT `
    -ProjectName "OS" `
    -TeamName "ft_buses" `
    -AreaPaths @("OS\Core\Connectivity Platform\Buses", "OS\Core\Connectivity Platform\Sensors") `
    -OutputDir ".\output" `
    -SpecificIteration "2025.09 Sprint 3"
```

## How It Works

### Step 1: Query Iteration Information

The script automatically:

- Retrieves all team iterations from Azure DevOps
- Identifies the previous completed iteration (or current/specific as requested)
- Extracts iteration dates and metadata
- Saves to `iteration-info.json`

### Step 2: Gather Work Items and PRs

The script:

- Builds a WIQL query to find completed work items
- Filters by area paths (Buses and Sensors)
- Only includes items in "Closed", "Done", or "Completed" state
- Retrieves full work item details in efficient batches
- Extracts linked pull requests from work item relations
- Fetches PR details including descriptions, branches, and repositories
- Saves all data to `work-items-with-prs.json`

### Step 3: Generate Internal Summary

The script creates a technical summary including:

- Executive summary with counts and breakdown
- Completed work items by component (Buses/Sensors)
- Technical highlights (features and bugs)
- Pull request summary with repository statistics
- Professional formatting for engineering managers

**Output**: `internal-summary-YYYY-MM-DD_HHmmss.md`

### Step 4: Generate Windows Insider Release Notes

The script transforms the technical data into user-friendly release notes:

- Overview of changes
- New features (user-focused descriptions)
- Improvements and bug fixes
- Developer notes with work item references
- Friendly tone suitable for public consumption

**Output**: `insider-release-notes-YYYY-MM-DD_HHmmss.md`

## Output Files

All generated files are saved in the `output` folder (or your specified output directory):

```text
output/
├── iteration-info.json                      # Iteration metadata
├── work-items-with-prs.json                 # Raw data from ADO
├── internal-summary-2024-11-14_143022.md    # Engineering summary
└── insider-release-notes-2024-11-14_143022.md # Public release notes
```

## Example Workflow

### Running for the First Time

**Simplest approach (interactive mode):**

1. **Open PowerShell**
2. **Navigate to the repository**:

   ```powershell
   cd c:\path\to\Iteration-release-manager
   ```

3. **Run the script**:

   ```powershell
   .\Generate-ReleaseNotes.ps1
   ```

4. **Provide inputs when prompted**:
   - Organization name (if not set via environment variable)
   - Area Paths (one per line, press Enter to finish)
   - PAT (if Azure CLI is not available and environment PAT is not set)

5. **Wait for completion** (usually takes 10-30 seconds depending on data volume)
6. **Review generated files** in the `output` folder

**Alternative approach (pre-configure authentication):**

1. **If using Azure CLI (recommended)**:

   ```powershell
   az login
   $env:AZURE_DEVOPS_ORG = "your-org"  # Optional
   ```

2. **OR if using PAT**:

   ```powershell
   $env:AZURE_DEVOPS_ORG = "your-org"  # Optional
   $env:AZURE_DEVOPS_PAT = "your-pat"  # Optional
   ```

3. **Run the script** (will skip prompts for pre-configured values):

   ```powershell
   .\Generate-ReleaseNotes.ps1
   ```

### Regular Use (e.g., Every Sprint)

1. **At the end of each iteration**, run the script:

   ```powershell
   .\Generate-ReleaseNotes.ps1
   ```

2. The script automatically detects and processes the previous iteration
3. Review and enhance the generated documentation
4. Distribute to appropriate audiences

## Tips and Best Practices

### For Best Results

- **Run after iteration close**: Wait until work items are properly closed/completed
- **Review PR descriptions**: Ensure PRs have good descriptions before running
- **Verify area paths**: Confirm work items are tagged with correct area paths
- **Edit generated content**: Always review and refine the generated summaries

### Performance

- Script typically completes in **10-30 seconds** for normal iterations
- Handles up to 200 work items in a single batch efficiently
- Caches PR data to avoid duplicate API calls

### Security

- **Use Azure CLI authentication when possible** for best security (no PAT storage required)
- **Never commit PAT to source control**
- If using PAT:
  - Use environment variables or SecureString parameters
  - PAT is treated as SecureString internally and never echoed to console or logs
  - Rotate PATs regularly (recommended: every 90 days)
  - Use minimal required scopes (Read-only)

## Troubleshooting

### Issue: "Azure DevOps organization not specified"

**Solution**: Set the `AZURE_DEVOPS_ORG` environment variable or pass `-Organization` parameter

### Issue: "Authentication required"

**Solution 1 (Recommended)**: Use Azure CLI authentication:
```powershell
az login
az devops configure --defaults organization=https://dev.azure.com/your-org
```

**Solution 2**: Set the `AZURE_DEVOPS_PAT` environment variable or pass `-PAT` parameter as SecureString:
```powershell
$securePAT = Read-Host -AsSecureString -Prompt "Enter PAT"
.\Generate-ReleaseNotes.ps1 -PAT $securePAT
```

### Issue: "No work items found"

**Possible causes:**

- Iteration dates are incorrect
- Work items are not in "Closed/Done/Completed" state
- Area paths don't match
- You don't have read permissions

**Solutions:**

1. Verify the iteration dates in the generated `iteration-info.json`
2. Check work item states in Azure DevOps
3. Confirm area paths are correct in the script configuration
4. Verify you have access to the OS project

### Issue: "No pull requests linked"

**Possible causes:**

- PRs are not properly linked to work items
- You don't have access to the repositories

**Solutions:**

1. Ensure PRs are linked to work items in Azure DevOps
2. Verify you have read access to the repositories
3. Check that the PAT has "Code (Read)" scope

### Issue: "API call failed"

**Possible causes:**

- Invalid or expired PAT
- Network connectivity issues
- Insufficient permissions
- Azure CLI token expired

**Solutions:**

1. If using Azure CLI: Run `az login` to refresh your token
2. If using PAT: Verify your PAT is valid and not expired
3. Check network connection to Azure DevOps
4. Confirm PAT has required scopes (or Azure CLI user has permissions)
5. Try regenerating the PAT if using PAT authentication

### Issue: "Script runs slowly"

**Solutions:**

- Reduce the number of work items (use specific iteration)
- Check network latency to Azure DevOps
- Consider running during off-peak hours

## Customization

### Modifying Area Paths

**Option 1 (Interactive - Recommended):** Run the script without the `-AreaPaths` parameter, and it will prompt you to enter Area Paths:

```powershell
.\Generate-ReleaseNotes.ps1
# The script will prompt: "Enter an Area Path (or press Enter without input to finish):"
```

**Option 2 (Command Line):** Pass Area Paths as a parameter when running the script:

```powershell
.\Generate-ReleaseNotes.ps1 -AreaPaths @(
    "OS\Core\Connectivity Platform\Buses",
    "OS\Core\Connectivity Platform\Sensors"
)
```

**Option 3 (Edit Script - Not Recommended):** If you prefer, you can still set default Area Paths by modifying the parameter default value in the script, but this is not recommended as it reduces flexibility.

### Changing Output Format

The summary generation sections (Steps 3 and 4) can be customized:

- Modify the markdown templates
- Add or remove sections
- Change formatting and structure
- Adjust the level of detail

### Adding Custom Fields

To include additional work item fields:

1. Update the WIQL query in Step 2
2. Add fields to the work item processing loop
3. Update the summary templates to display the new fields

## Comparison with Previous Version

| Feature | Old Version | New Version |
|---------|-------------|-------------|
| **Automation** | Manual (4 steps) | Fully automated |
| **Execution Time** | 5-10 minutes | 10-30 seconds |
| **User Interaction** | Required at each step | None (set and forget) |
| **Dependencies** | GitHub Copilot + ADO MCP | PowerShell only |
| **Reliability** | Dependent on Copilot | Direct API calls |
| **Data Accuracy** | High | High (same or better) |
| **Error Handling** | Limited | Comprehensive |
| **Performance** | Slow (manual copy-paste) | Fast (parallel API calls) |

## Migration from Old Version

If you were using the previous version with GitHub Copilot:

1. **Setup**: Create a PAT and set environment variables (one-time)
2. **Remove**: No need for GitHub Copilot or ADO MCP server
3. **Run**: Execute the new script - it produces the same outputs automatically
4. **Benefits**: Faster execution, no manual intervention, same accuracy

## Azure DevOps REST API Reference

This script uses the following Azure DevOps REST APIs:

- [Iterations API](https://learn.microsoft.com/en-us/rest/api/azure/devops/work/iterations)
- [Work Items API](https://learn.microsoft.com/en-us/rest/api/azure/devops/wit/work-items)
- [WIQL API](https://learn.microsoft.com/en-us/rest/api/azure/devops/wit/wiql)
- [Pull Requests API](https://learn.microsoft.com/en-us/rest/api/azure/devops/git/pull-requests)
- [Repositories API](https://learn.microsoft.com/en-us/rest/api/azure/devops/git/repositories)

## Support and Feedback

For issues or suggestions:

1. Check the troubleshooting section above
2. Review Azure DevOps permissions
3. Verify PAT is valid and has correct scopes
4. Contact your team's DevOps administrator

## Work Item Cleanup Script

In addition to release notes generation, this repository includes a work item cleanup script that helps engineering managers maintain clean work item data at the end of each iteration.

### Cleanup-WorkItems.ps1

**Purpose**: Automatically clean up work items at the end of an iteration by:

1. Assigning closed items to the respective iteration based on their closed date
2. Updating the rank field of child items to match their parent item's rank
3. Moving incomplete items from past iterations to the backlog for re-triage
4. Marking deliverables as "Completed" when all their child tasks are closed

**Key Features**:

- ✅ **Dry Run Mode**: Preview changes before applying them
- ✅ **Task Selection**: Run all tasks or select specific tasks to run
- ✅ **Interactive Menu**: Choose tasks interactively when no switches are provided
- ✅ **Bug Filtering**: Exclude "Bug" work item types by default (can be included with `-IncludeBugs`)
- ✅ **Iteration-Aware**: Automatically finds the previous completed iteration
- ✅ **Safe Updates**: Only updates items that need correction
- ✅ **Detailed Reporting**: Generates JSON report of all changes

### Cleanup Script Usage

#### Interactive Mode (Recommended)

Run the script without task switches to get an interactive menu:

```powershell
.\Cleanup-WorkItems.ps1 -DryRun
```

The script will:

1. Collect all necessary inputs (Organization, Area Paths, Authentication)
2. Show an interactive menu to select which tasks to run:
   - Option 1: Run ALL cleanup tasks
   - Option 2: Task 1 - Update iteration paths for closed items
   - Option 3: Task 2 - Sync child item ranks with parents
   - Option 4: Task 3 - Move incomplete items to backlog
   - Option 5: Task 4 - Mark deliverables as completed
   - Option 6: Select multiple tasks (custom combination)
3. Execute the selected tasks in dry run mode

#### Run Specific Tasks

**Run only Task 1 (update iteration paths):**

```powershell
.\Cleanup-WorkItems.ps1 -Task1 -DryRun
# OR
.\Cleanup-WorkItems.ps1 -UpdateIterationPaths -DryRun
```

**Run only Task 3 (move incomplete items to backlog):**

```powershell
.\Cleanup-WorkItems.ps1 -Task3 -DryRun
# OR
.\Cleanup-WorkItems.ps1 -MoveToBacklog -DryRun
```

**Run multiple specific tasks:**

```powershell
.\Cleanup-WorkItems.ps1 -Task1 -Task2 -DryRun
```

**Run all tasks explicitly:**

```powershell
.\Cleanup-WorkItems.ps1 -AllTasks -DryRun
```

#### Bug Filtering

By default, "Bug" work item types are **excluded** from cleanup operations. To include bugs:

```powershell
# Include bugs in cleanup (not default)
.\Cleanup-WorkItems.ps1 -IncludeBugs -DryRun

# Run specific task and include bugs
.\Cleanup-WorkItems.ps1 -Task3 -IncludeBugs -DryRun
```

#### Live Execution

After testing with `-DryRun`, remove the flag to apply changes:

```powershell
# Interactive mode - live execution
.\Cleanup-WorkItems.ps1

# Specific task - live execution
.\Cleanup-WorkItems.ps1 -Task1

# All tasks with bugs included - live execution
.\Cleanup-WorkItems.ps1 -AllTasks -IncludeBugs
```

**Note**: The script will ask you to confirm (Y/N) before applying any changes to Azure DevOps.

#### Additional Options

**Target specific iteration:**

```powershell
.\Cleanup-WorkItems.ps1 -SpecificIteration "2025.09 Sprint 3" -Task1 -DryRun
```

**Use current iteration:**

```powershell
.\Cleanup-WorkItems.ps1 -UseCurrentIteration -Task2 -DryRun
```

**Custom output directory:**

```powershell
.\Cleanup-WorkItems.ps1 -OutputDir "C:\WorkItemReports" -AllTasks -DryRun
```

**Full example with all parameters:**

```powershell
$securePAT = Read-Host -AsSecureString -Prompt "Enter PAT"
.\Cleanup-WorkItems.ps1 `
    -Organization "microsoft" `
    -PAT $securePAT `
    -ProjectName "OS" `
    -TeamName "ft_buses" `
    -AreaPaths @("OS\Core\Connectivity Platform\Buses", "OS\Core\Connectivity Platform\Sensors") `
    -OutputDir ".\output" `
    -Task1 -Task3 `
    -IncludeBugs `
    -DryRun
```

### Cleanup Script Prerequisites

Same as the release notes generator, plus:

- **Personal Access Token (PAT)** must have **Work Items (Read & Write)** scope (not just Read)
  - Or use Azure CLI authentication with appropriate permissions

### What Gets Cleaned Up

#### Task 1: Iteration Path Assignment

- Finds work items in "Closed", "Done", or "Completed" state
- Checks if the closed date falls within the iteration start/end dates
- Updates the iteration path if it doesn't match the correct iteration
- Only affects items in the Buses and Sensors area paths

#### Task 2: Rank Field Synchronization

- Finds parent-child work item relationships
- Compares the rank (StackRank) field of child items with their parents
- Updates child items to match their parent's rank when different
- Helps maintain consistent prioritization across related work items

#### Task 3: Move Incomplete Items to Backlog

- Identifies incomplete work items in past iterations
- Moves them to the backlog iteration for re-triage
- Ensures items are not lost when iterations end

#### Task 4: Mark Deliverables as Completed

- Finds deliverables (Features, Epics, User Stories) in "Started" state
- Checks if all child tasks are closed
- Automatically marks deliverables as "Completed" when appropriate

### Output

The script generates a JSON report in the output directory:

```text
output/
└── cleanup-report-2024-11-14_143022.json
```

Report includes:

- Iteration information
- Count of items updated
- List of all changes made (or would be made in dry run)
- Error count and details

### Testing

Before using the cleanup script, you can run the validation tests:

```powershell
.\Test-CleanupScript.ps1
```

This validates:

- Script structure and parameters
- API operation patterns
- Error handling
- Consistency with other scripts
- Logging and reporting

### Best Practices

1. **Always run in dry run mode first** to preview changes
2. **Review the dry run report** before executing live changes
3. **Run at the end of each iteration** after all work items are closed
4. **Keep the cleanup reports** for audit trail
5. **Verify PAT has write permissions** before running live

### Cleanup Script Troubleshooting

#### Issue: "PAT does not have write permissions"

**Solution 1**: Use Azure CLI authentication (if you have appropriate permissions)
```powershell
az login
.\Cleanup-WorkItems.ps1
```

**Solution 2**: Recreate your PAT with "Work Items (Read & Write)" scope

#### Issue: "No items found that need cleanup"

**Possible causes:**

- Items are already correctly assigned
- Work items are not in closed state
- Closed dates are outside iteration boundaries

**Solutions:**

1. Verify iteration dates are correct
2. Check work item states in Azure DevOps
3. Confirm closed dates are within iteration period

## License

Internal use only for Microsoft teams.

---

**Last Updated**: November 16, 2025
**Version**: 2.1 (Release Notes + Work Item Cleanup)
**Maintained by**: Your Team
