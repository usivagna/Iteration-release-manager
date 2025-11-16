# Cleanup-WorkItems.ps1
# Script to clean up work items at the end of an iteration
# Uses Azure DevOps REST API to update work items

param(
    [string]$ProjectName = "OS",
    [string]$TeamName = "ft_buses",
    [string]$Organization = "",
    [string]$PAT = "",
    [string]$OutputDir = ".\output",
    [switch]$UseCurrentIteration = $false,
    [string]$SpecificIteration = "",
    [switch]$DryRun = $false
)

# Configuration
$AreaPaths = @(
    "OS\Core\Connectivity Platform\Buses",
    "OS\Core\Connectivity Platform\Sensors"
)

Write-Host "=== Work Item Cleanup Script ===" -ForegroundColor Cyan
Write-Host "Project: $ProjectName" -ForegroundColor Yellow
Write-Host "Team: $TeamName" -ForegroundColor Yellow
if ($DryRun) {
    Write-Host "Mode: DRY RUN (no changes will be made)" -ForegroundColor Magenta
} else {
    Write-Host "Mode: LIVE (changes will be applied)" -ForegroundColor Yellow
}
Write-Host ""

# Create output directory if it doesn't exist
if (-not (Test-Path $OutputDir)) {
    New-Item -ItemType Directory -Path $OutputDir | Out-Null
    Write-Host "Created output directory: $OutputDir" -ForegroundColor Green
}

# Generate timestamp for output files
$timestamp = Get-Date -Format "yyyy-MM-dd_HHmmss"

# Get Azure DevOps credentials from environment or parameters
if ([string]::IsNullOrEmpty($Organization)) {
    $Organization = $env:AZURE_DEVOPS_ORG
    if ([string]::IsNullOrEmpty($Organization)) {
        Write-Host "ERROR: Azure DevOps organization not specified!" -ForegroundColor Red
        Write-Host "Please provide via -Organization parameter or set AZURE_DEVOPS_ORG environment variable" -ForegroundColor Yellow
        exit 1
    }
}

if ([string]::IsNullOrEmpty($PAT)) {
    $PAT = $env:AZURE_DEVOPS_PAT
    if ([string]::IsNullOrEmpty($PAT)) {
        Write-Host "ERROR: Azure DevOps Personal Access Token (PAT) not specified!" -ForegroundColor Red
        Write-Host "Please provide via -PAT parameter or set AZURE_DEVOPS_PAT environment variable" -ForegroundColor Yellow
        Write-Host ""
        Write-Host "To create a PAT:" -ForegroundColor Cyan
        Write-Host "1. Go to https://dev.azure.com/$Organization/_usersSettings/tokens" -ForegroundColor Gray
        Write-Host "2. Create a new token with 'Work Items (Read & Write)' scope" -ForegroundColor Gray
        Write-Host "3. Set it as environment variable: `$env:AZURE_DEVOPS_PAT = 'your-pat-here'" -ForegroundColor Gray
        exit 1
    }
}

# Create authorization header
$encodedPAT = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$PAT"))
$headers = @{
    "Authorization" = "Basic $encodedPAT"
    "Content-Type" = "application/json-patch+json"
}

$baseUrl = "https://dev.azure.com/$Organization"

# Function to invoke Azure DevOps REST API
function Invoke-ADORestAPI {
    param(
        [string]$Uri,
        [string]$Method = "GET",
        [object]$Body = $null,
        [hashtable]$CustomHeaders = $null
    )
    
    try {
        $requestHeaders = if ($CustomHeaders) { $CustomHeaders } else { $script:headers }
        
        $params = @{
            Uri = $Uri
            Method = $Method
            Headers = $requestHeaders
        }
        
        if ($Body) {
            if ($Method -eq "PATCH") {
                # For PATCH requests, body is already an array of operations
                $params.Body = ($Body | ConvertTo-Json -Depth 10 -Compress)
            } else {
                $params.Body = ($Body | ConvertTo-Json -Depth 10)
            }
        }
        
        $response = Invoke-RestMethod @params
        return $response
    }
    catch {
        Write-Host "ERROR calling API: $Uri" -ForegroundColor Red
        Write-Host $_.Exception.Message -ForegroundColor Red
        if ($_.ErrorDetails.Message) {
            Write-Host "Details: $($_.ErrorDetails.Message)" -ForegroundColor Red
        }
        return $null
    }
}

# Step 1: Get iteration information
Write-Host "Step 1: Querying iteration information..." -ForegroundColor Cyan

$iterationsUrl = "$baseUrl/$ProjectName/$TeamName/_apis/work/teamsettings/iterations?api-version=7.1-preview.1"
$iterations = Invoke-ADORestAPI -Uri $iterationsUrl

