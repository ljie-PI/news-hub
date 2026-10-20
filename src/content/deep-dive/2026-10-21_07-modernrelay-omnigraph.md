---
title: "ModernRelay/omnigraph"
date: "2026-10-21"
generated: "2026-10-21 07:00"
source: "GitHub"
slug: "2026-10-21_07-modernrelay-omnigraph"
summary: "Omnigraph 是面向长时运行智能体的 Rust 类型化属性图数据库：把共享世界模型、向量近邻、全文检索、图遍历和版本历史放进同一数据层，减少代理记忆漂移。分支隔离任务并支持合并审查；`.pg` 模式则在写入时约束节点、边与键。批次快照为 1534 stars、当日新增 173。README 所称“低成本扩展、数据不离开对象存储”属于项目方口径，而非独立测评结论。"
---

# ModernRelay/omnigraph

## 定位与痛点剖析

Omnigraph 是面向长时运行智能体的 Rust 类型化属性图数据库：把共享世界模型、向量近邻、全文检索、图遍历和版本历史放进同一数据层，减少代理记忆漂移。分支隔离任务并支持合并审查；`.pg` 模式则在写入时约束节点、边与键。批次快照为 1534 stars、当日新增 173。README 所称“低成本扩展、数据不离开对象存储”属于项目方口径，而非独立测评结论。

## 核心架构与技术细节

默认分支为 `main`。官方[架构文档](https://github.com/ModernRelay/omnigraph/blob/main/docs/dev/architecture.md)显示，每种节点或边是一个 Lance 数据集；写入先形成不可达的 detached version，再由 `__manifest` 的一次 CAS 同时发布表版本、模式与图谱谱系。编译器解析并检查 `.pg/.gq`，规划器生成执行计划，执行层结合 Lance、DataFusion 与内存拓扑索引。`cluster.yaml` 声明多图、查询及 Cedar 策略，`plan/apply` 收敛部署。README 对统一向量、BM25、遍历及 RRF 运行时的能力描述可由[搜索文档](https://github.com/ModernRelay/omnigraph/blob/main/docs/user/search/index.md)交叉核对。

## 竞品对比与生态站位

[TerminusDB](https://github.com/terminusdb/terminusdb)同样提供知识图谱的分支、合并、时间旅行及混合搜索，版本控制并非 Omnigraph 独有；后者的差异是以 Lance 和对象存储为底座，并把类型化图查询、检索与图级原子发布组合起来。[LanceDB](https://github.com/lancedb/lancedb)更聚焦多模态向量湖仓及成熟集成，Omnigraph则押注可审查的代理共享状态。机制一体，但生态仍年轻。

## 开发者反馈与局限性

近期开放的 [#1095](https://github.com/ModernRelay/omnigraph/issues/1095) 报告清理会先读取全部表版本，超时则零回收；评论在当前 `main` 上复现约两次打开每个已发布版本，但未复现报告中的 S3 延迟。[#1068](https://github.com/ModernRelay/omnigraph/issues/1068) 的评论也复现冷态无分页提交列表会串行读取合并分支历史块。开放 PR [#1096](https://github.com/ModernRelay/omnigraph/pull/1096) 尝试把未知存储结果限制到键或分支，评审已建议待 RFC 接受后合并，说明修复尚未进入发布版。另有 Azure 写入仍属预览、Python SDK 尚未提供等边界。

## 附带链接

- [GitHub 仓库](https://github.com/ModernRelay/omnigraph)
- [官方文档](https://omnigraph.dev)
- [v0.13.0 发布页](https://github.com/ModernRelay/omnigraph/releases/tag/v0.13.0)
