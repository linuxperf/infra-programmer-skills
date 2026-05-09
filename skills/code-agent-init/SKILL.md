---
name: code-agent-init
description: Generate fixed AGENTS.md and CLAUDE.md project instruction files from bundled templates. Use when the user asks to create, regenerate, or standardize agent guidance files for Codex, Claude Code, coding assistants, repository agent instructions, AGENTS.md, or CLAUDE.md.
---

# Code Agent Init

## Workflow

1. Identify the target repository root.
   - Use the current working directory when the user does not specify a path.
   - Prefer the nearest directory containing `.git` when working from a subdirectory.

2. Generate the files from this skill's bundled templates:

```bash
skills/code-agent-init/scripts/generate_agent_docs.sh [target-directory]
```

3. Preserve existing files by default.
   - If `AGENTS.md` or `CLAUDE.md` already exists, the script exits without overwriting it.
   - When the user explicitly asks to regenerate, replace, or overwrite the files, run:

```bash
skills/code-agent-init/scripts/generate_agent_docs.sh --force [target-directory]
```

4. Report the generated file paths.
   - Do not edit the generated content unless the user asks for a custom template.
   - Treat `assets/AGENTS.md` and `assets/CLAUDE.md` as the source of truth for the fixed templates.

## Templates

- `assets/AGENTS.md`: fixed Codex-style agent instructions.
- `assets/CLAUDE.md`: fixed Claude Code-style agent instructions.

## Notes

- Keep the templates deterministic and concise.
- If the templates need to change, update the files in `assets/` first, then regenerate target files with `--force`.
