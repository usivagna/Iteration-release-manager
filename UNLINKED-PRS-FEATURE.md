# Unlinked PRs Feature

## Overview

The **Unlinked PRs Feature** tracks all Pull Requests that were completed during the iteration date range but are **NOT** linked to work items that were completed in the iteration. This provides complete visibility into all code changes made during the iteration.

## Why This Feature?

Previously, the release notes only included PRs that were linked to completed work items. However, many PRs are completed during an iteration that:
- Are linked to work items that are still in progress
- Are linked to work items in a different iteration
- Are documentation or test changes not linked to specific work items
- Are bug fixes for issues discovered and resolved quickly

This feature ensures **100% visibility** into all code changes during the iteration period.

## What Gets Captured

The feature queries all repositories in the project and finds PRs that:
1. Are **associated with the specified Azure DevOps team** by one of:
   - Created by a team member
   - Team assigned as a reviewer
   - Reviewed by a team member
2. Have a **status of "completed"**
3. Were **closed during the iteration date range** (between start and end dates)
4. Are **NOT already linked** to work items that were completed in the iteration

For each PR found, the feature captures:
- PR ID, title, and description
- Repository name
- Source and target branches
- Closed date and author
- **All linked work items** (even if they're not completed), including:
  - Work item ID, title, type, state, and area path

## Output Files

### 1. JSON Data File
Location: `output/completed-prs-unlinked.json`

Contains structured data about all unlinked PRs:
```json
{
  "iterationName": "2025.09 Sprint 3",
  "startDate": "2025-08-25T00:00:00Z",
  "endDate": "2025-09-15T23:59:59Z",
  "completedPRs": [
    {
      "id": 2001,
      "title": "Update USB driver documentation",
      "description": "## Why...",
      "repository": "os-docs",
      "sourceBranch": "users/alice/doc-updates",
      "targetBranch": "main",
      "closedDate": "2025-09-10T14:30:00Z",
      "createdBy": "Alice Johnson",
      "workItems": [
        {
          "id": 12345681,
          "title": "Update USB4 documentation",
          "type": "Task",
          "state": "Active",
          "areaPath": "OS\\Core\\Connectivity Platform\\Buses"
        }
      ]
    }
  ]
}
```

### 2. Internal Summary Section
Location: `output/internal-summary-YYYY-MM-DD_HHMMSS.md`

A new section is added to the internal summary markdown file:

```markdown
## Completed PRs Not Linked to Completed Work Items

This section lists all Pull Requests created by **ft_buses team members** that were 
completed during the iteration period but are NOT linked to work items that were 
completed in this iteration.

### Summary

| Metric | Value |
|--------|-------|
| Team | ft_buses |
| Total Unlinked PRs (from team) | 3 |

### Most Active Repositories (Unlinked PRs)

| Repository | PR Count |
|------------|----------|
| os-docs | 1 |
| os-tests | 1 |
| os-client | 1 |

---

### Pull Requests

#### PR #2001: Update USB driver documentation

**Repository:** os-docs | **Closed:** 2025-09-10T14:30:00Z | **Author:** Alice Johnson  
**Branches:** users/alice/doc-updates → main

<details><summary>View Details</summary>

| Why | What | How |
|-----|------|-----|
| Developers were confused... | Updated API reference... | Documentation was reviewed... |

**Linked Work Items:**
- **[12345681]** Update USB4 documentation (Type: Task, State: Active)

</details>
```

## How It Works

### Step 2b: Query Completed PRs Associated with Team
After querying completed work items (Step 2), the script adds a new step:

1. **Get team members** from the specified Azure DevOps team
2. **Get all repositories** in the project
3. **For each repository**:
   - Query all PRs with status = "completed"
   - Filter by closed date within iteration range
4. **For each PR**:
   - Get PR details including reviewers
   - Check if PR is associated with team by:
     * Creator is a team member, OR
     * Team is assigned as a reviewer, OR
     * A team member is assigned as a reviewer
   - Skip if not associated with team
   - Check if it's already linked to a completed work item (skip if yes)
   - Get linked work items (even if not completed)
   - Add to unlinked PRs collection
5. **Save results** to JSON file
6. **Generate summary section** in internal summary

### API Calls Made
- `GET /_apis/projects/{project}/teams/{team}/members` - Get team members
- `GET /_apis/git/repositories` - Get all repositories
- `GET /_apis/git/repositories/{repoId}/pullrequests?searchCriteria.status=completed` - Get completed PRs
- `GET /_apis/git/repositories/{repoId}/pullrequests/{prId}/workitems` - Get linked work items
- `GET /_apis/wit/workitems?ids={ids}` - Get work item details

## Testing

Run the test suite to validate the feature:

```powershell
.\Test-UnlinkedPRs.ps1
```

This test:
1. Validates the example data file structure
2. Checks all required fields are present
3. Generates a test summary to verify formatting
4. Confirms the output file is created correctly

## Example Data

See `examples/completed-prs-unlinked.json` for a sample data file showing:
- A documentation PR linked to an Active work item
- A test PR with no linked work items
- A bug fix PR linked to a New work item

## Use Cases

### 1. Complete Release Notes
Capture all code changes, not just those tied to completed work items.

### 2. Documentation Changes
Track documentation updates that may not have completed work items.

### 3. Test Infrastructure
Capture test changes that improve quality but aren't tied to specific features.

### 4. Quick Bug Fixes
Find PRs for bugs that were discovered and fixed without formal work item tracking.

### 5. Cross-Iteration Work
See PRs completed in this iteration but linked to future work items.

## Benefits

- **Complete Visibility**: Never miss a code change in your release notes
- **Better Tracking**: Understand all work done, not just completed stories
- **Quality Metrics**: Track ratio of planned vs. unplanned work
- **Documentation**: Ensure documentation changes are captured
- **Compliance**: Full audit trail of all code changes in the iteration

## Configuration

No additional configuration needed! The feature automatically:
- Queries all repositories in the project
- Filters by iteration date range
- Excludes duplicates already in the work items summary
- Generates formatted output

## Maintenance

The feature:
- Uses existing authentication (Azure CLI or PAT)
- Follows the same API patterns as existing code
- Outputs data in consistent JSON format
- Integrates seamlessly into the internal summary

## Future Enhancements

Potential improvements:
- Add filtering by repository or area path
- Include commit statistics for each PR
- Add categorization by change type (docs, tests, code)
- Generate separate summary for unlinked PRs only
- Add metrics for PRs with no linked work items
