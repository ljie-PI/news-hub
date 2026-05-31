---
title: "colbymchenry-codegraph"
date: "2026-06-01"
generated: "2026-06-01 07:00"
source: "GitHub"
slug: "2026-06-01_07-colbymchenry-codegraph"
---

---
title: "colbymchenry/codegraph"
date: "2026-06-01"
source: "GitHub"
slug: "colbymchenry-codegraph"
---

## 定位与痛点

CodeGraph 是一款面向 AI 编码代理（Claude Code、Cursor、Codex、OpenCode、Gemini、Antigravity、Kiro、Hermes Agent 等）的"预索引代码知识图谱"MCP server。它要解决的痛点非常具体：当下 agent 每接到任务都会派生 Explore 子 agent，用 grep / glob / Read 反复扫描代码，导致 token 爆炸、tool call 次数高、响应慢。CodeGraph 将仓库符号、调用边、FTS5 全文检索预先构建到本地 SQLite，agent 只需一次 MCP 工具调用即可拿到入口点+相关符号+片段。官方基准（Opus 4.8，4 次中位）显示平均省 25% 成本、57% token、23% 时间、62% tool calls，本周新增 15,909 stars，已达 34.5k。

## 架构与技术

核心是本地优先架构：纯 SQLite（`node:sqlite` + WAL）存储符号与边，零外部服务、无 API key、不上传数据。监听层使用原生 FSEvents / inotify / ReadDirectoryChangesW，2 秒去抖动（可调 `CODEGRAPH_WATCH_DEBOUNCE_MS`），在 debounce 窗口内对每个文件挂"⚠️ 过期 banner"，提示 agent 直接 Read。连接时还会做 catch-up sync 弥补离线期间的改动。框架感知能力覆盖 14 种路由框架（Django、Flask、FastAPI、Express、NestJS、Laravel、Rails、Spring、Gin/chi、Axum/Actix/Rocket、ASP.NET、Vapor、React Router/SvelteKit），并专门处理 iOS/RN/Expo 桥接（`@objc`、`RCT_EXPORT_METHOD`、TurboModules、Fabric/Paper）。MCP 工具包含 search、context、trace、callers、callees、impact、node、explore、files、status 共十个；小于 150 文件的项目仅暴露 5 个核心工具以节省 prompt。

## 竞品对比

与 Sourcegraph、SCIP、ctags 等传统索引相比，CodeGraph 专为 LLM agent 工作流设计——返回结构是"代码上下文 + 关系图"而非通用 LSP；与 Lum1104/Understand-Anything 互补，后者侧重可视化教学，CodeGraph 侧重后台高效检索。相比 Cursor 内置的代码索引，它跨 agent 通用且完全本地。捆绑 Node 运行时省去 native build 是相对 tree-sitter 类 CLI 的工程优势。

## 反馈与局限

讨论焦点：Objective-C 仅 partial 支持、动态语言（Python/Ruby）的调用图精度受限于静态分析；大型 monorepo 首轮索引耗时较长；与 agent 端权限模型需手工配置 `mcp__codegraph__*` allow list。基准虽亮眼但来自作者自测，社区独立复现仍少。MIT 协议、CI hook（`codegraph affected`）和库化 API（`@colbymchenry/codegraph`）让它具备团队基建潜质。

## 链接

- 仓库：https://github.com/colbymchenry/codegraph
