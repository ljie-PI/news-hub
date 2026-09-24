---
title: "Once Claude can measure something, it can make it faster"
date: "2026-09-25"
generated: "2026-09-25 07:00"
source: "HN"
slug: "2026-09-25_07-once-claude-can-measure-something-it-can-make-it-f"
summary: "Anthropic称，八月用两周把网页与桌面端核心体验提速约三倍。团队先锁定覆盖九成五活动的四类旅程、十三项指标；第七十五百分位下，网页可输入时间由三点一秒降至零点五五秒，新建Claude Code会话由零点八秒降至零点三秒，加载Cowork云会话由二点六秒降至零点七三秒。以上均是官方自报，并非独立复测。"
---

# Once Claude can measure something, it can make it faster

## 事件背景
Anthropic称，八月用两周把网页与桌面端核心体验提速约三倍。团队先锁定覆盖九成五活动的四类旅程、十三项指标；第七十五百分位下，网页可输入时间由三点一秒降至零点五五秒，新建Claude Code会话由零点八秒降至零点三秒，加载Cowork云会话由二点六秒降至零点七三秒。以上均是官方自报，并非独立复测。

## 核心观点 / 产品机制
Claude Tag经Datadog MCP分析数据，把旅程拆成指令数、函数调用、React提交、样式重算与DOM变更等实验指标。基准须先证明与墙钟延迟相关，再写入只降不升的CI门槛。代理按“定位慢点—建基准—提交PR—灰度上线—读现场数据—下调门槛”并行循环；三千余次改动仍保留测试、人类批准、功能旗标和渐进发布。团队以八点三三毫秒帧预算优化长回复，却否决用九百行代码换两毫秒，主导权仍在人。

## 社区热议与争议点
冻结热度为220 points / 148 comments；本次Algolia实际取得100个可见节点，已触及上限。Daishiman赞成把高成本、未必奏效的优化试验交给代理；smy20011反驳局部指标可能掩盖SSR、路由和分块渲染等架构问题；simonw实测移动网络加载很快，却发现页面仍加载约20.78 MB JavaScript，认为还可减重。争论焦点不是提速是否存在，而是指标爬坡会否累积复杂度与技术债。

## 行业影响与未来展望
这套方法把性能工程从少数专家的阶段性项目，变成代理持续寻找可测目标的流水线；可迁移前提是指标确实代表用户体验，并用视觉回归、现场遥测和人类“品味”防止古德哈特效应。官方也承认长会话及第九十五百分位仍待改善。

## 附带链接
- [官方原文](https://claude.dev/blog/how-we-made-claude-ai-faster/)
- [Hacker News 讨论](https://news.ycombinator.com/item?id=49821196)
