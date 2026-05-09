#!/usr/bin/env bash
set -euo pipefail

force=0

if [[ "${1:-}" == "--force" ]]; then
  force=1
  shift
fi

target_dir="${1:-.}"
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
skill_dir="$(cd "$script_dir/.." && pwd)"

if [[ ! -d "$target_dir" ]]; then
  echo "Target directory does not exist: $target_dir" >&2
  exit 1
fi

target_dir="$(cd "$target_dir" && pwd)"

copy_template() {
  local name="$1"
  local source="$skill_dir/assets/$name"
  local target="$target_dir/$name"

  if [[ -e "$target" && "$force" -ne 1 ]]; then
    echo "Refusing to overwrite existing file: $target" >&2
    echo "Re-run with --force to replace it." >&2
    exit 1
  fi

  cp "$source" "$target"
  echo "Generated $target"
}

copy_template "AGENTS.md"
copy_template "CLAUDE.md"
