#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "$0")/../.." && pwd)"
MODE="summary"
KEYWORD=""

while [ "$#" -gt 0 ]; do
  case "$1" in
    --path)
      MODE="path"
      shift
      ;;
    *)
      KEYWORD="$1"
      shift
      ;;
  esac
done

if [ -z "$KEYWORD" ]; then
  echo "usage: $0 [--path] <task-id-or-keyword>" >&2
  exit 1
fi
MATCH="$(find "$ROOT_DIR/.workflow/tasks" -mindepth 1 -maxdepth 1 -type d | grep "$KEYWORD" | head -n 1 || true)"
if [ -z "$MATCH" ]; then
  echo "task not found: $KEYWORD" >&2
  exit 1
fi

if [ "$MODE" = "path" ]; then
  echo "$MATCH"
  exit 0
fi

echo "Task directory:"
echo "  $MATCH"
echo

echo "Files:"
for file in TASK.md PLAN.md VERIFY.md REVIEW.md; do
  if [ -f "$MATCH/$file" ]; then
    echo "  - $file"
  fi
done

echo
if [ -f "$MATCH/TASK.md" ]; then
  echo "Status:"
  grep -E '^- Status:' "$MATCH/TASK.md" | sed 's/^/  /' || true
fi
