---
title: "wasmer-django-to-rust"
date: "2026-06-05"
generated: "2026-06-05 07:00"
source: "Reddit"
slug: "2026-06-05_07-wasmer-django-to-rust"
---

---
title: "Wasmer 将 Django 后端迁到 Rust，基础设施资源占用下降 90%"
date: "2026-06-05"
generated: "2026-06-05 07:00"
source: "Reddit"
slug: "wasmer-django-to-rust"
---

## 背景：一支基建小队扛不住的 Django 单体

Wasmer 创始人 Syrus Akbary 于 6 月 3 日发文，复盘公司将运营了 7 年的 Django 后端整体重写为 Rust 的全过程，帖子随后被同步至 r/rust 与 r/programming，后者一天内收获 85 赞、22 条评论。迁移前的 Wasmer Backend 起源于 wapm.io 包仓库，峰值需要 **220 颗 CPU + 800 GB 内存** 才能承载并不算夸张的流量，且只由 1 名基建工程师维护，已经接近不可持续。

## 痛点与选型：不是 Django 不好，是耦合太重

作者把问题分成两类。**Django 自身限制**：ORM 缺乏真正的异步数据库支持（PR #18408 仍未合并），导致 GraphQL 场景下响应被严重阻塞；渐进式类型不足，`Any` 与未标注的依赖让重构如履薄冰；冷启动最差超过 60 秒。**自伤部分**：长期赶进度积累了「Frankenstein 式」代码，且团队没有专职 Python 专家。作者坦言「我们其实可以迁到 FastAPI + SQLAlchemy 拿到类似收益」，但既然团队的 Runtime 与 Edge 平台都是 Rust，统一栈才能复用包校验等核心库、改善 bus factor。

## 新架构：SeaORM + Async-GraphQL + Apalis

新后端按 Cargo workspace 切成多个 crate：技术层 `db / graphql / cache / iam / admin / tasks`，业务层 `Apps / Blog / Mailer`。关键依赖为 **SeaORM**（ORM）、**async-graphql**（保持对外 GraphQL 协议不变，客户端零改动）、**Apalis**（替代 Celery）、**Fernet**（加密）、**Octocrab**（GitHub 集成），Admin 面板则由 AI 基于 Tailadmin 组件生成。整个迁移由 1 人借助 AI 工具全职 3 个月完成。

## 收益数据

| 指标 | Django | Rust | 变化 |
| --- | --- | --- | --- |
| 计算 CPU | 220 | 24 | -89% |
| 内存 | 800 GB | 64 GB | -92% |
| DB 连接数 | 数千 | 数百 | 3–5× ↓ |
| 查询延迟 | 基线 | 快 5–10× | 5–10× |
| 启动时间 | >60 s | 1 s | ~60× |
| p95 API 延迟 | 120 ms | 30 ms | -75% |

## 踩坑与社区反响

作者诚实列出 Rust 侧的代价：**编译时间显著拖慢迭代**；失去 `python manage.py shell` 这类生产即时调试入口；SeaORM 同时支持 SQLite/Postgres 时，inet 等 PG 专有类型需手工兼容。r/rust 评论与历史讨论中常见的反向观点也值得参考——Medium 上《He Migrated the Whole Backend to Rust. Then Nobody Could Maintain It》警告团队 Rust 水位不足时维护成本会反噬；另一类用户则呼吁社区尽快出现「Rust 版 Django」，认为 Admin、缓存、约定式结构的缺失才是真正门槛。

## 行业坐标

这并非孤例：Discord 早在 2020 年就将 Read States 服务从 Go 迁到 Rust，借助消除 GC 抖动取得近 10× 性能提升与稳定的尾延迟；Cloudflare、Dropbox 也有类似案例。Wasmer 此次的特殊之处在于——它把「脚本语言→Rust」的故事从底层热路径推进到了**完整业务后端 + GraphQL + Admin** 这一层，并给出了可量化的基础设施账单削减证据，对中型 SaaS 团队尤具参考意义。
