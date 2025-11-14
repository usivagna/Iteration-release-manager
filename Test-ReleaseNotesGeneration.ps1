# Test-ReleaseNotesGeneration.ps1
# Test script that simulates the complete workflow using example data

Write-Host "=== Testing Release Notes Generator ===" -ForegroundColor Cyan
Write-Host ""

# Copy example files to output
Write-Host "Setting up test data..." -ForegroundColor Yellow
Copy-Item .\examples\iteration-info.json .\output\ -Force
Copy-Item .\examples\work-items-with-prs.json .\output\ -Force
Write-Host "Test data copied to output folder" -ForegroundColor Green
Write-Host ""

# Display what would be generated
Write-Host "Test iteration info:" -ForegroundColor Cyan
$iterationInfo = Get-Content .\output\iteration-info.json | ConvertFrom-Json
Write-Host "  Iteration: $($iterationInfo.iterationName)" -ForegroundColor White
Write-Host "  Period: $($iterationInfo.startDate) to $($iterationInfo.endDate)" -ForegroundColor White
Write-Host ""

Write-Host "Test work items:" -ForegroundColor Cyan
$workItems = Get-Content .\output\work-items-with-prs.json | ConvertFrom-Json
Write-Host "  Total work items: $($workItems.workItems.Count)" -ForegroundColor White
foreach ($wi in $workItems.workItems) {
    Write-Host "  - [$($wi.id)] $($wi.title)" -ForegroundColor White
    Write-Host "    Type: $($wi.type), Area: $($wi.areaPath)" -ForegroundColor Gray
    Write-Host "    PRs: $($wi.pullRequests.Count)" -ForegroundColor Gray
}
Write-Host ""

Write-Host "Example output files:" -ForegroundColor Cyan
Write-Host "  View examples/internal-summary-example.md for internal summary format" -ForegroundColor White
Write-Host "  View examples/insider-release-notes-example.md for release notes format" -ForegroundColor White
Write-Host ""

Write-Host "=== Test Complete ===" -ForegroundColor Green
Write-Host ""
Write-Host "To run the real automation:" -ForegroundColor Yellow
Write-Host "  1. Ensure ADO MCP is connected" -ForegroundColor Gray
Write-Host "  2. Run: .\Generate-ReleaseNotes.ps1" -ForegroundColor Gray
Write-Host "  3. Follow the prompts to generate actual release notes" -ForegroundColor Gray
