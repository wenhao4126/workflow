#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "$0")/../.." && pwd)"
TASK_ROOT="$ROOT_DIR/.workflow/tasks"
[ -d "$TASK_ROOT" ] || exit 0
find "$TASK_ROOT" -mindepth 1 -maxdepth 1 -type d | sort
