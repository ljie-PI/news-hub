---
title: "pg_durable: Microsoft open sources in-database durable execution"
date: "2026-06-06"
generated: "2026-06-06 07:00"
source: "HN"
slug: "2026-06-06_07-pg-durable-microsoft-open-sources-in-db-durable-execution"
summary: "2026 年 6 月初，微软在 GitHub 上开源了 **pg_durable**——一个把\"持久化工作流执行（durable execution）\"能力直接嵌入 PostgreSQL 的扩展，仓库挂在 `microsoft/pg_dur"
---

---
title: "pg_durable: Microsoft open sources in-database durable execution 深度调研"
date: "2026-06-06"
source: "Hacker News"
slug: "pg_durable-microsoft-open-sources-in-db-durable-execution"
---

# pg_durable: Microsoft open sources in-database durable execution

## 一、事件背景

2026 年 6 月初，微软在 GitHub 上开源了 **pg_durable**——一个把"持久化工作流执行（durable execution）"能力直接嵌入 PostgreSQL 的扩展，仓库挂在 `microsoft/pg_durable` 下，采用 PostgreSQL License。该项目实际上是 Azure HorizonDB（微软新的托管 Postgres 产品）中的 Durable Functions 能力剥离开源，由 Rust + pgrx 0.16.1 构建，支持 PostgreSQL 17/18，并提供 amd64 的 Debian 包。HN 主帖快速冲上 261 分，原因不只是"微软又开源了一个数据库扩展"，而是它直接切进了过去两年最热的 workflow orchestration 战场——Temporal、Restate、DBOS、Inngest 都在抢占这个赛道，而微软选择了"完全不需要额外服务，全部跑在 Postgres 里"的极简路径。

## 二、核心观点 / 产品机制

pg_durable 的核心理念是：**把工作流定义为 SQL 函数**，由扩展自动对每个步骤 checkpoint 落盘，崩溃 / 重启 / 故障转移后能从断点续跑，无需 Redis、Temporal、Step Functions 等任何外部基础设施。它通过两个 DSL 操作符串联步骤：`~>` 表示顺序执行，`|=>` 表示把上一步结果绑定为变量；启动方式是 `SELECT df.start(...)`，返回一个 instance ID，开发者可随时用 SQL 查询执行状态。典型场景包括：向量 embedding 流水线（chunk → 调 API → 写入 pgvector）、批量数据 ingest、需人工审批的运维 runbook、跨 HTTP 的外部 API 编排等。它替代的是"`pg_cron` + jobs 表 + 状态列 + 重试计数 + 轮询 worker"这套臭名昭著的拼接方案。安全层面，所有权限默认拒绝 `PUBLIC`，需通过 `df.grant_usage()` 显式授予，后台 worker 角色必须是 superuser（绕过 RLS）。

## 三、社区热议与争议点

HN 评论区的讨论非常专业。支持派看好"数据靠近计算"的范式：一位评论者写道："过去为了 durable 不得不引入 Temporal，运维负担巨大；如果 95% 的工作流就是几条 SQL，pg_durable 简直是降维打击。"也有人对比近期热门的 **DBOS**（前两周刚冲上 HN 头条）——认为微软把同类能力做成纯扩展而非 SDK，"耦合度更低、迁移成本更低"。质疑派的火力主要集中在三方面：(1) **superuser 要求是地雷**——后台 worker 必须以 superuser 运行，被多位 DBA 评为"在多租户托管 Postgres 上几乎不可接受"；(2) **DSL 表达力有限**——`~>` / `|=>` 操作符虽然简洁，但复杂分支、异常处理、并行 join 是否能在纯 SQL 中优雅表达仍存疑，有人调侃"看起来像在用 SQL 写 BPMN"；(3) **厂商绑定隐忧**——README 默认数据库名是 `postgres`、worker 角色叫 `azuresu`，明显是从 Azure HorizonDB 反向剥离，社区担心后续节奏完全由 Azure 团队决定。

## 四、行业影响与未来展望

pg_durable 把"durable execution"这个原本属于专用编排平台的能力下沉到数据库层，意味着 Temporal、Inngest 等独立服务必须更努力地证明自己的差异化（多语言 SDK、跨数据库支持、可视化）。对 Postgres 生态则是又一次"超能力扩展"：继 pgvector、pg_cron、pgmq 之后，Postgres 正在变成事实上的"应用平台"。预计未来 12 个月内会出现 pg_durable 的社区分支和与 Supabase / Neon 的集成尝试。

## 五、相关链接

- 原文: https://github.com/microsoft/pg_durable
- HN 讨论: https://news.ycombinator.com/item?id=48410000
- 参考: https://learn.microsoft.com/en-us/azure/horizondb/development/durable-functions
