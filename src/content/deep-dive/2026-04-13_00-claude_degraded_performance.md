---
title: "\"终于轮到我们了\"：开发者集体遭遇 Claude Code 性能断崖式下跌"
date: "2026-04-13"
generated: "2026-04-13 00:00"
source: "Reddit"
slug: "2026-04-13_00-claude_degraded_performance"
summary: "2026 年 4 月，r/ClaudeCode 上一篇帖子标题为「Finally happened to me and my colleagues. Seeing severely degraded performance」。作者所在公司大部分开发者使用 Claude Max20 计"
---

# "终于轮到我们了"：开发者集体遭遇 Claude Code 性能断崖式下跌

## 1. 事件背景
2026 年 4 月，r/ClaudeCode 上一篇帖子标题为「Finally happened to me and my colleagues. Seeing severely degraded performance」。作者所在公司大部分开发者使用 Claude Max20 计划，直到 3 月底体验都还极佳，「felt genuinely amazing and assisted us in our work」。但过去一周，他和同事都发现 Claude 出现了严重的质量下滑：本不该犯的遗漏、 Rubberducking 时做出愚蠢决策、无视上下文/指令。帖子迅速成为该子版块当月最热帖之一，与 AMD AI 总监 Stella Laurenzo 的数据化 critique 形成呼应。

## 2. 核心观点/产品机制
发帖者描述的症状与 Laurenzo 的 telemetry 高度一致，但完全来自一线开发者的主观体验：
- **上下文失忆**：Claude 开始忽略之前明确答应过的事；
- **决策退化**：在讨论架构方案时给出明显不合理的建议；
- **整体「变笨」**：从 3 月底的「真正的 force multiplier」变成令人失望的助手。

这与 Anthropic 在 2–3 月做的两项变更直接相关：
1. **2 月 9 日**：引入 adaptive thinking 机制，动态调整 thinking 长度；
2. **3 月 3 日**：将默认 effort level 从 high 改为 medium（effort=85）。
3 月 8 日前后，社区开始大规模反馈 quality degradation，同日 thinking redaction 比例突破 50%。

## 3. 社区热议与争议点
由于 Reddit 页面被反爬虫机制屏蔽，无法直接抓取该帖评论。但据 2026 年 4 月 dev.to 对 500+ Reddit 开发者评论的聚合分析，以及 The Register、InfoWorld 的报道，r/ClaudeCode 和 r/ClaudeAI 上的讨论情绪激烈：

**正方（强烈认同退化，准备换工具）**
- Reddit 用户抱怨：「One complex prompt to Claude and by the end you've burned 50-70% of your 5-hour limit.」质量下降的同时，使用限制让体验雪上加霜。
- 另一名用户称：「I used it 8 hours a day. Kept hitting usage limits so I bought two $200/month accounts. Canceled both immediately.」
- 有评论说：「Claude Code is higher quality but unusable. Codex is slightly lower quality but actually usable.」这句话精准概括了很多人的心态。

**反方（认为可以手动调回或只是短期波动）**
- 部分用户反驳：只要手动 `/effort high` 或改 `settings.json`，质量就能恢复。Anthropic 官方也持此观点。
- 有人将问题归咎于 4 月 8 日 Anthropic 的大规模 outage，认为部分退化是基础设施不稳定导致的临时现象。

## 4. 行业影响与未来展望
这则帖子及其引发的 Reddit 浪潮，标志着 AI coding agent 市场从「蜜月期」进入「挑剔期」。开发者不再满足于 benchmark 分数，而是要求：
1. **行为稳定性**：默认设置不应在未经明确告知的情况下降低质量；
2. **可预测的计费**：复杂的工程提示不应突然烧掉 70% 的额度；
3. **透明的 reasoning**：thinking token 被隐藏后，开发者失去了 debug 和信任模型的依据。
长期来看，这起事件可能加速 Cursor、Codex、Opencode 等竞品的用户增长，并促使 Anthropic 重新审视其默认 effort 策略与商业化路径（Max vs. Pro vs. API）。

## 5. 附带链接
- Reddit 原帖：https://www.reddit.com/r/ClaudeCode/comments/1sjepy1/finally_happened_to_me_and_my_colleagues_seeing/
- 外部资源：
  - [dev.to - Claude Code vs Codex 2026: What 500+ Reddit Developers Really Think](https://dev.to/_46ea277e677b888e0cd13/claude-code-vs-codex-2026-what-500-reddit-developers-really-think-31pb)
  - [The Register - Claude Code has become dumber, lazier: AMD director](https://www.theregister.com/2026/04/06/anthropic_claude_code_dumber_lazier_amd_ai_director/)
  - [InfoWorld - Enterprise developers question Claude Code reliability](https://www.infoworld.com/article/4154973/enterprise-developers-question-claude-codes-reliability-for-complex-engineering.html)