if (-not $iterations) {
    Write-Host "ERROR: Failed to retrieve iterations" -ForegroundColor Red
    exit 1
}

# Find the appropriate iteration
$targetIteration = $null
if ($SpecificIteration) {
    $targetIteration = $iterations.value | Where-Object { $_.name -eq $SpecificIteration }
    if (-not $targetIteration) {
        Write-Host "ERROR: Specified iteration '$SpecificIteration' not found" -ForegroundColor Red
        exit 1
    }
}
elseif ($UseCurrentIteration) {
    # Get current iteration
    $now = Get-Date
    $targetIteration = $iterations.value | Where-Object {
        $start = [DateTime]$_.attributes.startDate
        $end = [DateTime]$_.attributes.finishDate
        $now -ge $start -and $now -le $end
    } | Select-Object -First 1
}
else {
    # Get the most recently completed iteration
    $now = Get-Date
    $targetIteration = $iterations.value | Where-Object {
        $end = [DateTime]$_.attributes.finishDate
        $end -lt $now
    } | Sort-Object { [DateTime]$_.attributes.finishDate } -Descending | Select-Object -First 1
}

if (-not $targetIteration) {
    Write-Host "ERROR: No suitable iteration found" -ForegroundColor Red
    exit 1
}

$iterationInfo = @{
    iterationId = $targetIteration.id
    iterationName = $targetIteration.name
    iterationPath = $targetIteration.path
    startDate = $targetIteration.attributes.startDate
    endDate = $targetIteration.attributes.finishDate
    project = $ProjectName
    team = $TeamName
}

Write-Host "Found iteration: $($iterationInfo.iterationName)" -ForegroundColor Green
Write-Host "  Start: $($iterationInfo.startDate)" -ForegroundColor Gray
Write-Host "  End: $($iterationInfo.endDate)" -ForegroundColor Gray
Write-Host ""

# Step 2: Query work items that need cleanup
Write-Host "Step 2: Querying work items that need cleanup..." -ForegroundColor Cyan

# Task 1: Find closed items that should be assigned to this iteration
Write-Host "  Task 1: Finding closed items within iteration dates..." -ForegroundColor Yellow

$areaPathConditions = ($AreaPaths | ForEach-Object { "[System.AreaPath] UNDER '$_'" }) -join " OR "
$wiql = @"
SELECT [System.Id], [System.Title], [System.WorkItemType], [System.State], [System.AreaPath], [System.IterationPath], [Microsoft.VSTS.Common.ClosedDate], [Microsoft.VSTS.Scheduling.StoryPoints], [Microsoft.VSTS.Common.StackRank]
FROM WorkItems
WHERE ($areaPathConditions)
AND [System.State] IN ('Closed', 'Done', 'Completed')
AND [Microsoft.VSTS.Common.ClosedDate] >= '$($iterationInfo.startDate)'
AND [Microsoft.VSTS.Common.ClosedDate] <= '$($iterationInfo.endDate)'
AND [System.IterationPath] <> '$($iterationInfo.iterationPath)'
ORDER BY [System.Id]
"@

$wiqlQuery = @{
    query = $wiql
}

$wiqlUrl = "$baseUrl/$ProjectName/_apis/wit/wiql?api-version=7.1-preview.2"
$wiqlResult = Invoke-ADORestAPI -Uri $wiqlUrl -Method POST -Body $wiqlQuery

$itemsToUpdateIteration = @()
if ($wiqlResult -and $wiqlResult.workItems) {
    $workItemIds = $wiqlResult.workItems | ForEach-Object { $_.id }
    Write-Host "  Found $($workItemIds.Count) closed items with incorrect iteration path" -ForegroundColor Green
    
    # Get detailed work item information
    if ($workItemIds.Count -gt 0) {
        $idsParam = $workItemIds -join ","
        $workItemsUrl = "$baseUrl/$ProjectName/_apis/wit/workitems?ids=$idsParam&api-version=7.1-preview.3"
        $workItems = Invoke-ADORestAPI -Uri $workItemsUrl
        
        if ($workItems -and $workItems.value) {
            foreach ($wi in $workItems.value) {
                $itemsToUpdateIteration += @{
                    id = $wi.id
                    title = $wi.fields.'System.Title'
                    type = $wi.fields.'System.WorkItemType'
                    currentIterationPath = $wi.fields.'System.IterationPath'
                    closedDate = $wi.fields.'Microsoft.VSTS.Common.ClosedDate'
                }
            }
        }
    }
} else {
    Write-Host "  No closed items found that need iteration path update" -ForegroundColor Gray
}

# Task 2: Find child work items whose rank doesn't match parent rank
Write-Host "  Task 2: Finding child items with mismatched rank..." -ForegroundColor Yellow

