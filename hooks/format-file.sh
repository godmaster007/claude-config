#!/usr/bin/env bash
# PostToolUse(Edit|Write): format the edited file with whatever formatter is installed. Never blocks.
f=$(jq -r '.tool_input.file_path // empty')
[[ -z "$f" || ! -f "$f" ]] && exit 0
case "$f" in
  *.ts|*.tsx|*.js|*.jsx|*.mjs|*.cjs|*.json|*.css|*.scss|*.html|*.md|*.yml|*.yaml|*.vue)
    command -v npx >/dev/null && [[ -d node_modules/prettier ]] && npx --no-install prettier --write "$f" >/dev/null 2>&1 ;;
  *.py)
    if command -v ruff >/dev/null; then ruff format -q "$f"; elif command -v black >/dev/null; then black -q "$f"; fi ;;
  *.go) command -v gofmt >/dev/null && gofmt -w "$f" ;;
  *.sh) command -v shfmt >/dev/null && shfmt -w "$f" ;;
esac
exit 0
