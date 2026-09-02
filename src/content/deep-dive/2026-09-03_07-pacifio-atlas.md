---
title: "pacifio/atlas"
date: "2026-09-03"
generated: "2026-09-03 07:00"
source: "GitHub"
slug: "2026-09-03_07-pacifio-atlas"
summary: "Atlas 是面向编程代理的本地优先源码控制桌面端，目标不是再造一个聊天框，而是补齐代理改代码后的可追溯性：把提交与会话、提示词、工具调用、推理和文件差异绑定成 checkpoint，并让 Claude Code、Codex、原生代理共享项目记忆。上述能力来自 README 自报；可核验的是仓库默认分支为 `main`、采用 MIT 许可，且代码确有会话数据库、提交关联和差异模块。"
---

# pacifio/atlas

## 定位与痛点剖析

Atlas 是面向编程代理的本地优先源码控制桌面端，目标不是再造一个聊天框，而是补齐代理改代码后的可追溯性：把提交与会话、提示词、工具调用、推理和文件差异绑定成 checkpoint，并让 Claude Code、Codex、原生代理共享项目记忆。上述能力来自 README 自报；可核验的是仓库默认分支为 `main`、采用 MIT 许可，且代码确有会话数据库、提交关联和差异模块。

## 核心架构与技术细节

默认分支清单与架构文档显示，它以 Tauri 2 封装 React 19 前端，状态层用 Zustand/Immer，后端由 Rust、Tokio 和多组 `atlas-*` crate 承担。外部代理通过 ACP 的 JSON-RPC/stdio 子进程接入，原生代理走进程内 Cersei；统一事件管线再广播、捕获、写转录并摄取记忆。checkpoint 落入项目内 SQLite，借助 patch-id 在 amend/rebase 后重连提交。REST 将主语言判为 Rust，语言统计同时证实 TypeScript 占重要部分。

## 竞品对比与生态站位

Superset 官方 README 强调每个代理独占 Git worktree，GitButler则主打并行/堆叠分支、提交改写与撤销；Atlas 当前 README 并未宣称为每个代理自动隔离工作树，其差异点是跨代理记忆与“提交为何产生”的长期谱系。故它更像代理时代的审计与上下文层，而非纯并行任务调度器；MIT 许可也比两者当前的限制性源码许可更宽松。

## 开发者反馈与局限性

README 明示长尾 ACP 代理仍在持续测试，正式支持仅 macOS，Linux/Windows 同源可编译但未测试。开放的 issue #80 由协作者列出 MCP 尚需重启生效、偏 stdio、缺少 ACP 转发及健康诊断。已关闭的 bug #160 曾报告 OpenCode/Cursor/Kilo 被标成内置却静默启动失败；维护者评论确认 #161 加入按平台自动下载、进度和登录处理，说明问题已修而非现存缺陷，也反映 alpha 阶段接口仍快速演进。

## 附带链接

- [GitHub Repo](https://github.com/pacifio/atlas)
- [官网](https://www.tryatlas.cc/)
- [官方文档](https://docs.tryatlas.cc/)
- [Issue #80](https://github.com/pacifio/atlas/issues/80) · [Issue #160 与修复说明](https://github.com/pacifio/atlas/issues/160)
