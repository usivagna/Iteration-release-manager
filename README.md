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

### Azure DevOps Access

- Access to the **OS** project in Azure DevOps
- Authentication via one of the following methods:
  - **Azure DevOps CLI login (RECOMMENDED)**: More secure, no PAT handling
  - **Personal Access Token (PAT)**: Handled as SecureString
- Permissions required:
  - Work Items (Read for Generate-ReleaseNotes.ps1, Read & Write for Cleanup-WorkItems.ps1)
  - Code (Read)
- Access to:
  - Work items in the specified area paths
  - Team iterations
  - Pull requests
  - Commit history

### Security Features

- ✅ **SecureString PAT handling**: PAT is never stored or logged in plain text
- ✅ **Azure CLI authentication**: Preferred method avoiding direct PAT handling
- ✅ **Pre-flight permission checks**: Validates access before operations
- ✅ **Network validation**: Optional Microsoft corp network check with -Force override
- ✅ **No credential echoing**: Errors never expose authentication details

### Area Paths Covered

- `OS\Core\Connectivity Platform\Buses`
- `OS\Core\Connectivity Platform\Sensors`

## Setup

### 1. Authentication Setup (Choose One Method)

#### Method A: Azure DevOps CLI (RECOMMENDED - Most Secure)

This method avoids handling PAT tokens directly:

1. **Install Azure CLI** (if not already installed):
   ```powershell
   # Using winget (Windows 11)
   winget install Microsoft.AzureCLI
   
   # Or download from: https://aka.ms/installazurecliwindows
   ```

2. **Install Azure DevOps extension**:
   ```powershell
   az extension add --name azure-devops
   ```

3. **Login to Azure**:
   ```powershell
   az login
   ```

4. **Configure default organization**:
   ```powershell
   az devops configure --defaults organization=https://dev.azure.com/your-organization-name
   ```

5. **Set organization environment variable** (REQUIRED):
   ```powershell
   # For current session
   $env:AZURE_DEVOPS_ORG = "your-organization-name"
   
   # Or permanently (Windows)
   [Environment]::SetEnvironmentVariable("AZURE_DEVOPS_ORG", "your-organization-name", "User")
   ```

6. **Run the scripts with -UseAzDevOpsAuth flag**:
   ```powershell
   # If on Microsoft corp network
   .\Generate-ReleaseNotes.ps1 -UseAzDevOpsAuth
   
   # If NOT on Microsoft corp network (e.g., external with VPN)
   .\Generate-ReleaseNotes.ps1 -UseAzDevOpsAuth -Force
   ```

**Important Notes:**
- The `AZURE_DEVOPS_ORG` environment variable is always required, even with Azure CLI auth
- If you're not on Microsoft corp network, add the `-Force` flag to bypass the network check
- Make sure you're logged in with `az login` before running the scripts

#### Method B: Personal Access Token (PAT) as SecureString

For scenarios where Azure CLI is not available:

