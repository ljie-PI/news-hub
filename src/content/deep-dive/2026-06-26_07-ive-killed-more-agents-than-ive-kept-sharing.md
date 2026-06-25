---
title: "I've killed more agents than I've kept. Sharing the patterns in what dies and why."
date: "2026-06-26"
generated: "2026-06-26 07:00"
source: "Reddit"
slug: "2026-06-26_07-ive-killed-more-agents-than-ive-kept-sharing"
summary: "Reddit r/AI_Agents 用户 Worldly-Self-6270 发布经验帖，称过去 6 个月大约上线了 30 个不同的 AI agent 尝试，最终仍在运行的只有约 8 个，其余 22 个多在第 1 或第"
---

# I've killed more agents than I've kept. Sharing the patterns in what dies and why.

## 1. 事件背景
Reddit r/AI_Agents 用户 Worldly-Self-6270 发布经验帖，称过去 6 个月大约上线了 30 个不同的 AI agent 尝试，最终仍在运行的只有约 8 个，其余 22 个多在第 1 或第 2 周死亡。可访问的本地原始摘要显示，作者要分享“反复杀死 agent 的 5 个模式”，其中明确展开的第一项是：**Too many jobs in one agent**。我尝试通过 Reddit 原帖、`.json`、RSS、Old Reddit 以及公开搜索查看评论与完整正文，但 Reddit 页面抓取失败，搜索结果只返回帖子摘要和列表页片段，因此本文的事实部分主要基于该 raw 摘要与公开搜索片段；评论区不作逐字引用。

## 2. 核心观点/产品机制
这条帖子的核心价值在于把 agent 失败从“模型不够强”拉回到“系统边界设计不清”。作者举例说，凡是试图做“do everything inbound”的 agent 都死得很快：同一个 agent 同时负责邮件分流、草拟回复、安排会议、记录工单时，边缘情况会几何级放大。每增加一个职责，不只是多一个工具调用，而是多一套意图识别、状态跟踪、权限判断、失败回滚和用户期望管理。最后，prompt 变长、上下文变乱、错误难复现，开发者也很难判断究竟是哪一步出了问题。

更可落地的机制是把 agent 拆成窄任务单元：一个 agent 只做 inbox triage，另一个只做 draft，调度和工单写入交给确定性工作流或受限工具层；跨步骤由队列、状态机、审批节点和日志连接，而不是让一个 LLM 在超大上下文里“自由发挥”。这与近期 agent 工程中的共识相近：LLM 适合处理模糊输入、生成候选和解释结果，但靠近权限、日历、CRM、财务或客户沟通时，需要 schema、测试、审计与人类确认来限定行为。

## 3. 社区热议与争议点
由于评论正文无法抓取，以下是基于可见帖文与同类 r/AI_Agents 讨论脉络整理的争议，而非评论原文。第一，**单体 agent vs 多 agent 编排**：支持拆分者认为窄职责更容易评测和维护，反对者则担心多 agent 会带来更多链路延迟、成本和状态同步问题。第二，**agent 失败到底是产品问题还是工程问题**：作者的数据——30 个中只留 8 个——会让不少开发者质疑“demo 能跑”和“持续运行”之间的巨大差距。第三，**自主性边界**：邮件、会议、工单这些场景看似普通，但每一步都可能触达客户关系和业务记录，社区通常会争论哪些操作必须 human-in-the-loop，哪些可以自动执行。

## 4. 行业影响与未来展望
这类失败复盘对 2026 年企业 agent 落地很有提醒意义。过去一段时间，市场叙事强调“端到端自治”和“一个 agent 接管一个岗位”，但一线实验显示，真正能活过两周的往往是范围更小、接口更硬、反馈回路更短的工具型 agent。未来的产品竞争点可能不是谁能在演示中串联更多 app，而是谁能把职责边界、异常处理、观测指标和回滚机制做得足够清楚。对创业团队而言，最务实的路线是先从高频、低风险、可验证的小任务切入，用真实留存率、失败率和人工接管率证明价值；对企业买家而言，则应警惕“全能 agent”承诺，优先询问它如何分工、如何测试、如何审计，以及出错时谁负责。

## 5. 附带链接
- Reddit 原帖：https://www.reddit.com/r/AI_Agents/comments/1uf8oui/ive_killed_more_agents_than_ive_kept_sharing_the/
- r/AI_Agents 列表页搜索结果：https://www.reddit.com/r/AI_Agents/top
- 本次可用来源说明：Reddit 正文/评论抓取失败；本文基于本地 raw 摘要、公开搜索片段与同类 agent 工程实践分析。
