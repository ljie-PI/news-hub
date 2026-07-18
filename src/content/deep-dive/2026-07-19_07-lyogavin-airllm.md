---
title: "lyogavin/airllm"
date: "2026-07-19"
generated: "2026-07-19 07:00"
source: "GitHub"
slug: "2026-07-19_07-lyogavin-airllm"
summary: "大模型推理最大的门槛是显存。70B 级别模型全量加载往往需要数十 GB 显存，普通消费级显卡望尘莫及。AirLLM 的定位是\"平民显卡也能跑大模型推理\"，宣"
---

# lyogavin/airllm

## 定位与痛点剖析
大模型推理最大的门槛是显存。70B 级别模型全量加载往往需要数十 GB 显存，普通消费级显卡望尘莫及。AirLLM 的定位是"平民显卡也能跑大模型推理"，宣称在单张 4GB GPU 上运行 70B 模型，并可在 8GB 上运行 405B Llama 3.1、约 12GB 上运行 DeepSeek-V3（671B）（自报口径）。它面向缺乏昂贵集群、又想在本地实验前沿模型的个人开发者与研究者。

## 核心架构与技术细节
核心思路是分层加载（layer-by-layer inference）：将模型按 transformer 层切片，推理时逐层从磁盘载入显存、计算后立即释放，从而把峰值显存压到单层规模。项目强调不依赖量化、蒸馏或剪枝即可降低显存占用，同时也提供 8bit/4bit 量化选项。v2.5 引入 prefetching 让加载与计算重叠，v3.0 增加 FP8 支持，并通过统一的 AutoModel 自动识别模型类型，覆盖 Qwen3、Llama、DeepSeek、Phi-4、Gemma 等。

## 竞品对比与生态站位
相较 llama.cpp、vLLM 等以吞吐或量化为核心的方案，AirLLM 的差异点在于用"时间换显存"，牺牲速度换取极低显存门槛。它不适合高并发生产服务，而更像离线体验、教学与验证工具。生态上兼容 HuggingFace safetensors，支持 MacOS 与 CPU 推理。

## 开发者反馈与局限性
最大局限是逐层换入换出带来的高延迟，交互式使用体验较差。宣称的极限显存数据多为理想条件下的自报口径，实际速度与磁盘 IO 强相关。项目更偏实验性，长期维护与商业场景适配仍需谨慎评估。

## 附带链接
- 仓库：https://github.com/lyogavin/airllm
