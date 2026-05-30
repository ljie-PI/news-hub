---
title: "openrouter-series-b"
date: "2026-05-31"
generated: "2026-05-31 07:00"
source: "HN"
slug: "2026-05-31_07-openrouter-series-b"
---

---
title: "OpenRouter raises $113M Series B"
date: 2026-05-31
source: HackerNews
slug: openrouter-series-b
generated: 2026-05-31 07:00
---

## 事件背景

2026 年 5 月 30 日，多模型 API 网关 **OpenRouter** 宣布完成 **1.13 亿美元 B 轮融资**，由 Alphabet 旗下成长基金 **CapitalG** 领投，**NVIDIA 的 NVentures**、**ServiceNow Ventures**、**MongoDB Ventures**、**Snowflake Ventures**、**Databricks Ventures**、AMP PBC、Pace Capital 共同参与，老股东 a16z 与 Menlo Ventures 跟投。过去 6 个月，OpenRouter 周处理量从 5 万亿 token 飙升至 **25 万亿 token**，年化将突破 **1 千万亿（quadrillion）token**，服务超过 **800 万开发者**与 **400+ 模型**。

## 产品机制

OpenRouter 定位于 Agent 与底层模型供应商之间的"路由/网关层"，提供四类核心能力：

1. **统一多模型接入**：覆盖文本、图像、音频、语音、转录、嵌入、视频等多模态推理端点；
2. **智能路由**：跨 Provider 故障切换、成本/延迟优化以及"质量感知"调度，超越简单负载均衡；
3. **企业治理**：Workspaces、支出管理、Guardrails、零数据保留（ZDR）策略；
4. **统一计费与可观测性**：让团队无需为每个模型供应商单独签合同。

本轮投资方阵容明显倾向"企业基础设施"，反映出企业从单模型试点走向多模型生产系统的趋势。

## 社区热议与争议点

HN 评论区对 OpenRouter 普遍持正面态度，许多开发者表示其"上手 5 分钟即可比较 GPT/Claude/Gemini/Llama"是日常工作流标配。但争议同样集中：一是 **加价透明度**——OpenRouter 在原始 token 价之上抽成，部分用户希望看到更清晰的费率结构；二是 **数据隐私**——尽管官方提供 ZDR，社区仍担心请求经过中间层的合规风险；三是 **护城河存疑**——LiteLLM、Portkey、Vercel AI Gateway 等开源/商业方案不断涌现，路由层是否会被云厂商或模型厂自身蚕食成为热门讨论；四是 **CapitalG 领投的信号**——有评论指出 Google 通过 CapitalG 投资一个聚合所有竞品的网关，是耐人寻味的战略对冲。

## 行业影响与未来展望

OpenRouter 的融资印证了"多模型时代"的基础设施叙事：当没有任何单一模型在所有任务上称王，路由、降级、成本优化、合规便成为生产部署的刚需。CapitalG + NVIDIA + 三大数据云（Snowflake/Databricks/MongoDB）+ ServiceNow 的组合，意味着 OpenRouter 极可能被嵌入企业现有数据与工作流栈。下一阶段竞争焦点将转向 **Agent 原生路由**（按工具/任务自动选模型）、**SLA 与可观测性** 以及 **私有部署/VPC 网关**。对开发者而言，多模型抽象层正在从"便利工具"升级为"AI 时代的 CDN"。

## 附带链接

- 原文：<https://openrouter.ai/announcements/series-b>
- HN 讨论：<https://news.ycombinator.com/item?id=48338660>
