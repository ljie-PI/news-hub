---
title: "Auto-research with codex: How I achieved a 232x Faster Kernel"
date: "2026-08-16"
generated: "2026-08-16 07:00"
source: "HN"
slug: "2026-08-16_07-auto-research-with-codex-how-i-achieved-a-232x-fas"
summary: "GPU Mode 与 Core Automation 举办 B200 线性代数竞赛，要求实现批量紧凑 Householder QR；官方验证器检查重构、正交、三角及病态输入。作者称自己十四天提交逾"
---

# Auto-research with codex: How I achieved a 232x Faster Kernel

## 事件背景
GPU Mode 与 Core Automation 举办 B200 线性代数竞赛，要求实现批量紧凑 Householder QR；官方验证器检查重构、正交、三角及病态输入。作者称自己十四天提交逾一千五百次，获一百八十三人中第十二名，并把基线约四十一万九千微秒降至一千八百零五微秒，故称提速二百三十二倍。这是作者日志与榜单口径，并非第三方复现实验。

## 核心观点 / 产品机制
QR 的逐列反射存在串行依赖；方案以分块 Householder 把串行工作限制在窄面板，再用 WY 表示把尾部更新改成三次矩阵乘，喂给张量核心。Codex 在“基准—分析—验证—研究—改进”闭环中读取问题说明、性能剖析与提交日志；后期以三至五条候选路线并行，逐步加入 Triton 面板、图重放、融合布局及定形专用核，并非一次提示的功劳。

## 社区热议与争议点
支持者给出可核查但仍属自述的复现：rrhjm53270 称 DeepSeek-V4-Flash 用一两小时、零点二美元优化了 FlashAttention；shken 指出本题每一步都有耗时、剖析和通过失败这类“判定器”，而普通应用缺少反馈时代理会误报完成。反方更关注外推：augment_me 称前十方案中八个遇到赛外形状就坏；josu 回应竞赛目标本就是极致速度而非通用维护。作者随后也承认后续 Cholesky 测试里多数领先方案只通过约一半训练验证，印证数值稳定与过拟合风险。

## 行业影响与未来展望
案例说明代理最适合目标量化、验证便宜、搜索空间可迭代的系统优化，而非自动替代研究者。未来竞争点会从“会写核”转向验证器、剖析、候选管理和领域专家的研究品味；若要进入生产，还需加入赛外形状、稳定性、成本与可维护性测试，否则排行榜提速可能转化为技术债。

## 附带链接
- [原文](https://sankalp.bearblog.dev/autoresearch/)
- [Hacker News 讨论](https://news.ycombinator.com/item?id=49309549)
- [GPU Mode 官方说明](https://www.gpumode.com/news/linear-algebra-kernels-age-of-research)
- [qr_v2 榜单](https://www.gpumode.com/leaderboard/774?tab=rankings)
