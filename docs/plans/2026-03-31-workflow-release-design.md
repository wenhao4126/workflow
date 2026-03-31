# Workflow Release Preparation Design

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Prepare the workflow toolkit for a minimal v0.1.0 release with shell linting, badges, doctor improvements, changelog, and GitHub release metadata.

**Architecture:** Keep repository changes small and practical. Add local tooling and documentation improvements without introducing CI or extra project structure. Use GitHub CLI for release creation.

**Tech Stack:** Bash, Markdown, GitHub CLI, shellcheck

---

## Scope

1. Install shellcheck and run a real lint pass
2. Add simple badges to README
3. Extend `doctor` to report shellcheck availability
4. Add `CHANGELOG.md`
5. Create GitHub release `v0.1.0`

## Constraints

- Follow the requested order strictly
- No CI setup
- No unnecessary repository restructuring
- `doctor` should warn on missing shellcheck rather than hard fail on that check alone

## Validation

- `shellcheck scripts/workflow/*.sh scripts/lint-shell.sh`
- `bash scripts/workflow/workflow.sh doctor`
- `gh release view v0.1.0 --repo wenhao4126/workflow`
