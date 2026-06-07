---
title: "microsoft-pg-durable"
date: "2026-06-08"
generated: "2026-06-08 07:00"
source: "GitHub"
slug: "2026-06-08_07-microsoft-pg-durable"
---

---
title: "深度解读：microsoft/pg_durable —— PostgreSQL 库内持久化执行引擎"
date: "2026-06-08"
generated: "2026-06-08 07:00"
source: "GitHub"
slug: "microsoft-pg-durable"
category: "deep_dive"
---

## 一、定位与痛点剖析
当业务状态已在 PostgreSQL，团队往往还要拼装 pg_cron、外部 worker、状态表与轮询逻辑才能跑「可恢复的后台任务」。长事务持锁、WAL 暴涨、崩溃后需手动重建状态、并行 worker 出现部分失败……都是常见痛点。微软推出的 pg_durable 把「持久化执行」直接塞进 PostgreSQL 扩展，让长跑、可重入的 SQL 工作流在数据库内完成，无需 Redis、Temporal、Airflow 等外部依赖。

## 二、核心架构与技术细节
项目以 Rust 编写（50.4%，借助 cargo-pgrx 0.16.1）+ PLpgSQL（30.5%），支持 PostgreSQL 17 与 18。核心是把工作流抽象成「SQL 步骤组成的图」，引入 `~>`、`|=>` 等可组合算子；每一步执行后即落 checkpoint，崩溃或重启后从最近的耐久点续跑。提供 `df.start()` 拉起实例并返回 instance ID，状态、结果可直接 SQL 查询。安全模型上，`CREATE EXTENSION` 默认不授 PUBLIC，需通过 `df.grant_usage(role)` 显式开放。

## 三、竞品对比与生态站位
对标 Temporal、AWS Step Functions、Argo Workflows、Airflow 等编排器，pg_durable 的差异化在于「零基础设施」+「数据库原生」，特别适合 pgvector 嵌入流水线、批量 ingest、维护 runbook、扇出聚合、外部 API 调用等以行/文档/批次为单位的可恢复工作。相比 plpgsql 过程，它解决了「长事务一崩全废」的根本问题。

## 四、开发者反馈与局限性
项目当前为 Preview（24 star / 2 fork），微软光环+生产 PostgreSQL 用户基数大，预期增长可观。局限：需要安装扩展并加入 shared_preload_libraries，禁用扩展的托管 PG 暂时无缘；对亚毫秒同步请求、跨异构系统、纯应用逻辑场景并不适用；单 SQL 语句即可完成的任务用它属过度设计。

## 五、附带链接
- GitHub Repo: https://github.com/microsoft/pg_durable
- 依赖工具 cargo-pgrx: https://github.com/pgcentralfoundation/pgrx
