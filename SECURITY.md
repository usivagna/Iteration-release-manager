# Security Guidelines

This document outlines the security features and best practices for the Iteration Release Manager scripts.

## Security Features

### 🔐 Authentication

#### Azure CLI Authentication (Recommended)
The scripts support Azure DevOps CLI authentication as the most secure method:

```powershell
# Setup (one-time)
az login
az devops configure --defaults organization=https://dev.azure.com/your-org

# Use in scripts
.\Generate-ReleaseNotes.ps1 -UseAzDevOpsAuth
.\Cleanup-WorkItems.ps1 -UseAzDevOpsAuth
```

**Benefits:**
- No direct PAT handling required
- Uses Azure Active Directory authentication
- Leverages existing Azure CLI login session
- Token refresh handled automatically
- More audit-friendly

#### Personal Access Token (PAT) with SecureString
When Azure CLI is not available, PATs are handled as SecureString:

```powershell
# Pass as SecureString parameter
$secPat = ConvertTo-SecureString 'your-pat' -AsPlainText -Force
.\Generate-ReleaseNotes.ps1 -PAT $secPat

# Or use environment variable (converted to SecureString internally)
$env:AZURE_DEVOPS_PAT = "your-pat"
.\Generate-ReleaseNotes.ps1
```

**Security measures:**
- PAT parameter accepts only SecureString type
- Environment variable converted to SecureString immediately
- Credentials never logged or echoed
- Memory explicitly cleared after use

### 🛡️ Authorization & Validation

#### Pre-flight Permission Checks
Scripts validate permissions before performing any operations:

```powershell
# Automatically checks:
# - Work item read access (both scripts)
# - Work item write access (Cleanup script only)
# - Project access
```

**Fail-fast behavior:**
- Exits immediately if insufficient permissions
- Provides clear guidance on required permissions
- Prevents partial operations that might fail mid-execution

#### Network Context Validation
Optional check for Microsoft corporate network:

```powershell
# Enforced by default
.\Generate-ReleaseNotes.ps1 -UseAzDevOpsAuth

# Override when necessary (e.g., VPN, external authenticated access)
.\Generate-ReleaseNotes.ps1 -UseAzDevOpsAuth -Force
```

**Purpose:**
- Ensures scripts run in expected environment
- Reduces risk of accidental credential exposure
- Can be overridden with proper authentication

### 🔒 Credential Protection

#### No Plain Text Storage
- Credentials are never written to disk in plain text
- Output files (JSON, Markdown) contain no authentication data
- Log files don't include credential information

#### Memory Cleanup
```powershell
# Implemented in scripts:
$BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($PAT)
try {
    $plainPAT = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)
    # Use credential...
}
finally {
    # Immediately clear from memory
    [System.Runtime.InteropServices.Marshal]::ZeroFreeBSTR($BSTR)
    Remove-Variable -Name plainPAT -ErrorAction SilentlyContinue
}
```

#### Generic Error Messages
Error messages never expose credentials:

```powershell
# ❌ Bad (old approach):
Write-Host "ERROR: Authentication failed with PAT: $PAT"

# ✅ Good (new approach):
Write-Host "ERROR: API call failed. Please verify your credentials and permissions."
```

## Best Practices

### For Users

1. **Prefer Azure CLI Authentication**
   - Most secure option
   - No credential management needed
   - Recommended for all scenarios

2. **Secure PAT Handling**
   - Never commit PATs to source control
   - Use environment variables or SecureString parameters
   - Rotate PATs every 90 days
   - Use minimum required scopes

3. **Network Security**
   - Run from Microsoft corp network when possible
   - Use `-Force` only when you have verified authentication
   - Be aware of VPN and network context

4. **Permission Management**
   - Request only minimum required permissions
   - Generate: Work Items (Read), Code (Read)
   - Cleanup: Work Items (Read & Write), Code (Read)

### For Developers

1. **Never Log Credentials**
   ```powershell
   # ❌ Don't do this:
   Write-Host "PAT: $PAT"
   Write-Verbose "Token: $token"
   
   # ✅ Do this instead:
   Write-Host "Authentication configured"
   Write-Verbose "Using credential from environment"
   ```

