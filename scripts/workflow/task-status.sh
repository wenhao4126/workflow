#!/usr/bin/env bash
set -euo pipefail
TASK_DIR="$($(cd "$(dirname "$0")" && pwd)/open-task.sh "$1")"
if [ -f "$TASK_DIR/TASK.md" ]; then
  grep -E '^- Status:' "$TASK_DIR/TASK.md" || true
  echo "path: $TASK_DIR"
else
  echo "missing TASK.md in $TASK_DIR" >&2
  exit 1
fi
