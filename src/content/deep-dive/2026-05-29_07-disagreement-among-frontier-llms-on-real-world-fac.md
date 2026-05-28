---
title: "disagreement-among-frontier-llms-on-real-world-fac"
date: "2026-05-29"
generated: "2026-05-29 07:00"
source: "HN"
slug: "2026-05-29_07-disagreement-among-frontier-llms-on-real-world-fac"
---

---
title: "Disagreement among frontier LLMs on real-world fact-checks"
date: "2026-05-29"
generated: "2026-05-29 07:00"
source: "HackerNews"
slug: "disagreement-among-frontier-llms-on-real-world-fac"
---

## 1. 事件背景

Lenz Research 的 Kosta Jordanov 于 2026 年 5 月 21 日发布快照报告 **"Beyond Benchmarks: Frontier LLM Disagreement on Fact-Checks"**（v1.0），将 1000 条来自 Lenz 事实核查平台的真实用户提交语句（均不超过 180 天）抛给 5 个前沿大模型——GPT-5.4、Claude Opus 4.7、Gemini 3 Pro、Gemini 3 Pro + Search、Sonar Pro——只让模型在 True / Mostly True / Misleading / False 四档中作选择，**不评估对错**，只统计模型间的**分歧**。这种"无 ground truth、纯分歧度量"的设计立刻吸引到 HN 注意。

## 2. 核心发现

- **67% 的命题至少一个模型与多数派不一致**；45% 有两个及以上模型偏离；13% 干脆形不成多数。
- **21% 的命题出现极性分歧**（True ↔ False 跨越三档），这意味着不同前沿模型对超过五分之一的现实陈述给出完全相反结论。
- Krippendorff 序数 α = 0.639，与人类标注者在 AVeriTeC 上的 κ=0.619 接近，说明任务本身困难。
- **结构性偏差显著**：Gemini 3 Pro 双峰化（54% True + 40% False，中间两档合计仅 6%），而 Claude Opus 4.7 / Sonar Pro 更愿意使用 Mostly True 与 Misleading 中间档。
- **GPT-5.4 与多数派一致率最高 (81%)**，被作者称为"中位回归型"。
- 在 328 个全员一致的命题中，**Mostly True 为 0**——前沿模型几乎从不一起说"基本属实"，这一档完全成为分歧重灾区。

## 3. 社区热议与争议点

HN 上提交时间较新，评论尚在累积，但围绕"模型分歧研究"这一品类，常见争点已经在多个相关讨论中反复出现，本帖延续如下：

- **方法论争议**：有评论质疑作者用"被迫四选一、无 Abstain"的设定夸大了分歧，因为不允许"不确定"会把本可保留的灰度强行推到相邻档位，并把 1-bucket 差距误读为有意义的分歧。作者在 §9 已承认 Pigeonhole 仅是错误下界。
- **"中间档无人达成共识"被点赞**：多位评论者认为 0 个 unanimous-Mostly-True 是文章最具新闻价值的点——证明所谓"中等真实度"本质上是 prompt/训练取向问题，而非世界事实属性。
- **Gemini 双峰 vs Claude 中庸**：开发者讨论这种行为差异可能来自 RLHF 的 verdict prior。一派认为 Gemini 的极性化使其在自动化决策链路中更"危险"；另一派则认为 Claude 的中庸是"装作中立"，对最终下游应用更具误导性。
- **加 Search 帮助有限**：Gemini 3 Pro + Search 与裸 Gemini 3 Pro 一致率高达 75%（数据集中最高），评论里多人感叹"web 检索没有想象中那么能纠错"，并联想到 perplexity 类产品的真实价值边界。
- **对"投票即真相"路径泼冷水**：有用户提醒不要把 majority vote 当作 oracle——pigeonhole 只能证明至少一个模型错，并不能告诉你哪一个错。

## 4. 行业影响与未来展望

这份研究为正在被广泛部署的 **LLM 事实核查 / 内容审核 / RAG 引用判定** 类系统敲响了校准警钟。对工程实践的直接启示有三：

1. **Ensemble 不是免费午餐**：当模型在 21% 命题上极性相反时，简单 majority vote 会在政治、法律、健康等高敏感领域系统性放大某一家厂商的先验。
2. **中间档需要重新设计**：Mostly True / Misleading 等"半真半假"标签在前沿模型间几乎不可复现，事实核查产品也许应改用置信区间或来源标注，而非单一离散档。
3. **Retrieval 并非银弹**：加 Search 的 Gemini 与原版高度同源，提示真正决定 verdict 的仍是模型的内部 prior，而非检索内容本身。

更宏观地，Lenz 这种"不评对错，只测一致性"的范式，可能成为未来 LLM 对比的新主流——它便宜、可复现、且回避了"谁来标 ground truth"的政治难题。

## 5. 链接

- 原文报告：https://lenz.io/research/llm-disagreement
- HN 讨论：https://news.ycombinator.com/item?id=48307887
