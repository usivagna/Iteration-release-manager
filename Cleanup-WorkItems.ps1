# Cleanup-WorkItems.ps1
# Script to clean up work items at the end of an iteration
# Uses Azure DevOps REST API to update work items
#
# Features:
# - Dry Run Mode: Use -DryRun to preview changes without making any modifications
# - Automated Tagging: All modified items are tagged with "AutomatedCleanup" for tracking
# - Task 1: Update closed items to the iteration they were closed in
# - Task 2: Sync child item ranks with parent ranks
# - Task 3: Move incomplete items from past iterations to backlog
# - Task 4: Mark deliverables as completed when all child tasks are closed

param(
    [string]$ProjectName = "OS",
    [string]$TeamName = "ft_buses",
    [string]$Organization = "",
    [SecureString]$PAT = $null,
    [string]$OutputDir = ".\output",
    [switch]$UseCurrentIteration = $false,
    [string]$SpecificIteration = "",
    [switch]$DryRun = $false,
    [string[]]$AreaPaths = @()
)

# Tag to identify items modified by this script
$CleanupTag = "AutomatedCleanup"

Write-Host "=== Work Item Cleanup Script ===" -ForegroundColor Cyan
Write-Host ""
Write-Host "Collecting required inputs..." -ForegroundColor Cyan
Write-Host ""

# Step 0: Collect all required inputs at the start
Write-Host "--- Input Collection ---" -ForegroundColor Yellow
Write-Host ""

# Show execution mode
if ($DryRun) {
    Write-Host "Mode: DRY RUN (no changes will be made)" -ForegroundColor Magenta
} else {
    Write-Host "Mode: LIVE (changes will be applied)" -ForegroundColor Yellow
}
Write-Host ""

# Collect Azure DevOps Organization
if ([string]::IsNullOrEmpty($Organization)) {
    $Organization = $env:AZURE_DEVOPS_ORG
    if ([string]::IsNullOrEmpty($Organization)) {
        Write-Host "Azure DevOps Organization is required." -ForegroundColor Yellow
        $Organization = Read-Host "Enter Azure DevOps Organization name"
        if ([string]::IsNullOrEmpty($Organization)) {
            Write-Host ""
            Write-Host "ERROR: Azure DevOps organization is required!" -ForegroundColor Red
            exit 1
        }
    }
}
Write-Host "✓ Organization: $Organization" -ForegroundColor Green

# Collect Area Paths
if ($AreaPaths.Count -eq 0) {
    Write-Host ""
    Write-Host "Area Paths are required to query work items." -ForegroundColor Yellow
    Write-Host "Examples:" -ForegroundColor Gray
    Write-Host "  OS\Core\Connectivity Platform\Buses" -ForegroundColor Gray
    Write-Host "  OS\Core\Connectivity Platform\Sensors" -ForegroundColor Gray
    Write-Host ""
    Write-Host "Enter Area Paths (one per line, press Enter without input to finish):" -ForegroundColor Cyan
    
    $inputAreaPaths = @()
    do {
        $areaPath = Read-Host "  Area Path"
        if (-not [string]::IsNullOrWhiteSpace($areaPath)) {
            $trimmedPath = $areaPath.Trim()
            $inputAreaPaths += $trimmedPath
            Write-Host "    Added: $trimmedPath" -ForegroundColor Green
        }
    } while (-not [string]::IsNullOrWhiteSpace($areaPath))
    
    if ($inputAreaPaths.Count -eq 0) {
        Write-Host ""
        Write-Host "ERROR: At least one Area Path is required!" -ForegroundColor Red
        exit 1
    }
    
    $AreaPaths = $inputAreaPaths
}

Write-Host ""
Write-Host "✓ Area Paths configured:" -ForegroundColor Green
foreach ($path in $AreaPaths) {
    Write-Host "  - $path" -ForegroundColor Gray
}

