---
title: "strix-halo-ryzen-ai-max-395-benchmarks"
date: "2026-06-02"
generated: "2026-06-02 07:00"
source: "Reddit"
slug: "2026-06-02_07-strix-halo-ryzen-ai-max-395-benchmarks"
---

---
title: "Collecting Strix Halo / Ryzen AI MAX+ 395 local LLM results: llama.cpp Vulkan/RADV, Ollama, ROCm/HIP"
date: "2026-06-02"
generated: "2026-06-02 07:00"
source: "Reddit"
slug: "strix-halo-ryzen-ai-max-395-benchmarks"
---

## 1. 帖子背景

r/LocalLLM 用户 JSVD2 发起众包测评，系统性收集 AMD Strix Halo / Ryzen AI MAX+ 395 平台上的本地大模型推理性能。基准机器为 Beelink GTR9 Pro 迷你工作站，配 Ryzen AI MAX+ 395 APU、Radeon 8060S iGPU、128GB LPDDR5X 统一内存、Ubuntu 24.04 系统，覆盖 llama.cpp Vulkan/RADV、Ollama 以及 ROCm/HIP 三种后端。

## 2. 核心讨论点

最亮眼的数据来自 llama.cpp Vulkan/RADV 后端：Qwen3-Coder 30B-A3B（Q4_K_S 量化）在 tg128 测试中跑出 **98.51 tokens/s**，同模型 UD-Q4_K_XL 量化为 96.76 t/s，Qwen3.6 35B-A 系列也保持在相近水平。讨论焦点在于：1) 这是 MoE 激活 3B 的"作弊式"高分还是真实可用；2) Vulkan/RADV 路径已稳定超越 ROCm/HIP，AMD 的官方栈在消费级 APU 上反而落后于开源驱动；3) 128GB 统一内存让 30B–70B 级模型几乎"零成本"加载，prompt processing 仍是短板。

## 3. 社区反应 / 争议

楼内不少人将其与 Apple Silicon M4 Max/Ultra、Nvidia DGX Spark 对比。支持者认为 Strix Halo 把"低功耗、低噪音、低价"三者第一次同时做齐，是真正面向本地推理爱好者的平台；质疑者则指出更大稠密模型（70B Q4）下 token 速率会跌至 5–8 t/s 区间，距离实用 agent 仍有距离。也有用户分享 Bazzite/Fedora 下需要手动打 mesa-git 才能拿到该性能，门槛仍偏高。

## 4. 行业影响

随着 Strix Halo 在 Vulkan 路径上的成熟，AMD 第一次在"本地 LLM 推理盒子"赛道对苹果形成正面竞争，也对 Nvidia DGX Spark（同帖另一条 600GB/s 带宽实际为 NVLink 数值的纠正帖佐证）施压。对量化模型生态（GGUF、MoE 30B-A3B 类）是利好——硬件普及反过来会推动 llama.cpp、Ollama 继续优化 Vulkan 后端，弱化对 CUDA 的依赖。

## 5. 链接

- Permalink: https://www.reddit.com/r/LocalLLM/comments/1tu7xw4/collecting_strix_halo_ryzen_ai_max_395_local_llm/
- URL: (self post)
