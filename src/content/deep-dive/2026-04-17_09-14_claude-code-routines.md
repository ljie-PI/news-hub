---
title: "Claude Code Routines：自动化 AI 编程任务的新范式"
date: "2026-04-17"
generated: "2026-04-17 09:00"
source: "HN"
slug: "2026-04-17_09-14_claude-code-routines"
summary: "---"
---

# Claude Code Routines：自动化 AI 编程任务的新范式

> **来源**: code.claude.com/docs/en/routines | **热度**: 709 pts, 405 评论 | **日期**: 2026-04-14

---

## 事件背景

Anthropic 发布了 **Claude Code Routines**（目前处于 research preview 阶段），这是 Claude Code 的重要新功能，允许用户将 Claude Code 的工作配置保存为"Routine"，并通过定时任务、API 调用或 GitHub 事件自动触发执行——完全运行在 Anthropic 管理的云基础设施上，无需用户的电脑保持开机。

这标志着 AI 编程助手从"被动响应"模式演进到"主动自动化"模式，是 AI Agent 落地工程实践的重要一步。

---

## 核心观点/产品机制

**Routine 的构成要素：**
- 一个 Prompt（描述任务）
- 一个或多个代码仓库
- 一组 MCP Connectors（连接外部服务）
- 一个或多个触发器

**三种触发器类型：**

1. **Scheduled（定时）**：类似 cron job，支持每小时、每晚、每周等周期
2. **API（按需）**：向 per-routine 的 HTTPS 端点发送 POST 请求，携带 bearer token 即可触发；支持在请求体中传入 `text` 参数定制任务
3. **GitHub（事件驱动）**：响应 PR 打开、Release 发布等仓库事件自动执行

**官方示例用例：**
- **Backlog 维护**：每晚读取新 Issue，自动打标签、分配 owner，汇总发 Slack
- **告警分类**：监控系统超阈值时自动分析堆栈、关联近期提交、开草稿 PR
- **代码审查**：PR 打开时运行团队自定义 Checklist，留下 inline 评论
- **文档漂移检测**：每周扫描 PR 中修改的 API，自动对文档发起更新 PR

**可用范围**：Pro、Max、Team、Enterprise 计划，需开启 Claude Code on the Web。

---

## 社区热议与争议点

HN 405 条评论讨论深度较高，核心争议围绕以下主题：

1. **"云端 Agentic AI 的信任边界"**：最受关注的问题是：让 AI 自动向你的生产仓库推送代码、自动留评论、自动触发 CD 管道，出错了谁负责？有工程师写道："我非常期待这个功能，但我绝不会在没有人工审核层的情况下让它写入主干。"支持者认为 Routine 的实际操作是可以约束的（只开 Issue 标签，不直接 merge），关键在于 Prompt 设计。

2. **与现有 CI/CD 工具的关系**：多位用户讨论 Routine 与 GitHub Actions、Zapier、n8n 的区别。核心区别在于：Routine 的"大脑"是 Claude，能处理模糊任务、自然语言描述和需要推理的场景，而传统 CI/CD 只能处理显式定义的规则。

3. **定价和用量限制的担忧**：Routines 消耗的是用户的 Claude Code 配额，自动化任务大量运行可能快速耗尽月度限额。有用户希望 Anthropic 提供独立的 Routine 定价方案，类似于 AWS Lambda 的按调用计费。

4. **"Anthropic 托管 vs. 自部署"**：有用户指出将 Agent 运行在 Anthropic 的云基础设施上意味着代码和仓库数据需要离开本地，对于涉及敏感知识产权的企业这是一个合规问题。有人希望未来支持自托管运行时。

---

## 行业影响与未来展望

Claude Code Routines 是 AI 从"工具"向"自动化系统组件"演进的清晰案例。它为软件工程定义了一种新的分工模式：**人负责设计意图，AI 负责持续执行日常重复任务**。

这一功能若成熟，对开发者工具市场（GitHub Actions、linear 等）以及 DevOps 平台的工作流自动化层将构成竞争压力。更长远地看，它为"AI SRE"、"AI Tech Lead"等新型角色的出现奠定了基础设施基础。

---

## 附带链接

- 原文：https://code.claude.com/docs/en/routines
- HN 讨论：https://news.ycombinator.com/item?id=47768133
- 创建 Routines：https://claude.ai/code/routines
