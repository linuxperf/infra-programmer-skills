#!/usr/bin/env bash
set -euo pipefail

if ! git rev-parse --git-dir >/dev/null 2>&1; then
  echo "[ERROR] Not inside a git repository." >&2
  exit 1
fi

repo_root="$(git rev-parse --show-toplevel)"
cd "$repo_root"

echo "## Staged diff stat"
git diff --cached --stat

echo
echo "## Staged file status"
git diff --cached --name-status

echo
echo "## Staged diff"
git diff --cached --no-ext-diff
