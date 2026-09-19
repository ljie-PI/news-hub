---
title: "Tin: full-text search for Postgres"
date: "2026-09-20"
generated: "2026-09-20 07:00"
source: "HN"
slug: "2026-09-20_07-tin-full-text-search-for-postgres"
summary: "PlanetScale于2026年9月16日发布TIN（Text INdex），并称已面向其Postgres与Neki数据库正式可用。它回应了用户希望在关系库内完成高质量全文检索、避免另建搜索集群的需求。官方基准覆盖维基百科、GitHub议题等语料，宣称多类负载吞吐至少领先Postgres GIN与ParadeDB八倍；这仍是厂商自测，并非独立复现。"
---

# Tin: full-text search for Postgres

## 事件背景

PlanetScale于2026年9月16日发布TIN（Text INdex），并称已面向其Postgres与Neki数据库正式可用。它回应了用户希望在关系库内完成高质量全文检索、避免另建搜索集群的需求。官方基准覆盖维基百科、GitHub议题等语料，宣称多类负载吞吐至少领先Postgres GIN与ParadeDB八倍；这仍是厂商自测，并非独立复现。

## 核心观点 / 产品机制

TIN支持布尔、短语、跨度、模糊、通配符和正则查询，以及BM25排序与精确计数。关键设计是不另建连续文档号，直接把Postgres的ctid作为倒排项；再按数据页和行偏移做两级位图，以向量化方式求交并集。高频词计数可从元数据直接回答，MVCC可见性检查移入自定义扫描。更新先写可变段，后台合并为不可变段；ctid无需重编号，旧位图可转移所有权，从而减少重压缩和写放大。

## 社区热议与争议点

simonw肯定BM25利用全库词频，补足内置tsvector只按单行评分的短板；gfody则认为把索引留在库内可省掉外部Lucene的同步、回填和应用层关联。反面是Tiberium指出生产级TIN只在PlanetScale云上提供，本地Lead仅兼容语法且会扫描全部堆页，无法验证同等性能。Doohickey-d还质疑多语言边界：当前说明未展示CJK分词与词干化，逐字切分虽能工作，却可能低效且漏掉相关词。

## 行业影响与未来展望

TIN显示数据库厂商正把搜索能力重新收回数据层，以一致事务和更低运维成本挑战独立搜索集群。但其速度优势能否迁移到真实混合负载，仍取决于第三方基准、中文等语言分析器、可调相关性及自托管生产版。若这些缺口补齐，Postgres内嵌检索会更适合中等规模应用；否则云锁定与搜索定制需求仍会保留外部引擎的位置。

## 附带链接

- [PlanetScale原文](https://planetscale.com/blog/introducing-tin)
- [TIN入门文档](https://planetscale.com/docs/postgres/search/get-started)
- [本地兼容扩展Lead](https://github.com/planetscale/lead)
- [Hacker News讨论](https://news.ycombinator.com/item?id=49766611)
