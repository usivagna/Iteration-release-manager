# Iteration Release Notes Generator

Automated tool to generate iteration release notes and summaries for the Buses & Sensors team using GitHub Copilot with Azure DevOps MCP tools.

## Overview

This automation queries Azure DevOps for completed work items in a previous iteration, retrieves linked pull request details, and generates two types of documentation:

1. **Internal Summary**: Technical summary for engineering managers
2. **Windows Insider Release Notes**: User-friendly release notes for public consumption

## Prerequisites

### Required Tools
- **PowerShell 5.1+** (Windows PowerShell)
- **VS Code** with the following extensions:
  - GitHub Copilot
  - GitHub Copilot Chat
- **Azure DevOps MCP Server** configured and connected to GitHub Copilot

### Azure DevOps Access
- Access to the **OS** project in Azure DevOps
- Permissions to read:
  - Work items in the specified area paths
  - Team iterations
  - Pull requests
  - Commit history

### Area Paths Covered
- `OS\Core\Connectivity Platform\Buses`
- `OS\Core\Connectivity Platform\Sensors`

## Setup

1. Clone or download this repository to your local machine
2. Ensure you have VS Code open with the workspace folder loaded
3. Verify GitHub Copilot is active and connected
4. Verify ADO MCP server is connected (check Copilot status)

## How to Run

### Option 1: Interactive Mode (Recommended for First Time)

1. Open PowerShell in VS Code (Terminal → New Terminal)
2. Navigate to the repository folder:
   ```powershell
   cd c:\Users\ugans\source\repos\Iteration-release-manager
   ```
3. Run the script:
   ```powershell
   .\Generate-ReleaseNotes.ps1
   ```
4. Follow the prompts - the script will guide you through each step:
   - **Step 1**: Query iteration information (Copilot will use ADO MCP to get previous iteration dates)
   - **Step 2**: Query completed work items and linked PRs (Copilot will gather all relevant data)
   - **Step 3**: Generate internal summary (Copilot will create engineering manager summary)
   - **Step 4**: Generate Windows Insider release notes (Copilot will create public-facing notes)

### Option 2: Custom Parameters

```powershell
.\Generate-ReleaseNotes.ps1 -ProjectName "OS" -TeamName "ft_buses" -OutputDir ".\output"
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
- Iteration ID and name

**Output**: `iteration-info.json`

### Step 2: Gather Work Items and PRs
Copilot queries ADO for:
- All work items completed in the iteration
- Filtering by area paths (Buses and Sensors)
- Only items in "Closed", "Done", or "Completed" state
- All linked pull requests with descriptions
- PR metadata (branches, repositories)

**Output**: `work-items-with-prs.json`

### Step 3: Generate Internal Summary
Copilot analyzes the data and creates a technical summary including:
- Executive summary with counts and breakdown
- Completed work items by component
- Technical highlights and achievements
- Pull request summary
- Risks and dependencies

**Output**: `internal-summary-YYYY-MM-DD_HHmmss.md`

### Step 4: Generate Windows Insider Release Notes
Copilot transforms the technical data into user-friendly release notes:
- Overview of changes
- New features (user-focused)
- Improvements and bug fixes
- Known issues
- Developer notes
- What's coming next

**Output**: `insider-release-notes-YYYY-MM-DD_HHmmss.md`

## Output Files

All generated files are saved in the `output` folder (or your specified output directory):

```
output/
├── iteration-info.json                      # Iteration metadata
├── work-items-with-prs.json                 # Raw data from ADO
├── internal-summary-2024-11-14_143022.md    # Engineering summary
└── insider-release-notes-2024-11-14_143022.md # Public release notes
```

## Example Workflow

### Running for the First Time

1. **Open VS Code** with this workspace
2. **Open Terminal** (Ctrl+`)
3. **Run the script**:
   ```powershell
   .\Generate-ReleaseNotes.ps1
   ```
4. When prompted, **open GitHub Copilot Chat** (Ctrl+Shift+I or click Copilot icon)
5. **Copy the prompt** displayed in the terminal
6. **Paste into Copilot Chat** and press Enter
7. **Wait for Copilot** to complete the task and generate the file
8. **Press Enter in the terminal** to continue to the next step
9. Repeat for each step (4 steps total)

### Reviewing and Editing Output

After generation:
1. Open the generated markdown files in `output/`
2. Review for accuracy and completeness
3. Edit as needed:
   - Add context or clarifications
   - Remove sensitive information
   - Adjust tone or messaging
   - Add screenshots or links
4. Distribute to appropriate audiences

## Regular Use (e.g., Every Sprint)

1. **At the end of each iteration**, run the script:
   ```powershell
   .\Generate-ReleaseNotes.ps1
   ```
2. The script will automatically detect the previous iteration
3. Follow the prompts to generate fresh documentation
4. Review and publish

## Tips and Best Practices

### For Best Results
- **Run after iteration close**: Wait until work items are properly closed/completed
- **Review PR descriptions**: Ensure PRs have good descriptions before running
- **Verify area paths**: Confirm work items are tagged with correct area paths
- **Edit generated content**: Always review and refine the generated summaries

### Troubleshooting

**Problem**: Copilot doesn't respond or times out
- Check that ADO MCP server is connected
- Try breaking down the query into smaller parts
- Ensure you have network access to Azure DevOps

**Problem**: No work items found
- Verify the iteration dates are correct
- Check that work items are in "Closed" or "Done" state
- Confirm area paths are correct
- Verify you have read permissions

**Problem**: Missing pull request information
- Ensure work items are properly linked to PRs
- Check PR permissions
- Verify PRs are in the same ADO project or accessible repositories

**Problem**: Generated content is too generic
- Add more detailed descriptions to work items
- Improve PR descriptions and titles
- Manually enhance the generated markdown files

## Customization

### Modifying Area Paths
Edit line 12-15 in `Generate-ReleaseNotes.ps1`:
```powershell
$AreaPaths = @(
    "OS\Core\Connectivity Platform\Buses",
    "OS\Core\Connectivity Platform\Sensors"
)
```

### Changing Output Format
Edit the prompts in steps 3 and 4 to customize:
- Section headings
- Content structure
- Level of detail
- Tone and style

### Adding More Data Sources
You can extend the script to query:
- Test results
- Build information
- Deployment status
- Telemetry data

Just add new steps with appropriate Copilot prompts using ADO MCP tools.

## ADO MCP Tools Used

This automation leverages the following ADO MCP capabilities:
- `mcp_ado_work_list_team_iterations` - Get iteration dates
- `mcp_ado_search_workitem` - Search for completed work items
- `mcp_ado_wit_get_work_item` - Get work item details with relations
- `mcp_ado_wit_get_work_items_batch_by_ids` - Batch retrieve work items
- `mcp_ado_repo_get_pull_request_by_id` - Get PR details
- `mcp_ado_repo_list_pull_requests_by_repo_or_project` - List PRs

## Support and Feedback

For issues or suggestions:
1. Check the troubleshooting section above
2. Review ADO MCP server logs
3. Verify GitHub Copilot connection
4. Contact your team's DevOps administrator

## License

Internal use only for Microsoft teams.

---

**Last Updated**: November 14, 2025
**Version**: 1.0
**Maintained by**: Your Team
