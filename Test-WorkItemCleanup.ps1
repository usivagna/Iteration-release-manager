# Test-WorkItemCleanup.ps1
# Test script that simulates the cleanup workflow using example data

Write-Host "=== Testing Work Item Cleanup ===" -ForegroundColor Cyan
Write-Host ""

# Copy example files to output
Write-Host "Setting up test data..." -ForegroundColor Yellow
Copy-Item .\examples\cleanup-iteration-info.json .\output\ -Force
Copy-Item .\examples\cleanup-work-items.json .\output\ -Force
Copy-Item .\examples\cleanup-summary-example.json .\output\cleanup-summary-2025-09-16_103045.json -Force
Write-Host "Test data copied to output folder" -ForegroundColor Green
Write-Host ""

# Display what would be cleaned up
Write-Host "Test iteration info:" -ForegroundColor Cyan
$iterationInfo = Get-Content .\output\cleanup-iteration-info.json | ConvertFrom-Json
Write-Host "  Iteration: $($iterationInfo.iterationName)" -ForegroundColor White
Write-Host "  Path: $($iterationInfo.iterationPath)" -ForegroundColor White
Write-Host "  Period: $($iterationInfo.startDate) to $($iterationInfo.endDate)" -ForegroundColor White
Write-Host ""

Write-Host "Test work items to clean up:" -ForegroundColor Cyan
$workItems = Get-Content .\output\cleanup-work-items.json | ConvertFrom-Json
Write-Host "  Total work items: $($workItems.workItems.Count)" -ForegroundColor White
foreach ($wi in $workItems.workItems) {
    Write-Host "  - [$($wi.id)] $($wi.title)" -ForegroundColor White
    Write-Host "    Type: $($wi.type), State: $($wi.state)" -ForegroundColor Gray
    Write-Host "    Current Iteration: $(if ($wi.iterationPath) { $wi.iterationPath } else { '(not set)' })" -ForegroundColor Gray
    Write-Host "    Closed: $($wi.closedDate)" -ForegroundColor Gray
    
    # Determine what needs to be updated
    $needsUpdate = @()
    if (-not $wi.iterationPath -or $wi.iterationPath -ne $iterationInfo.iterationPath) {
        $needsUpdate += "Iteration Path"
    }
    if ($wi.parentId -and $wi.parentRank -and $wi.rank -ne $wi.parentRank) {
        $needsUpdate += "Rank (sync with parent)"
    }
    
    if ($needsUpdate.Count -gt 0) {
        Write-Host "    Needs update: $($needsUpdate -join ', ')" -ForegroundColor Yellow
    } else {
        Write-Host "    No updates needed" -ForegroundColor Green
    }
}
Write-Host ""

Write-Host "Test cleanup summary:" -ForegroundColor Cyan
$summary = Get-Content .\output\cleanup-summary-2025-09-16_103045.json | ConvertFrom-Json
Write-Host "  Total processed: $($summary.totalWorkItems)" -ForegroundColor White
Write-Host "  Updated: $($summary.updatedWorkItems)" -ForegroundColor White
Write-Host ""

if ($summary.updatedWorkItems -gt 0) {
    Write-Host "  Updates performed:" -ForegroundColor Cyan
    foreach ($update in $summary.updates) {
        Write-Host "    [$($update.workItemId)] $($update.title)" -ForegroundColor White
        Write-Host "      Fields updated: $($update.updatedFields -join ', ')" -ForegroundColor Gray
        if ($update.changes.iterationPath) {
            Write-Host "      Iteration Path: '$($update.changes.iterationPath.old)' -> '$($update.changes.iterationPath.new)'" -ForegroundColor Gray
        }
        if ($update.changes.rank) {
            Write-Host "      Rank: '$($update.changes.rank.old)' -> '$($update.changes.rank.new)'" -ForegroundColor Gray
        }
    }
}
Write-Host ""

Write-Host "=== Test Complete ===" -ForegroundColor Green
Write-Host ""
Write-Host "To run the real cleanup automation:" -ForegroundColor Yellow
Write-Host "  1. Ensure ADO MCP is connected" -ForegroundColor Gray
Write-Host "  2. Run: .\Cleanup-WorkItems.ps1" -ForegroundColor Gray
Write-Host "  3. Follow the prompts to perform actual cleanup operations" -ForegroundColor Gray
Write-Host ""
Write-Host "IMPORTANT: The real script will modify work items in Azure DevOps!" -ForegroundColor Red
Write-Host "Make sure you understand the changes before confirming the operations." -ForegroundColor Red
