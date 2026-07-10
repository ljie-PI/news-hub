---
title: "花钱越多，搜索越差？Agentic 搜索工具的成本与性能负相关"
date: "2026-07-11"
generated: "2026-07-11 07:00"
source: "Reddit"
slug: "2026-07-11_07-there-s-a-negative-correlation-between-cost-and-pe"
summary: "一位开发者在 r/AI_Agents 分享了一次大规模实测：他原以为为搜索 API 付更多的钱，就能让 Agent 得到更好的答案，结果几乎相反。他用同一个 Claude Opus 4.8"
---

# 花钱越多，搜索越差？Agentic 搜索工具的成本与性能负相关

## 事件背景
一位开发者在 r/AI_Agents 分享了一次大规模实测：他原以为为搜索 API 付更多的钱，就能让 Agent 得到更好的答案，结果几乎相反。他用同一个 Claude Opus 4.8 Agent 跑了相同的 121 个搜索任务，接入九款不同的 agentic web search 工具，每款各跑三轮，累计产生 3267 条经打分的答案。数据显示价格与质量沿着相反方向移动，其中 Firecrawl 综合排名第一，在 84 个「时效信息」任务中通过了 80 个。

## 核心观点
作者的核心结论是「贵 ≠ 好」。搜索质量取决于结果的相关性、内容完整度与噪声控制，而非单价。Firecrawl 因返回全页内容、贴合 Find→Extract→Clean→Use 的工作流而在时效任务上表现突出。高价 API 往往为「深度研究」或人类可读场景设计，未必适配 Agent 的程序化调用，反而在性价比上吃亏。

## 社区热议与争议点
围绕该帖的讨论呈现明显分歧（非逐字引用）。支持方认为该实验样本量够大，印证了「基准测试比营销话术更可信」。质疑方则指出：单一 Agent、单一任务集可能带来偏差，Firecrawl 自家博客也在推此类结论，存在利益关联；此外定价模式（按请求 vs 按积分）让横向比价并不公平。也有人提醒结果会随时间和索引更新而波动。

## 行业影响与未来展望
该实测强化了「用真实基准而非价格挑选工具」的趋势。随着 Brave、Exa、Tavily、Parallel 等在头部区间贴身竞争，差异逐渐落在延迟、内容抽取与噪声上。未来团队更可能按任务类型混搭多款 API，并以可复现基准持续评估，而非默认为高价买单。

## 附带链接
- Reddit 原帖：https://www.reddit.com/r/AI_Agents/comments/1usy2xt/theres_a_negative_correlation_between_cost_and/
- 参考基准：https://aimultiple.com/agentic-search
