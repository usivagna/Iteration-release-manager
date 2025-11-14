# Troubleshooting Guide

## Common Issues and Solutions

### Issue: "ADO MCP tools not available"

**Symptoms:**
- Copilot says it can't find ADO tools
- Functions like `mcp_ado_work_list_team_iterations` don't work

**Solutions:**
1. Check Copilot status in VS Code (bottom right corner)
2. Verify ADO MCP server is connected:
   - Open Copilot Chat
   - Type `@workspace /help` to see available tools
   - Look for ADO-related tools in the list
3. Restart VS Code if needed
4. Check with your admin that ADO MCP server is properly configured

---

### Issue: "No work items found"

**Symptoms:**
- `work-items-with-prs.json` is empty or has no work items
- Copilot reports 0 work items

**Solutions:**
1. **Verify iteration dates:**
   - Check `iteration-info.json` has correct dates
   - Ensure you're looking at a completed iteration
   
2. **Check work item states:**
   - Work items must be in "Closed", "Done", or "Completed" state
   - Ask Copilot to check for work items in "Active" state instead
   
3. **Verify area paths:**
   - Ensure work items are tagged with correct area paths:
     - `OS\Core\Connectivity Platform\Buses`
     - `OS\Core\Connectivity Platform\Sensors`
   
4. **Check permissions:**
   - Verify you have read access to the OS project
   - Test by manually viewing work items in Azure DevOps web

---

### Issue: "No pull requests linked"

**Symptoms:**
- Work items found but `pullRequests` array is empty
- PRs exist but aren't showing in the data

**Solutions:**
1. **Check work item links:**
   - Open work items in ADO web interface
   - Verify PRs are properly linked under "Links" or "Development"
   
2. **Link PRs correctly:**
   - PRs should have artifact links to work items
   - Use "Link to a work item" in PR description
   
3. **Repository access:**
   - Verify you have access to the repositories containing PRs
   - Check if PRs are in private/restricted repos

---

### Issue: "Copilot times out or doesn't respond"

**Symptoms:**
- Copilot Chat stops responding
- Requests take too long

**Solutions:**
1. **Break down queries:**
   - Instead of querying all work items at once, query by area path
   - Process Buses and Sensors separately
   
2. **Reduce data volume:**
   - Limit fields returned in queries
   - Query fewer work items initially
   
3. **Check network:**
   - Ensure stable connection to Azure DevOps
   - Try again during off-peak hours
   
4. **Restart Copilot:**
   - Reload VS Code window (Ctrl+Shift+P → "Reload Window")

---

### Issue: "Generated content is too generic"

**Symptoms:**
- Release notes lack detail
- Internal summary doesn't capture technical depth

**Solutions:**
1. **Improve source data:**
   - Add detailed descriptions to work items
   - Write comprehensive PR descriptions
   - Include technical context in PR comments
   
2. **Refine prompts:**
   - Edit the prompts in `Generate-ReleaseNotes.ps1`
   - Add more specific instructions
   - Include examples of desired output
   
3. **Manual editing:**
   - Use generated content as a starting point
   - Add context, examples, screenshots manually
   - Enhance with team knowledge

---

### Issue: "Wrong iteration selected"

**Symptoms:**
- Got current iteration instead of previous
- Dates don't match expected iteration

**Solutions:**
1. **Check iteration list:**
   - Ask Copilot to list all team iterations
   - Verify which one is marked as current
   
2. **Manually specify iteration:**
   - Edit the prompt to specify exact iteration name
   - Use iteration ID instead of "previous"
   
3. **Verify team settings:**
   - Check team settings in ADO
   - Ensure iterations are properly configured

---

### Issue: "Permission denied errors"

**Symptoms:**
- Can't access work items or PRs
- "Access denied" messages from ADO

**Solutions:**
1. **Check project access:**
   - Verify you're a member of the OS project
   - Request access from project admin if needed
   
2. **Check area path permissions:**
   - Area paths may have restricted access
   - Request read access to:
     - `OS\Core\Connectivity Platform\Buses`
     - `OS\Core\Connectivity Platform\Sensors`
   
3. **Check repository access:**
   - Verify access to repositories containing PRs
   - Request read permissions if needed

---

### Issue: "Script fails with JSON parsing errors"

**Symptoms:**
- Error reading `iteration-info.json` or `work-items-with-prs.json`
- Invalid JSON format

**Solutions:**
1. **Check file contents:**
   - Open the JSON file in VS Code
   - Look for syntax errors (missing commas, brackets)
   
2. **Regenerate files:**
   - Delete the problematic JSON file
   - Rerun the Copilot prompt for that step
   
3. **Validate JSON:**
   - Use VS Code's JSON validation (bottom right shows errors)
   - Fix any formatting issues

---

### Issue: "Output folder not created"

**Symptoms:**
- Can't find generated files
- Script says files don't exist

**Solutions:**
1. **Check current directory:**
   ```powershell
   Get-Location
   ```
   - Ensure you're in the right folder
   
2. **Create output folder manually:**
   ```powershell
   New-Item -ItemType Directory -Path ".\output" -Force
   ```
   
3. **Check permissions:**
   - Verify you can write to the current directory
   - Try running PowerShell as administrator if needed

---

## Getting More Help

If you're still stuck:

1. **Check the logs:**
   - VS Code Output panel (View → Output)
   - Select "GitHub Copilot" from dropdown
   
2. **Review ADO MCP documentation:**
   - Check your organization's ADO MCP setup guide
   - Verify server configuration
   
3. **Contact support:**
   - Reach out to your team's DevOps administrator
   - File an issue with your IT support team
   
4. **Verify prerequisites:**
   - Re-read the Prerequisites section in README.md
   - Ensure all requirements are met

---

## Debug Mode

To get more information about what's happening:

1. **Check Copilot output:**
   - Open Output panel (View → Output)
   - Select "GitHub Copilot" from dropdown
   - Review API calls and responses

2. **Test ADO access manually:**
   - Open Azure DevOps in browser
   - Navigate to OS project
   - Try viewing work items manually

3. **Test Copilot connection:**
   ```
   Ask Copilot: "List the available ADO MCP tools"
   ```
   - Should return a list of mcp_ado_* functions

---

## Still Need Help?

Create an issue with:
- Error messages (exact text)
- Steps you followed
- Screenshots if applicable
- Your VS Code and Copilot versions
