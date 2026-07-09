---
title: "Rewriting Bun in Rust"
date: "2026-07-10"
generated: "2026-07-10 07:00"
source: "HN"
slug: "2026-07-10_07-rewriting-bun-in-rust"
summary: "Bun 作者 Jarred Sumner 完成了一项酝酿已久的工程：把整个 Bun JavaScript 运行时从 Zig 迁移到 Rust。这是一次约 96 万行代码的重写，早在 5 月 9 日 Sumner 就在 X"
---

# Rewriting Bun in Rust

## 一、事件背景

Bun 作者 Jarred Sumner 完成了一项酝酿已久的工程：把整个 Bun JavaScript 运行时从 Zig 迁移到 Rust。这是一次约 96 万行代码的重写，早在 5 月 9 日 Sumner 就在 X 上预告，而实际完成比预告还快。据其自述，团队长期被内存崩溃困扰——「我厌倦了每晚担心 Bun 崩溃」。他强调问题不在 Zig 本身，而是 Bun 将 GC 与手动内存管理混用，这种罕见组合几乎没有语言为之优化。整个迁移借助 Claude 大量自动化完成，仅用约 11 天便让大部分测试套件通过。

## 二、核心观点

Sumner 给出的收益颇具说服力：内存泄漏被修复、稳定性提升、二进制体积缩小约 20%、性能提升约 5%。他反复澄清这并非「让 Claude 一句话重写 Bun」，而是持续人工监控工作流、逐文件校对、并不断调整 AI 的修复循环。换言之，AI 是加速器而非全自动黑箱。Simon Willison 转载并肯定了这一「Zig 到 Rust」实践的工程价值与流程透明度。

## 三、社区热议与争议点

HN 讨论（story 48839751）观点两极：

- **支持方**：用户 Philpax 指出，即便只是「朴素重写」就能修复内存泄漏、缩小体积、提升性能，「这对 Zig 而言不是好消息」，侧面印证迁移的现实收益。
- **质疑方**：thayne 认为 Zig 时期的架构决策未必适配 Rust，逐文件机械翻译且人工审查极少，产出「可能只是不错的起点，而非可维护的高质量代码」。
- **动机争议**：ofseed 提到 Bun 曾维护一个加速编译的 fork，却因 Zig 的「零 LLM 政策」无法合并，几周后便启动 Rust 重写，暗示两件事或有关联；rvz 更直言这是 Anthropic 模型的一次营销展示。

## 四、行业影响

这一案例把「AI 辅助大规模语言迁移」推到聚光灯下：近百万行运行时级代码的跨语言重写，过去需数月人力，如今借 LLM 压缩到两周内。它既是 AI 编码能力的里程碑，也重新点燃了 Zig 与 Rust 之争，以及「不理解的代码不应上生产」的工程伦理讨论。对下游生态（如 Electrobun）则意味着需要重新适配。

## 五、附带链接

- 原文（Simon Willison）：https://simonwillison.net/2026/Jul/8/rewriting-bun-in-rust/
- HN 讨论：https://news.ycombinator.com/item?id=48839751
- 反方观点（Andrew Kelley）：https://andrewkelley.me/post/my-thoughts-bun-rust-rewrite.html
