# Generate-PRSummary.ps1
# Script to generate a summary of all Pull Requests linked to a Work Item and its descendants
# Generates both a Markdown table and a JSON file with details

param(
    [string]$ProjectName = "OS",
    [int]$RootWorkItemId = 0,
    [string]$Organization = "",
    [SecureString]$PAT = $null,
    [string]$OutputDir = "./output"
)

Write-Host "=== Pull Request Summary Generator ===" -ForegroundColor Cyan
Write-Host ""
Write-Host "Collecting required inputs..." -ForegroundColor Cyan
Write-Host ""

# Step 0: Input Collection
Write-Host "--- Input Collection ---" -ForegroundColor Yellow
Write-Host ""

# Collect Azure DevOps Organization
if ([string]::IsNullOrEmpty($Organization)) {
    $Organization = $env:AZURE_DEVOPS_ORG
    if ([string]::IsNullOrEmpty($Organization)) {
        Write-Host "Azure DevOps Organization is required." -ForegroundColor Yellow
        $Organization = Read-Host "Enter Azure DevOps Organization name"
        if ([string]::IsNullOrEmpty($Organization)) {
            Write-Host ""; Write-Host "ERROR: Azure DevOps organization is required!" -ForegroundColor Red; exit 1
        }
    }
}
Write-Host "Organization: $Organization" -ForegroundColor Green

# Collect Root Work Item ID if not provided
if ($RootWorkItemId -eq 0) {
    Write-Host "Root Work Item ID is required." -ForegroundColor Yellow
    do {
        $inputIds = Read-Host "Enter the Root Work Item ID"
        if ([int]::TryParse($inputIds, [ref]$RootWorkItemId) -and $RootWorkItemId -gt 0) {
            # ok
        } else {
            Write-Host "Valid Work Item ID is required." -ForegroundColor Red
            $RootWorkItemId = 0
        }
    } while ($RootWorkItemId -eq 0)
}
Write-Host "Root Work Item ID: $RootWorkItemId" -ForegroundColor Green

# Create output directory
if (-not (Test-Path $OutputDir)) {
    New-Item -ItemType Directory -Path $OutputDir | Out-Null
    Write-Host "Created output directory: $OutputDir" -ForegroundColor Green
}

# Generate timestamp for output files
$timestamp = Get-Date -Format "yyyy-MM-dd_HHmmss"
Write-Host ("Output timestamp: {0}" -f $timestamp) -ForegroundColor DarkGray

# Authentication: Try Azure CLI first, then fall back to PAT
Write-Host "--- Authentication ---" -ForegroundColor Yellow
$useAzureCliAuth = $false
$headers = @{ "Content-Type" = "application/json" }

# Try to use Azure CLI authentication
try {
    $azAccount = az account show 2>$null | ConvertFrom-Json
    if ($null -ne $azAccount) {
        Write-Host "Attempting Azure CLI authentication..." -ForegroundColor Cyan
        $token = az account get-access-token --resource 499b84ac-1321-427f-aa17-267ca6975798 --query accessToken -o tsv 2>$null
        if (-not [string]::IsNullOrEmpty($token)) {
            $headers["Authorization"] = "Bearer $token"
            $useAzureCliAuth = $true
            Write-Host ("Using Azure CLI authentication (logged in as {0})" -f $azAccount.user.name) -ForegroundColor Green
        } else {
            Write-Host "  Azure CLI authentication failed, falling back to PAT" -ForegroundColor Yellow
        }
    }
}
catch {
    Write-Host "  Azure CLI not available, falling back to PAT" -ForegroundColor Yellow
}

# Fall back to PAT authentication if Azure CLI is not available
if (-not $useAzureCliAuth) {
    if ($null -eq $PAT) {
        # Prefer the Azure CLI DevOps login token if present (set by 'az devops login')
        $patEnvValue = $env:AZURE_DEVOPS_EXT_PAT
        if ([string]::IsNullOrEmpty($patEnvValue)) {
            # Fallback to generic env var used in other scripts
            $patEnvValue = $env:AZURE_DEVOPS_PAT
        }

        if (-not [string]::IsNullOrEmpty($patEnvValue)) {
            $PAT = ConvertTo-SecureString -String $patEnvValue -AsPlainText -Force
        }
    }

    if ($null -eq $PAT) {
        Write-Host ""; Write-Host "Azure CLI authentication not available." -ForegroundColor Yellow
        Write-Host "Personal Access Token (PAT) is required." -ForegroundColor Yellow
        Write-Host ""; Write-Host "To create a PAT:" -ForegroundColor Gray
        Write-Host "  1. Go to https://dev.azure.com/$Organization/_usersSettings/tokens" -ForegroundColor Gray
        Write-Host "  2. Create a new token with 'Work Items (Read)' and 'Code (Read)' scopes" -ForegroundColor Gray
        Write-Host ""; Write-Host "Enter your Personal Access Token:" -ForegroundColor Cyan
        $PAT = Read-Host -AsSecureString

        $BSTR_Check = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($PAT)
        try {
            $plainPAT_Check = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR_Check)
            $isEmpty = [string]::IsNullOrEmpty($plainPAT_Check)
        }
        finally {
            [System.Runtime.InteropServices.Marshal]::ZeroFreeBSTR($BSTR_Check)
            $plainPAT_Check = $null
        }

        if ($isEmpty) { Write-Host ""; Write-Host "ERROR: Authentication is required to proceed!" -ForegroundColor Red; exit 1 }
    }

    Write-Host "Using Personal Access Token (PAT) authentication" -ForegroundColor Green

    $BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($PAT)
    try {
        $plainPAT = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)
        $encodedPAT = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":" + $plainPAT))
        $headers["Authorization"] = "Basic $encodedPAT"
    }
    finally {
        [System.Runtime.InteropServices.Marshal]::ZeroFreeBSTR($BSTR)
        $plainPAT = $null
    }
}

