---
title: "M5 Pro MacBook 48GB 本地模型选型：Qwen 3.6 之外还能跑什么"
date: "2026-07-25"
generated: "2026-07-25 07:00"
source: "Reddit"
slug: "2026-07-25_07-just-got-an-m5-pro-macbook-48gb-ram-currently-runn"
summary: "一位用户新购 M5 Pro MacBook，配 48GB 统一内存，正通过 LM Studio 运行 Qwen 3.6 35B（A3B）并搭配终端工具 OpenCode 做本地编码。他在 r/LLM 求推荐其他值得一试的"
---

# M5 Pro MacBook 48GB 本地模型选型：Qwen 3.6 之外还能跑什么

## 事件背景
一位用户新购 M5 Pro MacBook，配 48GB 统一内存，正通过 LM Studio 运行 Qwen 3.6 35B（A3B）并搭配终端工具 OpenCode 做本地编码。他在 r/LLM 求推荐其他值得一试的本地模型，覆盖编码与通用两类。这一提问踩中了 2026 年的热点：Apple Silicon 的统一内存正让消费级笔记本成为可用的本地 AI 工作站。

## 核心观点 / 产品机制
Qwen 3.6 35B-A3B 是 MoE 架构，35B 总参数每 token 仅激活约 3B，4-bit 量化后约 20GB，恰好舒适地落在 48GB 内存里，且在 M5 上可达数十 tokens/s。它在 SWE-bench 上表现亮眼，被不少人视为当前 Mac 本地编码首选。关键机制在于：MoE 稀疏激活兼顾大参数容量与低显存占用，而 LM Studio/MLX/llama.cpp 提供了开箱即用的量化与推理。48GB 的余量还允许更长上下文或并行加载。

## 社区热议与争议点
（以下为议题层面归纳，未逐字引用评论。）通用与编码推荐通常分化：编码方向常被提及 Qwen3-Coder 系列、DeepSeek-Coder 类；通用/指令方向则有 Gemma、Llama 系列稠密模型。支持 MLX 者称其在 Apple 芯片上吞吐更高；反对者反映 MLX 版偶有上下文崩溃，回退 GGUF 更稳。分歧还在于：是否值得为本地推理买单，抑或每月 20 美元云端工具在能力上仍更划算。

## 行业影响与未来展望
该帖是"本地优先"浪潮的缩影：隐私、零 API 成本与离线可用推动开发者把 agent 工作流搬到设备端。随着 MoE 小激活模型与 Apple 统一内存共同成熟，48GB 级笔记本已能承担严肃编码任务。未来看点在量化质量、MLX 稳定性与 OpenCode 等本地 agent 生态的持续完善。

## 附带链接
- 原帖：https://www.reddit.com/r/LLM/comments/1v5hmjd/
- Qwen 3.6 Mac 评测：https://llmcheck.net/blog/qwen-36-35b-a3b-mac-new-number-one
