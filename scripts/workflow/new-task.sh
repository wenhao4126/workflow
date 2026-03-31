#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "$0")/../.." && pwd)"
TASK_NAME=""
CUSTOM_SLUG=""

while [ "$#" -gt 0 ]; do
  case "$1" in
    --slug)
      CUSTOM_SLUG="${2:-}"
      shift 2
      ;;
    *)
      TASK_NAME="$1"
      shift
      ;;
  esac
done

if [ -z "$TASK_NAME" ]; then
  echo "usage: $0 [--slug custom-slug] \"task name\"" >&2
  exit 1
fi
TASK_ID="$(date +%Y%m%d-%H%M%S)"
if [ -n "$CUSTOM_SLUG" ]; then
  TASK_SLUG="$CUSTOM_SLUG"
else
  TASK_SLUG="$(printf '%s' "$TASK_NAME" | tr '[:upper:]' '[:lower:]' | sed 's/[^[:alnum:]]\+/-/g; s/^-//; s/-$//')"
fi
TASK_DIR="$ROOT_DIR/.workflow/tasks/${TASK_ID}-${TASK_SLUG}"
mkdir -p "$TASK_DIR"
CREATED_AT="$(date '+%Y-%m-%d %H:%M:%S')"
for tpl in TASK PLAN VERIFY REVIEW; do
  sed \
    -e "s/{{TASK_NAME}}/$TASK_NAME/g" \
    -e "s/{{TASK_ID}}/$TASK_ID/g" \
    -e "s/{{CREATED_AT}}/$CREATED_AT/g" \
    "$ROOT_DIR/.workflow/templates/${tpl}.md" > "$TASK_DIR/${tpl}.md"
done
printf '%s\n' "$TASK_DIR"