Write-Host ""; Write-Host "=== Starting Processing ===" -ForegroundColor Cyan; Write-Host ""

$baseUrl = "https://dev.azure.com/$Organization"

function Invoke-ADORestAPI {
    param(
        [string]$Uri,
        [string]$Method = "GET",
        [object]$Body = $null
    )
    try {
        $params = @{ Uri = $Uri; Method = $Method; Headers = $headers }
        if ($Body) {
            $params.Body = ($Body | ConvertTo-Json -Depth 10)
            $params.Headers = $headers.Clone(); $params.Headers["Content-Type"] = "application/json"
        }
        return Invoke-RestMethod @params
    }
    catch {
        Write-Host "ERROR calling API: $Uri" -ForegroundColor Red
        Write-Host $_.Exception.Message -ForegroundColor Red
        return $null
    }
}

# Step 1: Query Work Item Hierarchy
Write-Host "Step 1: Fetching work item hierarchy for ID $RootWorkItemId..." -ForegroundColor Cyan

$wiql = @"
SELECT [System.Id]
FROM WorkItemLinks
WHERE ([Source].[System.Id] = $RootWorkItemId)
AND ([System.Links.LinkType] = 'System.LinkTypes.Hierarchy-Forward')
MODE (Recursive)
"@

$wiqlUrl = "$baseUrl/$ProjectName/_apis/wit/wiql?api-version=7.1-preview.2"
$wiqlResult = Invoke-ADORestAPI -Uri $wiqlUrl -Method POST -Body @{ query = $wiql }

$workItemIds = @()
if ($wiqlResult -and $wiqlResult.workItemRelations) {
    $workItemIds = $wiqlResult.workItemRelations | ForEach-Object { $_.target.id }
    if ($workItemIds -notcontains $RootWorkItemId) { $workItemIds += $RootWorkItemId }
} elseif (-not $wiqlResult) {
    Write-Host "  Could not retrieve hierarchy. Checking if item exists..." -ForegroundColor Yellow
    $workItemIds = @($RootWorkItemId)
}

$uniqueIds = $workItemIds | Select-Object -Unique
Write-Host "Found $($uniqueIds.Count) work items (Root + Descendants)" -ForegroundColor Green

# Step 2: Fetch Details & PRs
Write-Host "Step 2: Retrieving details and linked PRs..." -ForegroundColor Cyan

$batchSize = 200
$allWorkItems = @()
for ($i = 0; $i -lt $uniqueIds.Count; $i += $batchSize) {
    $batchIds = $uniqueIds[$i..[Math]::Min($i + $batchSize - 1, $uniqueIds.Count - 1)]
    $idsParam = $batchIds -join ","
    $workItemsUrl = "$baseUrl/$ProjectName/_apis/wit/workitems?ids=$idsParam&`$expand=relations&api-version=7.1-preview.3"
    $workItemsBatch = Invoke-ADORestAPI -Uri $workItemsUrl
    if ($workItemsBatch -and $workItemsBatch.value) { $allWorkItems += $workItemsBatch.value }
}

$processedData = @()
$prCache = @{}
$uniquePRs = @{}

