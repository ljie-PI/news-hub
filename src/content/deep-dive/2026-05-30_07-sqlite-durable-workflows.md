---
title: "SQLite Durable Workflows 深度解读"
date: "2026-05-30"
generated: "2026-05-30 07:00"
source: "HN"
slug: "2026-05-30_07-sqlite-durable-workflows"
summary: "Durable Execution（持久化执行）正在成为 AI agent 与长流程后端的主流架构。Temporal 用独立集群存储 workflow history，DBOS 则提出 \"Postgres is all you need\"，把 workfl"
---

---
title: "SQLite Durable Workflows 深度解读"
date: "2026-05-30"
generated: "2026-05-30 07:00"
source: "Hacker News"
slug: "sqlite-durable-workflows"
---

# SQLite Durable Workflows 深度解读

## 背景：从 "Postgres is all you need" 到 SQLite

Durable Execution（持久化执行）正在成为 AI agent 与长流程后端的主流架构。Temporal 用独立集群存储 workflow history，DBOS 则提出 "Postgres is all you need"，把 workflow 状态直接写进你已经在用的 Postgres，用同一个事务保证 step 结果与业务写入的 exactly-once。Obelisk 团队这篇文章把这条路线再往前推了一步：对相当大一类系统而言，**SQLite 就够了**。

## 核心论点

文章的关键洞察是把"durable"重新拆解：需要持久化的是 **workflow 状态**（执行日志、replay 历史、activity 重试记录），而 compute 本身可以是廉价、可丢弃的。既然如此，就没必要为了保存这点状态而引入一个独立的数据库服务、网络跳数与额外的控制面。SQLite 提供事务性持久化、零运维、无网络延迟，本地文件就是最合适的"机械量级"。

Obelisk 的架构正好契合这个模型：workflow 进度存在 execution log 里，崩溃后从持久化历史 replay，activity 可重试。一个 SQLite 文件同时承担运行时状态、本地 debug、replay 三种角色。

## Litestream 解决可移植性

单机 SQLite 的传统痛点是备份与迁移。文章给出的方案是 [Litestream](https://litestream.io/)：异步把 SQLite 变更流式复制到 S3 兼容对象存储。配合一个 observer 服务，可以按需把"有趣的"数据库拉下来检查。

作者诚实指出 caveat：Litestream 是**异步复制**，如果本地卷在最新写入被推送前丢失，restore 会丢一小段尾部数据。这不是高可用共享数据库，但对于 AI 实验、agent 工作流这种 bursty、可重跑的负载完全够用。

## 与 Temporal / DBOS 的对比定位

- **Temporal**：外部 orchestrator，独立集群 + Cassandra/MySQL/Postgres 存 history，运维重但 HA 与多租户成熟。
- **DBOS**：嵌入式库，复用业务 Postgres，step 与业务写入同事务，天然 exactly-once，适合已有 Postgres 的团队。
- **Obelisk + SQLite + Litestream**：进一步把数据库下沉为本地文件，每个 agent / tenant 一个独立 SQLite，故障隔离最好，单位成本最低。

三者其实是同一光谱上的三档：**外置集群 → 共享 Postgres → 每租户本地 SQLite**。粒度越细，HA 越弱，但隔离性、成本、可观测性越好。

## 适合谁，不适合谁

文章明确指出 SQLite 模式特别适合 **AI agents 与 AI 生成的 workflow**：bursty、实验性强、每个 agent 状态体量小且互相独立。一队微型 VM/容器，每个挂一个 SQLite + 对象存储备份，比一个常驻大集群更便宜、更易调试。

当需要更高可用性、跨节点共享状态、或不接受异步复制语义时，Obelisk 也支持 Postgres 后端，应按需切换。

## 评价

这是一篇方向正确的"做减法"文章。它没有否定 Temporal/DBOS，而是指出：**绝大多数 workflow 系统在 day 1 不需要那么多基础设施**。结合 Gunnar Morling 近期 "Building a Durable Execution Engine With SQLite" 一文，可以看出 SQLite + Litestream 正在形成一种新的轻量级 durable execution 范式——尤其在 agent 时代，per-tenant 嵌入式持久化可能才是默认值。

值得关注：异步复制的数据丢失窗口在生产 agent 场景的真实代价、以及多 SQLite 实例的全局可观测性如何收敛。
