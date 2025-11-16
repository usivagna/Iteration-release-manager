# Migration Guide: From Manual to Automated

## Overview

This guide helps you migrate from the old manual Copilot-based script to the new fully automated Azure DevOps REST API-based script.

## What Changed?

### Old Version (Manual)
- ❌ Required 4 manual steps with copy-paste to GitHub Copilot Chat
- ❌ Took 5-10 minutes to complete
- ❌ Required GitHub Copilot + ADO MCP server
- ❌ Prone to user errors during copy-paste
- ✅ Same data accuracy

### New Version (Automated)
- ✅ Zero manual intervention required
- ✅ Takes 10-30 seconds to complete
- ✅ Only requires PowerShell and a PAT
- ✅ Direct API calls - more reliable
- ✅ Same data accuracy (or better)

## Migration Steps

### Step 1: Create Azure DevOps Personal Access Token

The new script uses Azure DevOps REST API directly, so you need a Personal Access Token (PAT).

1. Navigate to: `https://dev.azure.com/[your-org]/_usersSettings/tokens`
2. Click **"New Token"**
3. Configure the token:
   - **Name**: "Release Notes Generator"
   - **Expiration**: 90 days (or custom)
   - **Scopes**: Select these specific scopes:
     - ✅ **Work Items**: Read
     - ✅ **Code**: Read
4. Click **"Create"**
5. **IMPORTANT**: Copy the token immediately - you won't see it again!

### Step 2: Set Environment Variables

You have two options for configuring the script:

#### Option A: Environment Variables (Recommended)

**For current PowerShell session:**
```powershell
$env:AZURE_DEVOPS_ORG = "your-organization-name"
$env:AZURE_DEVOPS_PAT = "paste-your-pat-here"
```

**To make it permanent (Windows):**
```powershell
[Environment]::SetEnvironmentVariable("AZURE_DEVOPS_ORG", "your-org-name", "User")
[Environment]::SetEnvironmentVariable("AZURE_DEVOPS_PAT", "your-pat-token", "User")
```

**To make it permanent (Linux/macOS):**
Add to your `~/.bashrc` or `~/.zshrc`:
```bash
export AZURE_DEVOPS_ORG="your-organization-name"
export AZURE_DEVOPS_PAT="your-pat-token"
```

#### Option B: Pass as Parameters

You can pass credentials directly when running the script:
```powershell
.\Generate-ReleaseNotes.ps1 -Organization "your-org" -PAT "your-pat"
```

**Note**: Environment variables are more secure as they don't appear in command history.

### Step 3: Test the New Script

1. Open PowerShell in the repository directory
2. Run the script:
   ```powershell
   .\Generate-ReleaseNotes.ps1
   ```
3. The script will automatically:
   - Query iteration information
   - Retrieve completed work items
   - Fetch linked PRs
   - Generate internal summary
   - Generate Windows Insider release notes

4. Check the `output/` folder for generated files

### Step 4: Verify Output

Compare the generated files with your previous outputs to ensure quality:

1. **iteration-info.json**: Should have the same structure
2. **work-items-with-prs.json**: Should contain all the same work items and PRs
3. **internal-summary-*.md**: Should have similar content but better formatting
4. **insider-release-notes-*.md**: Should be user-friendly and comprehensive

## Troubleshooting Migration Issues

### Issue: "Azure DevOps organization not specified"

**Cause**: Environment variable not set or parameter not passed

**Solution**: 
```powershell
$env:AZURE_DEVOPS_ORG = "your-organization-name"
```

### Issue: "Personal Access Token not specified"

**Cause**: Environment variable not set or parameter not passed

**Solution**:
```powershell
$env:AZURE_DEVOPS_PAT = "your-pat-here"
```

### Issue: "API call failed" or "401 Unauthorized"

**Cause**: Invalid or expired PAT

**Solutions**:
1. Verify the PAT is valid and not expired
2. Ensure the PAT has "Work Items (Read)" and "Code (Read)" scopes
3. Try creating a new PAT

### Issue: "No work items found"

**Cause**: Query criteria might be different

**Solutions**:
1. Check that work items are in "Closed", "Done", or "Completed" state
2. Verify iteration dates in `iteration-info.json`
3. Confirm area paths are correct
4. Ensure you have read access to the OS project

### Issue: Different data than before

**Cause**: Possible differences in API vs MCP data retrieval

**Solutions**:
1. Compare the JSON files (`iteration-info.json` and `work-items-with-prs.json`)
2. Verify the WIQL query matches your criteria
3. Check if work items have been updated since the last run
4. Ensure the iteration selection logic is correct

## Feature Comparison

| Feature | Old Version | New Version |
|---------|-------------|-------------|
| Execution Time | 5-10 minutes | 10-30 seconds |
| Manual Steps | 4 (copy-paste to Copilot) | 0 (fully automated) |
| Dependencies | GitHub Copilot + ADO MCP | PowerShell + PAT |
| Authentication | Through Copilot/MCP | Direct PAT |
| Error Handling | Limited | Comprehensive |
| Performance | Slow (manual) | Fast (parallel API calls) |
| Reliability | Dependent on Copilot | Direct API (more reliable) |
| Output Quality | Good | Same or better |
| Customization | Edit prompts | Edit PowerShell code |
| Debugging | Difficult | Easy (error messages) |

## Benefits of the New Version

### 1. **Time Savings**
- Old: 5-10 minutes with manual intervention
- New: 10-30 seconds, fully automated
- **Savings**: ~90% time reduction

### 2. **Reduced Errors**
- No more copy-paste mistakes
- No manual steps to forget
- Automated validation and error handling

### 3. **Better Reliability**
- Direct API calls don't depend on Copilot availability
- Retry logic for transient failures
- Clear error messages

### 4. **Easier Setup**
- No need to configure GitHub Copilot
- No need for ADO MCP server
- Just PowerShell + PAT

### 5. **Improved Performance**
- Parallel API calls for work items and PRs
- Efficient batching (200 items at a time)
- Cached PR data to avoid duplicates

### 6. **Better Maintainability**
- Pure PowerShell code - easy to debug
- Clear function structure
- Comprehensive error messages

## Rollback Plan

If you need to use the old version temporarily:

1. The old script is preserved as `README-OLD.md` and `QUICK-START-OLD.md`
2. You can still use GitHub Copilot Chat manually if needed
3. The old prompts are documented in the preserved files

However, we recommend sticking with the new automated version for better efficiency.

## Next Steps

1. ✅ Create your PAT (Step 1)
2. ✅ Set environment variables (Step 2)
3. ✅ Test the new script (Step 3)
4. ✅ Verify output quality (Step 4)
5. ✅ Update your documentation or runbooks
6. ✅ Train team members on the new process
7. ✅ Decommission old GitHub Copilot + ADO MCP setup (if no longer needed)

## Support

If you encounter issues during migration:

1. Check the [Troubleshooting section](#troubleshooting-migration-issues) above
2. Review the [README.md](README.md) for detailed documentation
3. Check the [QUICK-START.md](QUICK-START.md) for basic usage
4. Contact your team's DevOps administrator

## Feedback

We'd love to hear your feedback on the new automated version:
- What works well?
- What could be improved?
- Any features you'd like to see?

---

**Last Updated**: November 14, 2025
**Version**: 2.0