1. **Create a PAT**:
   - Go to <https://dev.azure.com/[your-organization]/_usersSettings/tokens>
   - Click "New Token"
   - Give it a descriptive name (e.g., "Release Notes Generator")
   - Set expiration (recommended: 90 days or custom)
   - Select scopes:
     - **Work Items**: Read (or Read & Write for Cleanup script)
     - **Code**: Read
   - Click "Create" and **copy the token** (you won't see it again!)

2. **Set as environment variable**:
   ```powershell
   # For current session
   $env:AZURE_DEVOPS_ORG = "your-organization-name"
   $env:AZURE_DEVOPS_PAT = "your-personal-access-token"
   
   # Or permanently (Windows)
   [Environment]::SetEnvironmentVariable("AZURE_DEVOPS_ORG", "your-organization-name", "User")
   [Environment]::SetEnvironmentVariable("AZURE_DEVOPS_PAT", "your-personal-access-token", "User")
   ```

3. **Or pass as SecureString parameter**:
   ```powershell
   $secPat = ConvertTo-SecureString 'your-pat' -AsPlainText -Force
   .\Generate-ReleaseNotes.ps1 -PAT $secPat
   ```

### 2. (Optional) AI-Powered Generation

For better, audience-tailored summaries using GitHub Copilot:

**Option A: Set GitHub Token (for future API integration):**

```powershell
$env:GITHUB_TOKEN = "your-github-token"
```

**Option B: Use the generated prompt files:**
The script generates `-prompt.txt` files alongside the summaries containing rich context from all PR descriptions. You can use these with any AI tool including GitHub Copilot Chat.

## Usage

### Basic Usage with Azure CLI (Recommended)

**Prerequisites:**
- Azure CLI installed with azure-devops extension
- Logged in with `az login`
- `AZURE_DEVOPS_ORG` environment variable set

```powershell
# On Microsoft corp network
.\Generate-ReleaseNotes.ps1 -UseAzDevOpsAuth

# NOT on Microsoft corp network (requires -Force)
.\Generate-ReleaseNotes.ps1 -UseAzDevOpsAuth -Force
```

This will:

1. Use your Azure DevOps CLI authentication context (no PAT handling)
2. Perform pre-flight permission check
3. Query the most recently completed iteration
4. Collect all work items and PR descriptions
5. Generate enhanced summaries with PR details (template-based by default)
6. Create AI prompt files for optional AI-powered generation

### Basic Usage with PAT (Environment Variable)

```powershell
# Set environment variable once
$env:AZURE_DEVOPS_ORG = "your-org"
$env:AZURE_DEVOPS_PAT = "your-pat"

# Run the script
.\Generate-ReleaseNotes.ps1
```

### AI-Powered Generation (Default)

```powershell
.\Generate-ReleaseNotes.ps1 -UseAzDevOpsAuth -UseAI
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
.\Generate-ReleaseNotes.ps1 -UseAzDevOpsAuth -UseAI:$false
```

Uses enhanced templates that include PR descriptions directly in the output.

### Advanced Usage

**Using Azure CLI authentication (most secure):**

```powershell
.\Generate-ReleaseNotes.ps1 -UseAzDevOpsAuth
```

**Using PAT as SecureString:**

```powershell
$secPat = ConvertTo-SecureString 'your-pat' -AsPlainText -Force
.\Generate-ReleaseNotes.ps1 -Organization "myorg" -PAT $secPat
```

**Use current iteration instead of previous:**

```powershell
# On corp network
.\Generate-ReleaseNotes.ps1 -UseAzDevOpsAuth -UseCurrentIteration

# NOT on corp network
.\Generate-ReleaseNotes.ps1 -UseAzDevOpsAuth -Force -UseCurrentIteration
```

**Target a specific iteration:**

```powershell
# On corp network
.\Generate-ReleaseNotes.ps1 -UseAzDevOpsAuth -SpecificIteration "2025.09 Sprint 3"

# NOT on corp network
.\Generate-ReleaseNotes.ps1 -UseAzDevOpsAuth -Force -SpecificIteration "2025.09 Sprint 3"
```

**Custom output directory:**

```powershell
.\Generate-ReleaseNotes.ps1 -UseAzDevOpsAuth -OutputDir "C:\ReleaseNotes\2025-Q4"
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

1. **Create and configure your PAT** (see Setup section)
2. **Open PowerShell**
3. **Navigate to the repository**:

   ```powershell
   cd c:\path\to\Iteration-release-manager
   ```

4. **Set environment variables** (if not already set):

   ```powershell
   $env:AZURE_DEVOPS_ORG = "your-org"
   $env:AZURE_DEVOPS_PAT = "your-pat"
   ```

5. **Run the script**:

   ```powershell
   .\Generate-ReleaseNotes.ps1
   ```

6. **Wait for completion** (usually takes 10-30 seconds depending on data volume)
7. **Review generated files** in the `output` folder

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

### Security Best Practices

#### Authentication
- **PREFER Azure CLI authentication** (`-UseAzDevOpsAuth`): Most secure, no direct credential handling
- **PAT handling**: Always use SecureString type, never plain text
- **Never commit credentials**: Don't store PATs in scripts or source control
- **Environment variables**: Use for convenience, but be aware they can be accessed by other processes
- **Rotate credentials**: Change PATs every 90 days or per your organization's policy
- **Minimal scopes**: Only grant required permissions (Read for Generate, Read & Write for Cleanup)

#### Network Security
- **Corp network check**: Script validates Microsoft corp network by default
- **Override with caution**: Use `-Force` only when you have verified authentication
- **No credential logging**: The scripts never echo PATs or auth tokens in output or logs
- **Error messages**: Generic error messages prevent credential exposure

#### Data Protection
- **SecureString in memory**: PATs converted from SecureString are immediately cleared after use
- **No plain text storage**: Credentials are never written to disk in plain text
- **Output files**: Generated JSON and MD files contain no authentication data
- **Memory cleanup**: Sensitive variables are explicitly removed after use

### Security Checklist

Before running the scripts:

- [ ] Use Azure CLI authentication when possible (`-UseAzDevOpsAuth`)
- [ ] If using PAT, pass as SecureString or use environment variable
- [ ] Verify you're on Microsoft corp network (or use `-Force` with proper auth)
- [ ] Confirm you have minimum required permissions
- [ ] Review output files to ensure no sensitive data is logged
- [ ] Rotate PATs regularly
- [ ] Never commit credentials to source control

## Troubleshooting

### Issue: "Azure DevOps organization not specified"

**Solution**: Set the `AZURE_DEVOPS_ORG` environment variable or pass `-Organization` parameter

### Issue: "Azure DevOps authentication not configured"

**Solutions**:
1. **Recommended**: Use Azure CLI authentication:
   ```powershell
   az login
   az devops configure --defaults organization=https://dev.azure.com/your-org
   .\Generate-ReleaseNotes.ps1 -UseAzDevOpsAuth
   ```

2. Set PAT environment variable:
   ```powershell
   $env:AZURE_DEVOPS_PAT = "your-pat"
   ```

3. Pass PAT as SecureString:
   ```powershell
   $secPat = ConvertTo-SecureString 'your-pat' -AsPlainText -Force
   .\Generate-ReleaseNotes.ps1 -PAT $secPat
   ```

### Issue: "Not running in Microsoft corp network context"

**Solutions**:
1. Connect to Microsoft corp network (VPN or physical connection)
2. Use `-Force` parameter to override the check (only if you have proper authentication)
   ```powershell
   .\Generate-ReleaseNotes.ps1 -UseAzDevOpsAuth -Force
   ```

### Issue: "Permission check failed"

**Possible causes:**
- Insufficient permissions in Azure DevOps
- Invalid or expired credentials
- Project doesn't exist or you don't have access

**Solutions**:
1. Verify you have the required permissions:
   - Work Items: Read (or Read & Write for Cleanup script)
   - Code: Read
2. Check if your PAT or Azure CLI login is still valid
3. Confirm you have access to the specified project in Azure DevOps
4. Try re-authenticating:
   ```powershell
   # For Azure CLI
   az login --force
   
   # For PAT
   # Generate a new PAT and update environment variable
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

- Invalid PAT
- Network connectivity issues
- Insufficient permissions

**Solutions:**

1. Verify your PAT is valid and not expired
2. Check network connection to Azure DevOps
3. Confirm PAT has required scopes
4. Try regenerating the PAT

### Issue: "Script runs slowly"

**Solutions:**

- Reduce the number of work items (use specific iteration)
- Check network latency to Azure DevOps
- Consider running during off-peak hours

## Customization

### Modifying Area Paths

Edit lines 16-19 in `Generate-ReleaseNotes.ps1`:

```powershell
$AreaPaths = @(
    "OS\Core\Connectivity Platform\Buses",
    "OS\Core\Connectivity Platform\Sensors"
    # Add more area paths as needed
)
```

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

**Key Features**:

- ✅ **Dry Run Mode**: Preview changes before applying them
- ✅ **Iteration-Aware**: Automatically finds the previous completed iteration
- ✅ **Safe Updates**: Only updates items that need correction
- ✅ **Detailed Reporting**: Generates JSON report of all changes

### Cleanup Script Usage

#### Dry Run (Recommended First)

```powershell
.\Cleanup-WorkItems.ps1 -DryRun
```

This will:

1. Query the most recently completed iteration
2. Identify work items that need cleanup
3. Display what would be changed without making any actual updates
4. Generate a report of potential changes

#### Live Execution

```powershell
.\Cleanup-WorkItems.ps1
```

This will:

1. Query the most recently completed iteration
2. Display a summary of work items to be updated
3. **Prompt for confirmation** before making any changes
4. Update iteration paths for items closed within the iteration dates (after confirmation)
5. Update rank fields for child items to match their parents (after confirmation)
6. Generate a report of all changes made

**Note**: The script will ask you to confirm (Y/N) before applying any changes to Azure DevOps. This safety feature ensures you review the changes before they are applied.

#### Cleanup Advanced Usage

**Target specific iteration:****

```powershell
.\Cleanup-WorkItems.ps1 -SpecificIteration "2025.09 Sprint 3" -DryRun
```

**Use current iteration:**

```powershell
.\Cleanup-WorkItems.ps1 -UseCurrentIteration
```

**Custom output directory:**

```powershell
.\Cleanup-WorkItems.ps1 -OutputDir "C:\WorkItemReports"
```

**Full example with all parameters:**

```powershell
.\Cleanup-WorkItems.ps1 `
    -Organization "microsoft" `
    -PAT "abc123..." `
    -ProjectName "OS" `
    -TeamName "ft_buses" `
    -OutputDir ".\output" `
    -DryRun
```

### Cleanup Script Prerequisites

Same as the release notes generator, plus:

- **Personal Access Token (PAT)** must have **Work Items (Read & Write)** scope (not just Read)

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

**Solution**: Recreate your PAT with "Work Items (Read & Write)" scope

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
