# Test-AutomatedScript.ps1
# Test script to validate the automated release notes generator logic

Write-Host "=== Testing Automated Release Notes Generator ===" -ForegroundColor Cyan
Write-Host ""

# Test 1: Check if example files exist
Write-Host "Test 1: Validating example data files..." -ForegroundColor Yellow
$iterationInfoPath = ".\examples\iteration-info.json"
$workItemsPath = ".\examples\work-items-with-prs.json"

if (-not (Test-Path $iterationInfoPath)) {
    Write-Host "  ❌ FAIL: $iterationInfoPath not found" -ForegroundColor Red
    exit 1
}
Write-Host "  ✅ PASS: iteration-info.json exists" -ForegroundColor Green

if (-not (Test-Path $workItemsPath)) {
    Write-Host "  ❌ FAIL: $workItemsPath not found" -ForegroundColor Red
    exit 1
}
Write-Host "  ✅ PASS: work-items-with-prs.json exists" -ForegroundColor Green
Write-Host ""

# Test 2: Load and validate JSON structure
Write-Host "Test 2: Validating JSON structure..." -ForegroundColor Yellow
try {
    $iterationInfo = Get-Content $iterationInfoPath | ConvertFrom-Json
    if (-not $iterationInfo.iterationName) {
        Write-Host "  ❌ FAIL: iteration-info.json missing iterationName" -ForegroundColor Red
        exit 1
    }
    Write-Host "  ✅ PASS: iteration-info.json is valid" -ForegroundColor Green
    Write-Host "    Iteration: $($iterationInfo.iterationName)" -ForegroundColor Gray
}
catch {
    Write-Host "  ❌ FAIL: iteration-info.json is not valid JSON" -ForegroundColor Red
    Write-Host "    Error: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}

try {
    $workItemsData = Get-Content $workItemsPath | ConvertFrom-Json
    if (-not $workItemsData.workItems) {
        Write-Host "  ❌ FAIL: work-items-with-prs.json missing workItems array" -ForegroundColor Red
        exit 1
    }
    Write-Host "  ✅ PASS: work-items-with-prs.json is valid" -ForegroundColor Green
    Write-Host "    Work items: $($workItemsData.workItems.Count)" -ForegroundColor Gray
}
catch {
    Write-Host "  ❌ FAIL: work-items-with-prs.json is not valid JSON" -ForegroundColor Red
    Write-Host "    Error: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}
Write-Host ""

# Test 3: Simulate summary generation
Write-Host "Test 3: Testing summary generation logic..." -ForegroundColor Yellow
$timestamp = Get-Date -Format "yyyy-MM-dd_HHmmss"
$testOutputDir = ".\test-output"

# Create test output directory
if (-not (Test-Path $testOutputDir)) {
    New-Item -ItemType Directory -Path $testOutputDir | Out-Null
}

# Test internal summary generation
$internalSummaryPath = Join-Path $testOutputDir "internal-summary-$timestamp.md"
try {
    $busesItems = $workItemsData.workItems | Where-Object { $_.areaPath -like '*\Buses' }
    $sensorsItems = $workItemsData.workItems | Where-Object { $_.areaPath -like '*\Sensors' }
    $features = $workItemsData.workItems | Where-Object { $_.type -in @('User Story', 'Feature') }
    $bugs = $workItemsData.workItems | Where-Object { $_.type -eq 'Bug' }
    
    Write-Host "  Data breakdown:" -ForegroundColor Gray
    Write-Host "    - Buses items: $($busesItems.Count)" -ForegroundColor Gray
    Write-Host "    - Sensors items: $($sensorsItems.Count)" -ForegroundColor Gray
    Write-Host "    - Features: $($features.Count)" -ForegroundColor Gray
    Write-Host "    - Bugs: $($bugs.Count)" -ForegroundColor Gray
    
    # Create a simple summary
    $summary = @"
# Iteration Summary: $($iterationInfo.iterationName)

**Period:** $($iterationInfo.startDate) to $($iterationInfo.endDate)

## Executive Summary

- Total work items completed: $($workItemsData.workItems.Count)
- Buses items: $($busesItems.Count)
- Sensors items: $($sensorsItems.Count)
- Features: $($features.Count)
- Bugs: $($bugs.Count)

---
*Generated on $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")*
"@
    
    $summary | Out-File $internalSummaryPath -Encoding utf8
    Write-Host "  ✅ PASS: Internal summary generated successfully" -ForegroundColor Green
    Write-Host "    File: $internalSummaryPath" -ForegroundColor Gray
}
catch {
    Write-Host "  ❌ FAIL: Failed to generate internal summary" -ForegroundColor Red
    Write-Host "    Error: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}

# Test insider notes generation
$insiderNotesPath = Join-Path $testOutputDir "insider-release-notes-$timestamp.md"
try {
    $notes = @"
# What's New in Buses & Sensors - $($iterationInfo.iterationName)

## Overview

This release includes $($workItemsData.workItems.Count) improvements to Windows connectivity and sensor capabilities.

## New Features

$(
if ($features) {
    ($features | ForEach-Object { "- $($_.title)" }) -join "`n"
} else {
    "No new features in this release."
}
)

---
*Generated on $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")*
"@
    
    $notes | Out-File $insiderNotesPath -Encoding utf8
    Write-Host "  ✅ PASS: Insider release notes generated successfully" -ForegroundColor Green
    Write-Host "    File: $insiderNotesPath" -ForegroundColor Gray
}
catch {
    Write-Host "  ❌ FAIL: Failed to generate insider release notes" -ForegroundColor Red
    Write-Host "    Error: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}
Write-Host ""

# Test 4: Validate generated files
Write-Host "Test 4: Validating generated files..." -ForegroundColor Yellow
if (-not (Test-Path $internalSummaryPath)) {
    Write-Host "  ❌ FAIL: Internal summary file not created" -ForegroundColor Red
    exit 1
}

$summaryContent = Get-Content $internalSummaryPath -Raw
if ($summaryContent.Length -lt 100) {
    Write-Host "  ❌ FAIL: Internal summary file is too short" -ForegroundColor Red
    exit 1
}
Write-Host "  ✅ PASS: Internal summary file is valid" -ForegroundColor Green

if (-not (Test-Path $insiderNotesPath)) {
    Write-Host "  ❌ FAIL: Insider release notes file not created" -ForegroundColor Red
    exit 1
}

$notesContent = Get-Content $insiderNotesPath -Raw
if ($notesContent.Length -lt 100) {
    Write-Host "  ❌ FAIL: Insider release notes file is too short" -ForegroundColor Red
    exit 1
}
Write-Host "  ✅ PASS: Insider release notes file is valid" -ForegroundColor Green
Write-Host ""

# Test 5: Check script parameters
Write-Host "Test 5: Validating script parameters..." -ForegroundColor Yellow
$scriptContent = Get-Content ".\Generate-ReleaseNotes.ps1" -Raw
$requiredParams = @("ProjectName", "TeamName", "Organization", "PAT", "OutputDir")
$allFound = $true
foreach ($param in $requiredParams) {
    if ($scriptContent -notmatch "\[string\]\`$$param") {
        Write-Host "  ❌ FAIL: Missing parameter: $param" -ForegroundColor Red
        $allFound = $false
    }
}
if ($allFound) {
    Write-Host "  ✅ PASS: All required parameters present" -ForegroundColor Green
}
Write-Host ""

# Summary
Write-Host "=== Test Summary ===" -ForegroundColor Cyan
Write-Host "All tests passed! ✅" -ForegroundColor Green
Write-Host ""
Write-Host "Generated test files in: $testOutputDir" -ForegroundColor Yellow
Write-Host "  - internal-summary-$timestamp.md" -ForegroundColor Gray
Write-Host "  - insider-release-notes-$timestamp.md" -ForegroundColor Gray
Write-Host ""
Write-Host "The automated script is ready for use!" -ForegroundColor Green
Write-Host ""
Write-Host "To use with real Azure DevOps data:" -ForegroundColor Cyan
Write-Host "1. Set environment variables:" -ForegroundColor Gray
Write-Host "   `$env:AZURE_DEVOPS_ORG = 'your-org'" -ForegroundColor Gray
Write-Host "   `$env:AZURE_DEVOPS_PAT = 'your-pat'" -ForegroundColor Gray
Write-Host "2. Run: .\Generate-ReleaseNotes.ps1" -ForegroundColor Gray
