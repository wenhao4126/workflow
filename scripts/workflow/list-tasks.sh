#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "$0")/../.." && pwd)"
TASK_ROOT="$ROOT_DIR/.workflow/tasks"
FILTER_STATUS=""
OUTPUT_MODE="table"

while [ "$#" -gt 0 ]; do
  case "$1" in
    --status)
      FILTER_STATUS="${2:-}"
      shift 2
      ;;
    --json)
      OUTPUT_MODE="json"
      shift
      ;;
    *)
      echo "usage: $0 [--status open|closed] [--json]" >&2
      exit 1
      ;;
  esac
done

[ -d "$TASK_ROOT" ] || exit 0

if [ "$OUTPUT_MODE" = "json" ]; then
  printf '[\n'
  first=1
  find "$TASK_ROOT" -mindepth 1 -maxdepth 1 -type d | sort | while read -r task_dir; do
    task_id="$(basename "$task_dir")"
    task_name="${task_id#*-}"
    task_name="${task_name#*-}"
    status="unknown"
    if [ -f "$task_dir/TASK.md" ]; then
      status_line="$(grep -E '^- Status:' "$task_dir/TASK.md" | head -n 1 || true)"
      status="${status_line#- Status: }"
    fi
    if [ -n "$FILTER_STATUS" ] && [ "$status" != "$FILTER_STATUS" ]; then
      continue
    fi
    if [ "$first" -eq 0 ]; then
      printf ',\n'
    fi
    first=0
    printf '  {"id":"%s","status":"%s","name":"%s","path":"%s"}' "$task_id" "$status" "$task_name" "$task_dir"
  done
  printf '\n]\n'
  exit 0
fi

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
  if [ -n "$FILTER_STATUS" ] && [ "$status" != "$FILTER_STATUS" ]; then
    continue
  fi
  printf '%-32s %-8s %s\n' "$task_id" "$status" "$task_name"
done
