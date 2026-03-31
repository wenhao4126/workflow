#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "$0")/../.." && pwd)"
TASK_ROOT="$ROOT_DIR/.workflow/tasks"
[ -d "$TASK_ROOT" ] || exit 0

printf '%-32s %-8s %s\n' 'TASK ID' 'STATUS' 'NAME'
find "$TASK_ROOT" -mindepth 1 -maxdepth 1 -type d | sort | while read -r task_dir; do
  task_id="$(basename "$task_dir")"
  task_name="${task_id#*-}"
  task_name="${task_name#*-}"
  status="unknown"
  if [ -f "$task_dir/TASK.md" ]; then
    status_line="$(grep -E '^- Status:' "$task_dir/TASK.md" | head -n 1 || true)"
    status="${status_line#- Status: }"
  fi
  printf '%-32s %-8s %s\n' "$task_id" "$status" "$task_name"
done
