#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

if ! command -v shellcheck >/dev/null 2>&1; then
  echo "shellcheck not found. Please install shellcheck first."
  exit 0
fi

shellcheck "$ROOT_DIR"/scripts/workflow/*.sh