2. **Clear Sensitive Variables**
   ```powershell
   # Always clean up after use
   try {
       # Use sensitive data
   }
   finally {
       Remove-Variable -Name sensitiveVar -ErrorAction SilentlyContinue
   }
   ```

3. **Use SecureString**
   ```powershell
   # Accept credentials as SecureString
   param(
       [SecureString]$PAT = $null
   )
   ```

4. **Validate Input**
   ```powershell
   # Check authentication before operations
   if ($null -eq $headers) {
       Write-Host "ERROR: Authentication not configured"
       exit 1
   }
   ```

## Security Testing

Run the security validation suite:

```powershell
.\Test-SecurityHardening.ps1
```

This validates:
- ✅ PAT parameter is SecureString
- ✅ Azure CLI auth support exists
- ✅ Force override parameter available
- ✅ No PAT echoing in code
- ✅ SecureString memory cleanup
- ✅ Corp network check function
- ✅ Pre-flight permission checks
- ✅ Generic error messages
- ✅ Azure CLI token handling
- ✅ Output file security
- ✅ PowerShell syntax validity
- ✅ Documentation completeness

## Threat Model

### Threats Mitigated

1. **Credential Exposure in Logs**
   - Risk: PAT visible in console output or log files
   - Mitigation: Never echo credentials, use generic error messages

2. **Credential Exposure in Source Control**
   - Risk: PAT committed to git repository
   - Mitigation: Use SecureString parameters, no plain text handling

3. **Memory Scraping**
   - Risk: Credentials remain in memory after use
   - Mitigation: Explicit memory cleanup with ZeroFreeBSTR

4. **Unauthorized Access**
   - Risk: Script run by unauthorized users
   - Mitigation: Pre-flight permission checks, network validation

5. **Insufficient Permissions**
   - Risk: Operations fail mid-execution due to permission issues
   - Mitigation: Fail-fast permission validation before any operations

### Residual Risks

1. **Environment Variable Access**
   - Other processes can read environment variables
   - Mitigation: Prefer Azure CLI auth, rotate PATs frequently

2. **Network Traffic Interception**
   - HTTPS traffic could be intercepted
   - Mitigation: Use corp network, verify TLS certificates

3. **Compromised Azure CLI Session**
   - If Azure CLI is compromised, tokens are accessible
   - Mitigation: Regular re-authentication, monitor Azure AD logs

## Incident Response

If a credential is compromised:

1. **Immediately revoke the PAT or Azure session**
   - Azure DevOps: https://dev.azure.com/[org]/_usersSettings/tokens
   - Azure CLI: `az logout`

2. **Generate a new credential**
   - Create new PAT with minimum required scopes
   - Re-authenticate with Azure CLI

3. **Review audit logs**
   - Check Azure DevOps audit logs for unauthorized access
   - Review Azure AD sign-in logs

4. **Update scripts**
   - Update environment variables or re-authenticate
   - Test with new credentials

## Compliance

### Microsoft Security Requirements

These scripts follow Microsoft internal security guidelines:
- ✅ No credentials in source control
- ✅ Least privilege access
- ✅ Secure credential handling
- ✅ Audit trail (via Azure DevOps logging)
- ✅ Network context awareness

### Data Protection

- **No PII in output files**: Scripts only process work item metadata
- **No credential storage**: Credentials never written to disk
- **Secure transmission**: All API calls use HTTPS

## Support

For security concerns or questions:

1. Review this documentation
2. Run `Test-SecurityHardening.ps1` to validate your setup
3. Check the troubleshooting section in README.md
4. Contact your security team for organization-specific guidance

## Version History

### v2.1 (Current)
- ✅ Azure CLI authentication support
- ✅ SecureString PAT handling
- ✅ Pre-flight permission checks
- ✅ Network context validation
- ✅ Memory cleanup
- ✅ Generic error messages

### v2.0
- Basic PAT authentication (plain text)
- No pre-flight checks
- No memory cleanup

---

**Last Updated**: November 17, 2025  
**Maintained by**: Development Team
