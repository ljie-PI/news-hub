---
title: "PgDog 拿到 550 万美元：Postgres 终于要有\"原生水平扩展\"的代理了"
date: "2026-06-11"
generated: "2026-06-11 07:00"
source: "HN"
slug: "2026-06-11_07-pgdog-is-funded-and-coming-to-a-database"
summary: "2026 年 6 月 10 日，开源 Postgres 代理 **PgDog** 创始人 **Lev Kokotov** 发文宣布完成 **550 万美元**种子轮，投资方包括 **Basis Set Ventures、Y Combinator、Pioneer Fund** "
---

---
title: "PgDog is funded and coming to a database near you"
date: "2026-06-11"
source: "Hacker News"
slug: "pgdog-is-funded-and-coming-to-a-database"
---

# PgDog 拿到 550 万美元：Postgres 终于要有"原生水平扩展"的代理了

## 事件背景

2026 年 6 月 10 日，开源 Postgres 代理 **PgDog** 创始人 **Lev Kokotov** 发文宣布完成 **550 万美元**种子轮，投资方包括 **Basis Set Ventures、Y Combinator、Pioneer Fund** 等。Lev 曾在 Instacart 任职，2020 年 4 月疫情爆发期把公司订单系统扩展 5 倍——核心瓶颈正是把 Postgres 撑到每分钟数十万订单。PgDog 是他第二个 Postgres 代理项目（前作 PgCat 已在多家公司生产环境运行），HN 帖（levkk 自己发）取得 359 分、182 条评论。

## 核心机制 / 产品观点

PgDog 的产品主张极端纯粹：**"Postgres is the only database you need"**——MongoDB、DynamoDB 之所以存在仅因 Postgres 难以横向扩展，"如果把 Postgres 撑到 100TB+ 表、每秒 100 万查询，开发者根本不会想用别的"。

技术形态：

- **Rust 写的多线程代理**，部署形式是一个 Docker 镜像放在数据库前面，应用层只需改 `DATABASE_URL`；
- **无 Postgres 扩展依赖**：不像 Citus 需要修改数据库二进制，PgDog 完全外置；
- **核心能力**：连接池 + 负载均衡 + **跨分片查询路由**（query parsing → 直接路由到目标 shard）；
- **当前规模**：已在生产环境支撑 **每秒 200 万查询**，已知分片管理量 **20 TB+**，Docker Hub 拉取数 **140 万**；
- **节奏**：每周四发新版，Discord 社区活跃；
- **商业化**：开源核心 + 即将推出的 Enterprise 版（面向 AWS、带 SLA 支持）；
- **可部署性**：on-prem、自管 K8s、本地笔电都可跑，"无 hidden serverless cost"。

## 社区热议与争议点

HN 评论区围绕几条主线：

1. **与 Citus / pg_shard 之比较**：经历过 Citus 的资深 DBA 称赞 PgDog "不污染数据库本体"，但也质疑 query parser 能否覆盖所有 SQL 形态——特别是 CTE、prepared statement、partial index 上的跨分片 JOIN。Lev 在评论里回应仍以"OLTP 直接路由优先、复杂分析查询走 Postgres 原生 FDW"作为折中。
2. **Vitess / TiDB / CockroachDB 怎么比**：有人认为 PgDog 选 "代理路线" 比 Cockroach 那种 "重写数据库" 更务实；也有人反驳"如果要分布式事务的强一致性，代理迟早撞墙"，Lev 承认跨分片两阶段提交仍是开放问题，PgDog 当前面向"应用层已显式选分片键"的场景。
3. **PgCat → PgDog 的过渡**：老用户问 PgCat 是否会被弃维，Lev 答 "PgCat 仍维护，但新功能在 PgDog"。这让一些公司纠结升级路径。
4. **三人团队 + 550 万够吗**：评论指出 Snowflake、Cockroach、Neon 各融数亿美金，PgDog 是否撑得到下一轮？支持者认为开源 + 自托管模式的边际成本极低，关键看 Enterprise 版的 ARR 跑出来。
5. **对 RDS / Aurora 的冲击**：用户最关心的实操问题——能否把 RDS Aurora cluster 加上 PgDog 直接得到分片？Lev 在播客里曾详细解释如何用 parallel replication stream 把已有大库切成 N 个 shard，HN 上有人验证这套流程"惊人地顺滑"。

## 行业影响与未来展望

- **Postgres 一统天下的叙事再加码**：从 Supabase、Neon、Crunchy 到 PgDog，Postgres 生态正补齐"无服务器 / 分片 / HTAP"短板，NoSQL 厂商面临持续压力；
- **代理范式 vs 数据库重写范式**：PgDog 选择"不动 Postgres 内核"路线，与 CockroachDB / TiDB 形成对照——前者迁移成本低、对应用透明，后者天生分布式但难以兼容生态；接下来 2-3 年是关键观察期；
- **企业版商业化**：Enterprise 版面向 AWS 提供 SLA，可能蚕食 RDS Proxy、Aurora 的中型客户市场；
- **下一步可看**：（1）跨分片事务 / 全局二级索引；（2）K8s Operator 与 helm chart 的官方化；（3）多 AZ 自动故障切换与 PITR 链路；（4）若三人团队能在一年内交付，Postgres 横向扩展将真正成为"开盒即用"。

## 附带链接

- HN 讨论：https://news.ycombinator.com/item?id=48476466
- 公告原文：https://pgdog.dev/blog/our-funding-announcement
- 开源仓库：https://github.com/pgdogdev/pgdog
- 创始人访谈：https://www.youtube.com/watch?v=1Rch9qEJUcY
