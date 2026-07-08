---
title: "TencentCloud/TencentDB-Agent-Memory"
date: "2026-07-09"
generated: "2026-07-09 07:00"
source: "GitHub"
slug: "2026-07-09_07-tencentdb-agent-memory"
summary: "TencentDB Agent Memory 由腾讯云开源，定位为 AI Agent 的「完全本地化长期记忆」，通过四层渐进式管线实现，宣称零外部 API 依赖。它针对两类痛点：长任务"
---

# TencentCloud/TencentDB-Agent-Memory

## 定位与痛点剖析
TencentDB Agent Memory 由腾讯云开源，定位为 AI Agent 的「完全本地化长期记忆」，通过四层渐进式管线实现，宣称零外部 API 依赖。它针对两类痛点：长任务中冗长工具日志爆炸式消耗 token，以及跨会话时需反复向 Agent 重述 SOP 与项目背景。README 宣称接入 OpenClaw 后 token 最多降 61.38%、通过率相对提升 51.52%、PersonaMem 准确率由 48% 升至 76%（自报口径）。

## 核心架构与技术细节
架构建立在两大支柱：记忆分层与符号化记忆。长期侧构建 L0 Conversation → L1 Atom → L2 Scenario → L3 Persona 语义金字塔，底层存数据库、上层存可读 Markdown，保证从抽象回溯到证据的可追溯路径。短期侧用 Mermaid 符号图承载任务状态，将完整日志 offload 到外部文件，仅在上下文保留轻量画布，靠 `node_id` 回溯。本地后端为 SQLite + sqlite-vec，检索用 BM25 + 向量 + RRF 混合。

## 竞品对比与生态站位
相较 Mem0、Zep 等以扁平向量库为主的记忆方案，本项目主打「拒绝扁平存储」的分层与符号化，强调白盒可调试与无损回溯。生态上以 OpenClaw 插件与 Hermes Gateway 适配器双形态交付，并规划 MCP、Dify 适配器（PR #431），站位为本地优先、可审计的 Agent 记忆中间件，背靠腾讯云 LKE 与 DeepSeek-V3.2 默认模型。

## 开发者反馈与局限性
仓库近期 PR 高度集中于健壮性修复，暴露真实短板：#435、#432、#429 反复处理 FTS5 查询算子的转义与注入；#428 加固 supervisor 抵御注入与路径穿越；#426 增加 CI 拒绝非法 UTF-8 与乱码回归；#430 将被内容过滤的抽取判为失败；#424 对远程 embedding 批量请求限流。这些说明本地检索的查询解析与编码兼容性仍在打磨，协议亦标注为 NOASSERTION。

## 附带链接
- GitHub: https://github.com/TencentCloud/TencentDB-Agent-Memory
