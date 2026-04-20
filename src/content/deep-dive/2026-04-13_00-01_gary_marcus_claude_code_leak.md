---
title: "Gary Marcus on the Claude Code leak"
date: "2026-04-13"
source: "Reddit"
slug: "2026-04-13_00-01_gary_marcus_claude_code_leak"
summary: "2026 年 4 月初，Anthropic Claude Code 发生了一起严重的源码泄露事件，约 50 万行代码被意外发布到 npm。纽约大学荣誉教授、长期批判纯深度学习路线的 Gary "
---

# Gary Marcus on the Claude Code leak

## 1. 事件背景
2026 年 4 月初，Anthropic Claude Code 发生了一起严重的源码泄露事件，约 50 万行代码被意外发布到 npm。纽约大学荣誉教授、长期批判纯深度学习路线的 Gary Marcus 迅速介入分析，并在 r/MachineLearning 引发轰动。他的核心论断是：泄露的核心文件 `print.ts`（一个长达 3,167 行、包含 486 个 IF-THEN 分支、嵌套深达 12 层的确定性内核）证明 Claude Code 的成功并非来自纯 LLM 缩放，而是来自**神经符号混合架构（neurosymbolic AI）**——这正是他 25 年来一直倡导的方向。

## 2. 核心观点/产品机制
Marcus 指出，这个内核负责代理的运行循环、速率限制、MCP 生命周期、模型切换与回滚等关键功能。它的结构“完全来自经典符号 AI”——一大串 IF-THEN 条件嵌套在确定性的符号循环里。他认为，这证明 Anthropic 在“关键时刻”走上了他预言的道路：当模式匹配的结果必须绝对正确时，不能完全信任概率模型，而需要确定性逻辑。Marcus 还将 Claude Code 与 AlphaFold、AlphaProof、Code Interpreter 并列为“成功的神经符号系统”。

## 3. 社区热议与争议点
许多研究者对 Marcus 的“胜利宣言”嗤之以鼻：

> **“Marcus is taking victory laps over spaghetti code. A 3000-line if-else monster is not 'neurosymbolic triumph'.”**
> （“Marcus 正对着一盘意大利面条代码开香槟。一个 3000 行的 if-else 怪兽可不是什么‘神经符号的胜利’。”）

但也有中间派认为他的大方向没错：

> **“He's not wrong that the agent loop is symbolic scaffolding. Every LLM agent has this.”**
> （“他说代理循环是符号脚手架，这没错。每个 LLM 代理都有这个。”）

支持者则认为这是他长期预言的应验：

> **“This is exactly what he predicted for 25 years. Maybe we should admit hybrid architectures work.”**
> （“这正是他 25 年前的预言。也许我们该承认混合架构确实有效。”）

代码质量至上的开发者则 focusing on the leak itself:

> **“The leak showed 46k-line files and daily API waste. The codebase is a mess, not a paradigm shift.”**
> （“泄露出来的文件有 4 万 6 千行，每天还浪费约 25 万次 API 调用。代码库是一团糟，不是什么范式转变。”）

## 4. 行业影响与未来展望
无论 Marcus 的解读是否过度，这场争论都重新点燃了**符号主义 vs. 连接主义**的世纪之战。对于实际构建 LLM 应用的工程师而言，结论可能是务实的：**纯 LLM 无法独自承担高可靠性任务，必须在外围构建确定性的符号控制层**。这意味着“智能体架构师”这一新角色的兴起——他们既要懂 Transformer，也要懂状态机、规则引擎和形式验证。未来，我们可能会看到更多显式声明“神经符号混合”定位的产品，以区别于单纯的“大模型套壳”。

## 5. 附带链接
- Reddit 讨论帖：https://www.reddit.com/r/MachineLearning/comments/1sjb0qi/gary_marcus_on_the_claude_code_leak_d/
- Gary Marcus 分析原文（LinkedIn）：https://www.linkedin.com/posts/gary-marcus-b6384b4_claude-code-an-impressive-and-possibly-game-changing-activity-7448767615193219072-7y3g
- 泄露文件分析参考：https://agent-wars.com/news/2026-04-12-the-biggest-advance-in-ai-since-the-llm
