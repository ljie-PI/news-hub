---
title: "LLMs are making formal software verification feasible at a much larger scale"
date: "2026-10-24"
generated: "2026-10-24 07:00"
source: "HN"
slug: "2026-10-24_07-anthropic-llm-formal-verification"
summary: "批次冻结热度为437 points、281 comments。Anthropic与Theorem宣布用Claude为真实开源库生成汇编级形式证明。123个库、239个入口和约1.8亿行证明均属厂商自报；当前公开仓库列出的可核验子集为60个入口、25个库，不能视为完整实验已获独立复现。"
---

# LLMs are making formal software verification feasible at a much larger scale

## 事件背景

批次冻结热度为437 points、281 comments。Anthropic与Theorem宣布用Claude为真实开源库生成汇编级形式证明。123个库、239个入口和约1.8亿行证明均属厂商自报；当前公开仓库列出的可核验子集为60个入口、25个库，不能视为完整实验已获独立复现。

## 核心观点 / 产品机制

流程把OSS-Fuzz现有测试入口编译成单线程静态RISC-V二进制，以Rocq中的Linux进程与指令语义和“不发生故障、中止或未建模行为”为规格；Claude生成证明，Rocq内核机械检查。它把采样测试升级为覆盖约束内全部输入与内存布局，但边界包括小于64MB输入、固定内存、musl和RISC-V模型，且不证明终止、业务正确或现实机器没有模型缺口。

## 社区热议与争议点

本次刷新Algolia实取100个可见节点，已触及limit 100，不能与冻结281评论等同。jaykru援引附录质疑冗长证明会撞上复杂度墙；jasongross反驳称优化检查性能反而催生模块化抽象。glennfiedler肯定约束内覆盖全部输入路径胜过模糊测试采样；woggy则以Lean缓存实验中模型写出“1=1”式空规格，警告机器验过不等于证明了想要的性质。

## 行业影响与未来展望

短期更现实的落点是让证明生成进入CI，在模糊测试锁定入口后为特定二进制“封口”，同时由人审规格与语义。独立Vero基准中最强代理只完整解决27/43个仓库，且在最难仓库未关闭任何规格，说明此次规模化不能外推为通用仓库验证已解决。

## 附带链接

- [Hacker News 原帖](https://news.ycombinator.com/item?id=50202217)
- [Anthropic 原文](https://www.anthropic.com/research/formal-verification)
- [技术附录](https://www-cdn.anthropic.com/files/4zrzovbb/website/6867eadf760258fa8b42a504600cd3c036d16358.pdf)
- [公开证明子集](https://github.com/theorem-labs/oss-verify-proofs)
- [RISC-V/Linux 形式语义](https://github.com/theorem-labs/rocq-linux-process-semantics)
- [独立研究：Vero 仓库级验证基准](https://arxiv.org/abs/2608.13522)
