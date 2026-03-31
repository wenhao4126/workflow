# Changelog

All notable changes to this project will be documented in this file.
## [v0.1.5] - 2026-03-31

### Changed
- Unified CLI help and usage wording across `workflow.sh`, `new`, `list`, `open`, `status`, and `close`
- Ignored local `TASK_CURRENT.md` task tracking file in `.gitignore`
## [v0.1.4] - 2026-03-31

### Added
- Added `--json` output to `workflow.sh new`
- Added `--pretty` and `--plain` output modes to `workflow.sh open`
- Added `--pretty` and `--plain` output modes to `workflow.sh list`
- Added real PNG demo asset at `docs/demo/workflow-demo.png`

### Changed
- Promoted new CLI flags into the documented `workflow.sh` entrypoint
- Extended `doctor` to check `.github/workflows/shellcheck.yml`
- Bumped toolkit version to `0.1.4`

## [v0.1.3] - 2026-03-31

### Added
- Added `--json` output to `workflow.sh open`
- Added `--json` output to `workflow.sh list` for script integration
- Added `--status open|closed` support to `workflow.sh new`
- Added `--status` filtering to `workflow.sh list`
- Added `--detail` mode to `workflow.sh open` to print `TASK.md`
- Added static demo placeholder under `docs/demo/`

### Changed
- Bumped toolkit version to `0.1.3`

## [v0.1.2] - 2026-03-31

### Added
- Added `--path` mode to `workflow.sh open` for script-friendly path-only output
- Added lightweight table-style output for `workflow.sh list`
- Added `--slug <value>` support to `workflow.sh new`
- Added GitHub Actions workflow for automatic shellcheck on push and pull request

### Changed
- Improved default `open` summary output while keeping shell usage practical
- Bumped toolkit version to `0.1.2`

## [v0.1.1] - 2026-03-31

### Changed
- Improved `workflow.sh open` output to show task directory, available files, and status summary
- Bumped toolkit version to `0.1.1`

## [v0.1.0] - 2026-03-31

### Added
- Rebuilt standalone workflow toolkit under `/home/wen/projects/workflow`
- Added `.workflow` templates and task storage layout
- Added workflow shell commands: `init`, `new`, `list`, `open`, `status`, `close`
- Added `help`, `version`, and `doctor` subcommands to `workflow.sh`
- Added MIT `LICENSE`
- Added `.editorconfig`
- Added `scripts/lint-shell.sh` for local shell linting
- Added bilingual Chinese/English `README.md`
- Added project planning docs under `docs/plans/`

### Changed
- Renamed default working branch from `master` to `main`
- Improved doctor output to include shellcheck availability

### Fixed
- Fixed shellcheck warnings in `close-task.sh` and `task-status.sh`
