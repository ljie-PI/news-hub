---
title: "Claude Opus 4.7 新分词器的隐性成本：官方说 1.35x，实测高达 1.47x"
date: "2026-04-18"
source: "HN"
slug: "2026-04-18_21-measuring-claude-47-tokenizer-costs"
summary: "Anthropic 于近日发布了 Claude Opus 4.7，在性能提升的同时引入了全新的分词器（tokenizer）。官方迁移指南明确标注，新分词器\"大约使用 1.0 到 1.35 倍的 token"
---

# Claude Opus 4.7 新分词器的隐性成本：官方说 1.35x，实测高达 1.47x

> 来源：Hacker News (632 points, 450 comments) | 2026-04-17

## 事件背景

Anthropic 于近日发布了 Claude Opus 4.7，在性能提升的同时引入了全新的分词器（tokenizer）。官方迁移指南明确标注，新分词器"大约使用 1.0 到 1.35 倍的 token 数量"来处理相同文本。然而，Claude Code Camp 博主 aray07 对此进行了独立实测，发现真实场景下的 token 膨胀率远超官方数字——在技术文档上实测达到 **1.47x**，在真实的 CLAUDE.md 配置文件上也达到了 **1.45x**。

尽管 Anthropic 保持了 $5/百万输入 token、$25/百万输出 token 的名义定价不变，但分词器的变化意味着：**同样的文本内容，你需要支付更多的 token 费用**。这实质上是一次"隐性涨价"。

## 核心观点与技术分析

分词器是 LLM 将自然语言文本转化为模型可处理的 token 序列的核心组件。不同的分词器对同一段文本会产生不同数量的 token。Claude 4.7 的新分词器显然采用了更细粒度的切分策略，这可能有助于模型更精确地理解文本语义，但代价是 token 数量显著增加。

作者的测试方法直接而有力：将相同内容分别送入 4.6 和 4.7 的 `/v1/messages/count_tokens` 端点，对比返回的 token 数。结果表明，对于代码和技术文档等内容，膨胀率可高达 1.47x——比官方声称的上限 1.35x 多出近 10 个百分点。

结合 Finout 等第三方分析机构的评估，即便按官方 1.35x 计算，使用 Claude Opus 4.7 处理大量上下文的 API 用户，每月账单也将增加约 35%。若按实测 1.47x 计算，增幅接近 50%。

## 社区热议与争议点

这篇文章在 HN 引发了超 450 条评论的激烈讨论，争议焦点主要集中在以下几个方面：

**1. 4.7 是否真的更强，还是"加价不加量"？**

用户 **uberman** 分享了切身体验："4.6 在实践中似乎有几乎无限的上下文窗口，很少产生不完整或错误的结果……但我确实注意到 4.7 消耗配额更快了。"这代表了相当一部分用户的感受——能力提升难以感知，但钱包的消耗却很明确。

**2. Anthropic 是否在暗中 A/B 测试？**

用户 **jofzar** 爆料称 Matrix.dev 发现 Anthropic 在过去 12 天里在生产环境中对 4.6 和 4.7 进行了 A/B 测试，引发了社区对透明度的质疑。用户在不知情的情况下使用了不同版本的模型，这对依赖一致性的生产环境是一个严重问题。

**3. 基准测试是否可信？**

当有人引用 MarginLab 的持续性能监控数据（marginlab.ai）为 Claude 辩护时，用户 **Majromax** 尖锐指出："典型的 95% 置信区间从 35% 到 65% 通过率——整整两倍的性能差异"，认为每天仅 50 个测试任务根本不足以得出有意义的结论。而 **cbg0** 更直接地质疑："缓存所有 SWE bench 问题的回答就能轻松刷榜"，暗示基准测试存在被游戏化的风险。反对方 **addisonj** 则试图调和："我承认人类对性能判断很差……但你真的要完全依赖那些一次次被证明可以被操纵的基准测试吗？"

**4. 产能瓶颈与 effort 机制的争议**

多位用户认为，Anthropic 引入的 effort 分级机制（低/中/高）部分原因是为了缓解产能压力。4.7 在高 effort 模式下会"更深入地思考"，产生更多输出 token，进一步推高成本。这让一些用户怀疑 effort 机制本质上是一种需求管理工具，而非纯粹的功能优化。

## 行业影响与未来展望

这一事件揭示了 AI 行业定价策略中的深层问题。名义价格不变、但通过分词器调整实现隐性涨价的做法，可能会引发用户信任危机。随着 LLM 被越来越多地嵌入生产系统，企业客户对成本的可预测性要求越来越高。

短期来看，依赖大量上下文输入的 Claude Code 用户和 API 重度用户将受到最直接的影响。长期来看，这一事件可能推动行业建立更透明的定价机制——例如基于实际字符数或标准化 token 计量，而非各模型自定义的分词器输出。

对于开发者而言，当务之急是审计现有工作流中的 token 消耗，利用 Anthropic 提供的 `count_tokens` 端点进行基准测试，并在预算规划中预留充足的弹性空间。

---

**相关链接**：
- 原始文章：[I Measured Claude 4.7's New Tokenizer. Here's What It Costs You.](https://www.claudecodecamp.com/p/i-measured-claude-4-7-s-new-tokenizer-here-s-what-it-costs-you)
- HN 讨论：[Hacker News](https://news.ycombinator.com/item?id=47807006)
- Anthropic 官方定价：[Claude API Pricing](https://platform.claude.com/docs/en/about-claude/pricing)
- Claude 4.7 更新说明：[What's new in Claude Opus 4.7](https://platform.claude.com/docs/en/about-claude/models/whats-new-claude-4-7)
