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

sed -i 's/^- Status: open/- Status: closed/' "$TASK_DIR/TASK.md"

if [ "$MODE" = "json" ]; then
  printf '{"path":"%s","status":"closed"}\n' "$TASK_DIR"
else
  echo "closed: $TASK_DIR"
fi
