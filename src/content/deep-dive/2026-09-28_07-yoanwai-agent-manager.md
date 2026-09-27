---
title: "YoanWai/agent-manager"
date: "2026-09-28"
generated: "2026-09-28 07:00"
source: "GitHub"
slug: "2026-09-28_07-yoanwai-agent-manager"
summary: "agent-manager 是面向同时运行多个 AI 编码代理的 Go 终端工作台。它不替代 Claude Code、Codex、OpenCode、Hermes 等既有客户端，而以薄封装复用用户原有登录、订阅、配置和 MCP 服务；每个代理驻留于独立 tmux 会话。它针对的痛点不是模型能力，而是多任务时频繁切换终端、遗漏待确认会话、上下文中断与代码审阅割裂。批次快照为 526 stars、55 forks、当日新增 18；查询时仓库 API 与前两项一致。"
---

# YoanWai/agent-manager

## 定位与痛点剖析

agent-manager 是面向同时运行多个 AI 编码代理的 Go 终端工作台。它不替代 Claude Code、Codex、OpenCode、Hermes 等既有客户端，而以薄封装复用用户原有登录、订阅、配置和 MCP 服务；每个代理驻留于独立 tmux 会话。它针对的痛点不是模型能力，而是多任务时频繁切换终端、遗漏待确认会话、上下文中断与代码审阅割裂。批次快照为 526 stars、55 forks、当日新增 18；查询时仓库 API 与前两项一致。

## 核心架构与技术细节

入口负责子命令与 Bubble Tea 界面；`internal/tmux` 管理名为 `agentmgr` 的私有 tmux 服务，`internal/store` 用 SQLite 保存会话、任务、文件预约和审阅状态，`internal/status` 每两秒解析窗格输出，Claude Code 则优先读取 Hook 事件。内置工具规则集中在 `internal/config`，避免旧配置冻结适配逻辑。内嵌 MCP 服务允许代理创建、读取、等待和消息通知其他会话；独立 Git worktree 隔离修改，审阅器支持整文件差异、行级批注并把意见送回原代理。

## 竞品对比与生态站位

它位于“裸 tmux”与浏览器编排平台之间：保留本地终端、既有 CLI 和持久会话，同时补齐状态树、快捷提示与审阅闭环。项目方对比页称，相比 claude-squad、agent-deck、Agent of Empires 和 Vibe Kanban，其差异是无需离开终端即可把行级意见回传代理；但也明确承认尚无成本追踪和自动开 PR，后两类能力由部分竞品提供。因此其优势偏交互摩擦和多 CLI 兼容，而非完整项目管理或云端控制台。

## 开发者反馈与局限性

真实反馈显示适配层仍受上游终端界面变化牵制：issue #573 报告 OpenCode 工作中被误判为空闲，修复已由 PR #608 合入；开放的 #594 仍记录宽窗格侧栏污染回复与提示抽取。#592 指出 Hermes 的排队消息会被当作回复，#628 则统计默认终端字体缺少大量界面符号。功能边界也清晰：需要 tmux，原生 Windows 不支持而依赖 WSL2；成本统计缺席，SSH 多机管理仍停留在开放 PR #552。高频发布虽响应快，也意味着状态规则维护负担持续存在。

## 附带链接

- [GitHub 仓库](https://github.com/YoanWai/agent-manager)
- [官方文档](https://agent-manager.dev/docs/)
- [官方竞品对比](https://agent-manager.dev/compare/)
- [OpenCode 状态误判 #573](https://github.com/YoanWai/agent-manager/issues/573)
- [宽窗格解析问题 #594](https://github.com/YoanWai/agent-manager/issues/594)
- [Hermes 回复抽取问题 #592](https://github.com/YoanWai/agent-manager/issues/592)
- [SSH 多机管理 PR #552](https://github.com/YoanWai/agent-manager/pull/552)
- [最新发布 v0.39.0](https://github.com/YoanWai/agent-manager/releases/tag/v0.39.0)
