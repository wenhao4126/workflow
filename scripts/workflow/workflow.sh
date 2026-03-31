#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CMD="${1:-}"
shift || true
case "$CMD" in
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
    cat <<'USAGE'
usage: workflow.sh <command>

commands:
  init                初始化 .workflow 目录
  new "task name"     创建任务
  list                列出任务
  open <keyword>      打开任务目录
  status <keyword>    查看任务状态
  close <keyword>     关闭任务
USAGE
    exit 1
    ;;
esac