$parentChildWiql = @"
SELECT [System.Id], [System.Title], [System.WorkItemType], [System.State], [System.Parent], [Microsoft.VSTS.Common.StackRank]
FROM WorkItemLinks
WHERE ([Source].[System.AreaPath] UNDER 'OS\Core\Connectivity Platform\Buses'
    OR [Source].[System.AreaPath] UNDER 'OS\Core\Connectivity Platform\Sensors')
AND ([Target].[System.AreaPath] UNDER 'OS\Core\Connectivity Platform\Buses'
    OR [Target].[System.AreaPath] UNDER 'OS\Core\Connectivity Platform\Sensors')
AND [System.Links.LinkType] = 'System.LinkTypes.Hierarchy-Forward'
AND [Target].[System.IterationPath] UNDER '$($iterationInfo.iterationPath)'
MODE (MustContain)
"@

$parentChildQuery = @{
    query = $parentChildWiql
}

$pcWiqlResult = Invoke-ADORestAPI -Uri $wiqlUrl -Method POST -Body $parentChildQuery

$itemsToUpdateRank = @()
if ($pcWiqlResult -and $pcWiqlResult.workItemRelations) {
    Write-Host "  Found $($pcWiqlResult.workItemRelations.Count) parent-child relationships" -ForegroundColor Gray
    
    # Get unique work item IDs (both parents and children)
    $allIds = @()
    $parentChildMap = @{}
    
    foreach ($relation in $pcWiqlResult.workItemRelations) {
        if ($relation.source -and $relation.target) {
            $sourceId = $relation.source.id
            $targetId = $relation.target.id
            
            $allIds += $sourceId
            $allIds += $targetId
            
            if (-not $parentChildMap.ContainsKey($targetId)) {
                $parentChildMap[$targetId] = @()
            }
            $parentChildMap[$targetId] += $sourceId
        }
    }
    
    $uniqueIds = $allIds | Select-Object -Unique
    
    if ($uniqueIds.Count -gt 0) {
        # Batch retrieve work items
        $batchSize = 200
        $allWorkItems = @{}
        
        for ($i = 0; $i -lt $uniqueIds.Count; $i += $batchSize) {
            $batchIds = $uniqueIds[$i..[Math]::Min($i + $batchSize - 1, $uniqueIds.Count - 1)]
            $idsParam = $batchIds -join ","
            
            $workItemsUrl = "$baseUrl/$ProjectName/_apis/wit/workitems?ids=$idsParam&api-version=7.1-preview.3"
            $workItemsBatch = Invoke-ADORestAPI -Uri $workItemsUrl
            
            if ($workItemsBatch -and $workItemsBatch.value) {
                foreach ($wi in $workItemsBatch.value) {
                    $allWorkItems[$wi.id] = $wi
                }
            }
        }
        
        # Compare ranks
        foreach ($childId in $parentChildMap.Keys) {
            $parentIds = $parentChildMap[$childId]
            
            if ($allWorkItems.ContainsKey($childId)) {
                $child = $allWorkItems[$childId]
                $childRank = $child.fields.'Microsoft.VSTS.Common.StackRank'
                
                foreach ($parentId in $parentIds) {
                    if ($allWorkItems.ContainsKey($parentId)) {
                        $parent = $allWorkItems[$parentId]
                        $parentRank = $parent.fields.'Microsoft.VSTS.Common.StackRank'
                        
                        if ($parentRank -and $childRank -ne $parentRank) {
                            $itemsToUpdateRank += @{
                                childId = $childId
                                childTitle = $child.fields.'System.Title'
                                childType = $child.fields.'System.WorkItemType'
                                currentRank = $childRank
                                parentId = $parentId
                                parentTitle = $parent.fields.'System.Title'
                                parentRank = $parentRank
                            }
                        }
                    }
                }
            }
        }
        
        Write-Host "  Found $($itemsToUpdateRank.Count) child items with mismatched rank" -ForegroundColor Green
    }
} else {
    Write-Host "  No parent-child relationships found" -ForegroundColor Gray
}

Write-Host ""

# Step 3: Apply changes
Write-Host "Step 3: Applying changes..." -ForegroundColor Cyan

$updatedCount = 0
$errorCount = 0
$changeLog = @()

