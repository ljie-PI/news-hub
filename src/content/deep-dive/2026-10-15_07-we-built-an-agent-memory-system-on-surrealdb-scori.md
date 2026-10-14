---
title: "We built an agent memory system on SurrealDB, scoring 77.2% on BEAM"
date: "2026-10-15"
generated: "2026-10-15 07:00"
source: "Reddit"
slug: "2026-10-15_07-we-built-an-agent-memory-system-on-surrealdb-scori"
summary: "SurrealDB 创始人 Tobie 在 10 月 14 日发布 Agent Memory：把跨会话对话、文档与结构化数据变成可查询记忆。标题中的 77.2% 是厂商在 BEAM 1M 上的运行自报，并非独立复现或同协议排行榜结论。"
---

# We built an agent memory system on SurrealDB, scoring 77.2% on BEAM

## 事件背景
SurrealDB 创始人 Tobie 在 10 月 14 日发布 Agent Memory：把跨会话对话、文档与结构化数据变成可查询记忆。标题中的 77.2% 是厂商在 BEAM 1M 上的运行自报，并非独立复现或同协议排行榜结论。

## 核心观点 / 产品机制
产品把实体、属性、关系、向量、原文与检索轨迹放进同一 SurrealDB 数据层；事实携带来源、原文位置和置信度，新事实通过 supersession 关闭旧事实而不覆盖。system、known、valid 三种时间支持当前态与 as-of 查询；检索融合向量、BM25、图关系等信号。厂商对 35 段会话、700 题自报 mean 77.2：rubric 的 0、0.5、1 均计入平均；strict 57.1 仅统计所有 rubric 项全对的问题。该运行启用十项非默认检索/聊天设置，用 Gemini 3.8 Flash 作答、Gemini 3.5 Flash Lite 裁判，且 event ordering 仅 49.7、70 题中仅 1 题全对，均属厂商口径。记忆层目前闭源；harness 在私有仓库，精确命令未记录、尚未公开。

## 社区热议与争议点
本次 RSS 返回 22 个 entry：主帖 1、评论 21；仅是可见子集，AutoModerator 不计观点。WryPheasant 认可保留旧事实的时间追踪；QuanTradin 追问无日期的“我现在住哪”会否误取旧值；Ctbhatia 质疑当前态过滤与 as-of 查询如何分流；Polynice-Elcia 追问跨对话实体合并。Tobie 回应会先判断问题的时间基准，并以三类时间过滤图；实体则倾向连接而非删除——这些是作者口径，不是独立验证。

## 行业影响与未来展望
它把 agent memory 从“向量库加聊天记录”推进为带来源、状态演化和审计轨迹的数据层，方向值得关注。但 77.2 与其他系统因回答模型、裁判、检索预算和排序规则不同不能直接排位。能否证明优势，仍取决于公开 harness、复现命令、默认配置成绩，以及针对事实过期、实体合并和事件排序的独立测试。

## 附带链接
- [Reddit 原帖](https://www.reddit.com/r/AI_Agents/comments/1x605lz/we_built_an_agent_memory_system_on_surrealdb/)
- [官方发布文](https://surrealdb.com/blog/introducing-surrealdb-agent-memory)
- [官方文档](https://surrealdb.com/docs/agent-memory)
- [BEAM 明细](https://surrealdb.com/agent-memory/benchmarks)
- [BEAM 论文](https://arxiv.org/abs/2510.27246)
