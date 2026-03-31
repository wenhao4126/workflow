# Workflow Toolkit Rebuild Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Rebuild a clean standalone workflow toolkit under `/home/wen/projects/workflow`.

**Architecture:** Use a file-based workflow layout with `.workflow/` for templates and task data, plus `scripts/workflow/` for shell command entrypoints. Keep it independent from the task-card system and any workspace-specific automation.

**Tech Stack:** Bash, Markdown, file-system-based task storage

---

### Task 1: Scaffold repository structure
**Files:**
- Create: `.workflow/README.md`
- Create: `.workflow/templates/TASK.md`
- Create: `.workflow/templates/PLAN.md`
- Create: `.workflow/templates/VERIFY.md`
- Create: `.workflow/templates/REVIEW.md`
- Create: `scripts/workflow/workflow.sh`
- Create: `scripts/workflow/init-workflow-templates.sh`
- Create: `scripts/workflow/new-task.sh`
- Create: `scripts/workflow/open-task.sh`
- Create: `scripts/workflow/list-tasks.sh`
- Create: `scripts/workflow/close-task.sh`
- Create: `scripts/workflow/task-status.sh`
- Create: `README.md`

Step 1: Create directories.
Step 2: Create markdown templates.
Step 3: Create shell scripts.
Step 4: Make scripts executable.

### Task 2: Verify core CLI behavior
**Files:**
- Verify: `scripts/workflow/*.sh`

Step 1: Run `bash scripts/workflow/workflow.sh init`.
Step 2: Run `bash scripts/workflow/workflow.sh new "示例任务"`.
Step 3: Run `bash scripts/workflow/workflow.sh list`.
Step 4: Run `bash scripts/workflow/workflow.sh status <task-keyword>`.
Step 5: Run `bash scripts/workflow/workflow.sh close <task-keyword>`.

### Task 3: Prepare for Git publishing
**Files:**
- Create: `.gitignore` (optional later)

Step 1: Review generated task data.
Step 2: Decide whether `.workflow/tasks/` should be committed.
Step 3: Initialize git and push to a dedicated repository when ready.
