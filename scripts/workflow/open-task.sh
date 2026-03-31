#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "$0")/../.." && pwd)"
KEYWORD="${1:-}"
if [ -z "$KEYWORD" ]; then
  echo "usage: $0 <task-id-or-keyword>" >&2
  exit 1
fi
MATCH="$(find "$ROOT_DIR/.workflow/tasks" -mindepth 1 -maxdepth 1 -type d | grep "$KEYWORD" | head -n 1 || true)"
if [ -z "$MATCH" ]; then
  echo "task not found: $KEYWORD" >&2
  exit 1
fi
echo "$MATCH"
