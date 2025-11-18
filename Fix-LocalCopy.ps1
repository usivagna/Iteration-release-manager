# Fix-LocalCopy.ps1
# Script to help diagnose and fix local file encoding issues

Write-Host "=== Local Copy Diagnostic Tool ===" -ForegroundColor Cyan
Write-Host ""

# Check if file has HTML entities
$scriptContent = Get-Content ".\Generate-ReleaseNotes.ps1" -Raw

if ($scriptContent -match '&amp;') {
    Write-Host "ERROR: File contains HTML-encoded ampersands (&amp;)" -ForegroundColor Red
    Write-Host "This indicates the file was copied from a web view or has encoding issues" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "To fix this issue:" -ForegroundColor Cyan
    Write-Host "1. Delete your local copy" -ForegroundColor White
    Write-Host "2. Re-clone from GitHub:" -ForegroundColor White
    Write-Host "   git clone -b copilot/harden-security-auth-mechanism https://github.com/usivagna/Iteration-release-manager.git" -ForegroundColor Gray
    Write-Host ""
    Write-Host "OR use git checkout to restore the file:" -ForegroundColor White
    Write-Host "   git fetch origin" -ForegroundColor Gray
    Write-Host "   git checkout origin/copilot/harden-security-auth-mechanism -- Generate-ReleaseNotes.ps1" -ForegroundColor Gray
    Write-Host "   git checkout origin/copilot/harden-security-auth-mechanism -- Cleanup-WorkItems.ps1" -ForegroundColor Gray
    exit 1
}

if ($scriptContent -match '&lt;|&gt;|&quot;') {
    Write-Host "ERROR: File contains other HTML entities" -ForegroundColor Red
    Write-Host "Follow the fix steps above" -ForegroundColor Yellow
    exit 1
}

Write-Host "✓ File does not contain HTML entities" -ForegroundColor Green
Write-Host ""

# Try to parse the file
try {
    $null = [System.Management.Automation.PSParser]::Tokenize($scriptContent, [ref]$null)
    Write-Host "✓ PowerShell syntax is valid" -ForegroundColor Green
}
catch {
    Write-Host "ERROR: PowerShell syntax error detected" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Yellow
    Write-Host ""
    Write-Host "The file may have been corrupted. Please re-pull from GitHub." -ForegroundColor Yellow
    exit 1
}

Write-Host ""
Write-Host "=== File Check Complete ===" -ForegroundColor Cyan
Write-Host "Your local copy appears to be correct." -ForegroundColor Green
Write-Host ""
Write-Host "If you're still having issues, please:" -ForegroundColor Yellow
Write-Host "1. Check your PowerShell version: `$PSVersionTable.PSVersion" -ForegroundColor White
Write-Host "2. Ensure you have the required modules installed" -ForegroundColor White
Write-Host "3. Review the error message carefully" -ForegroundColor White
