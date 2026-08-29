---
title: "I accidentally turned LLM memory into program analysis"
date: "2026-08-30"
generated: "2026-08-30 07:00"
source: "HN"
slug: "2026-08-30_07-i-accidentally-turned-llm-memory-into-program-anal"
summary: "作者在用 LLM agent 做长期漏洞研究时发现：模型会重新提出已排除路径，也会沿着后来被证伪的观察继续推理。批次冻结时该帖为 266 points、71 comments；调研时 Algolia 实际取得 62 个可见评论节点，未触及 100 条上限，两种口径不混用。"
---

# I accidentally turned LLM memory into program analysis

## 事件背景
作者在用 LLM agent 做长期漏洞研究时发现：模型会重新提出已排除路径，也会沿着后来被证伪的观察继续推理。批次冻结时该帖为 266 points、71 comments；调研时 Algolia 实际取得 62 个可见评论节点，未触及 100 条上限，两种口径不混用。

## 核心观点 / 产品机制
Lemmalog 把 LLM 当作概率式前端，将源码、调试器输出和自然语言抽取成 Datalog facts；确定性引擎再按 rules 求固定点。它记录每个结论的多条支持链，撤回错误事实时只失效受影响且已无其他支撑的结论，并以 provenance 回答“为何成立”，用 validity intervals 保留历史状态。向量检索负责找相关旧信息，演绎状态则回答“目前什么为真”。作者自测中，LongMemEval F1 为 0.463，LoCoMo 为 0.533，仍落后 PropMem；优势集中在知识更新、时间关系与拒绝错误前提，瓶颈则是抽取遗漏、实体归并及条件语义损失。

## 社区热议与争议点
tptacek 将其概括为让模型查询 CodeQL 式的代码事实提取，肯定神经与符号分析的结合；alexpotato 赞同让 LLM 只处理模糊部分、把重复推导交给低成本确定性程序。反方中，alansaber 指出事实变更仍需版本控制和关系重算，会增加复杂度与计算开销；apt-apt-apt-apt 追问紧凑 DSL 遇到“有点红蓝且间歇出现”这类模糊条件后，是否最终仍会退回自然语言。

## 行业影响与未来展望
这条路线把“扩大上下文”改写为“维护可撤销、可追溯的分析状态”，可能适用于代码审计、故障调查和长期研究 agent，也利于审阅结论来源。但目前证据主要是会话记忆基准，尚未验证真实漏洞项目；未来关键不只是 Datalog 求值，而是可靠抽取、非单调更新、置信度与原始片段回溯。

## 附带链接
- [原文](https://pwning.systems/posts/llm-memory-program-analysis/)
- [Hacker News 讨论](https://news.ycombinator.com/item?id=49485416)
- [Lemmalog](https://github.com/JordyZomer/lemmalog)
