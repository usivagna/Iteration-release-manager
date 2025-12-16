# Test-UnlinkedPRs.ps1
# Test script to validate the unlinked PRs feature

Write-Host "=== Testing Unlinked PRs Feature ===" -ForegroundColor Cyan
Write-Host ""

# Test 1: Check if example files exist
Write-Host "Test 1: Validating example data files..." -ForegroundColor Yellow
$unlinkedPRsPath = ".\examples\completed-prs-unlinked.json"

if (-not (Test-Path $unlinkedPRsPath)) {
    Write-Host "  ❌ FAIL: $unlinkedPRsPath not found" -ForegroundColor Red
    exit 1
}
Write-Host "  ✅ PASS: completed-prs-unlinked.json exists" -ForegroundColor Green
Write-Host ""

# Test 2: Load and validate JSON structure
Write-Host "Test 2: Validating JSON structure..." -ForegroundColor Yellow
try {
    $unlinkedPRsData = Get-Content $unlinkedPRsPath | ConvertFrom-Json
    if (-not $unlinkedPRsData.completedPRs) {
        Write-Host "  ❌ FAIL: completed-prs-unlinked.json missing completedPRs array" -ForegroundColor Red
        exit 1
    }
    Write-Host "  ✅ PASS: completed-prs-unlinked.json is valid" -ForegroundColor Green
    Write-Host "    Iteration: $($unlinkedPRsData.iterationName)" -ForegroundColor Gray
    Write-Host "    Completed PRs: $($unlinkedPRsData.completedPRs.Count)" -ForegroundColor Gray
}
catch {
    Write-Host "  ❌ FAIL: completed-prs-unlinked.json is not valid JSON" -ForegroundColor Red
    Write-Host "    Error: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}
Write-Host ""

# Test 3: Validate PR structure
Write-Host "Test 3: Validating PR data structure..." -ForegroundColor Yellow
$validationErrors = 0

foreach ($pr in $unlinkedPRsData.completedPRs) {
    # Check required fields
    if (-not $pr.id) {
        Write-Host "  ❌ PR missing required field: id" -ForegroundColor Red
        $validationErrors++
    }
    if (-not $pr.title) {
        Write-Host "  ❌ PR $($pr.id) missing required field: title" -ForegroundColor Red
        $validationErrors++
    }
    if (-not $pr.repository) {
        Write-Host "  ❌ PR $($pr.id) missing required field: repository" -ForegroundColor Red
        $validationErrors++
    }
    if (-not $pr.closedDate) {
        Write-Host "  ❌ PR $($pr.id) missing required field: closedDate" -ForegroundColor Red
        $validationErrors++
    }
}

if ($validationErrors -eq 0) {
    Write-Host "  ✅ PASS: All PRs have required fields" -ForegroundColor Green
} else {
    Write-Host "  ❌ FAIL: Found $validationErrors validation errors" -ForegroundColor Red
    exit 1
}
Write-Host ""

# Test 4: Test summary generation logic
Write-Host "Test 4: Testing summary generation for unlinked PRs..." -ForegroundColor Yellow
$timestamp = Get-Date -Format "yyyy-MM-dd_HHmmss"
$testOutputDir = ".\test-output"

# Create test output directory
if (-not (Test-Path $testOutputDir)) {
    New-Item -ItemType Directory -Path $testOutputDir | Out-Null
}

# Helper function to format text (simplified version)
function Format-MarkdownText {
    param([string]$Text)
    if ([string]::IsNullOrWhiteSpace($Text)) { return "" }
    
    # Basic cleanup
    $cleaned = $Text -replace '\s+', ' '
    $cleaned = $cleaned.Trim()
    
    return $cleaned
}

# Helper function to parse PR description
function Parse-PRDescription {
    param([string]$Description)
    
    $why = ""
    $what = ""
    $how = ""
    
    if ([string]::IsNullOrWhiteSpace($Description)) {
        return @{ Why = "N/A"; What = "N/A"; How = "N/A" }
    }
    
    # Extract "Why" section
    if ($Description -match '(?si)#{0,6}\s*Why\s*(?:is this change being made)?\s*\??\s*\n+(.+?)(?=\n+#{1,6}\s*(?:What|How)|$)') {
        $why = $matches[1].Trim()
    }
    
    # Extract "What" section
    if ($Description -match '(?si)#{0,6}\s*What\s*(?:changed)?\s*\??\s*\n+(.+?)(?=\n+#{1,6}\s*(?:Why|How)|$)') {
        $what = $matches[1].Trim()
    }
    
    # Extract "How" section
    if ($Description -match '(?si)#{0,6}\s*How\s*(?:was (?:the change |it )?tested)?\s*\??\s*\n+(.+?)(?=\n+#{1,6}\s*(?:Why|What)|$)') {
        $how = $matches[1].Trim()
    }
    
    # Clean up extracted text
    $why = if ($why) { ($why -replace '\r?\n', ' ' -replace '\s+', ' ').Trim() } else { "N/A" }
    $what = if ($what) { ($what -replace '\r?\n', ' ' -replace '\s+', ' ').Trim() } else { "N/A" }
    $how = if ($how) { ($how -replace '\r?\n', ' ' -replace '\s+', ' ').Trim() } else { "N/A" }
    
    return @{ Why = $why; What = $what; How = $how }
}

try {
    # Generate a test summary section
    $summaryPath = Join-Path $testOutputDir "unlinked-prs-summary-$timestamp.md"
    
    # Group PRs by repository
    $prsByRepo = $unlinkedPRsData.completedPRs | Group-Object repository
    
    Write-Host "  Data breakdown:" -ForegroundColor Gray
    Write-Host "    - Total unlinked PRs: $($unlinkedPRsData.completedPRs.Count)" -ForegroundColor Gray
    Write-Host "    - Repositories: $($prsByRepo.Count)" -ForegroundColor Gray
    
    foreach ($repoGroup in $prsByRepo) {
        Write-Host "      * $($repoGroup.Name): $($repoGroup.Count) PR(s)" -ForegroundColor Gray
    }
    
    # Format each PR
    $prSections = ($unlinkedPRsData.completedPRs | ForEach-Object {
        $pr = $_
        $cleanPrTitle = Format-MarkdownText -Text $pr.title
        $prSections = Parse-PRDescription -Description $pr.description
        
        # Format linked work items
        $workItemsList = if ($pr.workItems -and $pr.workItems.Count -gt 0) {
            ($pr.workItems | ForEach-Object {
                "  - **[$($_.id)]** $($_.title) (Type: $($_.type), State: $($_.state))"
            }) -join "`n"
        } else {
            "  - No linked work items"
        }
        
"#### PR #$($pr.id): $cleanPrTitle

**Repository:** $($pr.repository)
**Why:** $($prSections.Why)
**What:** $($prSections.What)
**Linked Work Items:**
$workItemsList

"
    }) -join "`n---`n`n"
    
    # Create the summary
    $summary = @"
# Completed PRs Not Linked to Completed Work Items

**Iteration:** $($unlinkedPRsData.iterationName)
**Period:** $($unlinkedPRsData.startDate) to $($unlinkedPRsData.endDate)

## Summary

Total unlinked PRs: $($unlinkedPRsData.completedPRs.Count)

---

## Pull Requests

$prSections

---

*Generated on $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")*
"@
    
    $summary | Out-File $summaryPath -Encoding utf8
    
    if (Test-Path $summaryPath) {
        Write-Host "  ✅ PASS: Summary generated successfully" -ForegroundColor Green
        Write-Host "    Output: $summaryPath" -ForegroundColor Gray
    } else {
        Write-Host "  ❌ FAIL: Summary file not created" -ForegroundColor Red
        exit 1
    }
}
catch {
    Write-Host "  ❌ FAIL: Error generating summary" -ForegroundColor Red
    Write-Host "    Error: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}
Write-Host ""

Write-Host "=== All Tests Passed ===" -ForegroundColor Green
Write-Host ""
Write-Host "Test output available in: $testOutputDir" -ForegroundColor Yellow
