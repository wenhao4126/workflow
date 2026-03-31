# Workflow Polish Design

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Polish the standalone workflow toolkit with minimal, practical repository improvements.

**Architecture:** Keep the repository simple and file-based. Add repository hygiene files (`LICENSE`, `.editorconfig`), a lightweight shell lint script, bilingual README sections, and a few small CLI enhancements (`help`, `version`, `doctor`) without introducing CI or external dependencies.

**Tech Stack:** Bash, Markdown, plain text configuration

---

## Scope

1. Add MIT license
2. Add `.editorconfig`
3. Add a lightweight shellcheck runner script
4. Expand README to Chinese + English
5. Add `help`, `version`, and `doctor` subcommands to `workflow.sh`

## Constraints

- No CI setup
- No task-card system integration
- No large refactor
- Keep current command behavior backward compatible

## Validation

- `bash scripts/workflow/workflow.sh help`
- `bash scripts/workflow/workflow.sh version`
- `bash scripts/workflow/workflow.sh doctor`
- `bash scripts/lint-shell.sh`
