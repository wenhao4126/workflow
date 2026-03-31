#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"
VERSION="0.1.5"
CMD="${1:-help}"
shift || true

doctor_check() {
  local missing=0
  local path
  for path in \
    "$ROOT_DIR/.workflow" \
    "$ROOT_DIR/.workflow/templates" \
    "$ROOT_DIR/scripts/workflow" \
    "$ROOT_DIR/.workflow/templates/TASK.md" \
    "$ROOT_DIR/.workflow/templates/PLAN.md" \
    "$ROOT_DIR/.workflow/templates/VERIFY.md" \
    "$ROOT_DIR/.workflow/templates/REVIEW.md"
  do
    if [ -e "$path" ]; then
      echo "OK   $path"
    else
      echo "MISS $path"
      missing=1
    fi
  done

  if command -v shellcheck >/dev/null 2>&1; then
    echo "OK   shellcheck: $(command -v shellcheck)"
  else
    echo "WARN shellcheck: not found"
  fi

  if [ -f "$ROOT_DIR/.github/workflows/shellcheck.yml" ]; then
    echo "OK   github action: $ROOT_DIR/.github/workflows/shellcheck.yml"
  else
    echo "WARN github action: shellcheck workflow missing"
  fi

  if [ "$missing" -eq 0 ]; then
    echo "doctor: workflow toolkit looks healthy"
  else
    echo "doctor: missing required files"
    exit 1
  fi
}

show_help() {
  cat <<'USAGE'
usage: workflow.sh <command> [options]

commands:
  help                                        显示帮助
  version                                     显示版本
  doctor                                      检查 workflow 目录结构
  init                                        初始化 .workflow 目录
  new [--slug <slug>] [--status <status>] [--json] "task name"
  list [--status <status>] [--json|--pretty|--plain]
  open [--path|--json|--detail|--pretty|--plain] <task-id-or-keyword>
  status [--json] <task-id-or-keyword>
  close [--json] <task-id-or-keyword>
USAGE
}

case "$CMD" in
  help)
    show_help
    ;;
  version)
    echo "$VERSION"
    ;;
  doctor)
    doctor_check
    ;;
  init)
    exec "$SCRIPT_DIR/init-workflow-templates.sh" "$@"
    ;;
  new)
    exec "$SCRIPT_DIR/new-task.sh" "$@"
    ;;
  list)
    exec "$SCRIPT_DIR/list-tasks.sh" "$@"
    ;;
  open)
    exec "$SCRIPT_DIR/open-task.sh" "$@"
    ;;
  status)
    exec "$SCRIPT_DIR/task-status.sh" "$@"
    ;;
  close)
    exec "$SCRIPT_DIR/close-task.sh" "$@"
    ;;
  *)
    show_help
    exit 1
    ;;
esac
