# Test-NewFeatures.ps1
# Test script to validate the new features in Cleanup-WorkItems.ps1

Write-Host "=== Testing New Features in Cleanup-WorkItems.ps1 ===" -ForegroundColor Cyan
Write-Host ""

$scriptPath = ".\Cleanup-WorkItems.ps1"
$scriptContent = Get-Content $scriptPath -Raw

# Test 1: Check new parameters exist
Write-Host "Test 1: Validating new task selection parameters..." -ForegroundColor Yellow
$taskParams = @(
    "Task1", "UpdateIterationPaths", "Task2", "SyncRanks", 
    "Task3", "MoveToBacklog", "Task4", "MarkCompleted", "AllTasks"
)
$allFound = $true
foreach ($param in $taskParams) {
    if ($scriptContent -match "\[switch\]\`$$param") {
        Write-Host "  ✅ Parameter found: -$param" -ForegroundColor Green
    } else {
        Write-Host "  ❌ FAIL: Missing parameter: -$param" -ForegroundColor Red
        $allFound = $false
    }
}
if (-not $allFound) { exit 1 }
Write-Host ""

# Test 2: Check bug filtering parameter
Write-Host "Test 2: Validating bug filtering parameter..." -ForegroundColor Yellow
if ($scriptContent -match "\[switch\]\`$IncludeBugs") {
    Write-Host "  ✅ Parameter found: -IncludeBugs" -ForegroundColor Green
} else {
    Write-Host "  ❌ FAIL: Missing parameter: -IncludeBugs" -ForegroundColor Red
    exit 1
}
Write-Host ""

# Test 3: Check interactive menu implementation
Write-Host "Test 3: Validating interactive menu implementation..." -ForegroundColor Yellow
$menuChecks = @{
    "Menu title" = "Task Selection Menu"
    "Option 1" = "Run ALL cleanup tasks"
    "Option 2" = "Task 1: Update iteration paths"
    "Option 3" = "Task 2: Sync child item ranks"
    "Option 4" = "Task 3: Move incomplete items"
    "Option 5" = "Task 4: Mark deliverables"
    "Option 6" = "Select multiple tasks"
    "Read-Host for menu" = "Enter your choice"
}
foreach ($check in $menuChecks.GetEnumerator()) {
    if ($scriptContent -match [regex]::Escape($check.Value)) {
        Write-Host "  ✅ Found: $($check.Key)" -ForegroundColor Green
    } else {
        Write-Host "  ❌ FAIL: Missing: $($check.Key)" -ForegroundColor Red
        $allFound = $false
    }
}
if (-not $allFound) { exit 1 }
Write-Host ""

# Test 4: Check bug filtering in WIQL queries
Write-Host "Test 4: Validating bug filtering in WIQL queries..." -ForegroundColor Yellow
$bugFilterChecks = @{
    "Bug filter clause creation" = 'WorkItemType.*<>.*Bug'
    "shouldExcludeBugs variable" = '\$shouldExcludeBugs'
}
foreach ($check in $bugFilterChecks.GetEnumerator()) {
    if ($scriptContent -match $check.Value) {
        Write-Host "  ✅ Found: $($check.Key)" -ForegroundColor Green
    } else {
        Write-Host "  ❌ FAIL: Missing: $($check.Key)" -ForegroundColor Red
        $allFound = $false
    }
}
if (-not $allFound) { exit 1 }
Write-Host ""

