---
title: "Ternary Bonsai 2 27B"
date: "2026-09-18"
generated: "2026-09-18 07:00"
source: "Reddit"
slug: "2026-09-18_07-ternary-bonsai-2-27b"
summary: "Prism ML 于九月十七日把 Bonsai 2 的 GGUF、MLX 与浏览器演示收入 Hugging Face 集合，目标是让二百七十亿参数级模型进入笔记本和单卡。冻结帖编号为 1wj84nz；同批 1wj6c4l 讲的是同一发布，属于交叉帖，故不另写一篇。"
---

# Ternary Bonsai 2 27B

## 事件背景

Prism ML 于九月十七日把 Bonsai 2 的 GGUF、MLX 与浏览器演示收入 Hugging Face 集合，目标是让二百七十亿参数级模型进入笔记本和单卡。冻结帖编号为 1wj84nz；同批 1wj6c4l 讲的是同一发布，属于交叉帖，故不另写一篇。

## 核心观点 / 产品机制

模型卡称它沿用 Qwen3.8-27B 的混合注意力架构，总参数二百七十三点六亿，以每一百二十八个权重共享半精度缩放的三值表示，并用分块 Hadamard 旋转配合运行时激活变换。Hub 文件元数据实证：密集三值 PTQ1_0 为五点九五 GB，二比特槽位 PQ2_0 为七点二一 GB；MLX 整包为八点六 GB。所谓“保留百分之九十八点二智能”来自发布方十四项思考模式评测均值八十四点七八，并非独立复现。普通 llama.cpp 不能直接运行，需 Prism 分支。

## 社区热议与争议点

目标帖 Atom 共十八个条目，即主帖加十七条可见评论。正面看，betam4x 说旧版已能在老 iPhone 上实用，虽非旗舰却超出体积预期；Koksny 回应 AMD 疑问，称 HIP、ROCm 与 Vulkan 已可用，但其速度数字只是用户自报。反面看，KURD_1_STAN 质疑百分比会掩盖实际差距；lgk01 报告 Unsloth Studio 无法加载，发帖者答复需专用分支、等待上游兼容。可见讨论既认可端侧密度，也集中担忧评测口径和运行时碎片化；RSS 只是当时公开子集，不代表完整评论区。

## 行业影响与未来展望

若三值内核进入主流运行时，端侧代理可用更大参数量换取推理能力，并降低权重下载与常驻内存。但小权重不等于低总显存：长上下文状态、激活和工作区仍需预算。近期关键不是单一平均分，而是第三方长任务、代码稳定性及不同硬件的同条件复测。

## 附带链接

- Reddit 原帖：https://www.reddit.com/r/LocalLLaMA/comments/1wj84nz/ternary_bonsai_2_27b/
- Hugging Face 集合：https://huggingface.co/collections/prism-ml/bonsai-2
- GGUF 模型卡：https://huggingface.co/prism-ml/Ternary-Bonsai-2-27B-gguf
- MLX 模型卡：https://huggingface.co/prism-ml/Ternary-Bonsai-2-27B-mlx-2bit
- WebGPU 演示：https://huggingface.co/spaces/webml-community/ternary-bonsai-2-webgpu-kernels
