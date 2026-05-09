# infra-programmer-skills

Reusable Codex/Claude Code skill folders.

## Skills

- `code-agent-init`: generate fixed `AGENTS.md` and `CLAUDE.md` project instruction files.
- `git-commit`: summarize and draft commit messages from staged/cached git changes only.

## Validate

```bash
python3 /home/jqh9804/.codex/skills/.system/skill-creator/scripts/quick_validate.py skills/code-agent-init
python3 /home/jqh9804/.codex/skills/.system/skill-creator/scripts/quick_validate.py skills/git-commit
skills/code-agent-init/scripts/generate_agent_docs.sh /tmp/code-agent-init-test
skills/git-commit/scripts/staged_context.sh
```
