# Changelog

All notable changes to this project will be documented in this file.

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
