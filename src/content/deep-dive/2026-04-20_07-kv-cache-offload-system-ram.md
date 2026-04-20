---
title: "KV Cache 卸载到系统内存：本地大模型玩家的 VRAM 突围战"
date: "2026-04-20"
source: "Reddit"
slug: "2026-04-20_07-kv-cache-offload-system-ram"
summary: "在本地部署大语言模型（LLM）时，VRAM（显存）是最稀缺的资源。模型权重占一部分，但随着上下文长度增长，**KV Cache（键值缓存）** 的显存占用会急剧"
---

# KV Cache 卸载到系统内存：本地大模型玩家的 VRAM 突围战

## 事件背景

在本地部署大语言模型（LLM）时，VRAM（显存）是最稀缺的资源。模型权重占一部分，但随着上下文长度增长，**KV Cache（键值缓存）** 的显存占用会急剧膨胀——对于 70B 级别模型，32K 上下文的 KV Cache 可轻松吃掉 8-16GB 显存。Reddit r/unsloth 社区用户提出了一个直击痛点的问题：**能否将 KV Cache 卸载到系统内存（RAM）而非占用宝贵的 VRAM？**

这个问题之所以引发广泛关注，是因为大多数本地玩家的硬件配置是"显存紧张但内存充裕"——一张 24GB 的 RTX 4090 搭配 64-128GB DDR5 内存是常见配置。如果 KV Cache 能利用这部分闲置的系统内存，就能在不升级显卡的前提下大幅扩展可用上下文长度。

## 核心观点

社区讨论揭示了一个关键事实：**KV Cache 的 CPU 卸载并非新概念，多个主流框架已提供不同程度的支持。**

- **llama.cpp**：默认情况下 KV Cache 会分配到 GPU 上，但提供了 `--no-kv-offload` 参数，可以强制将 KV 缓存保留在 CPU 内存中。这在 GPU 层数部分卸载（`-ngl` 不满载）时尤其有用。代价是推理速度会下降，因为每次 attention 计算都需要跨 PCIe 总线读取数据。
- **vLLM**：内置 `--swap-size` 参数，允许定义 RAM 中用于 KV Cache 交换的空间大小，实现了生产级的 KV 缓存溢出机制。
- **LMCache**：作为 vLLM 的配套项目，提供了更精细的 KV Cache 卸载方案，支持将缓存卸载到 CPU 内存、NVMe SSD 甚至远程存储。通过环境变量 `LMCACHE_LOCAL_CPU=True` 和 `LMCACHE_MAX_LOCAL_CPU_SIZE` 即可启用 CPU 卸载。

## 社区热议

**1. 速度与容量的权衡**  
多位用户指出，KV Cache 放在系统内存中，读取延迟约为 GPU HBM 的 10-50 倍（取决于 PCIe 带宽）。但相比重新计算整个 KV Cache（即重新 prefill），从 RAM 加载仍然快约 **10 倍**。对于长对话场景，这是一笔划算的交易。

**2. KV Cache 量化的叠加效应**  
社区讨论中提到 llama.cpp 支持 KV Cache 量化（如 Q8_0、Q4_0），可以将缓存体积压缩 2-4 倍。但有用户在 r/LocalLLaMA 指出一个隐患：量化后的 KV Cache 反而会将更多计算推到 CPU 上执行（反量化操作），在大模型上可能得不偿失。

**3. 苹果 M 系列芯片的统一内存优势**  
部分用户提到，Apple Silicon 的统一内存架构天然规避了这个问题——GPU 和 CPU 共享同一块内存池，不存在"卸载"的概念。这也是 Mac 在本地 LLM 社区中受欢迎的原因之一。

**4. NVMe 作为下一层缓存**  
更激进的方案是将 KV Cache 溢出到高速 NVMe SSD。LMCache 已支持此功能。虽然延迟更高，但对于 128K+ 超长上下文场景，这可能是唯一可行的本地方案。

## 行业影响

KV Cache 管理正在从一个"实现细节"演变为**本地 LLM 推理栈的核心竞争力**。随着模型上下文窗口从 8K 扩展到 128K 甚至 1M，KV Cache 的存储和调度将成为决定用户体验的关键因素。

当前的趋势是**分层缓存架构**：热数据留在 GPU HBM，温数据卸载到系统 RAM，冷数据落盘到 NVMe——本质上是将传统存储层次结构引入了 LLM 推理。这对框架开发者（llama.cpp、vLLM、SGLang）和硬件厂商（更大的 L2 Cache、CXL 内存扩展）都提出了新的优化方向。

对于普通玩家而言，好消息是：**你的 64GB 内存不再只是摆设。** 合理配置 KV Cache 卸载，可以在现有硬件上解锁更长的上下文窗口和更大的模型。

## 链接

- [原帖：Any way to offload KV cache to system RAM instead of VRAM?](https://www.reddit.com/r/unsloth/comments/1sq38b8/)
- [LMCache：KV Cache CPU 卸载文档](https://docs.lmcache.ai/getting_started/quickstart/offload_kv_cache.html)
- [llama.cpp --no-kv-offload 功能讨论](https://github.com/ggml-org/llama.cpp/issues/9302)
- [vLLM 论坛：KV Cache 卸载到 DRAM 或 NVMe](https://discuss.vllm.ai/t/possible-to-offload-kv-cache-to-dram-or-nvme/1682)
- [r/LocalLLaMA：KV Cache 交换到 RAM 比重算快 10 倍](https://www.reddit.com/r/LocalLLaMA/comments/1olouiw/)
