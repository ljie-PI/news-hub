---
title: "Honker：为 SQLite 带来 Postgres NOTIFY/LISTEN 语义"
date: "2026-04-24"
generated: "2026-04-24 07:00"
source: "HN"
slug: "2026-04-24_07-honker-sqlite-notify-listen"
summary: "SQLite 正在成为越来越多产品级应用的首选数据库——从桌面客户端到边缘服务，\"单文件即数据库\"的简洁性极具吸引力。然而，当项目规模增长到需要 *"
---

# Honker：为 SQLite 带来 Postgres NOTIFY/LISTEN 语义

> 项目地址：https://github.com/russellromney/honker  
> HN 讨论：https://news.ycombinator.com/item?id=47874647（216 分 / 50 评论）

## 1. 定位与痛点剖析

SQLite 正在成为越来越多产品级应用的首选数据库——从桌面客户端到边缘服务，"单文件即数据库"的简洁性极具吸引力。然而，当项目规模增长到需要 **发布/订阅（pub/sub）** 和 **任务队列** 时，常规答案是"加一个 Redis + Celery"。这意味着引入第二个数据存储、双写一致性问题以及额外的运维负担（broker 进程、备份策略、网络拓扑）。

Honker 的定位非常明确：**如果 SQLite 是主数据库，那么队列也应当住在同一个 .db 文件里**。它把业务写入和消息入队放进同一个事务——commit 一起提交，rollback 一起回滚，从根本上消除了双写问题。

## 2. 核心架构与技术细节

Honker 的核心用 Rust 实现（`honker-core` / `honker-extension`），同时编译为 SQLite 可加载扩展（loadable extension），因此任何能执行 `load_extension('honker')` 的客户端都能获得完整功能。上层绑定覆盖 Python、Node.js、Bun、Ruby、Go、Elixir、C++ 等主流语言，均为薄封装。

**关键技术选型：WAL 文件 stat() 轮询替代 SQL 轮询。** SQLite 没有服务器进程，无法像 Postgres 那样通过内核信号通知。Honker 的做法是每 1ms 对 WAL 文件执行一次 `stat(2)` 系统调用，检测文件元数据变更来判断是否有新写入，从而实现跨进程的 **单位数毫秒级事件推送**。同时保留 5 秒一次的"偏执轮询"作为兜底。

主要能力矩阵：

- **Notify/Listen**：跨进程通知，监听者从当前 MAX(id) 开始，不重放历史
- **Work Queue**：支持重试、优先级、延迟任务、死信表、可见性超时（默认 300s）、指数退避
- **Durable Stream**：每个 consumer 独立 offset，可配置 flush 间隔（默认 1000 条或 1 秒），at-least-once 语义
- **Cron 调度器**：crontab 风格定时任务，内置 leader 选举
- **任务结果存储**：enqueue 返回 id，worker 持久化返回值，调用方 await 结果

项目明确**不构建**的功能：任务管道/链/组/chord、多写复制、DAG 工作流编排——这划定了"轻量嵌入式"的边界。

## 3. 竞品对比与生态站位

Honker README 自身列出了对标项目：

| 项目 | 数据库 | 特点 |
|------|--------|------|
| **pg_notify** | Postgres | 快速触发，无重试/可见性 |
| **pg-boss** | Postgres | 成熟的 Postgres 任务队列 |
| **Oban** | Postgres (Elixir) | Elixir 生态金标准 |
| **Huey** | SQLite/Redis (Python) | Python 轻量队列，但无跨语言支持 |
| **Honker** | SQLite | 跨语言、事务原子性、无 broker |

Honker 的差异化在于：① 跨语言一致性（一套 Rust 核心，多语言绑定）；② 无需额外进程/broker；③ 队列与业务数据在同一事务中。代价是继承了 SQLite 单写者的限制。

## 4. 开发者反馈与局限性

HN 讨论中，社区反馈集中在以下几点：

**stat() 开销争论**：有开发者惊讶于 stat() 每 1ms 调用一次仅消耗不到 0.1% CPU。但资深内核开发者 vlovich123 指出，stat() 走 VFS 层，存在隐藏的缓存行锁竞争和 L3/RAM 压力，建议未来考虑 `io_uring` + `PRAGMA data_version` 方案。作者表示认同，当前选择 stat() 主要为了跨平台一致性。

**单进程 vs 多进程场景**：andersmurphy 质疑——对于 Java/Go/C# 等语言，应用本身管理单写者就能在线程间推送通知，何须跨进程方案？作者回应核心价值在于 **多进程架构**（如独立 worker 进程）和 **1ms 反应性**，而非单进程内的线程间通信。

**并发 claim 瓶颈**：ncruces 指出 claim/ack 工作流在多 reader 场景下会被 SQLite 单写者锁严重制约，认为这是根本性局限。作者坦承：当需要分布式锁时，"可能该换工具了"。

**Litestream 跨机器通知**：有人提出结合 Litestream 只读副本实现跨服务器 notify 的可能性，作者认为虽然受限于同步间隔（约 1 秒），但某些场景下可行。

总体来看，Honker 填补了 SQLite 生态中"嵌入式消息基础设施"的空白，非常适合单机多进程、边缘部署或嵌入式应用。但 SQLite 单写者模型决定了它无法替代 Postgres 级别的并发队列方案。项目当前标记为 **Experimental**，API 可能变动。

## 5. 链接

- **GitHub 仓库**：https://github.com/russellromney/honker
- **Rust Crate**：https://crates.io/crates/honker
- **HN 讨论**：https://news.ycombinator.com/item?id=47874647
- **对标项目**：[pg-boss](https://github.com/timgit/pg-boss) · [Oban](https://github.com/sorentwo/oban) · [Huey](https://github.com/coleifer/huey)
