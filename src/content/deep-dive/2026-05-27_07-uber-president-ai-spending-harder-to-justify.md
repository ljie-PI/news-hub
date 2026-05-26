---
title: "uber-president-ai-spending-harder-to-justify"
date: "2026-05-27"
generated: "2026-05-27 07:00"
source: "HN"
slug: "2026-05-27_07-uber-president-ai-spending-harder-to-justify"
---

---
title: "Uber president says AI spending is getting 'harder to justify'"
date: "2026-05-27"
source: "Hacker News"
hn_url: "https://news.ycombinator.com/item?id=48277485"
external_url: "https://www.theverge.com/transportation/937116/uber-ai-investment-hard-to-justify"
score: 250
comments: 132
slug: "uber-president-ai-spending-harder-to-justify"
---

## 事件背景

Uber 总裁兼 COO Andrew Macdonald 在播客《Rapid Response》接受采访时透露,公司在 2026 年仅四个月就用完了全年 AI 预算。Uber 2025 年研发支出达 34 亿美元,同比增长 9%;CEO Dara Khosrowshahi 公开表示公司正以减少招聘的方式对冲 AI 投入。Macdonald 直言,目前 Claude Code 等编码工具的 token 消耗与公司向用户交付的有用功能之间无法划出清晰的因果线:"那条联系还不存在……我无法说'OK,我们现在多产出了 25% 有用的消费者功能'。"他承认部分底层指标 (如代码量、PR 数量) 趋势惊人,但未来若不能与功能交付挂钩,"token 成本对人头成本"的取舍将越来越难自证。Verge 将此视为 AI 大客户公开质疑前沿 AI ROI 的标志性时刻。报道还列出 Uber 借 AI 投入新推出的几个功能:与 Expedia 集成的应用内酒店预订、Travel Mode、"Eats for the Way"司机顺路取餐、语音订单等。

## 核心观点

文章核心观点是:企业 AI 支出正在进入"对账期"——头部买家被迫从"叙事消费"转向 ROI 核算。Macdonald 的发言并非反对 AI,而是预告 Uber 将公开把 token 消耗与人头开支放在同一张表上博弈,这种公开化本身就会反向影响 Anthropic、OpenAI 等供应商的定价权与续约谈判。在更宏观层面,文章暗示当一家以"激进采用新技术"著称的公司都觉得难以自证,大多数后发企业的 AI 预算合理性将更脆弱。

## 社区热议

HN 评论区将此视为"AI 泡沫体温计",分歧明显但更偏冷静派。最高赞主题之一是"tokenmaxxing"——lazide 直言,大企业鼓励工程师烧 token 的本质是"哪怕 AI 不真好用,只要让人相信它有可能取代你,就足以削弱软件工程师的议价权"。lokar 援引 Goodhart 定律:"经理无法把工程师绩效测准到 ±50%,于是就改测能测的——token 消耗",于是出现指标驱动的浪费。ambicapter 总结风气:"没人愿意承认自己不知道 AI 怎么帮上忙,但也没人愿意被甩下炒作列车"。在 ROI 一侧,JSR_FDED 指出"低垂果实"很快被摘完,复杂的棕地代码现实里收益骤降;blensor 警告速度会复利化技术债——"用劣质砖块快速堆出来的叠叠乐"。也有真实正面案例:有用户讲述 iOS UI 测试套件多年无人维护,用 Claude 让其通宵跑了一周就完成;另一位 CTO 用 haiku+sonnet 自建了月成本 <20 美元的 Intercom 替代品。foldr 主张"保守用法"——代码评审、bug 根因定位、代码库语义搜索——即便不让 AI 写代码也清晰受益。规模视角上,rowanseymour 与 2001zhaozhao 都认为小而精的团队最受益,大型企业的瓶颈本就是官僚而非编码速度,因此 AI 边际收益较小。市场派 DesiLurker 指出中国模型已经"提前刺破泡沫",AI 让执行力的护城河消失,"剩下的护城河只能从华盛顿买"。也有警告 (lenerdenator):企业会同时砍人头与砍 AI 支出,而攻击者却不存在预算约束,安全侧风险将被 AI 放大。

## 行业影响

Macdonald 的发言对整个企业 AI 市场意味着几件事。第一,前沿 AI 厂商的"用量增长"叙事开始被大客户重新框定为"用量 vs 价值"叙事,Anthropic、OpenAI 的合同结构 (席位、token 配额、产出担保) 都会被重谈。第二,"token cost vs headcount cost"将成为 CFO 们的标准 KPI,催生第三方 AI 成本治理、可观测性与代理路由产品 (FinOps for AI) 的需求。第三,模型分层策略将更激进:像 DeepSeek、Xiaomi MiMo 等便宜模型 (今日 HN 同批次另有 MiMo-v2.5 降价 99% 的新闻) 会被大量纳入混合栈,把昂贵的前沿模型挤到真正需要复杂推理的边缘场景。第四,招聘节奏被 AI 间接锁定——Uber"少招人对冲 AI 投入"的逻辑若不能兑现产出,将转为"既减招聘又减 AI 支出",对软件行业就业是双向利空。第五,小团队与个人开发者反而是结构受益方:他们的瓶颈本就是产能,AI 价值最易显化。

## 附带链接

- 原文 (The Verge): https://www.theverge.com/transportation/937116/uber-ai-investment-hard-to-justify
- Hacker News 讨论: https://news.ycombinator.com/item?id=48277485
- 相关主题: Outsourcing + Local AI vs Frontier Labs https://www.signalbloom.ai/posts/outsourcing-plus-localai-will-soon-become-more-economical-vs-frontier-labs/