# Update iteration paths
if ($itemsToUpdateIteration.Count -gt 0) {
    Write-Host "  Updating iteration paths for $($itemsToUpdateIteration.Count) items..." -ForegroundColor Yellow
    
    foreach ($item in $itemsToUpdateIteration) {
        Write-Host "    [$($item.id)] $($item.title)" -ForegroundColor Gray
        Write-Host "      Current: $($item.currentIterationPath)" -ForegroundColor Gray
        Write-Host "      New: $($iterationInfo.iterationPath)" -ForegroundColor Gray
        Write-Host "      Closed: $($item.closedDate)" -ForegroundColor Gray
        
        if (-not $DryRun) {
            # Create PATCH operation to update iteration path
            $patchDocument = @(
                @{
                    op = "add"
                    path = "/fields/System.IterationPath"
                    value = $iterationInfo.iterationPath
                }
            )
            
            $updateUrl = "$baseUrl/$ProjectName/_apis/wit/workitems/$($item.id)?api-version=7.1-preview.3"
            $result = Invoke-ADORestAPI -Uri $updateUrl -Method PATCH -Body $patchDocument
            
            if ($result) {
                Write-Host "      ✅ Updated successfully" -ForegroundColor Green
                $updatedCount++
                $changeLog += @{
                    id = $item.id
                    title = $item.title
                    type = "IterationPath"
                    oldValue = $item.currentIterationPath
                    newValue = $iterationInfo.iterationPath
                }
            } else {
                Write-Host "      ❌ Failed to update" -ForegroundColor Red
                $errorCount++
            }
        } else {
            Write-Host "      [DRY RUN] Would update iteration path" -ForegroundColor Magenta
        }
    }
}

# Update ranks
if ($itemsToUpdateRank.Count -gt 0) {
    Write-Host "  Updating ranks for $($itemsToUpdateRank.Count) items..." -ForegroundColor Yellow
    
    foreach ($item in $itemsToUpdateRank) {
        Write-Host "    Child [$($item.childId)] $($item.childTitle)" -ForegroundColor Gray
        Write-Host "      Parent: [$($item.parentId)] $($item.parentTitle)" -ForegroundColor Gray
        Write-Host "      Current rank: $($item.currentRank)" -ForegroundColor Gray
        Write-Host "      Parent rank: $($item.parentRank)" -ForegroundColor Gray
        
        if (-not $DryRun) {
            # Create PATCH operation to update rank
            $patchDocument = @(
                @{
                    op = "add"
                    path = "/fields/Microsoft.VSTS.Common.StackRank"
                    value = $item.parentRank
                }
            )
            
            $updateUrl = "$baseUrl/$ProjectName/_apis/wit/workitems/$($item.childId)?api-version=7.1-preview.3"
            $result = Invoke-ADORestAPI -Uri $updateUrl -Method PATCH -Body $patchDocument
            
            if ($result) {
                Write-Host "      ✅ Updated successfully" -ForegroundColor Green
                $updatedCount++
                $changeLog += @{
                    id = $item.childId
                    title = $item.childTitle
                    type = "StackRank"
                    oldValue = $item.currentRank
                    newValue = $item.parentRank
                    parentId = $item.parentId
                }
            } else {
                Write-Host "      ❌ Failed to update" -ForegroundColor Red
                $errorCount++
            }
        } else {
            Write-Host "      [DRY RUN] Would update rank" -ForegroundColor Magenta
        }
    }
}

Write-Host ""

# Step 4: Generate summary report
Write-Host "Step 4: Generating summary report..." -ForegroundColor Cyan

$reportPath = Join-Path $OutputDir "cleanup-report-$timestamp.json"
$report = @{
    timestamp = $timestamp
    iterationName = $iterationInfo.iterationName
    iterationPath = $iterationInfo.iterationPath
    startDate = $iterationInfo.startDate
    endDate = $iterationInfo.endDate
    dryRun = $DryRun
    summary = @{
        itemsToUpdateIteration = $itemsToUpdateIteration.Count
        itemsToUpdateRank = $itemsToUpdateRank.Count
        totalUpdated = $updatedCount
        errors = $errorCount
    }
    changes = $changeLog
}

$report | ConvertTo-Json -Depth 10 | Out-File $reportPath -Encoding utf8
Write-Host "Report saved to: $reportPath" -ForegroundColor Green
Write-Host ""

# Summary
Write-Host "=== Cleanup Summary ===" -ForegroundColor Cyan
Write-Host "Iteration: $($iterationInfo.iterationName)" -ForegroundColor Yellow
Write-Host "  Items to update iteration path: $($itemsToUpdateIteration.Count)" -ForegroundColor Gray
Write-Host "  Items to update rank: $($itemsToUpdateRank.Count)" -ForegroundColor Gray

if (-not $DryRun) {
    Write-Host "  Total updated: $updatedCount" -ForegroundColor Green
    Write-Host "  Errors: $errorCount" -ForegroundColor $(if ($errorCount -gt 0) { "Red" } else { "Gray" })
} else {
    Write-Host "  [DRY RUN MODE] No changes were made" -ForegroundColor Magenta
}

Write-Host ""
Write-Host "Cleanup completed!" -ForegroundColor Green
