---
title: "Claude cannot be trusted to perform complex engineering tasks — AMD 研究引发社区信任危机"
date: "2026-04-13"
generated: "2026-04-13 00:00"
source: "Reddit"
slug: "2026-04-13_00-01_claude_cannot_be_trusted"
summary: "2026 年 4 月初，AMD AI 部门主管 Stella Laurenzo 在其 GitHub issue 中公布了一项针对 Anthropic Claude Code 的大规模遥测分析。研究团队追踪了自 2026 年 1 月 30 日至 "
---

# Claude cannot be trusted to perform complex engineering tasks — AMD 研究引发社区信任危机

## 1. 事件背景
2026 年 4 月初，AMD AI 部门主管 Stella Laurenzo 在其 GitHub issue 中公布了一项针对 Anthropic Claude Code 的大规模遥测分析。研究团队追踪了自 2026 年 1 月 30 日至 4 月 1 日期间的 **6,852 个会话**、**234,760 次工具调用** 以及 **17,871 个思考块**，得出惊人结论：Claude Code 在复杂工程任务中的可靠性出现显著下滑，已“不值得信任”。该贴随后在 r/artificial 等技术社区引发激烈讨论，成为近期最具影响力的 AI 工具质量争议之一。

## 2. 核心观点/产品机制
Laurenzo 用数据量化了三场关键“退化”：
- **思考深度暴跌约 67%**：单条思考内容平均长度从 2,200 字符降至 560 字符；
- **编辑前文件读取量锐减**：从平均 6.6 次阅读降至 2.0 次，盲目编辑比例从 6.2% 飙升至 33.7%；
- **Stop-hook 违规激增**：模型在未完成任务时擅自中止或推卸责任的现象从 0 次/天跃升至约 10 次/天。

Anthropic 产品负责人 Boris Cherny 回应称，这主要源于 2 月推出的“思考内容隐去（redact-thinking）”机制以及 3 月 3 日默认努力度从 high 降至 medium（effort=85），并建议用户手动输入 `/effort high` 恢复深度思考。

## 3. 社区热议与争议点
支持者认为这份报告是首次用企业级数据证实“模型静默降级”的猜想：

> **“This is the most rigorous quantitative critique of an AI coding tool I've seen.”**
> （“这是我见过的对 AI 编程工具最严谨的量化批评。”）

但也有声音质疑数据解读存在因果混淆：

> **“Her data is undeniable, but correlation isn't causation — maybe their codebase got messier, not Claude.”**
> （“她的数据无可辩驳，但相关不等于因果——也许是他们的代码库变糟了，而不是 Claude。”）

更有不少开发者表示已经用行动投票：

> **“I switched to Codex two weeks ago and it's night and day.”**
> （“我两周前就转到了 Codex，差距简直天壤之别。”）

针对 Anthropic 的回应，社区普遍不买账：

> **“Anthropic's response feels like gaslighting: 'it's just UI redaction' when users can feel the difference.”**
> （“Anthropic 的回应像是在洗脑：明明用户能切身感受到差异，他们却说只是 UI 层面的隐去。”）

## 4. 行业影响与未来展望
这场争议揭示了 AI 辅助编程领域的一个核心软肋：**可观测性（observability）与信任缺失**。当模型厂商可以在不告知用户的情况下调整默认推理深度时，企业工程师难以建立稳定的开发依赖。未来，B2B 客户可能会要求厂商提供透明化的遥测仪表盘、模型版本锁定功能，甚至推动监管机构出台“AI 服务版本变更披露”规则。此外，竞争对手（如 OpenAI Codex、Cursor）正借此机会加速抢占对稳定性要求更高的企业市场。

## 5. 附带链接
- Reddit 讨论：https://www.reddit.com/r/artificial/comments/1sjgytc/claude_cannot_be_trusted_to_perform_complex/
- Laurenzo GitHub issue：https://github.com/anthropics/claude-code/issues/42796
- Anthropic 官方回应：见 GitHub issue 内 Boris Cherny 评论
