#!/usr/bin/env bash
# Link this repo into ~/.claude so every Claude Code session (local or cloud) uses it.
# Usage: git clone git@github.com:godmaster007/claude-config.git ~/claude-config && ~/claude-config/install.sh
set -euo pipefail
src=$(cd "$(dirname "$0")" && pwd)
mkdir -p "$HOME/.claude"
for item in CLAUDE.md settings.json hooks agents skills; do
  dest="$HOME/.claude/$item"
  if [[ -e "$dest" && ! -L "$dest" ]]; then mv "$dest" "$dest.bak.$(date +%s)"; echo "Backed up existing $dest"; fi
  ln -sfn "$src/$item" "$dest"
done
chmod +x "$src"/hooks/*.sh
echo "Linked claude-config into ~/.claude"
