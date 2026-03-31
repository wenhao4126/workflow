#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "$0")/../.." && pwd)"
TASK_NAME=""
CUSTOM_SLUG=""
TASK_STATUS="open"
OUTPUT_JSON="0"

while [ "$#" -gt 0 ]; do
  case "$1" in
    --slug)
      CUSTOM_SLUG="${2:-}"
      shift 2
      ;;
    --status)
      TASK_STATUS="${2:-}"
      shift 2
      ;;
    --json)
      OUTPUT_JSON="1"
      shift
      ;;
    *)
      TASK_NAME="$1"
      shift
      ;;
  esac
done

if [ -z "$TASK_NAME" ]; then
  echo "usage: $0 [--slug <slug>] [--status <status>] [--json] \"task name\"" >&2
  exit 1
fi

case "$TASK_STATUS" in
  open|closed)
    ;;
  *)
    echo "invalid status: $TASK_STATUS" >&2
    exit 1
    ;;
esac

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
sed -i "s/^- Status: open/- Status: $TASK_STATUS/" "$TASK_DIR/TASK.md"

if [ "$OUTPUT_JSON" = "1" ]; then
  printf '{"path":"%s","id":"%s","slug":"%s","status":"%s","name":"%s"}\n' \
    "$TASK_DIR" "$TASK_ID" "$TASK_SLUG" "$TASK_STATUS" "$TASK_NAME"
else
  printf '%s\n' "$TASK_DIR"
fi
