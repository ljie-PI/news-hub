---
title: "similarities-between-llms-and-quantum-mechanics"
date: "2026-06-04"
generated: "2026-06-04 07:00"
source: "Reddit"
slug: "2026-06-04_07-similarities-between-llms-and-quantum-mechanics"
---

---
title: "Similarities between LLMs and Quantum Mechanics"
date: "2026-06-04"
generated: "2026-06-04 07:00"
source: "Reddit"
slug: "similarities-between-llms-and-quantum-mechanics"
---

## 事件背景

r/LLM 一位发帖人提出一个颇具哲学意味的类比：大型语言模型在生成回答之前，"潜在所有答案"都同时以概率分布的形式叠加存在，只有当用户采样（sampling）时才"坍缩"成一个具体输出——这与量子力学中波函数的态叠加与测量坍缩异曲同工。帖子在 r/LLM 引发了一轮跨学科的脑暴讨论。

## 核心观点

发帖人列出几条对应关系：(1) 概率叠加：LLM 在 softmax 输出处给出 token 上的概率分布，恰似波函数；(2) 测量坍缩：采样（greedy / top-p / temperature）相当于一次"测量"，从分布中得到具体值；(3) 不可克隆与不可重复：在 temperature>0 时即使输入完全相同，输出也会因随机性而不同，类似量子测量的统计本质；(4) 观察者效应：prompt 本身改变模型"看到的现实"，类似测量装置选择决定可观测量；(5) 纠缠：注意力机制让远距离 token 形成强关联，类比量子纠缠。

## 社区热议与争议点

评论区形成三股力量。物理学背景的网友普遍提醒"这只是隐喻，不是物理"：LLM 是经典的、确定性的浮点计算，所谓随机性来自伪随机数发生器，与量子的本征不确定性有本质区别；他们担心这种类比会被滥用为玄学。第二派 ML 研究者则认为类比有启发价值，指出 path integral 在 transformer 的多头注意力解释中、以及 tensor network 与 transformer 的形式相似性，已经有正式论文研究；推荐了 Anthropic 关于 superposition 与 polysemanticity 的研究，认为神经元"叠加多个概念"的现象本身就借用了量子术语。第三派纯吃瓜，乐于看哲学讨论。争议焦点是：类比到底是有效的认识工具，还是会误导大众理解 AI 工作原理。

## 行业影响与未来展望

虽是哲学讨论，却折射出一个真实趋势——可解释性研究正越来越多借用物理学语言（叠加、相变、临界性、能量景观）描述深度网络行为。从 Anthropic 的 dictionary learning 到 mechanistic interpretability 社区对 phase transition 的研究，物理直觉正成为理解大模型的有力工具。预计未来几年我们会看到更多"AI 物理学"性质的论文，但同时也需警惕概念混淆带来的传播失真。

## 附带链接

- 原帖: https://www.reddit.com/r/LLM/comments/1tw2w21/
