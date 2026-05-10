# Architecture

This repository stores reusable Codex and Claude Code skills.

## Repository Layout

- `skills/code-agent-init/`: skill for generating repository-level agent instruction files.
  - `assets/AGENTS.md` and `assets/CLAUDE.md` are the fixed template sources.
  - `scripts/generate_agent_docs.sh` writes the templates into a target repository. By default it creates missing files and appends template content to existing files. With `--force`, it replaces the target files.
  - `agents/openai.yaml` describes skill metadata for agent tooling.
- `skills/git-commit/`: skill for inspecting staged git changes and drafting commit messages.
  - `Commits.md` contains commit-message guidance.
  - `scripts/staged_context.sh` collects staged diff context.
  - `agents/openai.yaml` describes skill metadata for agent tooling.
- `AGENTS.md` and `CLAUDE.md`: repository-level assistant instructions.
- `README.md`: high-level repository overview and validation commands.

## Operational Notes

Skill implementations keep templates and behavior colocated under each skill directory. Scripts are intended to be run directly from the repository root or through their skill instructions.
