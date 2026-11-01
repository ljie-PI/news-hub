---
title: "FlashML-org/FreeToken"
date: "2026-11-02"
generated: "2026-11-02 07:00"
source: "GitHub"
slug: "2026-11-02_07-flashml-org-freetoken"
summary: "FreeToken 是面向个人电脑的开源 MoE 推理与服务引擎，目标是让显存装不下的大模型协同使用 GPU、CPU 和主存，而非依赖数据中心卡。它提供桌面端、命令行及 OpenAI/Anthropic 兼容接口，适合本地代理与研究者。批次冻结为 15,363 stars、当日新增 232；查询 REST API 时为 15,364 stars，二者口径分开。"
---

# FlashML-org/FreeToken

## 定位与痛点剖析

FreeToken 是面向个人电脑的开源 MoE 推理与服务引擎，目标是让显存装不下的大模型协同使用 GPU、CPU 和主存，而非依赖数据中心卡。它提供桌面端、命令行及 OpenAI/Anthropic 兼容接口，适合本地代理与研究者。批次冻结为 15,363 stars、当日新增 232；查询 REST API 时为 15,364 stars，二者口径分开。

## 核心架构与技术细节

默认分支为 `main`，当前清单版本及最新稳定版均为 v0.2.1。主实现采用 Python，热点路径包含 Triton、C++、CUDA/HIP 内核。README 描述的关键机制是带宽自适应 CPU–GPU 共执行、双缓冲预填充、全局 LRU 专家缓存，以及专家缓存与 KV 内存的运行时动态分配；语义锚点缓存用于减少工具调用后上下文重算。其“消费级硬件运行 290B+ 模型”属于 README 自报口径，不能视作独立基准。

## 竞品对比与生态站位

经官方 README 核验，llama.cpp 同样支持量化、CPU+GPU 混合推理和本地 API，且覆盖 Metal、Vulkan、CUDA、HIP 等更多后端。FreeToken 的差异是更聚焦超大 MoE 的专家卸载、缓存和 PCIe/CPU 带宽调度，并吸收 SGLang、vLLM、llama.cpp 等项目设计；代价是通用硬件与模型覆盖面更窄。

## 开发者反馈与局限性

开放 issue #822 报告 RTX 4060/WSL 上 v0.2.0 相比 v0.1.3 变慢。维护者解释新版本按专家形状、线程数匹配带宽配置，建议针对模型执行 `ft bench bw`；报告者称调低显存比例后接近旧版，但维护者仅提出 WDDM 溢出到主存的假设，尚不能推广为普遍结论。issue #847 仍报告某 Gemma-4 NVFP4 权重格式加载失败且无人回复。项目清单标注 Beta；CLI 安装文档以 Linux x86_64、NVIDIA 与 CUDA 13 为主，AMD 仍属实验路径。

## 附带链接

- [GitHub Repo](https://github.com/FlashML-org/FreeToken)
- [官网](https://www.flashml.ai/)
- [v0.2.1 发布记录](https://github.com/FlashML-org/FreeToken/releases/tag/v0.2.1)
- [issue #822](https://github.com/FlashML-org/FreeToken/issues/822)
- [issue #847](https://github.com/FlashML-org/FreeToken/issues/847)
- [llama.cpp](https://github.com/ggml-org/llama.cpp)
