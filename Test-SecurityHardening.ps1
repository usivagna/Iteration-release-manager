# Test-SecurityHardening.ps1
# Test script to validate security and authentication hardening

Write-Host "=== Testing Security & Auth Hardening ===" -ForegroundColor Cyan
Write-Host ""

$testsPassed = 0
$testsFailed = 0

# Test 1: Verify PAT parameter is SecureString
Write-Host "Test 1: Validating PAT parameter type..." -ForegroundColor Yellow
try {
    $genScript = Get-Content ".\Generate-ReleaseNotes.ps1" -Raw
    $cleanupScript = Get-Content ".\Cleanup-WorkItems.ps1" -Raw
    
    if ($genScript -match '\[SecureString\]\$PAT' -and $cleanupScript -match '\[SecureString\]\$PAT') {
        Write-Host "  ✅ PASS: PAT parameter is SecureString in both scripts" -ForegroundColor Green
        $testsPassed++
    } else {
        Write-Host "  ❌ FAIL: PAT parameter is not SecureString" -ForegroundColor Red
        $testsFailed++
    }
}
catch {
    Write-Host "  ❌ FAIL: Error checking PAT parameter: $($_.Exception.Message)" -ForegroundColor Red
    $testsFailed++
}
Write-Host ""

# Test 2: Verify UseAzDevOpsAuth parameter exists
Write-Host "Test 2: Validating Azure CLI auth support..." -ForegroundColor Yellow
try {
    if ($genScript -match '\[switch\]\$UseAzDevOpsAuth' -and $cleanupScript -match '\[switch\]\$UseAzDevOpsAuth') {
        Write-Host "  ✅ PASS: UseAzDevOpsAuth parameter exists in both scripts" -ForegroundColor Green
        $testsPassed++
    } else {
        Write-Host "  ❌ FAIL: UseAzDevOpsAuth parameter missing" -ForegroundColor Red
        $testsFailed++
    }
}
catch {
    Write-Host "  ❌ FAIL: Error checking UseAzDevOpsAuth: $($_.Exception.Message)" -ForegroundColor Red
    $testsFailed++
}
Write-Host ""

# Test 3: Verify Force parameter exists
Write-Host "Test 3: Validating Force override parameter..." -ForegroundColor Yellow
try {
    if ($genScript -match '\[switch\]\$Force' -and $cleanupScript -match '\[switch\]\$Force') {
        Write-Host "  ✅ PASS: Force parameter exists in both scripts" -ForegroundColor Green
        $testsPassed++
    } else {
        Write-Host "  ❌ FAIL: Force parameter missing" -ForegroundColor Red
        $testsFailed++
    }
}
catch {
    Write-Host "  ❌ FAIL: Error checking Force parameter: $($_.Exception.Message)" -ForegroundColor Red
    $testsFailed++
}
Write-Host ""

# Test 4: Verify no PAT echoing in error messages
Write-Host "Test 4: Checking for PAT echo prevention..." -ForegroundColor Yellow
try {
    # Check that scripts don't contain patterns that would echo PAT
    $hasPatEcho = $false
    
    # Check for dangerous patterns
    if ($genScript -match 'Write-Host.*\$PAT' -or $cleanupScript -match 'Write-Host.*\$PAT') {
        $hasPatEcho = $true
    }
    if ($genScript -match 'Write-Host.*\$plainPAT' -or $cleanupScript -match 'Write-Host.*\$plainPAT') {
        $hasPatEcho = $true
    }
    if ($genScript -match 'Write-Host.*\$encodedPAT' -or $cleanupScript -match 'Write-Host.*\$encodedPAT') {
        $hasPatEcho = $true
    }
    
    if (-not $hasPatEcho) {
        Write-Host "  ✅ PASS: No PAT echoing detected" -ForegroundColor Green
        $testsPassed++
    } else {
        Write-Host "  ❌ FAIL: Found potential PAT echoing" -ForegroundColor Red
        $testsFailed++
    }
}
catch {
    Write-Host "  ❌ FAIL: Error checking PAT echoing: $($_.Exception.Message)" -ForegroundColor Red
    $testsFailed++
}
Write-Host ""

