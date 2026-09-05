---
title: "Portal by Spotify cut my Claude Code token usage by 90%"
date: "2026-09-06"
generated: "2026-09-06 07:00"
source: "HN"
slug: "2026-09-06_07-portal-by-spotify-cut-my-claude-code-token-usage-b"
summary: "Spotify 工程博客提出：编码代理的大量消耗来自读文件和生成样板，而非高难推理，因此可把这类工作从 Claude Code 分流给便宜模型。本批次冻结的 HN 数据为 242 分、152 条评论；调研时 Algolia 脚本实际取得 100 个可见节点，已触及本次上限，两种口径不能互换。"
---

# Portal by Spotify cut my Claude Code token usage by 90%

## 事件背景
Spotify 工程博客提出：编码代理的大量消耗来自读文件和生成样板，而非高难推理，因此可把这类工作从 Claude Code 分流给便宜模型。本批次冻结的 HN 数据为 242 分、152 条评论；调研时 Algolia 脚本实际取得 100 个可见节点，已触及本次上限，两种口径不能互换。

## 核心观点
方案以 Portal 的 AiKA Modes 声明临时代理，示例用 Gemini 2.5 Flash 承担批量阅读和样板代码。Shunt 插件在工具调用前拦截超过默认 350 行的整文件读取及部分 shell 读取，再由脚本调用 Portal CLI，技能文件负责提示调用方式；带范围的定向读取仍放行。标题的“90%”是 Spotify 作者在一个 Java 单体仓库、四种场景中，对“Claude 直接读文件”与“Claude 只消费工作模型摘要”所得的批量读取平均词元节省自报值，不是独立基准；代码生成场景连作者也称难以按词元比较。原文还承认廉价模型漏掉线程安全缺陷，且一次委派通常增加 10—30 秒延迟。

## 社区热议
正面例子中，jampa 把廉价模型称作先定位相关代码的“LLM 过滤器”；fy20 则称 Cursor 的类似分工在父模型复核下多数交接可用。反方方面，lxgr 指出 LLM 无法像布隆过滤器那样保证不漏项；gruez 质疑文章只算词元、未控制输出准确性，也没有 DeepSWE-bench 一类任务效果。四例均来自本次实际取回的 Algolia 节点。

## 行业影响
这类分层路由可把模型选择从平台工程下沉为配置，并复用于阅读、文档和样板生成；但它更准确地说是把昂贵模型的词元转移到另一服务，而非证明总成本下降。能否规模化取决于质量回归、端到端费用、数据边界与延迟监控；调试、架构和安全关键代码仍应由强模型读取原始上下文并复核。

## 附带链接
- [Spotify 工程原文](https://engineering.atspotify.com/2026/9/portal-by-spotify-cut-my-claude-code-token-usage-by-90)
- [Hacker News 讨论](https://news.ycombinator.com/item?id=49571465)
- [Shunt 插件](https://github.com/sorantis/portal-ai-plugins/tree/add-shunt-claude/plugins/shunt)
- [AiKA Modes 文档](https://backstage.spotify.com/docs/portal/core-features-and-plugins/aika/modes)
