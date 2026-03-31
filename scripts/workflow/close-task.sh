#!/usr/bin/env bash
set -euo pipefail
TASK_DIR="$($(cd "$(dirname "$0")" && pwd)/open-task.sh "$1")"
sed -i 's/^- Status: open/- Status: closed/' "$TASK_DIR/TASK.md"
echo "closed: $TASK_DIR"
