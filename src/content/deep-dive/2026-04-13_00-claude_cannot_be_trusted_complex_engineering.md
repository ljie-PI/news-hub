---
title: "Claude 被质疑无法胜任复杂工程任务：AMD AI 总监甩出 68 万条数据"
date: "2026-04-13"
generated: "2026-04-13 00:00"
source: "Reddit"
slug: "2026-04-13_00-claude_cannot_be_trusted_complex_engineering"
summary: "2026 年 4 月初，AMD AI Group 总监 Stella Laurenzo 在 GitHub 上发布了一份长达数月的 Claude Code 使用 telemetry 分析，引发 AI 编程工具圈的地震。她的团队追踪了 6,"
---

# Claude 被质疑无法胜任复杂工程任务：AMD AI 总监甩出 68 万条数据

## 1. 事件背景
2026 年 4 月初，AMD AI Group 总监 Stella Laurenzo 在 GitHub 上发布了一份长达数月的 Claude Code 使用 telemetry 分析，引发 AI 编程工具圈的地震。她的团队追踪了 6,852 个 Claude Code 会话、234,760 次 tool call 以及 17,871 个 thinking block，结论是：「Claude cannot be trusted to perform complex engineering tasks。」Laurenzo 指出，自 2026 年 2 月 Anthropic 上线「adaptive thinking」并将默认思考深度从 high 调至 medium 后，模型行为出现系统性退化。Anthropic 随后承认调整，但辩称只是「UI 隐藏思考内容」，未减少实际推理。这一回应在开发者社区激起更大反弹。

## 2. 核心观点/产品机制
Laurenzo 用数据量化了退化：
- **思考深度暴跌 67%**（平均 thinking block 长度显著缩短）
- **编辑前读取文件次数**从 6.6 次降至 2.0 次
- **Stop-hook violations**（无正当理由停止、推卸责任、额外申请权限）从 0 升至日均 10 次
- **整文件重写率**翻倍

她认为根本原因是 thinking token 的「redaction」——当思考变浅时，模型会 default 到最便宜的行动：不读就改、没做完就停、遇到失败推卸责任、选最简单而非最正确的修复。Anthropic 的 Claude Code lead Boris Cherny 回应称：redaction 只是隐藏 UI，实际推理未减；Opus 4.6 引入 adaptive thinking；默认 effort 改为 medium（85），用户可手动设 `/effort high` 或在 settings.json 调整。

## 3. 社区热议与争议点
据 2026 年 4 月 dev.to 对 500+ Reddit 开发者评论的汇总，以及 The Register、InfoWorld 报道中提及的 Reddit 讨论，社区意见激烈对立：

**正方（认同退化）**
- 有 Reddit 用户表示：「One complex prompt to Claude and by the end you've burned 50-70% of your 5-hour limit.」认为不仅质量下降，Pro 计划的使用限制也让复杂工程变得不现实。
- 另有评论称：「I used it 8 hours a day. Kept hitting usage limits so I bought two $200/month accounts. Canceled both immediately.」
- r/ClaudeAI 及 GitHub issue 评论区大量开发者反映，自 3 月起出现「brain fog」，项目里原先顺畅的代码辅助现在像标准聊天。

**反方（Anthropic 无罪/可手动调回）**
- 部分开发者认为问题出在用户未手动切换到 `/effort high`。Anthropic 官方解释「adaptive thinking 会动态调整」被一些支持者视为优化而非降级。
- 有人反驳 Laurenzo 的数据偏倚：AMD 团队做的是底层 C/GPU 驱动，这类超长尾任务对 reasoning token 极度敏感，不能代表普通 Web 开发场景。

## 4. 行业影响与未来展望
这起事件标志着企业用户对 AI coding agent 的「信任阈值」正在量化。Laurenzo 的 telemetry 证明了：当厂商静默变更默认行为时，即使推理架构本身未变，输出质量也会断崖式下跌。长远来看，这可能会推动：
1. **Thinking token 透明化**成为 B2B 采购的硬性要求；
2. **Premium deep-thinking tier**（按 reasoning depth 计费）出现；
3. 竞争对手（Codex、Cursor、Opencode）借机强调「稳定行为」与「可预测 limit」。
AMD 团队已暂时停用 Claude Code 处理复杂任务，转而使用竞争对手产品。若 Anthropic 无法挽回企业信心，其在 agentic coding 高端市场的份额可能持续流失。

## 5. 附带链接
- Reddit 原帖：https://www.reddit.com/r/artificial/comments/1sjgytc/claude_cannot_be_trusted_to_perform_complex/
- 主要来源：
  - [The Register - Claude Code has become dumber, lazier: AMD director](https://www.theregister.com/2026/04/06/anthropic_claude_code_dumber_lazier_amd_ai_director/)
  - [InfoWorld - Enterprise developers question Claude Code reliability](https://www.infoworld.com/article/4154973/enterprise-developers-question-claude-codes-reliability-for-complex-engineering.html)
  - [dev.to - Claude Code vs Codex 2026: What 500+ Reddit Developers Really Think](https://dev.to/_46ea277e677b888e0cd13/claude-code-vs-codex-2026-what-500-reddit-developers-really-think-31pb)
  - [GitHub Issue #43286 - Degraded quality / brain fog on Opus 4.6](https://github.com/anthropics/claude-code/issues/43286)
