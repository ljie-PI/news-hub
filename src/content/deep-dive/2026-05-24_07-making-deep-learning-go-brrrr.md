---
title: "深度调研：从第一性原理让深度学习 \"飞起来\""
date: "2026-05-24"
generated: "2026-05-24 07:00"
source: "HN"
slug: "2026-05-24_07-making-deep-learning-go-brrrr"
summary: "PyTorch 核心团队成员 Horace He 在 2022 年发表的经典博文《Making Deep Learning Go Brrrr from First Principles》重新登上 Hacker News 前列。文章用第一性原理拆解深度学"
---

---
title: "深度调研：从第一性原理让深度学习 "飞起来""
date: "2026-05-24"
generated: "2026-05-24 07:00"
source: "HackerNews"
slug: "making-deep-learning-go-brrrr"
source_url: "https://horace.io/brrr_intro.html"
hn_url: "https://news.ycombinator.com/item?id=48246889"
score: 141
comments: 56
---

# 深度调研：从第一性原理让深度学习 "飞起来"

## 事件概述

PyTorch 核心团队成员 Horace He 在 2022 年发表的经典博文《Making Deep Learning Go Brrrr from First Principles》重新登上 Hacker News 前列。文章用第一性原理拆解深度学习训练/推理为什么慢，以及在不改算法的前提下如何让 GPU 真正 "跑满"。本轮重新热议与近期大量 LLM 训练优化（FlashAttention、torch.compile、CUDA Graphs 等）密切相关，被认为是入门系统级性能工程的必读材料。

## 核心观点

文章将深度学习算子的瓶颈分为三类：

1. **Compute-bound**：算子真正受限于浮点算力，如大尺寸 GEMM（矩阵乘）。这类只能通过更好的矩阵分块、Tensor Core 利用率和精度选择（FP16/BF16/FP8）来加速。
2. **Memory-bandwidth-bound**：算子受限于显存带宽，如逐元素操作、LayerNorm、Softmax、激活函数。优化关键在 **算子融合** 与 **kernel fusion**，减少在 HBM 与寄存器/共享内存之间反复搬运张量。
3. **Overhead-bound**：算子小到 GPU 都没真正干活，时间花在 Python 调度、CUDA launch、framework 开销上。解决方案包括 CUDA Graphs、torch.compile、JIT trace、batch up。

He 提供了非常实用的 "诊断流程"：先用 profiler 看是哪一类，再选对应武器。这种系统化框架使初学者免于把所有问题归因于 "GPU 不够强"。

## 行业意义

在 LLM 时代，训练/推理成本动辄数百万美金，1% 的吞吐量优化都能换算成可观的节省，这篇博文倡导的 "先理解 roofline，再写优化代码" 的方法论已成为 PyTorch 2.x（torch.compile、Inductor）、vLLM、SGLang、TensorRT-LLM 等系统的设计哲学基础。

- **Kernel fusion**：FlashAttention/FlashAttention-2/3 正是把 attention 从 memory-bound 变成 compute-bound 的典型范例。
- **CUDA Graphs**：在小 batch 推理与 RL 训练里，能直接消除 overhead-bound 部分。
- **torch.compile**：把高层 PyTorch 代码降低到 Triton/Inductor 自动融合。

## 评论焦点

HN 评论区讨论：为什么这篇 2022 年的文章在 2026 年仍然适用（答案：硬件加速器架构基本没变，HBM 带宽提升远不如算力）；torch.compile 是否已经能让大部分手写 fusion 失去意义；以及对训练框架来说 overhead-bound 在多 GPU 通信开销主导后是否依然是优化重点。

## 关注建议

建议系统软件/ML infra 工程师把本文作为内训材料，同时配套阅读 NVIDIA 的 "GPU Performance Background" 系列与 FlashAttention 论文。对应用层 LLM 工程师，理解这三类瓶颈是合理选择 batch size、序列长度、量化方案的前提。