foreach ($wi in $allWorkItems) {
    $wiObj = @{ id = $wi.id; title = $wi.fields.'System.Title'; type = $wi.fields.'System.WorkItemType'; state = $wi.fields.'System.State'; pullRequests = @() }
    if ($wi.relations) {
        $prLinks = $wi.relations | Where-Object { $_.rel -eq 'ArtifactLink' -and $_.url -match 'vstfs:///Git/PullRequestId/' }
        foreach ($prLink in $prLinks) {
            $decodedUrl = [System.Net.WebUtility]::UrlDecode($prLink.url)
            if ($decodedUrl -match 'vstfs:///Git/PullRequestId/([^/]+)/([^/]+)/([^/]+)') {
                $prRepoId = $matches[2]; $prId = $matches[3]; $cacheKey = "$prRepoId-$prId"
                if (-not $prCache.ContainsKey($cacheKey)) {
                    Write-Host "  Fetching PR #$prId..." -ForegroundColor Gray
                    Write-Host "    GET $prUrl" -ForegroundColor DarkGray
                    # Build PR URL with UriBuilder to avoid malformed query strings
                    $prUrlBuilder = [System.UriBuilder]::new("$baseUrl/$ProjectName/_apis/git/repositories/$prRepoId/pullrequests/$prId")
                    $prUrlBuilder.Query = "api-version=7.1-preview.1"
                    $prUrl = $prUrlBuilder.Uri.AbsoluteUri
                    $pr = Invoke-ADORestAPI -Uri $prUrl
                    if ($pr) {
                        $repoName = if ($pr.repository.name) { $pr.repository.name } else { "Unknown" }
                        $prInfo = @{
                            id = $pr.pullRequestId
                            title = $pr.title
                            description = if ($pr.description) { $pr.description } else { "" }
                            repository = $repoName
                            status = $pr.status
                            createdBy = $pr.createdBy.displayName
                            creationDate = $pr.creationDate
                            closedDate = $pr.closedDate
                            url = $pr.url -replace "_apis/git/repositories/[^/]+/pullrequests/", "_git/$($pr.repository.name)/pullrequest/"
                            webUrl = if ($pr._links.web.href) { $pr._links.web.href } else { "" }
                        }
                        $prCache[$cacheKey] = $prInfo
                        if (-not $uniquePRs.ContainsKey($cacheKey)) { $uniquePRs[$cacheKey] = $prInfo }
                    }
                }
                if ($prCache.ContainsKey($cacheKey)) { $wiObj.pullRequests += $prCache[$cacheKey] }
            }
        }
    }
    $processedData += $wiObj
}

# Step 3: Generate Outputs
Write-Host ""; Write-Host "Step 3: Generating outputs..." -ForegroundColor Cyan

$jsonOutput = @{ rootWorkItemId = $RootWorkItemId; generatedAt = [DateTime]::Now; project = $ProjectName; workItems = $processedData; uniquePullRequests = $uniquePRs.Values }
$jsonFileName = "pr-summary-{0}_{1}.json" -f $RootWorkItemId, $timestamp
$jsonPath = Join-Path $OutputDir $jsonFileName
$jsonOutput | ConvertTo-Json -Depth 10 | Out-File $jsonPath -Encoding utf8
Write-Host "Generated JSON: $jsonPath" -ForegroundColor Green

$mdFileName = "pr-summary-{0}_{1}.md" -f $RootWorkItemId, $timestamp
$mdPath = Join-Path $OutputDir $mdFileName
$mdContent = @()
$mdContent += "# PR Summary for Work Item #$RootWorkItemId and Descendants"
$mdContent += ""
$mdContent += "Generated on: $(Get-Date)"
$mdContent += ""
$mdContent += "## Pull Requests"
$mdContent += ""
$mdContent += "| ID | Repository | Title | Description | Status | Author |"
$mdContent += "|----|------------|-------|-------------|--------|--------|"

$sortedPRs = $uniquePRs.Values | Sort-Object id
foreach ($pr in $sortedPRs) {
    $title = $pr.title -replace '\|', '-'
    $repo = $pr.repository
    $link = if ($pr.webUrl) { "[#${($pr.id)}]($($pr.webUrl))" } else { "#${($pr.id)}" }
    $desc = $pr.description
    if ($desc) {
        $desc = $desc -replace "`r`n", " " -replace "`n", " " -replace '\|', '-'
        if ($desc.Length -gt 100) { $desc = $desc.Substring(0, 97) + "..." }
    } else { $desc = "" }
    $mdContent += "| $link | $repo | $title | $desc | $($pr.status) | $($pr.createdBy) |"
}

if ($sortedPRs.Count -eq 0) { $mdContent += ""; $mdContent += "*No Pull Requests found linked to the work item hierarchy.*" }

$mdContent += ""; $mdContent += "## Work Items Processed"; $mdContent += ""; $mdContent += "| ID | Type | Title | Linked PRs |"; $mdContent += "|----|------|-------|------------|"
foreach ($wi in $processedData) {
    $prCount = $wi.pullRequests.Count
    $mdContent += "| $($wi.id) | $($wi.type) | $($wi.title) | $prCount |"
}

$mdContent | Out-File $mdPath -Encoding utf8
Write-Host "Generated Markdown: $mdPath" -ForegroundColor Green

Write-Host ""; Write-Host "=== Complete ===" -ForegroundColor Cyan