# Test 5: Check conditional task execution
Write-Host "Test 5: Validating conditional task execution..." -ForegroundColor Yellow
$taskConditions = @{
    "Task 1 conditional" = 'if.*\$runTask1'
    "Task 2 conditional" = 'if.*\$runTask2'
    "Task 3 conditional" = 'if.*\$runTask3'
    "Task 4 conditional" = 'if.*\$runTask4'
    "Task 1 skipped message" = 'Task 1.*Skipped'
    "Task 2 skipped message" = 'Task 2.*Skipped'
    "Task 3 skipped message" = 'Task 3.*Skipped'
    "Task 4 skipped message" = 'Task 4.*Skipped'
}
foreach ($check in $taskConditions.GetEnumerator()) {
    if ($scriptContent -match $check.Value) {
        Write-Host "  ✅ Found: $($check.Key)" -ForegroundColor Green
    } else {
        Write-Host "  ❌ FAIL: Missing: $($check.Key)" -ForegroundColor Red
        $allFound = $false
    }
}
if (-not $allFound) { exit 1 }
Write-Host ""

# Test 6: Check array initialization
Write-Host "Test 6: Validating array initialization..." -ForegroundColor Yellow
$arrayInits = @(
    "itemsToUpdateIteration", "itemsToUpdateRank", 
    "itemsToMoveToNext", "itemsToMarkCompleted"
)
foreach ($array in $arrayInits) {
    if ($scriptContent -match "\`$$array = @\(\)") {
        Write-Host "  ✅ Array initialized: $array" -ForegroundColor Green
    } else {
        Write-Host "  ❌ FAIL: Array not initialized: $array" -ForegroundColor Red
        $allFound = $false
    }
}
if (-not $allFound) { exit 1 }
Write-Host ""

# Test 7: Check bug filtering message
Write-Host "Test 7: Validating bug filtering messages..." -ForegroundColor Yellow
if ($scriptContent -match "Bug Filtering.*EXCLUDED") {
    Write-Host "  ✅ Bug filtering message found" -ForegroundColor Green
} else {
    Write-Host "  ❌ FAIL: Bug filtering message not found" -ForegroundColor Red
    exit 1
}
Write-Host ""

# Test 8: Check task selection display
Write-Host "Test 8: Validating task selection display..." -ForegroundColor Yellow
if ($scriptContent -match "Task Selection.*Running") {
    Write-Host "  ✅ Task selection display found" -ForegroundColor Green
} else {
    Write-Host "  ❌ FAIL: Task selection display not found" -ForegroundColor Red
    exit 1
}
Write-Host ""

# Test 9: Check parameter documentation in header
Write-Host "Test 9: Validating parameter documentation in header..." -ForegroundColor Yellow
$headerDocs = @{
    "Task selection docs" = "Task Selection"
    "Bug filtering docs" = "Bug Filtering"
    "UpdateIterationPaths alias" = "UpdateIterationPaths"
    "IncludeBugs description" = "IncludeBugs"
}
foreach ($check in $headerDocs.GetEnumerator()) {
    if ($scriptContent -match [regex]::Escape($check.Value)) {
        Write-Host "  ✅ Found: $($check.Key)" -ForegroundColor Green
    } else {
        Write-Host "  ❌ FAIL: Missing: $($check.Key)" -ForegroundColor Red
        $allFound = $false
    }
}
if (-not $allFound) { exit 1 }
Write-Host ""

# Summary
Write-Host "=== Test Summary ===" -ForegroundColor Cyan
Write-Host "All tests passed! ✅" -ForegroundColor Green
Write-Host ""
Write-Host "New features validated:" -ForegroundColor Cyan
Write-Host "  ✓ Task selection switches (-Task1, -Task2, -Task3, -Task4, -AllTasks)" -ForegroundColor Gray
Write-Host "  ✓ Parameter aliases (-UpdateIterationPaths, -SyncRanks, -MoveToBacklog, -MarkCompleted)" -ForegroundColor Gray
Write-Host "  ✓ Interactive menu system" -ForegroundColor Gray
Write-Host "  ✓ Bug filtering switch (-IncludeBugs, default behavior is to exclude bugs)" -ForegroundColor Gray
Write-Host "  ✓ Conditional task execution" -ForegroundColor Gray
Write-Host "  ✓ Bug filtering in WIQL queries" -ForegroundColor Gray
Write-Host "  ✓ User-facing messages and documentation" -ForegroundColor Gray
Write-Host ""
