# Quick Start Guide - Secure Authentication

This guide helps you get started with the Iteration Release Manager scripts using secure authentication methods.

## Prerequisites

- PowerShell 5.1 or later
- Access to Azure DevOps project
- One of the authentication methods configured

## Option 1: Azure CLI Authentication (Recommended)

This is the most secure method and doesn't require managing PATs.

### Step 1: Install Azure CLI

**Windows (using winget):**
```powershell
winget install Microsoft.AzureCLI
```

**Or download from:** https://aka.ms/installazurecliwindows

### Step 2: Install Azure DevOps Extension

```powershell
az extension add --name azure-devops
```

### Step 3: Login to Azure

```powershell
az login
```

This will open a browser for authentication. Sign in with your Microsoft account.

### Step 4: Configure Default Organization

```powershell
# Replace 'your-org' with your Azure DevOps organization name
az devops configure --defaults organization=https://dev.azure.com/your-org
```

### Step 5: Set Organization Environment Variable

```powershell
# For current session
$env:AZURE_DEVOPS_ORG = "your-org"

# Or permanently (Windows)
[Environment]::SetEnvironmentVariable("AZURE_DEVOPS_ORG", "your-org", "User")
```

### Step 6: Run the Scripts

```powershell
# Generate release notes
.\Generate-ReleaseNotes.ps1 -UseAzDevOpsAuth

# Clean up work items
.\Cleanup-WorkItems.ps1 -UseAzDevOpsAuth -DryRun
```

**✅ Advantages:**
- No PAT management needed
- More secure
- Uses Azure Active Directory
- Automatic token refresh
- Better audit trail

---

## Option 2: Personal Access Token (PAT) with SecureString

Use this method when Azure CLI is not available.

### Step 1: Create a PAT

1. Go to https://dev.azure.com/[your-org]/_usersSettings/tokens
2. Click "New Token"
3. Give it a name: "Release Notes Generator"
4. Set expiration: 90 days (recommended)
5. Select scopes:
   - **Work Items**: Read (or Read & Write for Cleanup)
   - **Code**: Read
6. Click "Create" and **copy the token**

### Step 2: Set Environment Variables

```powershell
# For current session
$env:AZURE_DEVOPS_ORG = "your-org"
$env:AZURE_DEVOPS_PAT = "your-pat-token-here"

# Or permanently (Windows)
[Environment]::SetEnvironmentVariable("AZURE_DEVOPS_ORG", "your-org", "User")
[Environment]::SetEnvironmentVariable("AZURE_DEVOPS_PAT", "your-pat-token-here", "User")
```

### Step 3: Run the Scripts

```powershell
# Generate release notes
.\Generate-ReleaseNotes.ps1

# Clean up work items (dry run first!)
.\Cleanup-WorkItems.ps1 -DryRun
```

**⚠️ Important:**
- Never commit the PAT to source control
- Rotate every 90 days
- Use minimum required scopes
- Consider using Azure CLI instead

---

## Option 3: Pass PAT as SecureString (Advanced)

For automation scenarios where you need to pass credentials securely:

```powershell
# Convert PAT to SecureString
$secPat = ConvertTo-SecureString 'your-pat-token-here' -AsPlainText -Force

# Run script with SecureString
.\Generate-ReleaseNotes.ps1 -Organization "your-org" -PAT $secPat

# Or for cleanup
.\Cleanup-WorkItems.ps1 -Organization "your-org" -PAT $secPat -DryRun
```

**Use cases:**
- CI/CD pipelines
- Scheduled tasks
- Automation scripts

---

## Verify Your Setup

Run the security test to ensure everything is configured correctly:

```powershell
.\Test-SecurityHardening.ps1
```

This validates:
- Script syntax
- Security features
- Documentation
- No credential exposure

---

## Common Use Cases

### Generate Release Notes for Previous Iteration

```powershell
# Using Azure CLI (recommended)
.\Generate-ReleaseNotes.ps1 -UseAzDevOpsAuth

# Using PAT from environment variable
.\Generate-ReleaseNotes.ps1
```

### Generate Release Notes for Specific Iteration

```powershell
.\Generate-ReleaseNotes.ps1 -UseAzDevOpsAuth -SpecificIteration "2025.09 Sprint 3"
```

### Clean Up Work Items (Dry Run)

```powershell
# Always run dry run first to preview changes
.\Cleanup-WorkItems.ps1 -UseAzDevOpsAuth -DryRun
```

### Clean Up Work Items (Live)

```powershell
# After reviewing dry run results
.\Cleanup-WorkItems.ps1 -UseAzDevOpsAuth
```

### Override Network Check

If you're authenticated but not on corp network:

```powershell
.\Generate-ReleaseNotes.ps1 -UseAzDevOpsAuth -Force
```

---

## Troubleshooting

### "Azure DevOps CLI not logged in"

**Solution:**
```powershell
az login
az devops configure --defaults organization=https://dev.azure.com/your-org
```

### "Permission check failed"

**Cause:** Insufficient permissions

**Solution:**
1. Verify you have access to the project
2. Check PAT scopes if using PAT
3. For Generate: Need Work Items (Read) and Code (Read)
4. For Cleanup: Need Work Items (Read & Write) and Code (Read)

### "Not running in Microsoft corp network context"

**Solutions:**
1. Connect to Microsoft corp network (VPN)
2. Use `-Force` flag if you have proper authentication:
   ```powershell
   .\Generate-ReleaseNotes.ps1 -UseAzDevOpsAuth -Force
   ```

### "No work items found"

**Possible causes:**
- Iteration dates are incorrect
- Work items not in completed state
- Area paths don't match

**Solution:**
1. Check iteration dates in output
2. Verify work items are closed/completed
3. Confirm area paths in script match your team's paths

---

## Security Best Practices

✅ **DO:**
- Use Azure CLI authentication when possible
- Rotate PATs every 90 days
- Use minimum required permissions
- Run on Microsoft corp network
- Review output files for sensitive data

❌ **DON'T:**
- Commit PATs to source control
- Share PATs via email or chat
- Use overly permissive scopes
- Skip the pre-flight permission check
- Echo credentials in logs

---

## Next Steps

1. **Review the full documentation**: See [README.md](README.md)
2. **Understand security features**: Read [SECURITY.md](SECURITY.md)
3. **Run the scripts**: Follow the examples above
4. **Customize as needed**: Modify area paths and parameters

---

## Getting Help

- **Security questions**: See [SECURITY.md](SECURITY.md)
- **General questions**: See [README.md](README.md)
- **Troubleshooting**: See [TROUBLESHOOTING.md](TROUBLESHOOTING.md)
- **Test your setup**: Run `.\Test-SecurityHardening.ps1`

---

**Last Updated**: November 17, 2025