Write-Host ""
Write-Host "--- Configuration Summary ---" -ForegroundColor Yellow
Write-Host "Project: $ProjectName" -ForegroundColor Gray
Write-Host "Team: $TeamName" -ForegroundColor Gray
Write-Host "Organization: $Organization" -ForegroundColor Gray
Write-Host "Area Paths: $($AreaPaths.Count) configured" -ForegroundColor Gray
Write-Host "Output Directory: $OutputDir" -ForegroundColor Gray
Write-Host ""

# Create output directory if it doesn't exist
if (-not (Test-Path $OutputDir)) {
    New-Item -ItemType Directory -Path $OutputDir | Out-Null
    Write-Host "Created output directory: $OutputDir" -ForegroundColor Green
}

# Generate timestamp for output files
$timestamp = Get-Date -Format "yyyy-MM-dd_HHmmss"

# Authentication: Try Azure CLI first, then fall back to PAT
Write-Host "--- Authentication ---" -ForegroundColor Yellow
$useAzureCliAuth = $false
$headers = @{
    "Content-Type" = "application/json-patch+json"
}

# Try to use Azure CLI authentication
try {
    $azAccount = az account show 2>$null | ConvertFrom-Json
    if ($azAccount) {
        Write-Host "Attempting Azure CLI authentication..." -ForegroundColor Cyan
        
        # Get Azure DevOps access token using Azure CLI
        $token = az account get-access-token --resource 499b84ac-1321-427f-aa17-267ca6975798 --query accessToken -o tsv 2>$null
        if ($token) {
            $headers["Authorization"] = "Bearer $token"
            $useAzureCliAuth = $true
            Write-Host "✓ Using Azure CLI authentication (logged in as $($azAccount.user.name))" -ForegroundColor Green
        } else {
            Write-Host "  Azure CLI authentication failed, falling back to PAT" -ForegroundColor Yellow
        }
    }
}
catch {
    # Azure CLI not available or not logged in, will try PAT
    Write-Host "  Azure CLI not available, falling back to PAT" -ForegroundColor Yellow
}

# Fall back to PAT authentication if Azure CLI is not available
if (-not $useAzureCliAuth) {
    # Check if PAT was provided as parameter
    if ($null -eq $PAT) {
        # Try to get PAT from environment variable as SecureString
        $patEnvValue = $env:AZURE_DEVOPS_PAT
        if (-not [string]::IsNullOrEmpty($patEnvValue)) {
            # Convert plain text PAT from environment to SecureString
            $PAT = ConvertTo-SecureString -String $patEnvValue -AsPlainText -Force
        }
    }
    
    if ($null -eq $PAT) {
        Write-Host ""
        Write-Host "Azure CLI authentication not available." -ForegroundColor Yellow
        Write-Host "Personal Access Token (PAT) is required." -ForegroundColor Yellow
        Write-Host ""
        Write-Host "To create a PAT:" -ForegroundColor Gray
        Write-Host "  1. Go to https://dev.azure.com/$Organization/_usersSettings/tokens" -ForegroundColor Gray
        Write-Host "  2. Create a new token with 'Work Items (Read & Write)' scope" -ForegroundColor Gray
        Write-Host ""
        Write-Host "Enter your Personal Access Token:" -ForegroundColor Cyan
        $PAT = Read-Host -AsSecureString
        
        if ($null -eq $PAT) {
            Write-Host ""
            Write-Host "ERROR: Authentication is required to proceed!" -ForegroundColor Red
            Write-Host ""
            Write-Host "Please either:" -ForegroundColor Yellow
            Write-Host "  1. Run 'az login' to use Azure CLI authentication, or" -ForegroundColor Gray
            Write-Host "  2. Provide a PAT when prompted, or" -ForegroundColor Gray
            Write-Host "  3. Set `$env:AZURE_DEVOPS_PAT environment variable" -ForegroundColor Gray
            exit 1
        }
    }
    
    Write-Host "✓ Using Personal Access Token (PAT) authentication" -ForegroundColor Green
    
    # Convert SecureString to plain text for encoding (only in memory, never logged)
    $BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($PAT)
    try {
        $plainPAT = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)
        $encodedPAT = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$plainPAT"))
        $headers["Authorization"] = "Basic $encodedPAT"
    }
    finally {
        # Immediately clear the plain text PAT from memory
        [System.Runtime.InteropServices.Marshal]::ZeroFreeBSTR($BSTR)
        if ($plainPAT) {
            $plainPAT = $null
        }
    }
}

