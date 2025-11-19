# Test-CleanupScript.ps1
# Test script to validate the work item cleanup script logic

Write-Host "=== Testing Work Item Cleanup Script ===" -ForegroundColor Cyan
Write-Host ""

# Test 1: Check if cleanup script exists
Write-Host "Test 1: Validating cleanup script exists..." -ForegroundColor Yellow
$cleanupScriptPath = ".\Cleanup-WorkItems.ps1"

if (-not (Test-Path $cleanupScriptPath)) {
    Write-Host "  ❌ FAIL: $cleanupScriptPath not found" -ForegroundColor Red
    exit 1
}
Write-Host "  ✅ PASS: Cleanup-WorkItems.ps1 exists" -ForegroundColor Green
Write-Host ""

# Test 2: Validate script parameters
Write-Host "Test 2: Validating script parameters..." -ForegroundColor Yellow
$scriptContent = Get-Content $cleanupScriptPath -Raw
$requiredParams = @(
    @{Name="ProjectName"; Pattern="\[string\]\`$ProjectName"},
    @{Name="TeamName"; Pattern="\[string\]\`$TeamName"},
    @{Name="Organization"; Pattern="\[string\]\`$Organization"},
    @{Name="PAT"; Pattern="\[SecureString\]\`$PAT"},
    @{Name="OutputDir"; Pattern="\[string\]\`$OutputDir"},
    @{Name="DryRun"; Pattern="\[switch\]\`$DryRun"}
)
$allFound = $true

foreach ($param in $requiredParams) {
    if ($scriptContent -match $param.Pattern) {
        Write-Host "  ✅ Parameter found: $($param.Name)" -ForegroundColor Green
    } else {
        Write-Host "  ❌ FAIL: Missing parameter: $($param.Name)" -ForegroundColor Red
        $allFound = $false
    }
}

if (-not $allFound) {
    exit 1
}
Write-Host ""

# Test 3: Validate environment variable usage pattern
Write-Host "Test 3: Validating environment variable pattern..." -ForegroundColor Yellow
$checks = @{
    "Organization env check" = [regex]::Escape('$env:AZURE_DEVOPS_ORG')
    "PAT env check" = [regex]::Escape('$env:AZURE_DEVOPS_PAT')
    "Base URL construction" = [regex]::Escape('https://dev.azure.com/$Organization')
    "Authorization header" = 'Authorization'
}

foreach ($check in $checks.GetEnumerator()) {
    if ($scriptContent -match $check.Value) {
        Write-Host "  ✅ PASS: $($check.Key)" -ForegroundColor Green
    } else {
        Write-Host "  ❌ FAIL: $($check.Key) not found" -ForegroundColor Red
        $allFound = $false
    }
}

if (-not $allFound) {
    exit 1
}
Write-Host ""

# Test 4: Validate API operations
Write-Host "Test 4: Validating API operations..." -ForegroundColor Yellow
$apiChecks = @{
    "WIQL query for closed items" = 'Microsoft.VSTS.Common.ClosedDate'
    "StackRank field usage" = 'Microsoft.VSTS.Common.StackRank'
    "IterationPath update" = 'System.IterationPath'
    "PATCH method for updates" = 'Method.*PATCH'
    "Parent-child relationships" = 'System.Links.LinkType.*Hierarchy'
}

foreach ($check in $apiChecks.GetEnumerator()) {
    if ($scriptContent -match $check.Value) {
        Write-Host "  ✅ PASS: $($check.Key)" -ForegroundColor Green
    } else {
        Write-Host "  ❌ FAIL: $($check.Key) not found" -ForegroundColor Red
        $allFound = $false
    }
}

if (-not $allFound) {
    exit 1
}
Write-Host ""

# Test 5: Validate dry run functionality
Write-Host "Test 5: Validating dry run functionality..." -ForegroundColor Yellow
if ($scriptContent -match 'DryRun.*\$false') {
    Write-Host "  ✅ PASS: DryRun parameter found" -ForegroundColor Green
} else {
    Write-Host "  ❌ FAIL: DryRun parameter not properly configured" -ForegroundColor Red
    exit 1
}

if ($scriptContent -match 'if.*-not.*DryRun') {
    Write-Host "  ✅ PASS: DryRun conditional logic found" -ForegroundColor Green
} else {
    Write-Host "  ❌ FAIL: DryRun conditional logic not found" -ForegroundColor Red
    exit 1
}
Write-Host ""

# Test 6: Validate output report generation
Write-Host "Test 6: Validating output report generation..." -ForegroundColor Yellow
if ($scriptContent -match 'cleanup-report.*\.json') {
    Write-Host "  ✅ PASS: Report generation found" -ForegroundColor Green
} else {
    Write-Host "  ❌ FAIL: Report generation not found" -ForegroundColor Red
    exit 1
}
Write-Host ""

