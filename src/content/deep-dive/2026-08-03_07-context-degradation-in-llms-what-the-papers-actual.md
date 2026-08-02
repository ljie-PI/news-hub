---
title: "Context degradation in LLMs: what the papers actually show"
date: "2026-08-03"
generated: "2026-08-03 07:00"
source: "Reddit"
slug: "2026-08-03_07-context-degradation-in-llms-what-the-papers-actual"
summary: "一篇发表在 Towards Data Science 的长文《Context Rot: Why Claude Code Sessions Decay》被转发到 r/MachineLearning，作者 Jake Minns 系统梳理了「上下文腐烂」（context rot）�"
---

# Context degradation in LLMs: what the papers actually show

## 事件背景
一篇发表在 Towards Data Science 的长文《Context Rot: Why Claude Code Sessions Decay》被转发到 r/MachineLearning，作者 Jake Minns 系统梳理了「上下文腐烂」（context rot）现象：长对话会话往往开头表现出色，却在远未触及 token 上限时就悄然「失去线索」。帖子引用了多篇论文，把这一日常体感落到了可测量的机制层面，引发机器学习社区对长上下文可靠性的讨论。

## 核心观点 / 产品机制
文章把腐烂分为两类。「内在腐烂」源自注意力机制本身：softmax 强制注意力预算之和为一，任何无关 token 都无法获得完全为零的权重，因此上下文越长，关键信号与噪声之间的边际就被稀释。经典的「大海捞针」测试显示检索准确率呈 U 形，首尾最高、中间最低（Liu et al. 2024）；一旦剥离词面重合（NoLiMa），性能下降来得远早于标称上限。「内容腐烂」则是可控的：陈旧、错误、矛盾的信息随会话累积并被反复重新处理。作者借用 Drew Breunig 的四种失败模式——混淆、冲突、分心、投毒——说明工具堆叠、调试弯路都会污染上下文。

## 社区热议与争议点
（未逐字引用评论区）在议题层面，支持者认为这解释了为何「加更多上下文」常适得其反，主动裁剪与分段才是正解；也有人指出许多结论是已知的 needle-in-haystack 老问题。争议点在于：内在腐烂究竟是架构宿命还是可通过 RAG、记忆压缩等工程手段大幅缓解，业界尚无定论。

## 行业影响与未来展望
随着 Agent 与编码助手普及，「治理上下文」正从玄学变成工程实践：可用上下文预算远低于标称窗口，意味着上下文管理、子代理拆分与定期压缩会成为标配能力。未来模型即便扩大窗口，如何维持中段信息的信噪比仍是核心课题。

## 附带链接
- 原文：https://towardsdatascience.com/governed-context-managing-context-rot-in-claude-code/
- 讨论：https://www.reddit.com/r/MachineLearning/comments/1vdsgcj/context_degradation_in_llms_what_the_papers/
