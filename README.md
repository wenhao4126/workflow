# Workflow Toolkit

一个独立的、基于文件系统的 workflow 工具链仓库。

它用于：
- 初始化 workflow 目录结构
- 创建任务
- 查看任务列表
- 查询任务状态
- 关闭任务

## 目录结构

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

## 快速开始

### 1. 初始化 workflow 目录

```bash
bash scripts/workflow/workflow.sh init
```

### 2. 创建任务

```bash
bash scripts/workflow/workflow.sh new "实现 README 改进"
```

### 3. 查看任务列表

```bash
bash scripts/workflow/workflow.sh list
```

### 4. 查看任务状态

```bash
bash scripts/workflow/workflow.sh status "实现 README 改进"
```

### 5. 关闭任务

```bash
bash scripts/workflow/workflow.sh close "实现 README 改进"
```

## 一个完整示例

```bash
# 初始化
bash scripts/workflow/workflow.sh init

# 创建任务
bash scripts/workflow/workflow.sh new "添加 main 分支切换说明"

# 查看列表
bash scripts/workflow/workflow.sh list

# 查看状态
bash scripts/workflow/workflow.sh status "添加 main 分支切换说明"

# 关闭任务
bash scripts/workflow/workflow.sh close "添加 main 分支切换说明"
```

## 设计原则

- 独立于任务卡片系统
- 使用纯 Bash + Markdown
- 任务数据默认保存在 `.workflow/tasks/`
- 运行时任务目录默认不提交到 Git（由 `.gitignore` 控制）

## 当前命令

```bash
bash scripts/workflow/workflow.sh init
bash scripts/workflow/workflow.sh new "任务名"
bash scripts/workflow/workflow.sh list
bash scripts/workflow/workflow.sh open "关键词"
bash scripts/workflow/workflow.sh status "关键词"
bash scripts/workflow/workflow.sh close "关键词"
```
