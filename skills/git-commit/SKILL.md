---
name: git-commit
description: Draft concise git commit summaries and commit messages from staged/cached changes only. Use when the user asks to summarize a commit, write a commit message, inspect staged changes, or prepare a git commit while explicitly ignoring unstaged working-tree modifications, untracked files that are not staged, and any non-cached diff.
---

# Git Commit

## Core Rule

Only use the git index as source material.

Use:

```bash
git diff --cached --stat
git diff --cached --name-status
git diff --cached
```

Do not use unstaged sources for the summary:

```bash
git diff
git status --short
git ls-files --others --exclude-standard
```

`git status --short` is allowed only to detect whether staged changes exist, and never as evidence for commit content.

## Workflow

1. Collect staged context.
   - Prefer `scripts/staged_context.sh` from this skill when available.
   - Otherwise run `git diff --cached --stat`, `git diff --cached --name-status`, and `git diff --cached`.

2. Check for an empty index.
   - If `git diff --cached --quiet` succeeds, say there are no staged changes to summarize.
   - Do not summarize unstaged or untracked files as a fallback.

3. Summarize only staged files and hunks.
   - Mention file paths only if they appear in the cached name/status or cached diff.
   - Ignore visible IDE context, open tabs, unstaged changes, and untracked files unless they are staged.

4. Draft a commit message.
   - Prefer an imperative subject under 72 characters.
   - Add a short body only when the staged diff contains multiple meaningful changes or non-obvious rationale.
   - Do not claim tests or validation unless the user provided them or they were actually run.

## Output Format

When the user asks for a commit message, read `Commits.md` and format the result according to its Conventional Commits rules while using only the staged diff as evidence.

When the user asks for a summary, provide:

- Staged files changed
- Key staged changes
- Suggested commit message

Keep the wording grounded in the cached diff. If the cached diff is huge or binary-heavy, summarize the staged name/status and stat first, then note what could not be inspected textually.

## Script

Run this helper from a git repository root or subdirectory:

```bash
skills/git-commit/scripts/staged_context.sh
```

It prints only cached/staged information and exits successfully even when there are no staged changes.
