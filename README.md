# claude-config

Nick's Claude Code setup: global instructions, permissions, hooks, subagents and personal skills.

| Path | What it does |
|---|---|
| `CLAUDE.md` | Global instructions loaded in every session (who I am, how to answer, swarm playbook, caching rules) |
| `settings.json` | Permissions (allow / ask / deny) and hook wiring |
| `hooks/guard-bash.sh` | Blocks commits to main, commits containing secrets or `.env`, and runs a repo's `.claude/precommit.sh` if it has one |
| `hooks/format-file.sh` | Auto-formats edited files (prettier, ruff/black, gofmt, shfmt) |
| `hooks/notify.sh` | Desktop alert when Claude needs input or finishes |
| `agents/` | `researcher`, `reviewer` and `planner` subagents |
| `skills/` | Personal skills: `weekly-review`, `project-kickoff` |

## Install
- **Your computer:** `git clone https://github.com/godmaster007/claude-config ~/claude-config && ~/claude-config/install.sh`
- **Cloud sessions:** add `bash ~/claude-config/install.sh` (after cloning) to the environment's setup script.

Needs `jq` for the hooks.