# Test 5: Verify SecureString cleanup
Write-Host "Test 5: Checking SecureString memory cleanup..." -ForegroundColor Yellow
try {
    if ($genScript -match 'ZeroFreeBSTR' -and $cleanupScript -match 'ZeroFreeBSTR') {
        Write-Host "  ✅ PASS: SecureString memory cleanup implemented" -ForegroundColor Green
        $testsPassed++
    } else {
        Write-Host "  ❌ FAIL: SecureString memory cleanup missing" -ForegroundColor Red
        $testsFailed++
    }
}
catch {
    Write-Host "  ❌ FAIL: Error checking memory cleanup: $($_.Exception.Message)" -ForegroundColor Red
    $testsFailed++
}
Write-Host ""

# Test 6: Verify Microsoft corp network check function
Write-Host "Test 6: Validating corp network check..." -ForegroundColor Yellow
try {
    if ($genScript -match 'function Test-MicrosoftCorpNetwork' -and $cleanupScript -match 'function Test-MicrosoftCorpNetwork') {
        Write-Host "  ✅ PASS: Corp network check function exists" -ForegroundColor Green
        $testsPassed++
    } else {
        Write-Host "  ❌ FAIL: Corp network check function missing" -ForegroundColor Red
        $testsFailed++
    }
}
catch {
    Write-Host "  ❌ FAIL: Error checking corp network function: $($_.Exception.Message)" -ForegroundColor Red
    $testsFailed++
}
Write-Host ""

# Test 7: Verify pre-flight permission check
Write-Host "Test 7: Validating pre-flight permission check..." -ForegroundColor Yellow
try {
    if ($genScript -match 'Pre-flight permission check' -and $cleanupScript -match 'Pre-flight permission check') {
        Write-Host "  ✅ PASS: Pre-flight permission check implemented" -ForegroundColor Green
        $testsPassed++
    } else {
        Write-Host "  ❌ FAIL: Pre-flight permission check missing" -ForegroundColor Red
        $testsFailed++
    }
}
catch {
    Write-Host "  ❌ FAIL: Error checking permission check: $($_.Exception.Message)" -ForegroundColor Red
    $testsFailed++
}
Write-Host ""

# Test 8: Verify error messages don't expose credentials
Write-Host "Test 8: Validating generic error messages..." -ForegroundColor Yellow
try {
    # Check that error handling is generic
    if ($genScript -match 'API call failed. Please verify your credentials and permissions' -and 
        $cleanupScript -match 'API call failed. Please verify your credentials and permissions') {
        Write-Host "  ✅ PASS: Generic error messages implemented" -ForegroundColor Green
        $testsPassed++
    } else {
        Write-Host "  ❌ FAIL: Generic error messages not found" -ForegroundColor Red
        $testsFailed++
    }
}
catch {
    Write-Host "  ❌ FAIL: Error checking error messages: $($_.Exception.Message)" -ForegroundColor Red
    $testsFailed++
}
Write-Host ""

# Test 9: Verify Azure CLI token retrieval
Write-Host "Test 9: Checking Azure CLI token handling..." -ForegroundColor Yellow
try {
    if ($genScript -match 'az account get-access-token' -and $cleanupScript -match 'az account get-access-token') {
        Write-Host "  ✅ PASS: Azure CLI token retrieval implemented" -ForegroundColor Green
        $testsPassed++
    } else {
        Write-Host "  ❌ FAIL: Azure CLI token retrieval missing" -ForegroundColor Red
        $testsFailed++
    }
}
catch {
    Write-Host "  ❌ FAIL: Error checking Azure CLI token handling: $($_.Exception.Message)" -ForegroundColor Red
    $testsFailed++
}
Write-Host ""

