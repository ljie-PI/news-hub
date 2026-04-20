---
title: "Dear Anthropic: You're screwing up. Big time."
date: "2026-04-14"
generated: "2026-04-14 09:00"
source: "Reddit"
slug: "2026-04-14_09-01_dear_anthropic_screwing_up"
summary: "**来源**: r/ClaudeCode  "
---

# Dear Anthropic: You're screwing up. Big time.

**来源**: r/ClaudeCode  
**日期**: 2026-04-14  
**链接**: https://www.reddit.com/r/ClaudeCode/

---

## 1. 事件背景

2026 年 3-4 月，Anthropic 的 Claude Code 产品面临多重危机同时爆发：**配额耗尽过快**（订阅用户反映 19 分钟内用完 5 小时额度）、**模型性能疑似下降**（AMD 高级总监发布 6,852 次会话的数据分析，显示 Claude Code 从 2 月起推理深度明显退化）、**源代码意外泄露**（近 2,000 份内部文件因"人为失误"短暂公开）。

在这种背景下，r/ClaudeCode 出现了大量声讨帖，其中一篇标题直接为"Dear Anthropic: You're screwing up. Big time."的帖子获得了极高的关注度，成为该社区对 Anthropic 积累不满的集体宣泄口。

---

## 2. 核心观点 / 产品机制

**帖主的核心控诉**（综合来自多个高赞帖子的代表性观点）：

1. **配额危机**：Max 5 计划（$100/月）用户报告配额在 19-60 分钟内耗尽，而非承诺的"大量使用"。Anthropic 承认"用户使用速度比预期快"，但未给出明确的改善时间表或补偿方案。一位用户："我的$200/月费用能换来的实际使用时间我完全没法预测，这怎么算是专业服务？"

2. **性能退化指控**：Stella Laurenzo（AMD AI 集团高级总监）的 GitHub 分析显示，从 2026 年 2 月起，Claude Code 的推理深度下降，更频繁地采用"最简单的修复方案"而非深度推理，预先停止任务的频率上升。分析覆盖 6,852 次会话、17,871 个思维块和 234,760 次工具调用——这不是主观感受，而是数据。

3. **透明度缺失**：Anthropic 未主动告知用户任何与性能相关的变更，社区只能通过自发测试来发现和证明退化问题，这种"沉默"被认为是对付费用户的不尊重。

4. **"AI 缩水"（AI Shrinkflation）**：用户付同样的价钱，但产品能力在悄悄缩水，这与食品行业的"减量不减价"如出一辙。

---

## 3. 社区热议与争议点

**愤怒的多数声音**：
- "我把整个开发工作流都迁移到了 Claude Code，然后发现它的配额毫无规律地耗尽。这不是产品，这是赌博。"
- 多位开发者宣布切换到 Cursor + GPT-4o 或 GitHub Copilot，"Anthropic 让我学到了一个教训：不要把核心工作流依赖在没有 SLA 保证的 AI 服务上。"
- 有用户整理了一份"Claude Code 替代品"清单，在一周内获得了数千次保存。

**为 Anthropic 辩护的声音**：
- "Anthropic 的年化收入从$15B 涨到$30B 的速度代表了用户对产品的真实投票。配额问题是供需失衡，不是恶意为之。"
- "我一直在用 Claude Code，没感觉到退化。Stella 的分析可能混入了不同任务类型的噪音，'推理深度'这个指标怎么定义本身就有问题。"
- Anthropic 工程师 Boris Cherny 在 X 上发帖回应：UI 上"思考"部分的变化是显示层改动，不影响实际推理能力，并附上了 internal benchmark 数据——但很多用户认为内部 benchmark 不够可信。

**对行业的更深层反思**：
- "这场争议揭示了 AI 工具的一个根本问题：我们无法独立验证 AI 是否在'认真工作'。模型的黑箱性质让'性能退化'几乎无法被外部证伪。"
- 有用户提议 Anthropic 建立公开的、可重现的性能监控仪表板，让用户实时跟踪模型能力变化——这个建议获得了大量点赞，但 Anthropic 至今未回应。

---

## 4. 行业影响与未来展望

这场风波的深层影响远超一家公司的产品危机：

1. **AI 工具的 SLA 化是大势所趋**：企业用户将越来越要求 AI 服务商提供类似传统 SaaS 的 SLA（服务等级协议），包括可用性、性能和响应时间的明确承诺
2. **性能透明度成为竞争维度**：Anthropic 的这次被动成为了对手的机会，OpenAI 和 Google 都在强调"可靠性"和"稳定性"作为差异化卖点
3. **开发者生态的信任危机**：过度依赖单一 AI 工具商的风险被重新评估，多供应商策略（multi-vendor hedging）将在企业采购中变得更普遍
4. **Anthropic 的市值压力**：在年化$30B 收入的亮眼数字背后，用户留存率和 NPS（净推荐值）下降的隐忧正在被投资者注意到

**结语**：这场争议不是 Anthropic 独有的问题，而是整个 AI 行业在"快速增长"和"产品稳定性"之间撕扯的缩影。

---

## 5. 附带链接

- VentureBeat 深度报道（Claude 性能退化调查）: https://venturebeat.com/technology/is-anthropic-nerfing-claude-users-increasingly-report-performance
- The Register 报道（配额危机）: https://www.theregister.com/2026/03/31/anthropic_claude_code_limits/
- GitHub AMD 工程师分析: https://github.com/anthropics/claude-code/issues/42796
- Reddit 社区讨论: https://www.reddit.com/r/ClaudeCode/
