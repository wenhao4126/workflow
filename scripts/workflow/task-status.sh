#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
MODE="plain"

while [ "$#" -gt 0 ]; do
  case "$1" in
    --json)
      MODE="json"
      shift
      ;;
    --)
      shift
      break
      ;;
    -*)
      echo "unknown option: $1" >&2
      echo "usage: $0 [--json] <task-id-or-keyword>" >&2
      exit 2
      ;;
    *)
      break
      ;;
  esac
done

if [ "$#" -ne 1 ]; then
  echo "usage: $0 [--json] <task-id-or-keyword>" >&2
  exit 2
fi

TASK_DIR="$("$SCRIPT_DIR/open-task.sh" --path "$1")"

if [ ! -f "$TASK_DIR/TASK.md" ]; then
  echo "missing TASK.md in $TASK_DIR" >&2
  exit 1
fi

status="unknown"
status_line="$(grep -E '^- Status:' "$TASK_DIR/TASK.md" | head -n 1 || true)"
if [ -n "$status_line" ]; then
  status="${status_line#- Status: }"
fi

if [ "$MODE" = "json" ]; then
  printf '{"path":"%s","status":"%s"}\n' "$TASK_DIR" "$status"
else
  if [ -n "$status_line" ]; then
    echo "$status_line"
  else
    echo "- Status: unknown"
  fi
  echo "path: $TASK_DIR"
fi