# Test 10: Verify output files don't contain credentials
Write-Host "Test 10: Checking output file security..." -ForegroundColor Yellow
try {
    # Check that output files don't contain credential patterns
    $hasCredentialOutput = $false
    
    # Look for any JSON output that might contain auth data (using word boundaries)
    if ($genScript -match 'ConvertTo-Json.*\$PAT\b' -or $cleanupScript -match 'ConvertTo-Json.*\$PAT\b') {
        $hasCredentialOutput = $true
    }
    if ($genScript -match 'Out-File.*\$PAT\b' -or $cleanupScript -match 'Out-File.*\$PAT\b') {
        $hasCredentialOutput = $true
    }
    if ($genScript -match 'ConvertTo-Json.*\$plainPAT' -or $cleanupScript -match 'ConvertTo-Json.*\$plainPAT') {
        $hasCredentialOutput = $true
    }
    if ($genScript -match 'ConvertTo-Json.*\$encodedPAT' -or $cleanupScript -match 'ConvertTo-Json.*\$encodedPAT') {
        $hasCredentialOutput = $true
    }
    
    if (-not $hasCredentialOutput) {
        Write-Host "  ✅ PASS: No credential output detected" -ForegroundColor Green
        $testsPassed++
    } else {
        Write-Host "  ❌ FAIL: Found potential credential output" -ForegroundColor Red
        $testsFailed++
    }
}
catch {
    Write-Host "  ❌ FAIL: Error checking output security: $($_.Exception.Message)" -ForegroundColor Red
    $testsFailed++
}
Write-Host ""

# Test 11: Verify PowerShell syntax is valid
Write-Host "Test 11: Validating PowerShell syntax..." -ForegroundColor Yellow
try {
    $null = [System.Management.Automation.PSParser]::Tokenize($genScript, [ref]$null)
    $null = [System.Management.Automation.PSParser]::Tokenize($cleanupScript, [ref]$null)
    Write-Host "  ✅ PASS: PowerShell syntax is valid for both scripts" -ForegroundColor Green
    $testsPassed++
}
catch {
    Write-Host "  ❌ FAIL: Syntax error: $($_.Exception.Message)" -ForegroundColor Red
    $testsFailed++
}
Write-Host ""

# Test 12: Verify documentation updates
Write-Host "Test 12: Validating documentation updates..." -ForegroundColor Yellow
try {
    $readme = Get-Content ".\README.md" -Raw
    
    $hasSecuritySection = $readme -match 'Security Features'
    $hasAzCliDocs = $readme -match 'Azure DevOps CLI'
    $hasSecureStringDocs = $readme -match 'SecureString'
    $hasNetworkCheck = $readme -match 'Network validation'
    
    if ($hasSecuritySection -and $hasAzCliDocs -and $hasSecureStringDocs -and $hasNetworkCheck) {
        Write-Host "  ✅ PASS: Documentation properly updated" -ForegroundColor Green
        $testsPassed++
    } else {
        Write-Host "  ❌ FAIL: Documentation incomplete" -ForegroundColor Red
        if (-not $hasSecuritySection) { Write-Host "    Missing: Security Features section" -ForegroundColor Gray }
        if (-not $hasAzCliDocs) { Write-Host "    Missing: Azure CLI documentation" -ForegroundColor Gray }
        if (-not $hasSecureStringDocs) { Write-Host "    Missing: SecureString documentation" -ForegroundColor Gray }
        if (-not $hasNetworkCheck) { Write-Host "    Missing: Network validation documentation" -ForegroundColor Gray }
        $testsFailed++
    }
}
catch {
    Write-Host "  ❌ FAIL: Error checking documentation: $($_.Exception.Message)" -ForegroundColor Red
    $testsFailed++
}
Write-Host ""

# Summary
Write-Host "=== Test Summary ===" -ForegroundColor Cyan
Write-Host "Tests Passed: $testsPassed" -ForegroundColor Green
Write-Host "Tests Failed: $testsFailed" -ForegroundColor $(if ($testsFailed -gt 0) { "Red" } else { "Green" })
Write-Host ""

if ($testsFailed -eq 0) {
    Write-Host "✓ All security hardening tests passed!" -ForegroundColor Green
    exit 0
} else {
    Write-Host "✗ Some tests failed. Please review and fix." -ForegroundColor Red
    exit 1
}
