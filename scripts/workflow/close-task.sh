#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TASK_DIR="$("$SCRIPT_DIR/open-task.sh" "$1")"
sed -i 's/^- Status: open/- Status: closed/' "$TASK_DIR/TASK.md"
echo "closed: $TASK_DIR"
