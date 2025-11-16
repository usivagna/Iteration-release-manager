# Quick Start Guide - Automated Version

## Setup (One-Time - 5 Minutes)

### 1️⃣ Create Azure DevOps Personal Access Token

1. Go to: https://dev.azure.com/[your-org]/_usersSettings/tokens
2. Click **"New Token"**
3. Name: "Release Notes Generator"
4. Scopes: Select **"Work Items (Read)"** and **"Code (Read)"**
5. Click **"Create"** and **copy the token**

### 2️⃣ Set Environment Variables

**PowerShell:**
```powershell
$env:AZURE_DEVOPS_ORG = "your-organization-name"
$env:AZURE_DEVOPS_PAT = "paste-your-token-here"
```

**To make it permanent (Windows):**
```powershell
[Environment]::SetEnvironmentVariable("AZURE_DEVOPS_ORG", "your-org", "User")
[Environment]::SetEnvironmentVariable("AZURE_DEVOPS_PAT", "your-token", "User")
```

---

## Running the Script (30 Seconds)

### Basic Usage
```powershell
.\Generate-ReleaseNotes.ps1
```

**That's it!** The script will:
- ✅ Find the previous completed iteration
- ✅ Query all completed work items
- ✅ Retrieve linked PRs
- ✅ Generate internal summary
- ✅ Generate Windows Insider release notes
- ✅ Save everything to the `output/` folder

---

## What You'll Get

After running the script, you'll have these files in the `output/` folder:

📄 **iteration-info.json** - Iteration metadata  
📄 **work-items-with-prs.json** - All work items and PR data  
📄 **internal-summary-TIMESTAMP.md** - For engineering managers  
📄 **insider-release-notes-TIMESTAMP.md** - For Windows Insiders

---

## Advanced Options

**Use current iteration instead of previous:**
```powershell
.\Generate-ReleaseNotes.ps1 -UseCurrentIteration
```

**Target a specific iteration:**
```powershell
.\Generate-ReleaseNotes.ps1 -SpecificIteration "2025.09 Sprint 3"
```

**Custom output folder:**
```powershell
.\Generate-ReleaseNotes.ps1 -OutputDir "C:\MyReports"
```

**Pass credentials directly (not recommended):**
```powershell
.\Generate-ReleaseNotes.ps1 -Organization "myorg" -PAT "my-token"
```

---

## Key Benefits Over Old Version

| Old Version | New Version |
|-------------|-------------|
| ❌ 4 manual steps | ✅ Zero manual steps |
| ❌ 5-10 minutes | ✅ 10-30 seconds |
| ❌ Copy/paste prompts | ✅ Fully automated |
| ❌ Requires GitHub Copilot | ✅ PowerShell only |
| ❌ Requires ADO MCP | ✅ Direct REST API |

---

## Troubleshooting

**Error: "Azure DevOps organization not specified"**
- Set `AZURE_DEVOPS_ORG` environment variable

**Error: "Personal Access Token not specified"**
- Set `AZURE_DEVOPS_PAT` environment variable

**Error: "No work items found"**
- Check that work items are in "Closed", "Done", or "Completed" state
- Verify iteration dates
- Confirm you have read access to the OS project

**Error: "API call failed"**
- Verify your PAT is valid and not expired
- Ensure PAT has "Work Items (Read)" and "Code (Read)" scopes
- Check network connectivity

---

## Security Best Practices

- ✅ Use environment variables for PAT
- ✅ Never commit PAT to source control
- ✅ Rotate PAT every 90 days
- ✅ Use minimum required scopes (Read-only)

---

## Need More Help?

See the full [README-NEW.md](README-NEW.md) for:
- Detailed setup instructions
- Comprehensive troubleshooting guide
- Customization options
- API reference

---

**Ready to automate?** Set up your PAT and run `.\Generate-ReleaseNotes.ps1` to get started!
