---
title: "AlphaProof Code"
date: "2026-11-11"
generated: "2026-11-11 07:00"
source: "HN"
slug: "2026-11-11_07-alphaproof-code-formal-math"
summary: "DeepMind 于 2026 年 11 月 10 日公布 AlphaProof Code，用 AI 辅助验证 Signal 的 `libsignal` 核心密码协议。批次冻结互动为 549 points、173 comments；调研时 Algolia 返回故事分数 550，并实际取得 100 个可见评论节点，已触及本次上限，后者不能覆盖冻结口径。"
---

# AlphaProof Code

## 事件背景
DeepMind 于 2026 年 11 月 10 日公布 AlphaProof Code，用 AI 辅助验证 Signal 的 `libsignal` 核心密码协议。批次冻结互动为 549 points、173 comments；调研时 Algolia 返回故事分数 550，并实际取得 100 个可见评论节点，已触及本次上限，后者不能覆盖冻结口径。

## 核心观点
系统先由人类专家与规格代理把安全目标写成 Lean 规格，再把未改造的 Rust 代码编译为 AArch64 可执行文件，由四十至八十个证明代理协作，最终只接受 Lean 内核和 comparator 通过的证明。论文及博客自报：四周生成约 650 万行证明，可信规格与机器语义约 2.6 万行，并回注两个历史漏洞检验规格；这些是官方实验口径，并非外部复现。公开仓库提供符号与计算模型证明、机器语义及构建脚本，但模型限于单线程静态进程，密码原语、部分例程以可信合约处理。

## 社区热议
独立可见评论中，p-e-w 赞叹 Signal 实现能经严格验证；jlouis 指出手工 Lean 证明常需原程序五十至一百倍工作，认为代理可显著降本。质疑也很具体：Gasp0de 强调被验证的是加密协议而非整个 Signal 应用；sanderjd 指出复杂密码例程以合约替代，且并发与信号未建模，因此保障仍是实际系统的有限切片。

## 行业影响
价值不在“AI 宣称安全”，而在生成结果可由小内核机械拒伪；若规格维护成本下降，形式化验证可能进入关键库的持续集成。但规格是否表达真实需求、可信合约是否成立、硬件与操作系统是否匹配，仍需人工审计，不能把局部定理扩张为整机无漏洞。

## 附带链接
- DeepMind 原文：https://deepmind.google/blog/introducing-alphaproof-code/
- 技术论文：https://deepmind.google/documents/36/Formal_Verification_of_Signal_4.pdf
- 代码与证明：https://github.com/google-deepmind/code-verification
- 证明浏览站：https://google-deepmind.github.io/code-verification
- HN 讨论：https://news.ycombinator.com/item?id=50439193
