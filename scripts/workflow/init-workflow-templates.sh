#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "$0")/../.." && pwd)"
mkdir -p "$ROOT_DIR/.workflow/templates" "$ROOT_DIR/.workflow/tasks"
echo "workflow templates ready: $ROOT_DIR/.workflow"
