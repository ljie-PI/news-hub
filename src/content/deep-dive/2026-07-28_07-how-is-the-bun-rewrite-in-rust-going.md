---
title: "How is the Bun Rewrite in Rust going?"
date: "2026-07-28"
generated: "2026-07-28 07:00"
source: "HN"
slug: "2026-07-28_07-how-is-the-bun-rewrite-in-rust-going"
summary: "2026 年 5 月，Bun（原用 Zig 编写的 JavaScript 运行时）作者 Jarred Sumner 宣布用 AI 将 Bun「重写为 Rust」，声称仅耗时 11 天、花费 16.5 万美元的 Anthropic API 调�"
---

---
title: How is the Bun Rewrite in Rust going?
date: 2026-07-28
source: hackernews
slug: how-is-the-bun-rewrite-in-rust-going
---
# How is the Bun Rewrite in Rust going?

## 事件背景

2026 年 5 月，Bun（原用 Zig 编写的 JavaScript 运行时）作者 Jarred Sumner 宣布用 AI 将 Bun「重写为 Rust」，声称仅耗时 11 天、花费 16.5 万美元的 Anthropic API 调用即完成并合并到 main。此事恰逢 Anthropic 收购 Bun，被广泛当作「AI 能替代开源维护者」的营销样板。开发者 Tom Lockwood 对此持怀疑态度，展开了一次深入的代码与数据核查。

## 核心观点与调查发现

Lockwood 指出「完成」二字值得打上引号：截至 7 月 27 日，重写合并六周后仍无任何发布 tag，距上一个版本 v1.3.14 已过去 11 周。来自 robobun（Claude Code 代理）的开放 PR 从 7 月 9 日的 1277 个飙升到 2475 个，按每条约 40 分钟的合并流水线计算，需连续跑 86 天才能清完。他据此推断真实成本远超 16.5 万美元——CI/CD 的 Buildkite 集群持续运转、Anthropic 员工深度介入，若按每天 1 万美元估算，实际投入已逼近 80 万美元。

## 社区热议与争议点

HN 讨论呈现明显分歧。质疑派 windexh8er 比喻这像「换了轮胎却宣称换了整台车」；TazeTSchnitzel 与 insanitybit 从技术角度指出，逐文件机械翻译只会保留 C 式的 unsafe ABI，「拥有 C 代码的全部内存不安全性」，并未真正获得 Rust 的安全收益。支持派 SquareWheel 认为大重构后开发速度暂降很正常，不宜单凭 commit 与发布节奏下结论；sfink 则强调这证明了 AI 可长时间无人值守地持续产出，本身即是突破。也有人如 benjiro29 提醒：软件价值在于后续功能演进，而非快速一次性生成。

## 行业影响与未来展望

此案成为当前 AI 炒作周期的缩影：估值高度绑定「AI 吃掉一切」的叙事。Lockwood 附言 Anthropic 的 C 编译器与 Cursor 的 FastRender 浏览器数月无提交，暗示这类 AI 重写项目难以持续维护。核心悬念仍在：重写是否真「完成」、是否值回成本与估值，短期内恐无定论。

## 附带链接

- HN 讨论：https://news.ycombinator.com/item?id=49067854
- 原文博客：https://lockwood.dev/ai/2026/07/27/how-is-the-bun-rewrite-in-rust-going.html
