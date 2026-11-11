---
title: "Gemini Decisions API"
date: "2026-11-12"
generated: "2026-11-12 07:00"
source: "HN"
slug: "2026-11-12_07-gemini-decisions-api"
summary: "2026年11月11日，Google发布由专用模型 Gemini Decision 1 驱动的 Decisions API，把“生成文字再解析”改成直接输出封闭选项的概率，面向路由、分级、规则检查和代理控制。HN批次冻结为179 points、59 comments；调研时Algolia显示187 points，脚本实际取得59个可见评论节点，未触及100条上限，当前口径不覆盖冻结数据。"
---

# Gemini Decisions API

## 事件背景

2026年11月11日，Google发布由专用模型 Gemini Decision 1 驱动的 Decisions API，把“生成文字再解析”改成直接输出封闭选项的概率，面向路由、分级、规则检查和代理控制。HN批次冻结为179 points、59 comments；调研时Algolia显示187 points，脚本实际取得59个可见评论节点，未触及100条上限，当前口径不覆盖冻结数据。

## 核心观点 / 产品机制

一次请求可把同一段文本、图像、音频、视频或PDF交给最多1000个彼此隔离的问题，在单次前向计算中返回三类结果：`noul`给出是/否概率，`choice`在2至255个选项间归一化，`score`输出有序量表的加权分及各级概率；每项另有置信度，应用应自行设阈值与人工回退。上下文上限262144 tokens，输出token为零。Google自报端到端延迟150至250毫秒、输入价每百万token 0.10美元及基准领先；这些并非独立复现。当前仅限Gemini Developer API的v1beta，且不支持缓存、批处理、对话历史、工具调用或推理块。

## 社区热议与争议点

waximabbax认为价格高于同类，但原生音视频输入对特定场景有价值。mediaman强调普通LLM的token概率校准差，不能把它等同于结构化输出，真正价值在可据不确定性分流。mikeocool则以早期竞品体验质疑延迟：Jev约250毫秒而竞品约750毫秒，说明官方基准仍需真实负载验证。vesterde追问何时进入Vertex；官方文档目前也只列开发者API，企业云落地时间未明。

## 行业影响与未来展望

它把分类器、LLM裁判和代理停止条件收敛为统一的多模态决策层，可能降低高频控制面的解析与输出成本。但概率不是授权：选项必然分配概率，输入还可能诱导自身分类；高风险动作仍需业务规则、对抗样本、阈值校准和人工复核。竞争焦点将从“能否返回枚举”转向校准、尾延迟、可移植性与生命周期承诺。

## 附带链接

- [Google官方发布原文](https://blog.google/innovation-and-ai/technology/developers-tools/gemini-decisions-api/)
- [Google开发文档](https://aistudio.google.com/docs/decisions-api)
- [Gemini Decision 1模型页](https://aistudio.google.com/docs/models/gemini-decision-1)
- [Hacker News讨论](https://news.ycombinator.com/item?id=50456791)
