---
title: "safishamsi-graphify"
date: "2026-06-15"
generated: "2026-06-15 07:00"
source: "GitHub"
slug: "2026-06-15_07-safishamsi-graphify"
---

---
title: "safishamsi/graphify 深度解读"
date: "2026-06-15"
generated: "2026-06-15 07:00"
source: "GitHub Deep Dive"
slug: "safishamsi-graphify"
batch: "2026-06-15_07"
---

## 项目简介

Graphify 是 YC S26 孵化的开源项目,定位为一款"AI 编码助手通用 skill"。在 Claude Code、Codex、OpenCode、Cursor、Gemini CLI、GitHub Copilot CLI、Aider、Amp、Devin CLI、Google Antigravity、Hermes 等近 20 种 AI 编程客户端中输入 `/graphify .`,它会扫描整个项目(源码、文档、PDF、图片、视频),构建一个可查询的多模态知识图谱,输出 `graph.html`(交互可视化)、`GRAPH_REPORT.md`(关键概念与建议提问)与 `graph.json`(持久化结构)。Python 3.10+,PyPI 包名 `graphifyy`(双 y)。

## 技术架构

底层结合 **Tree-sitter 静态分析** 与 **LLM 驱动的语义抽取**,再通过 Leiden 社区检测做聚类。可选 extras 极为丰富:PDF/Office/Google Sheets 解析、faster-whisper 视频转写、SQL 与 PostgreSQL 实时反射、Terraform/HCL/BYOND DM AST、Neo4j / FalkorDB 后端推送、MCP stdio 服务、Ollama 本地推理及 OpenAI/Gemini/Anthropic/Bedrock/Azure 多后端。设计上以 PreToolUse hook + AGENTS.md 把图谱自动嵌入助手上下文,让 LLM 用"查图"替代"grep 全仓"。

## 同类对比

CodeSee 与 Sourcegraph 偏向 Web 平台的代码地图与搜索;GitLens 聚焦 Git 历史可视化;Aider 内置的 repomap 仅生成精简 tree 提示。Graphify 的差异点在于:**跨 18+ AI 客户端的统一 skill 协议**、**多模态(代码+文档+音视频)**、以及**可持久化、可增量、可推送到 Neo4j 的图数据**。它不是 IDE 插件,而是"AI 助手层"的标准化抽象。

## 社区反应

一周新增 5478 stars,累计达 66.8k(SkillsLLM 数据)。爆点来自 Jack Roberts(22.3 万订阅)6 月 8 日视频 *"Claude Code + Graphify = Insane Agentic OS"*,数日内 3.76 万播放。核心叙事:**省 token、跨会话共享"大脑"**——Claude Code 不再每次重读仓库,显著降低成本与延迟。Reddit r/claude 的 "2026 最佳 Skills" 帖将其列入必装名单。

## 未来走向

随着 Anthropic Agent Skills 规范被 Codex CLI、Cursor、Gemini CLI、Copilot 共同采纳,Graphify 已占据"代码理解层"的事实标准生态位。下一步看点:与 Hermes 等 agentic OS 的深度集成、MCP 化的远程图谱服务、以及 Neo4j/FalkorDB 后端的企业版商业化路径。
