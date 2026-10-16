#!/usr/bin/env bash
# PreToolUse(Bash): block commits that contain secrets or land on main, and run an
# optional per-repo pre-commit check. Exit 2 blocks the call; stderr goes back to Claude.
set -uo pipefail
cmd=$(jq -r '.tool_input.command // ""')
case "$cmd" in
  *"git commit"*)
    branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "")
    if [[ "$branch" == "main" || "$branch" == "master" ]]; then
      echo "Blocked: don't commit directly to $branch. Create a branch first." >&2; exit 2
    fi
    if git diff --cached -U0 2>/dev/null | grep -E '^\+' | grep -qE \
      '(AKIA[0-9A-Z]{16}|-----BEGIN [A-Z ]*PRIVATE KEY-----|sk-[A-Za-z0-9_-]{20,}|ghp_[A-Za-z0-9]{36}|xox[baprs]-[A-Za-z0-9-]{10,}|sb_secret_[A-Za-z0-9_-]{10,}|eyJhbGciOi[A-Za-z0-9._-]{40,})'; then
      echo "Blocked: staged changes look like they contain a secret. Remove it and use an env var." >&2; exit 2
    fi
    if git diff --cached --name-only 2>/dev/null | grep -qE '(^|/)\.env($|\.)'; then
      echo "Blocked: a .env file is staged. Unstage it and add it to .gitignore." >&2; exit 2
    fi
    root=$(git rev-parse --show-toplevel 2>/dev/null || echo "")
    if [[ -n "$root" && -x "$root/.claude/precommit.sh" ]]; then
      if ! out=$("$root/.claude/precommit.sh" 2>&1); then
        echo "Blocked: .claude/precommit.sh failed:" >&2; echo "$out" | tail -40 >&2; exit 2
      fi
    fi
    ;;
esac
exit 0
