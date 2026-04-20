---
title: "ICML 2026 审稿评分方差巨大：不同 Batch 之间的评分一致性引发社区热议"
date: "2026-04-18"
source: "Reddit"
slug: "2026-04-18_21-icml-2026-score-variance"
summary: "---"
---

# ICML 2026 审稿评分方差巨大：不同 Batch 之间的评分一致性引发社区热议

> 来源：[r/MachineLearning](https://www.reddit.com/r/MachineLearning/comments/1sovebg/icml_2026_heavy_score_variance_among_various/) | 分类：ML / CV / NLP | 日期：2026-04-18

---

## 一、事件背景

ICML 2026 的审稿流程正处于收尾阶段，社区中一个引发广泛关注的话题浮出水面：**不同审稿 batch 之间的评分方差极大**。Reddit 用户在 r/MachineLearning 发帖讨论，指出同一质量水准的论文在不同 batch 中可能获得截然不同的分数，这使得论文的最终命运很大程度上取决于"运气"——即被分配到哪个审稿批次。

ICML 2026 今年投稿量再创新高，而高质量审稿人的增速远远跟不上。为应对这一挑战，ICML 2026 引入了多项新政策，包括 **自排名机制（self-ranking）** 和 **双轨 LLM 审稿政策**（Policy A 完全禁止使用 LLM，Policy B 允许有限 LLM 辅助）。然而，这些新机制似乎并未有效缓解评分噪声问题，反而可能在某些维度加剧了 batch 间的不一致性。

## 二、核心观点

帖子的核心论点是：**ICML 的 batch 分配制度导致了系统性的评分不公平**。不同 batch 的审稿人在评分标准、专业背景和投入程度上差异显著，最终体现为同类论文的得分高度分散。社区数据显示，实验室内 80 余篇待审论文中仅约 10 篇达到 3.5 分以上，整体评分偏低且分布不均。这种高方差环境鼓励了"投机式投稿"——作者会提交更多边缘论文，寄希望于评分随机性带来的正向偏差。

## 三、社区热议与争议点

### 1. Policy A vs. Policy B 的评分差异
社区调查（约 100 份回复）表明，**Policy B（允许 LLM 辅助）下的论文平均分更高，但评分方差也更大**，这与直觉相悖——使用相同前沿模型本应使评分更趋一致。有人推测这是因为 LLM 辅助审稿人对论文优点的识别更敏感，但也可能只是 LLM 输出天然趋向"给高分"的 bias。

### 2. 审稿质量与投入的巨大落差
大量作者抱怨收到了"不公正且无知"的评分。选择 Policy A（纯人工审稿）的审稿人花费大量时间独立完成审稿，却发现其他审稿人敷衍了事。这种努力程度的不对称进一步放大了 batch 内部和 batch 之间的评分差异。

### 3. Rebuttal 流程中的时序问题
部分审稿人在 author-reviewer discussion 阶段结束后才提交或更新评分，作者已无法通过 Author AC Confidential Comments 进行反馈。虽然 ICML 官方表示 AC 会在决策中综合考虑所有 rebuttal，但这种时序错位让许多作者感到不安，尤其当迟到的评分恰好拉低了论文均分时。

### 4. 自排名机制（Self-Ranking）的效果存疑
ICML 2026 引入的 Isotonic Mechanism 自排名政策，要求作者对自己的多篇投稿进行排序，以帮助校准评分。该机制提供"简单平均"和"贪心"两种策略来计算修正分。但社区对该机制的实际校准效果持怀疑态度，认为它可能只是增加了流程复杂度而未真正解决根本问题。

## 四、行业影响与未来展望

评分高方差问题并非 ICML 独有，ICLR、NeurIPS 等顶会近年来都面临类似困境。但 ICML 2026 因同时叠加了 LLM 双轨政策和自排名实验，使得问题更加突出和可量化。

**短期来看**，本轮审稿的高方差可能导致部分优秀论文被不公正地拒稿，而部分弱论文侥幸通过，进一步侵蚀社区对顶会评审体系的信任。**长期来看**，这一争议或将推动以下变革：

- **更成熟的 LLM 辅助审稿规范**：当前的 A/B 双轨实验本质上是一次大规模社会实验，其数据将为未来政策制定提供关键依据。
- **跨 batch 评分校准机制**：引入更强的全局校准（如 batch 间的分数归一化），而非仅依赖审稿人自觉。
- **审稿人激励与问责**：解决审稿投入不对称的根本问题，可能需要更强的审稿人评估和反馈机制。

顶会审稿体系正处于一个关键转折点，ICML 2026 的实验结果和社区反馈将深刻影响未来几年的学术评审范式。

---

## 五、相关链接

- [Reddit 原帖：ICML 2026 - Heavy score variance among various batches?](https://www.reddit.com/r/MachineLearning/comments/1sovebg/icml_2026_heavy_score_variance_among_various/)
- [ICML 2026 Peer Review FAQ](https://icml.cc/Conferences/2026/PeerReviewFAQ)
- [ICML 2026 Self-Ranking Policy](https://blog.icml.cc/2026/01/12/introducing-icml-2026-policy-for-self-ranking-in-reviews/)
- [Reddit: ICML 2026 Review Discussion](https://www.reddit.com/r/MachineLearning/comments/1s1yz2t/d_icml_2026_review_discussion/)
- [Reddit: ICML 2026 Review Policy Debate](https://www.reddit.com/r/MachineLearning/comments/1s8rpuo/d_icml_2026_review_policy_debate_100_responses/)
- [Reddit: ICML 2026 Average Score](https://www.reddit.com/r/MachineLearning/comments/1sbhuti/d_icml_2026_average_score/)
- [PaperCopilot ICML 2026 Statistics](https://papercopilot.com/statistics/icml-statistics/icml-2026-statistics/)