Write-Host ""
Write-Host "All inputs collected successfully!" -ForegroundColor Green
Write-Host ""
Write-Host "=== Starting Work Item Cleanup ===" -ForegroundColor Cyan
Write-Host ""

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
        $requestHeaders = if ($CustomHeaders) { $CustomHeaders.Clone() } else { $script:headers.Clone() }
        
        $params = @{
            Uri = $Uri
            Method = $Method
            Headers = $requestHeaders
        }
        
        if ($Body) {
            if ($Method -eq "PATCH") {
                # For PATCH requests, body is already an array of operations
                $params.Body = ($Body | ConvertTo-Json -Depth 10 -Compress)
                $requestHeaders["Content-Type"] = "application/json-patch+json"
            } else {
                $params.Body = ($Body | ConvertTo-Json -Depth 10)
                $requestHeaders["Content-Type"] = "application/json"
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

# Use the OS backlog iteration for moving incomplete items
$backlogIterationInfo = @{
    iterationPath = "OS"
    iterationName = "OS"
}
Write-Host "Backlog iteration for incomplete items: OS" -ForegroundColor Green

Write-Host ""

Write-Host ""

# Step 2: Query work items that need cleanup
Write-Host "Step 2: Querying work items that need cleanup..." -ForegroundColor Cyan

# Task 1: Find closed items that should be assigned to correct iteration (all past iterations)
Write-Host "  Task 1: Finding closed items with incorrect iteration paths..." -ForegroundColor Yellow

$areaPathConditions = ($AreaPaths | ForEach-Object { "[System.AreaPath] UNDER '$_'" }) -join " OR "
$wiql = @"
SELECT [System.Id], [System.Title], [System.WorkItemType], [System.State], [System.AreaPath], [System.IterationPath], [Microsoft.VSTS.Common.ClosedDate], [Microsoft.VSTS.Scheduling.StoryPoints], [Microsoft.VSTS.Common.StackRank]
FROM WorkItems
WHERE ($areaPathConditions)
AND [System.State] IN ('Closed', 'Done', 'Completed')
AND [Microsoft.VSTS.Common.ClosedDate] <> ''
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
    Write-Host "  Found $($workItemIds.Count) closed items to check" -ForegroundColor Gray
    
    # Get detailed work item information in batches to avoid URL length limits
    if ($workItemIds.Count -gt 0) {
        $batchSize = 200
        for ($i = 0; $i -lt $workItemIds.Count; $i += $batchSize) {
            $batchEnd = [Math]::Min($i + $batchSize - 1, $workItemIds.Count - 1)
            $batchIds = $workItemIds[$i..$batchEnd]
            $idsParam = $batchIds -join ","
            
            Write-Host "  Fetching work items batch $([Math]::Floor($i/$batchSize) + 1) of $([Math]::Ceiling($workItemIds.Count/$batchSize))..." -ForegroundColor Gray
            $workItemsUrl = "$baseUrl/$ProjectName/_apis/wit/workitems?ids=$idsParam&api-version=7.1-preview.3"
            $workItems = Invoke-ADORestAPI -Uri $workItemsUrl
            
            if ($workItems -and $workItems.value) {
                foreach ($wi in $workItems.value) {
                    $closedDate = $wi.fields.'Microsoft.VSTS.Common.ClosedDate'
                    $currentIterPath = $wi.fields.'System.IterationPath'
                    
                    if ($closedDate) {
                        try {
                            $closedDateTime = [DateTime]$closedDate
                            
                            # Find the iteration that contains the closed date
                            $correctIteration = $iterations.value | Where-Object {
                                $iterStart = [DateTime]$_.attributes.startDate
                                $iterEnd = [DateTime]$_.attributes.finishDate
                                $closedDateTime -ge $iterStart -and $closedDateTime -le $iterEnd
                            } | Select-Object -First 1
                            
                            # If we found a matching iteration and it's different from current, add to update list
                            if ($correctIteration -and $correctIteration.path -ne $currentIterPath) {
                                $itemsToUpdateIteration += @{
                                    id = $wi.id
                                    title = $wi.fields.'System.Title'
                                    type = $wi.fields.'System.WorkItemType'
                                    currentIterationPath = $currentIterPath
                                    correctIterationPath = $correctIteration.path
                                    correctIterationName = $correctIteration.name
                                    closedDate = $closedDate
                                    tags = $wi.fields.'System.Tags'
                                }
                            }
                        } catch {
                            Write-Verbose "Could not parse closed date for work item $($wi.id): $closedDate"
                        }
                    }
                }
            }
        }
    }
    
    Write-Host "  Found $($itemsToUpdateIteration.Count) closed items with incorrect iteration path" -ForegroundColor Green
} else {
    Write-Host "  No closed items found that need iteration path update" -ForegroundColor Gray
}

# Task 2: Find child work items whose rank doesn't match parent rank
Write-Host "  Task 2: Finding child items with mismatched rank..." -ForegroundColor Yellow

$sourceAreaPathConditions = ($AreaPaths | ForEach-Object { "([Source].[System.AreaPath] UNDER '$_')" }) -join "`n    OR "
$targetAreaPathConditions = ($AreaPaths | ForEach-Object { "([Target].[System.AreaPath] UNDER '$_')" }) -join "`n    OR "

$parentChildWiql = @"
SELECT [System.Id], [System.Title], [System.WorkItemType], [System.State], [System.Parent], [Microsoft.VSTS.Common.StackRank]
FROM WorkItemLinks
WHERE ($sourceAreaPathConditions)
AND ($targetAreaPathConditions)
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
                                tags = $child.fields.'System.Tags'
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

# Task 3: Find incomplete items in past iterations
Write-Host "  Task 3: Finding incomplete items in past iterations..." -ForegroundColor Yellow

$itemsToMoveToNext = @()
if ($backlogIterationInfo) {
    # Query for items that are not completed and have an iteration path set
    # We'll filter for past iterations after getting the results
    # Note: We don't exclude any specific iteration path in the query since we'll filter by end date
    $incompleteWiql = @"
SELECT [System.Id], [System.Title], [System.WorkItemType], [System.State], [System.AreaPath], [System.IterationPath], [System.Tags]
FROM WorkItems
WHERE ($areaPathConditions)
AND [System.State] NOT IN ('Closed', 'Done', 'Completed', 'Removed')
ORDER BY [System.IterationPath], [System.Id]
"@

    $incompleteQuery = @{
        query = $incompleteWiql
    }

    $incompleteResult = Invoke-ADORestAPI -Uri $wiqlUrl -Method POST -Body $incompleteQuery
    
    if ($incompleteResult -and $incompleteResult.workItems) {
        $incompleteIds = $incompleteResult.workItems | ForEach-Object { $_.id }
        Write-Host "  Found $($incompleteIds.Count) potentially incomplete items with iteration paths set" -ForegroundColor Gray
        
        # Get detailed work item information in batches
        if ($incompleteIds.Count -gt 0) {
            $batchSize = 200
            for ($i = 0; $i -lt $incompleteIds.Count; $i += $batchSize) {
                $batchEnd = [Math]::Min($i + $batchSize - 1, $incompleteIds.Count - 1)
                $batchIds = $incompleteIds[$i..$batchEnd]
                $idsParam = $batchIds -join ","
                
                $workItemsUrl = "$baseUrl/$ProjectName/_apis/wit/workitems?ids=$idsParam&api-version=7.1-preview.3"
                $workItems = Invoke-ADORestAPI -Uri $workItemsUrl
                
                if ($workItems -and $workItems.value) {
                    foreach ($wi in $workItems.value) {
                        $wiIterPath = $wi.fields.'System.IterationPath'
                        $wiIterEnd = $null
                        
                        # Find the iteration end date for this work item's iteration
                        $wiIter = $iterations.value | Where-Object { $_.path -eq $wiIterPath } | Select-Object -First 1
                        if ($wiIter -and $wiIter.attributes.finishDate) {
                            try {
                                $wiIterEnd = [DateTime]$wiIter.attributes.finishDate
                                
                                # Only include if the iteration has ended (in the past)
                                if ($wiIterEnd -lt $now) {
                                $itemsToMoveToNext += @{
                                    id = $wi.id
                                    title = $wi.fields.'System.Title'
                                    type = $wi.fields.'System.WorkItemType'
                                    state = $wi.fields.'System.State'
                                    currentIterationPath = $wiIterPath
                                    iterationEndDate = $wiIterEnd
                                    tags = $wi.fields.'System.Tags'
                                }
                            }
                            } catch {
                                # Skip items where date parsing fails
                                Write-Verbose "Could not parse end date for iteration: $wiIterPath"
                            }
                        } else {
                            # Skip items in iterations without an end date (likely backlog or undefined iterations)
                            Write-Verbose "Skipping item $($wi.id) - iteration has no end date: $wiIterPath"
                        }
                    }
                }
            }
        }
        
        Write-Host "  Found $($itemsToMoveToNext.Count) incomplete items that need to be moved" -ForegroundColor Green
    } else {
        Write-Host "  No incomplete items found in past iterations" -ForegroundColor Gray
    }
} else {
    Write-Host "  No backlog iteration found - skipping incomplete items check" -ForegroundColor Gray
}

# Task 4: Find deliverables that should be marked as Completed
Write-Host "  Task 4: Finding Started deliverables with all closed tasks (all iterations)..." -ForegroundColor Yellow

$itemsToMarkCompleted = @()

# Query for all deliverables in any iteration that are in "Started" state
$deliverablesWiql = @"
SELECT [System.Id], [System.Title], [System.WorkItemType], [System.State], [System.AreaPath], [System.IterationPath]
FROM WorkItems
WHERE ($areaPathConditions)
AND [System.WorkItemType] IN ('Feature', 'Epic', 'User Story', 'Deliverable')
AND [System.State] IN ('Active', 'In Progress', 'Started', 'Committed')
ORDER BY [System.Id]
"@

$deliverablesQuery = @{
    query = $deliverablesWiql
}

$deliverablesResult = Invoke-ADORestAPI -Uri $wiqlUrl -Method POST -Body $deliverablesQuery

if ($deliverablesResult -and $deliverablesResult.workItems) {
    $deliverableIds = $deliverablesResult.workItems | ForEach-Object { $_.id }
    Write-Host "  Found $($deliverableIds.Count) potential deliverables in Started state" -ForegroundColor Gray
    
    # Get detailed work item information with relations
    if ($deliverableIds.Count -gt 0) {
        $batchSize = 200
        for ($i = 0; $i -lt $deliverableIds.Count; $i += $batchSize) {
            $batchEnd = [Math]::Min($i + $batchSize - 1, $deliverableIds.Count - 1)
            $batchIds = $deliverableIds[$i..$batchEnd]
            $idsParam = $batchIds -join ","
            
            Write-Host "  Fetching deliverables batch $([Math]::Floor($i/$batchSize) + 1) of $([Math]::Ceiling($deliverableIds.Count/$batchSize))..." -ForegroundColor Gray
            $workItemsUrl = "$baseUrl/$ProjectName/_apis/wit/workitems?ids=$idsParam&`$expand=relations&api-version=7.1-preview.3"
            $workItems = Invoke-ADORestAPI -Uri $workItemsUrl
            
            if ($workItems -and $workItems.value) {
                foreach ($wi in $workItems.value) {
                    # Get all child work items (tasks)
                    $childIds = @()
                    if ($wi.relations) {
                        foreach ($relation in $wi.relations) {
                            # Check for child relationships
                            if ($relation.rel -eq "System.LinkTypes.Hierarchy-Forward") {
                                # Extract ID from URL
                                if ($relation.url -match '/(\d+)$') {
                                    $childIds += [int]$matches[1]
                                }
                            }
                        }
                    }
                    
                    # If there are child items, check if all are closed
                    if ($childIds.Count -gt 0) {
                        # Get child work item details in batches if needed
                        $allChildrenClosed = $true
                        $childStates = @()
                        
                        $childBatchSize = 200
                        for ($j = 0; $j -lt $childIds.Count; $j += $childBatchSize) {
                            $childBatchEnd = [Math]::Min($j + $childBatchSize - 1, $childIds.Count - 1)
                            $childBatchIds = $childIds[$j..$childBatchEnd]
                            $childIdsParam = $childBatchIds -join ","
                            $childWorkItemsUrl = "$baseUrl/$ProjectName/_apis/wit/workitems?ids=$childIdsParam&api-version=7.1-preview.3"
                            $childWorkItems = Invoke-ADORestAPI -Uri $childWorkItemsUrl
                            
                            if ($childWorkItems -and $childWorkItems.value) {
                                foreach ($child in $childWorkItems.value) {
                                    $childState = $child.fields.'System.State'
                                    $childStates += "$($child.id): $childState"
                                    
                                    # Check if child is not in a closed state
                                    if ($childState -notin @('Closed', 'Done', 'Completed', 'Removed')) {
                                        $allChildrenClosed = $false
                                    }
                                }
                            }
                        }
                        
                        # If all children are closed, this deliverable should be marked as Completed
                        if ($allChildrenClosed) {
                            $itemsToMarkCompleted += @{
                                id = $wi.id
                                title = $wi.fields.'System.Title'
                                type = $wi.fields.'System.WorkItemType'
                                state = $wi.fields.'System.State'
                                iterationPath = $wi.fields.'System.IterationPath'
                                childCount = $childIds.Count
                                childStates = $childStates -join "; "
                                tags = $wi.fields.'System.Tags'
                            }
                        }
                    }
                }
            }
        }
    }
    
    Write-Host "  Found $($itemsToMarkCompleted.Count) deliverables to mark as Completed (across all iterations)" -ForegroundColor Green
} else {
    Write-Host "  No Started deliverables found in iteration" -ForegroundColor Gray
}

Write-Host ""

# User confirmation before applying changes (unless in DryRun mode)
if (-not $DryRun) {
    $totalChanges = $itemsToUpdateIteration.Count + $itemsToUpdateRank.Count + $itemsToMoveToNext.Count + $itemsToMarkCompleted.Count
    
    if ($totalChanges -gt 0) {
        Write-Host "=== CONFIRMATION REQUIRED ===" -ForegroundColor Yellow
        Write-Host "You are about to make changes to Azure DevOps work items:" -ForegroundColor Yellow
        Write-Host "  - $($itemsToUpdateIteration.Count) items will have iteration path updated" -ForegroundColor Gray
        Write-Host "  - $($itemsToUpdateRank.Count) items will have rank updated" -ForegroundColor Gray
        Write-Host "  - $($itemsToMoveToNext.Count) incomplete items will be moved to backlog" -ForegroundColor Gray
        Write-Host "  - $($itemsToMarkCompleted.Count) deliverables will be marked as Completed" -ForegroundColor Gray
        Write-Host "  - Total: $totalChanges work items will be modified" -ForegroundColor Gray
        Write-Host ""
        Write-Host "Do you want to proceed with these changes? (Y/N): " -ForegroundColor Cyan -NoNewline
        
        $confirmation = Read-Host
        
        if ($confirmation -ne 'Y' -and $confirmation -ne 'y') {
            Write-Host ""
            Write-Host "Operation cancelled by user." -ForegroundColor Yellow
            Write-Host "No changes were made to Azure DevOps." -ForegroundColor Yellow
            Write-Host ""
            Write-Host "Tip: Use -DryRun to preview changes without confirmation prompts." -ForegroundColor Gray
            exit 0
        }
        
        Write-Host ""
        Write-Host "Proceeding with changes..." -ForegroundColor Green
        Write-Host ""
    }
}

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
        Write-Host "      Correct: $($item.correctIterationPath) ($($item.correctIterationName))" -ForegroundColor Gray
        Write-Host "      Closed: $($item.closedDate)" -ForegroundColor Gray
        
        if (-not $DryRun) {
            # Build tag value - append to existing tags if any
            $currentTags = $item.tags
            $newTags = if ([string]::IsNullOrEmpty($currentTags)) {
                $CleanupTag
            } else {
                "$currentTags; $CleanupTag"
            }
            
            # Create PATCH operation to update iteration path, add tag, and add comment
            $patchDocument = @(
                @{
                    op = "add"
                    path = "/fields/System.IterationPath"
                    value = $item.correctIterationPath
                },
                @{
                    op = "add"
                    path = "/fields/System.Tags"
                    value = $newTags
                },
                @{
                    op = "add"
                    path = "/fields/System.History"
                    value = "Ugan's AI agent updated this closed item to match the iteration it was closed in."
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
                    newValue = $item.correctIterationPath
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
            # Build tag value - append to existing tags if any
            $currentTags = $item.tags
            $newTags = if ([string]::IsNullOrEmpty($currentTags)) {
                $CleanupTag
            } else {
                "$currentTags; $CleanupTag"
            }
            
            # Create PATCH operation to update rank, add tag, and add comment
            $patchDocument = @(
                @{
                    op = "add"
                    path = "/fields/Microsoft.VSTS.Common.StackRank"
                    value = $item.parentRank
                },
                @{
                    op = "add"
                    path = "/fields/System.Tags"
                    value = $newTags
                },
                @{
                    op = "add"
                    path = "/fields/System.History"
                    value = "Ugan's AI agent updated this closed item to match the iteration it was closed in."
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

# Move incomplete items to backlog
if ($itemsToMoveToNext.Count -gt 0 -and $backlogIterationInfo) {
    Write-Host "  Moving incomplete items to backlog ($($backlogIterationInfo.iterationName))..." -ForegroundColor Yellow
    
    foreach ($item in $itemsToMoveToNext) {
        Write-Host "    [$($item.id)] $($item.title)" -ForegroundColor Gray
        Write-Host "      Type: $($item.type) | State: $($item.state)" -ForegroundColor Gray
        Write-Host "      Current: $($item.currentIterationPath)" -ForegroundColor Gray
        Write-Host "      New: $($backlogIterationInfo.iterationPath)" -ForegroundColor Gray
        Write-Host "      Iteration ended: $($item.iterationEndDate)" -ForegroundColor Gray
        
        if (-not $DryRun) {
            # Build tag value - append to existing tags if any
            $currentTags = $item.tags
            $newTags = if ([string]::IsNullOrEmpty($currentTags)) {
                $CleanupTag
            } else {
                "$currentTags; $CleanupTag"
            }
            
            # Create PATCH operation to move to next iteration, add tag, and add comment
            $patchDocument = @(
                @{
                    op = "add"
                    path = "/fields/System.IterationPath"
                    value = $backlogIterationInfo.iterationPath
                },
                @{
                    op = "add"
                    path = "/fields/System.Tags"
                    value = $newTags
                },
                @{
                    op = "add"
                    path = "/fields/System.History"
                    value = "Ugan's AI agent moved this incomplete item from past iteration to backlog for triage."
                }
            )
            
            $updateUrl = "$baseUrl/$ProjectName/_apis/wit/workitems/$($item.id)?api-version=7.1-preview.3"
            $result = Invoke-ADORestAPI -Uri $updateUrl -Method PATCH -Body $patchDocument
            
            if ($result) {
                Write-Host "      ✅ Moved successfully" -ForegroundColor Green
                $updatedCount++
                $changeLog += @{
                    id = $item.id
                    title = $item.title
                    type = "MoveToBacklog"
                    oldValue = $item.currentIterationPath
                    newValue = $backlogIterationInfo.iterationPath
                    state = $item.state
                    workItemType = $item.type
                }
            } else {
                Write-Host "      ❌ Failed to move" -ForegroundColor Red
                $errorCount++
            }
        } else {
            Write-Host "      [DRY RUN] Would move to backlog" -ForegroundColor Magenta
        }
    }
}

# Mark deliverables with all closed tasks as Completed
if ($itemsToMarkCompleted.Count -gt 0) {
    Write-Host "  Marking deliverables with all closed tasks as Completed..." -ForegroundColor Yellow
    
    foreach ($item in $itemsToMarkCompleted) {
        Write-Host "    [$($item.id)] $($item.title)" -ForegroundColor Gray
        Write-Host "      Type: $($item.type) | State: $($item.state)" -ForegroundColor Gray
        Write-Host "      Iteration: $($item.iterationPath)" -ForegroundColor Gray
        Write-Host "      Children: $($item.childCount) (all closed)" -ForegroundColor Gray
        
        if (-not $DryRun) {
            # Build tag value - append to existing tags if any
            $currentTags = $item.tags
            $newTags = if ([string]::IsNullOrEmpty($currentTags)) {
                $CleanupTag
            } else {
                "$currentTags; $CleanupTag"
            }
            
            # Create PATCH operation to mark as Completed, add tag, and add comment
            $completionDate = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
            $patchDocument = @(
                @{
                    op = "add"
                    path = "/fields/System.State"
                    value = "Completed"
                },
                @{
                    op = "add"
                    path = "/fields/System.Tags"
                    value = $newTags
                },
                @{
                    op = "add"
                    path = "/fields/System.History"
                    value = "Ugan's AI agent marked this deliverable as Completed on $completionDate because all $($item.childCount) linked tasks are now closed."
                },
                @{
                    op = "add"
                    path = "/fields/OSG.Partner.PartnerNewComments"
                    value = "Automated completion - all child tasks closed"
                }
            )
            
            $updateUrl = "$baseUrl/$ProjectName/_apis/wit/workitems/$($item.id)?api-version=7.1-preview.3"
            $result = Invoke-ADORestAPI -Uri $updateUrl -Method PATCH -Body $patchDocument
            
            if ($result) {
                Write-Host "      ✅ Marked as Completed successfully" -ForegroundColor Green
                $updatedCount++
                $changeLog += @{
                    id = $item.id
                    title = $item.title
                    type = "MarkAsCompleted"
                    oldValue = $item.state
                    newValue = "Completed"
                    workItemType = $item.type
                    iterationPath = $item.iterationPath
                    childCount = $item.childCount
                }
            } else {
                Write-Host "      ❌ Failed to mark as Completed" -ForegroundColor Red
                $errorCount++
            }
        } else {
            Write-Host "      [DRY RUN] Would mark as Completed" -ForegroundColor Magenta
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
    nextIterationName = if ($backlogIterationInfo) { $backlogIterationInfo.iterationName } else { $null }
    nextIterationPath = if ($backlogIterationInfo) { $backlogIterationInfo.iterationPath } else { $null }
    dryRun = $DryRun
    summary = @{
        itemsToUpdateIteration = $itemsToUpdateIteration.Count
        itemsToUpdateRank = $itemsToUpdateRank.Count
        itemsToMoveToNext = $itemsToMoveToNext.Count
        itemsToMarkCompleted = $itemsToMarkCompleted.Count
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
Write-Host "  Items to move to backlog: $($itemsToMoveToNext.Count)" -ForegroundColor Gray
Write-Host "  Deliverables to mark as Completed: $($itemsToMarkCompleted.Count)" -ForegroundColor Gray
if ($backlogIterationInfo) {
    Write-Host "  Backlog iteration: $($backlogIterationInfo.iterationName)" -ForegroundColor Gray
}

if (-not $DryRun) {
    Write-Host "  Total updated: $updatedCount" -ForegroundColor Green
    Write-Host "  Errors: $errorCount" -ForegroundColor $(if ($errorCount -gt 0) { "Red" } else { "Gray" })
} else {
    Write-Host "  [DRY RUN MODE] No changes were made" -ForegroundColor Magenta
}

Write-Host ""
Write-Host "Cleanup completed!" -ForegroundColor Green
