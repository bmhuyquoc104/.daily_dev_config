---
name: ship
description: Use when the user wants to commit, push, and open a pull request for the current changes in Azure DevOps. Validate branch naming and commit message format, require a user-specified target branch, verify the destination branch exists, stage relevant files, push the branch, and open a PR.
---

# Ship

Validates branch and commit conventions, commits staged changes, pushes the branch, and opens an Azure DevOps PR.

## When to Use This Skill

Invoke this skill when the user says things like:
- "ship it"
- "commit push pr"
- "ship this"
- "create a pr"
- "push and open a pr"
- "commit and ship"

## Workflow

Follow these steps **in order**, stopping and reporting any errors immediately.

### Step 1 — Sanity checks

Run these in parallel:
```bash
git status
git diff
git log --oneline -5
git remote -v
```

Use the output to understand: what branch we're on, what's changed, what the recent commit style looks like, and what the remote is.

Also verify Azure DevOps CLI auth and defaults:
```bash
az devops configure -l
```

If defaults are missing, use:
```bash
az devops configure --defaults organization=https://dev.azure.com/<org> project=<project>
```

### Step 2 — Resolve target branch from user request

Set target branch before rebasing/PR creation.

- If the user says "create pull request to <branch>", use `<branch>` as `TARGET_BRANCH`.
- If user does not specify a destination branch, stop and ask them to provide one.
- Do not guess or default this value.

```bash
TARGET_BRANCH=<user-provided-branch>
```

### Step 3 — Validate destination branch exists

Verify target branch exists on remote before continuing:

```bash
git fetch origin
if ! git ls-remote --exit-code --heads origin "$TARGET_BRANCH" >/dev/null; then
  echo "Destination branch '$TARGET_BRANCH' does not exist on origin."
  echo "Please provide a valid target branch and retry."
  exit 1
fi
```

### Step 4 — Resolve repository from current directory

Infer repository name from the current git remote and verify it exists in Azure DevOps:

```bash
remote_url=$(git config --get remote.origin.url)
REPOSITORY=$(basename -s .git "$remote_url")

if [ -z "$REPOSITORY" ]; then
  echo "Could not infer repository from remote.origin.url."
  echo "Please provide the Azure DevOps repository name."
  exit 1
fi

if ! az repos show --repository "$REPOSITORY" >/dev/null 2>&1; then
  echo "Repository '$REPOSITORY' was inferred from current directory but was not found in Azure DevOps."
  echo "Please confirm organization/project defaults or provide the repository name explicitly."
  exit 1
fi
```

### Step 5 — Validate source branch name

Validate current branch naming convention before committing:

```bash
branch_name=$(git rev-parse --abbrev-ref HEAD)
pattern='^(feat|fix|bug|chore|refactor|test|docs|ci|build|style|perf|revert|hotfix|wip)/[A-Z]+-[0-9]+/[a-z0-9-]+$'

if ! [[ "$branch_name" =~ $pattern ]]; then
  echo "Invalid branch name '$branch_name'"
  echo "Expected: action/PROJECT-123/short-description"
  echo "See: https://modecdna.atlassian.net/wiki/spaces/TT/pages/8617394200/TE+Coding+Guideline"
  exit 1
fi
```

### Step 6 — Rebase onto destination

Rebase the current branch onto the target branch to ensure no merge conflicts:

```bash
git fetch origin
git rebase origin/$TARGET_BRANCH
```

If there are conflicts, resolve them (keeping both sides where appropriate), then continue the rebase. Do NOT skip this step. Push after successful rebase with `--force-with-lease` if needed:
```bash
git push --force-with-lease
```

### Step 7 — Stage files

Stage all changed/new files that are relevant to the work. Explicitly exclude:
- `.DS_Store`
- `*.db`, `*.db-shm`, `*.db-wal`
- Any file that looks like it contains secrets (`.env`, `credentials.*`, etc.)
- Prototype/demo directories unless they are part of the deliverable

```bash
git add <relevant files>
git status   # verify staging looks right
```

### Step 8 — Commit

Commit message must match branch-derived format:
- Branch format: `<action>/<PROJECT-123>/<short-description>`
- Commit subject format: `<action>(<PROJECT-123>): <message>`

Validate commit message before finalizing commit:

```bash
branch_name=$(git rev-parse --abbrev-ref HEAD)
action_type=$(echo "$branch_name" | cut -d'/' -f1)
ticket_num=$(echo "$branch_name" | cut -d'/' -f2)
commit_subject='<first line of commit message>'
pattern="^${action_type}\(${ticket_num}\): .+"

if ! [[ "$commit_subject" =~ $pattern ]]; then
  echo "Invalid commit message '$commit_subject'"
  echo "Expected format: ${action_type}(${ticket_num}): message"
  exit 1
fi
```

```bash
git commit -m "<message>"
```

### Step 9 — Push

If the branch has no upstream yet:
```bash
git push -u origin <branch>
```

Otherwise:
```bash
git push
```

### Step 10 — Open PR

Use the `az` CLI to create a PR targeting `$TARGET_BRANCH`:

```bash
az repos pr create \
  --repository "$REPOSITORY" \
  --source-branch <branch> \
  --target-branch $TARGET_BRANCH \
  --title "<concise title matching commit subject>" \
  --description "## Summary

- <2-4 bullet points describing what changed and why>

## Notes

<any reviewer context, migration steps, known limitations - omit section if none>" \
  --open
```

Capture the PR URL from the output.

### Step 11 — Report back

Tell the user:
- The commit hash and message
- The PR URL
- Any follow-up needed (for example, reviewers to add)

## Rules

- **Never force-push** to `main` or `master`
- **Never commit** `.env`, secrets, or credential files — warn the user if they're staged
- **Always validate** branch name before commit
- **Always validate** commit subject against branch-derived pattern before commit
- **Always require** explicit user-specified destination branch
- **Always verify** destination branch exists on `origin` before rebase and PR creation
- **Always resolve** repository from `remote.origin.url` and verify it exists in Azure DevOps
- **Always rebase** onto `origin/$TARGET_BRANCH` before pushing to minimise conflicts
- If `az` is not authenticated, tell the user to run `az login` first
- If Azure DevOps extension is missing, install it with `az extension add --name azure-devops`
- If the build/tests are known to exist (e.g. `go build ./...`, `npm test`), run them before committing and abort if they fail
