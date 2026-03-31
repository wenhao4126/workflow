# Workflow Toolkit

![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)
![Release](https://img.shields.io/github/v/release/wenhao4126/workflow?display_name=tag)
![Shell](https://img.shields.io/badge/shell-bash-89e051)

一个独立的、基于文件系统的 workflow 工具链仓库。

An independent, file-system-based workflow toolkit repository.

它用于：
- 初始化 workflow 目录结构
- 创建任务
- 查看任务列表
- 查询任务状态
- 关闭任务

It is used to:
- initialize workflow directory structure
- create tasks
- list tasks
- inspect task status
- close tasks

## 目录结构 / Project Structure

```text
.
├── .workflow/
│   ├── README.md
│   ├── templates/
│   │   ├── TASK.md
│   │   ├── PLAN.md
│   │   ├── VERIFY.md
│   │   └── REVIEW.md
│   └── tasks/
├── scripts/
│   ├── lint-shell.sh
│   └── workflow/
│       ├── workflow.sh
│       ├── init-workflow-templates.sh
│       ├── new-task.sh
│       ├── open-task.sh
│       ├── list-tasks.sh
│       ├── close-task.sh
│       └── task-status.sh
└── docs/
    └── plans/
```

## 快速开始 / Quick Start

### 1. 初始化 workflow 目录 / Initialize workflow directory

```bash
bash scripts/workflow/workflow.sh init
```

### 2. 创建任务 / Create a task

```bash
bash scripts/workflow/workflow.sh new "实现 README 改进"
```

### 3. 查看任务列表 / List tasks

```bash
bash scripts/workflow/workflow.sh list
```

### 4. 查看任务状态 / Check task status

```bash
bash scripts/workflow/workflow.sh status "实现 README 改进"
```

### 5. 关闭任务 / Close a task

```bash
bash scripts/workflow/workflow.sh close "实现 README 改进"
```

## 一个完整示例 / Full Example

```bash
# 初始化 / init
bash scripts/workflow/workflow.sh init

# 创建任务 / create a task
bash scripts/workflow/workflow.sh new "添加 main 分支切换说明"

# 查看列表 / list tasks
bash scripts/workflow/workflow.sh list

# 查看状态 / check status
bash scripts/workflow/workflow.sh status "添加 main 分支切换说明"

# 关闭任务 / close task
bash scripts/workflow/workflow.sh close "添加 main 分支切换说明"
```

## 设计原则 / Design Principles

- 独立于任务卡片系统 / Independent from the task-card system
- 使用纯 Bash + Markdown / Uses plain Bash + Markdown
- 任务数据默认保存在 `.workflow/tasks/` / Task runtime data is stored in `.workflow/tasks/`
- 运行时任务目录默认不提交到 Git / Runtime task directories are ignored by Git by default

## 当前命令 / Available Commands

```bash
bash scripts/workflow/workflow.sh help
bash scripts/workflow/workflow.sh version
bash scripts/workflow/workflow.sh doctor
bash scripts/workflow/workflow.sh init
bash scripts/workflow/workflow.sh new "任务名"
bash scripts/workflow/workflow.sh list
bash scripts/workflow/workflow.sh open "关键词"
bash scripts/workflow/workflow.sh status "关键词"
bash scripts/workflow/workflow.sh close "关键词"
```

## Shell 检查 / Shell Lint

```bash
bash scripts/lint-shell.sh
```

如果本机没有安装 `shellcheck`，脚本会给出提示而不是直接失败。

If `shellcheck` is not installed, the script will print a hint instead of failing hard.

## Demo / 演示

静态演示素材说明位于：
- `docs/demo/README-demo.txt`
- `docs/demo/workflow-demo.png`

![Workflow Demo](docs/demo/workflow-demo.png)

A placeholder for static demo assets is available at:
- `docs/demo/README-demo.txt`
- `docs/demo/workflow-demo.png`
