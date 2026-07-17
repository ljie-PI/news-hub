---
title: "tirth8205/code-review-graph"
date: "2026-07-18"
generated: "2026-07-18 07:00"
source: "GitHub"
slug: "2026-07-18_07-tirth8205-code-review-graph"
summary: "AI 编程工具在做代码审查时，往往会反复重读整个代码库，导致 token 消耗爆炸、成本高企且速度缓慢。`code-review-graph` 主打 \"Stop burning tokens\" —— 一个 l"
---

# tirth8205/code-review-graph

## 定位与痛点剖析

AI 编程工具在做代码审查时，往往会反复重读整个代码库，导致 token 消耗爆炸、成本高企且速度缓慢。`code-review-graph` 主打 "Stop burning tokens" —— 一个 local-first 的代码智能图谱，为 MCP 与 CLI 场景服务。它先为代码库构建结构化地图，再通过 MCP 协议把精确上下文喂给 AI 助手，让模型 "只读该读的部分"。官方基准显示在 6 个真实仓库上实现了 38x 到 528x 的 token 缩减。

## 核心架构与技术细节

项目以 Python 为主（91.6%），配合 TypeScript 的 VS Code 扩展。核心用 [Tree-sitter](https://tree-sitter.github.io/tree-sitter/) 解析源码，抽取 class、function、import、call 等节点构建持久化知识图谱，并支持增量式（incremental）追踪变更，仅重解析改动部分。图谱通过 MCP server 暴露，AI 工具据此按需检索精确上下文，而非全量塞入。新增语言只需在 `parser.py` 的 `EXTENSION_TO_LANGUAGE` 与节点类型映射中扩展即可。

## 竞品对比与生态站位

相比云端 RAG 或 embedding 检索方案，它坚持本地优先、无需向量数据库，走结构化图谱（graphrag）路线，隐私与延迟更优。生态兼容极广：Codex、Claude Code、Cursor、Windsurf、Zed、Continue、OpenCode、Gemini CLI、GitHub Copilot 等主流工具一键 `install` 自动配置，还提供 GitHub Action，站位于 "AI coding 上下文供给层"。

## 开发者反馈与局限性

项目热度极高（19.5k stars、2.1k forks、493 commits、27 个 releases），并有多语言 README 与 Discord 社区。局限在于 Windows 配置易踩坑（需 fastmcp 3.2.4+、避免 `cmd /c` 包装、显式设置 PYTHONUTF8），且基准数据来自自测仓库，实际缩减比因项目结构差异较大。

## 附带链接

- 仓库：https://github.com/tirth8205/code-review-graph
- 官网：https://code-review-graph.com
- PyPI：https://pypi.org/project/code-review-graph/
