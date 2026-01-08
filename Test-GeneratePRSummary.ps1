# Test-GeneratePRSummary.ps1
# Test script to validate the structure and logic of Generate-PRSummary.ps1

Write-Host "=== Testing Generate-PRSummary.ps1 ===" -ForegroundColor Cyan
Write-Host ""

$scriptPath = ".\Generate-PRSummary.ps1"

if (-not (Test-Path $scriptPath)) {
    Write-Host "❌ FAIL: Script file not found at $scriptPath" -ForegroundColor Red
    exit 1
}
Write-Host "✅ Script file exists" -ForegroundColor Green

$scriptContent = Get-Content $scriptPath -Raw

# Test 1: Check parameters
Write-Host "Test 1: Validating parameters..." -ForegroundColor Yellow
$requiredParams = @("RootWorkItemId", "Organization", "PAT", "OutputDir")
$allFound = $true
foreach ($param in $requiredParams) {
    if ($scriptContent -match "\[.*\]\`$$param") {
        Write-Host "  ✅ Parameter found: -$param" -ForegroundColor Green
    } else {
        Write-Host "  ❌ FAIL: Missing parameter: -$param" -ForegroundColor Red
        $allFound = $false
    }
}

# Test 2: Check Logic Components
Write-Host ""
Write-Host "Test 2: Validating internal logic..." -ForegroundColor Yellow

$logicCheers = @{
    "WIQL Recursive Query" = "MODE (Recursive)"
    "Link Type Check" = "System.LinkTypes.Hierarchy-Forward"
    "Target ID Extraction" = "target.id"
    "PR Link Matching" = "vstfs:///Git/PullRequestId/"
    "Markdown Output" = "| ID | Repository | Title | Description | Status | Author |"
    "JSON Output" = "ConvertTo-Json -Depth 10"
}

foreach ($check in $logicCheers.GetEnumerator()) {
    # Escape regex special characters in the pattern
    $pattern = [regex]::Escape($check.Value).Replace("\ ", " ").Replace("\(", "(").Replace("\)", ")").Replace("\|", "|")
    
    # Simple substring check is often safer for simple strings, but let's stick to match for now or just simple contains
    if ($scriptContent.Contains($check.Value)) {
         Write-Host "  ✅ Found: $($check.Key)" -ForegroundColor Green
    } else {
         Write-Host "  ❌ FAIL: Missing logic for: $($check.Key) (Expected '$($check.Value)')" -ForegroundColor Red
         $allFound = $false
    }
}

Write-Host ""
if ($allFound) {
    Write-Host "=== All Static Tests Passed ===" -ForegroundColor Green
    Write-Host "The script structure is correct. To test functionality, run:"
    Write-Host ".\Generate-PRSummary.ps1 -RootWorkItemId <YourID> -Organization <YourOrg>"
} else {
    Write-Host "=== Some Tests Failed ===" -ForegroundColor Red
    exit 1
}
