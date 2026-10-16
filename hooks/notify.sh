#!/usr/bin/env bash
# Notification/Stop: desktop alert when Claude needs input or finishes. Silent where no notifier exists (cloud).
msg="Claude needs your attention"; [[ "${1:-}" == "done" ]] && msg="Claude finished"
if command -v osascript >/dev/null; then osascript -e "display notification \"$msg\" with title \"Claude Code\"";
elif command -v notify-send >/dev/null; then notify-send "Claude Code" "$msg"; fi
exit 0