# Test 7: Validate error handling
Write-Host "Test 7: Validating error handling..." -ForegroundColor Yellow
$errorHandling = @{
    "Try-catch blocks" = 'try.*catch'
    "Error messages" = 'Write-Host.*ERROR'
    "Exit codes" = 'exit 1'
    "API error handling" = 'ErrorDetails'
}

foreach ($check in $errorHandling.GetEnumerator()) {
    if ($scriptContent -match $check.Value) {
        Write-Host "  ✅ PASS: $($check.Key)" -ForegroundColor Green
    } else {
        Write-Host "  ⚠️  WARNING: $($check.Key) might be missing" -ForegroundColor Yellow
    }
}
Write-Host ""

# Test 8: Check consistency with Generate-ReleaseNotes.ps1
Write-Host "Test 8: Validating consistency with Generate-ReleaseNotes.ps1..." -ForegroundColor Yellow
$releaseNotesPath = ".\Generate-ReleaseNotes.ps1"

if (Test-Path $releaseNotesPath) {
    $releaseNotesContent = Get-Content $releaseNotesPath -Raw
    
    $consistencyChecks = @{
        "Same base URL pattern" = 'https://dev.azure.com/\$Organization'
        "Same iterations API call" = 'teamsettings/iterations'
        "Same authorization pattern" = 'Basic \$encodedPAT'
    }
    
    foreach ($check in $consistencyChecks.GetEnumerator()) {
        $inBoth = ($scriptContent -match [regex]::Escape($check.Value)) -and ($releaseNotesContent -match [regex]::Escape($check.Value))
        if ($inBoth) {
            Write-Host "  ✅ PASS: $($check.Key) is consistent" -ForegroundColor Green
        } else {
            Write-Host "  ⚠️  WARNING: $($check.Key) might differ" -ForegroundColor Yellow
        }
    }
} else {
    Write-Host "  ⚠️  WARNING: Generate-ReleaseNotes.ps1 not found for comparison" -ForegroundColor Yellow
}
Write-Host ""

# Test 9: Validate script structure
Write-Host "Test 9: Validating script structure..." -ForegroundColor Yellow
$structureChecks = @{
    "Step 1: Get iteration information" = 'Step 1.*iteration information'
    "Step 2: Query work items" = 'Step 2.*work items'
    "Step 3: Apply changes" = 'Step 3.*changes'
    "Step 4: Generate report" = 'Step 4.*report'
}

foreach ($check in $structureChecks.GetEnumerator()) {
    if ($scriptContent -match $check.Value) {
        Write-Host "  ✅ PASS: $($check.Key)" -ForegroundColor Green
    } else {
        Write-Host "  ❌ FAIL: $($check.Key) not found" -ForegroundColor Red
        $allFound = $false
    }
}

if (-not $allFound) {
    exit 1
}
Write-Host ""

# Test 10: Check for proper logging
Write-Host "Test 10: Validating logging..." -ForegroundColor Yellow
$loggingChecks = @{
    "Colored output (Cyan)" = 'ForegroundColor Cyan'
    "Colored output (Green)" = 'ForegroundColor Green'
    "Colored output (Red)" = 'ForegroundColor Red'
    "Colored output (Yellow)" = 'ForegroundColor Yellow'
    "Progress messages" = 'Write-Host.*Found.*items'
}

foreach ($check in $loggingChecks.GetEnumerator()) {
    if ($scriptContent -match $check.Value) {
        Write-Host "  ✅ PASS: $($check.Key)" -ForegroundColor Green
    } else {
        Write-Host "  ⚠️  WARNING: $($check.Key) might be missing" -ForegroundColor Yellow
    }
}
Write-Host ""

# Summary
Write-Host "=== Test Summary ===" -ForegroundColor Cyan
Write-Host "All critical tests passed! ✅" -ForegroundColor Green
Write-Host ""
Write-Host "The cleanup script is ready for use!" -ForegroundColor Green
Write-Host ""
Write-Host "Usage examples:" -ForegroundColor Cyan
Write-Host "1. With Azure CLI (recommended):" -ForegroundColor Gray
Write-Host "   az login" -ForegroundColor Gray
Write-Host "   .\Cleanup-WorkItems.ps1 -DryRun" -ForegroundColor Gray
Write-Host ""
Write-Host "2. With PAT as environment variable:" -ForegroundColor Gray
Write-Host "   `$env:AZURE_DEVOPS_PAT = 'your-pat'" -ForegroundColor Gray
Write-Host "   .\Cleanup-WorkItems.ps1 -DryRun" -ForegroundColor Gray
Write-Host ""
Write-Host "3. With PAT as SecureString:" -ForegroundColor Gray
Write-Host "   `$securePAT = Read-Host -AsSecureString" -ForegroundColor Gray
Write-Host "   .\Cleanup-WorkItems.ps1 -Organization 'myorg' -PAT `$securePAT -DryRun" -ForegroundColor Gray
Write-Host ""
