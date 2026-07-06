---
title: "GPT-5.6 Sol Ultra will be in Codex"
date: "2026-07-07"
generated: "2026-07-07 07:00"
source: "HN"
slug: "2026-07-07_07-gpt-5-6-sol-ultra-will-be-in-codex"
summary: "OpenAI 员工 Thomas Sottiaux 在 X 上宣布，GPT-5.6 系列中推理能力最强的 Sol Ultra 档位将接入 Codex 编程工具。GPT-5.6 采用全新命名体系：数字代表代际，Sol、Terr"
---

# GPT-5.6 Sol Ultra will be in Codex

## 事件背景
OpenAI 员工 Thomas Sottiaux 在 X 上宣布，GPT-5.6 系列中推理能力最强的 Sol Ultra 档位将接入 Codex 编程工具。GPT-5.6 采用全新命名体系：数字代表代际，Sol、Terra、Luna 代表可独立演进的能力层级。此次之所以引发热议，一是 Sol 引入了 max 与 ultra 两档更高推理强度，二是据 The Information 报道，OpenAI 疑似找到了将推理成本砍半的方法。

## 核心观点 / 产品机制
Sol Ultra 定位于最吃算力的高强度推理任务，把它塞进 Codex，意味着 OpenAI 想让顶配模型直接驱动 agentic 编程工作流，而非停留在对话问答。评论区最关注的机制是"成本如何砍半"：dools 认为 OpenAI 多半已搞定某种共享 KV 缓存，并援引 vLLM 的 Automatic Prefix Caching——前缀相同的查询可复用缓存、跳过重复计算。但 ewild 提醒很多人低估了 transformer 的工作方式，这类优化远非唾手可得；simpleintheory 则指出 OpenAI 疑似已以"fast answers"之名在做类似复用。

## 社区热议与争议点
争论随即转向"缓存到底能否省钱"。joegibbs 乐观估计"各国首都是什么"这类通用问题或占查询一成，若近乎免费返回就值得缓存。nearbuy 用数据反驳：这类问题按 GPT-5.5 API 计价仅约五分之一美分、输出七十余 token，而编程动辄数十万 token 上下文，缓存又要求前缀完全匹配，省下的都是本就不花钱的部分。imtringued 补充说维护上 GB 的缓存库本身开销巨大，只有"每用户前缀缓存"才真正划算。围绕"效率优化该不该保密"，layla5alive 援引报道称各家把 compute multiplier 当商业机密封锁，razodactyl 与 georgemcbay 则主张 AI 应回归开放协作。

## 行业影响与未来展望
Sol Ultra 进入 Codex，标志前沿模型正加速向高强度 agentic 编程收敛，"有限预览"也让顶配算力愈发稀缺。若推理成本真能砍半，将重塑 API 定价并挤压开源模型的性价比空间；反之若只是营销话术，高强度档位的高昂开销仍是长上下文编程的最大痛点。这场围绕缓存与推理经济学的激辩，预示竞赛焦点正从"参数与跑分"转向"单位 token 成本"。

## 附带链接
- 原帖（HN 讨论链接）: https://news.ycombinator.com/item?id=48799614
- 原始新闻链接（外部 URL）: https://twitter.com/thsottiaux/status/2073933490513752151
