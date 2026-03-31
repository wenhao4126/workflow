#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"
VERSION="0.1.0"
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

  if [ "$missing" -eq 0 ]; then
    echo "doctor: workflow toolkit looks healthy"
  else
    echo "doctor: missing required files"
    exit 1
  fi
}

show_help() {
  cat <<'USAGE'
usage: workflow.sh <command>

commands:
  help                显示帮助
  version             显示版本
  doctor              检查 workflow 目录结构
  init                初始化 .workflow 目录
  new "task name"     创建任务
  list                列出任务
  open <keyword>      打开任务目录
  status <keyword>    查看任务状态
  close <keyword>     关闭任务
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
