---
title: "I wrote a Rust inference engine for Qwen models on a 12 GB GPU, decode is ~1.7x llama.cpp on my RTX3060"
date: "2026-11-01"
generated: "2026-11-01 07:00"
source: "Reddit"
slug: "2026-11-01_07-rustingstrata-qwen-inference-engine"
summary: "本批冻结的是十月三十一日发布于 LocalLLM 的帖子，作者公开 RustingStrata，目标是在 12 GB 显存上运行放不下的 Qwen 混合专家 GGUF。逐帖 Atom 共取得五个条目：完整主帖、两条普通评论和两条作者回复，故社区观察仅代表可见子集。"
---

# I wrote a Rust inference engine for Qwen models on a 12 GB GPU, decode is ~1.7x llama.cpp on my RTX3060

## 事件背景

本批冻结的是十月三十一日发布于 LocalLLM 的帖子，作者公开 RustingStrata，目标是在 12 GB 显存上运行放不下的 Qwen 混合专家 GGUF。逐帖 Atom 共取得五个条目：完整主帖、两条普通评论和两条作者回复，故社区观察仅代表可见子集。

## 核心观点 / 产品机制

仓库身份核验为 RustingStudio/RustingStrata。其控制面与张量实现以 Rust 编写、无 ggml 或 C++ 构建步骤，但“纯 Rust”需加限定：仓库仍含 CUDA、GLSL/SPIR-V，tokenizer 依赖还会编译 C。CUDA 路径启动时用 NVRTC 编译并缓存 cubin；Vulkan 实际加载另写的 GLSL 所生成且已提交的 SPIR-V，并非同一份 CUDA 内核直接跨后端运行。路由命中者在 GPU 计算，缺失专家由独立 CPU 线程池经共享邮箱并行执行；计数按时间衰减，每八个位置最多把六十四个冷驻留专家换成更热的缺失专家，并保存画像供下次启动。作者当前自测同一模型下短提示解码为一百一十八点二对六十八点四词元每秒，四千词元提示后为一百一十三点四对六十六点五，约一点七倍；但仅一台 RTX 3060、三轮均值，尚无独立复现。

## 社区热议与争议点

一位用户认可并行卸载，却要求在 AMD 上实测，也对 MTP 常规文本增益持观望态度；作者回复称校准是一次性固定选项计时，而热专家约一两轮收敛，此为作者口径。另一位用户质疑 llama.cpp 与“原版 Strata”并非同类；作者承认模型覆盖不同，暂不能直接比较，只表示可另做测试。

## 行业影响与未来展望

该设计展示消费级显卡可用调度与异构并行换容量和解码速度，但跨显卡、长上下文、端到端延迟及质量仍需可复现实验。Vulkan 又要求浮点六十四位与子组大小三十二，当前通用性有限。

## 附带链接

- [Reddit 原帖](https://www.reddit.com/r/LocalLLM/comments/1xkgrno/i_wrote_a_rust_inference_engine_for_qwen_models/)
- [Canonical 仓库](https://github.com/RustingStudio/RustingStrata)
- [基准说明](https://github.com/RustingStudio/RustingStrata/blob/main/docs/m6-results.md)
