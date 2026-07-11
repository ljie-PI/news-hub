---
title: "postgres-rewritten-in-rust"
date: "2026-07-12"
generated: "2026-07-12 07:00"
source: "HN"
slug: "2026-07-12_07-postgres-rewritten-in-rust"
---

---
title: "Postgres rewritten in Rust, now passing 100% of the Postgres regression tests"
date: 2026-07-12
source: hackernews
slug: postgres-rewritten-in-rust
---

## 事件背景

开发者 malisper 发布了 pgrust——一个用 Rust 重写 Postgres 的项目，在 Hacker News 上获得 804 分与 716 条评论的高关注度。项目目标兼容 Postgres 18.3，已在 46,000+ 条回归查询上匹配官方预期输出。作者更透露一个尚未发布的新版本已通过 100% 的 Postgres 回归测试套件。

## 核心机制

pgrust 与 Postgres 磁盘格式兼容，可直接从现有 18.3 数据目录启动。它采用「每连接一线程」替代 Postgres 的「每连接一进程」模型，据称在事务负载上比 Postgres 快 50%，在分析型负载上快约 300 倍（ClickBench 上仅比 ClickHouse 慢 2 倍）。核心思路是保持 Postgres 行为不变、以真实测试为「预言机」，再用 Rust 加 AI 辅助编程探索更深层的服务端改造。项目采用 AGPL-3.0，目前尚未达到生产可用，扩展与 PL/Python 等过程语言仍不兼容。

## 社区热议与争议点

最大争议聚焦于「AI 重写」。juliangmp 主张「必须严格区分人工重写与 AI 重写」，Dormeno 补充「当多数代码由 AI 写成，就是 AI 重写」。反方 colordrops 反驳：既然无法分辨黑盒里是顶级开发者还是 AI，区分就无意义，且 AI 代码质量与驱动它的工程师强相关。支持者 mrklol 以 Bun 为例：「有优质测试和足够 token，跨语言转换效果不错」。而 uecker 一针见血地质疑：「因为它不可信，而可信才是最重要的。」raincole 则冷言：「或者，你直接用 Postgres 就行，它就在那儿。」

## 行业影响与未来展望

pgrust 折射出「AI 驱动大型系统重写」的新范式之争。jatins 认为重写本质是翻译类的苦力活，恰是 LLM 所长；satvikpendem 直言人类不愿做边际收益太小的重写，而 AI「不在乎」。若性能数据属实，线程模型与分析加速对数据库领域颇具启发。但可信度、可维护性与长期支持仍是悬而未决的核心疑问，社区对「无人真正审查的 AI 代码」保持警惕。

## 附带链接

- 仓库：https://github.com/malisper/pgrust
- HN 讨论：https://news.ycombinator.com/item?id=48841676
- 浏览器 Demo：https://pgrust.com
