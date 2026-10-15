---
title: "P100 (sm_60) patches for llama.cpp: +42% decode and +74% short-prefill on a 2×P100 tensor split"
date: "2026-10-16"
generated: "2026-10-16 07:00"
source: "Reddit"
slug: "2026-10-16_07-p100-sm-60-patches-for-llama-cpp-42-decode-and-74"
summary: "帖子作者为缺少 DP4A、却有全速 HFMA2 的 GP100 补齐 llama.cpp 优化，发布基于 v0.7.0、提交 `620d2225c` 的 41 个非官方补丁。仓库标签与上游发布提交吻合；标题的解码提升 42%、短预填充提升 74.2%均是作者在两张 P100-PCIE-16GB 上的自测，不是独立复现。"
---

# P100 (sm_60) patches for llama.cpp: +42% decode and +74% short-prefill on a 2×P100 tensor split

## 事件背景
帖子作者为缺少 DP4A、却有全速 HFMA2 的 GP100 补齐 llama.cpp 优化，发布基于 v0.7.0、提交 `620d2225c` 的 41 个非官方补丁。仓库标签与上游发布提交吻合；标题的解码提升 42%、短预填充提升 74.2%均是作者在两张 P100-PCIE-16GB 上的自测，不是独立复现。

## 核心观点 / 产品机制
关键并非单一内核：补丁 12 用 `half2/HFMA2` 改写 Q4_1 GEMV；49 为 pre-Volta 张量切分启用内部 AllReduce 并分流 H2D；50 向 sm_60 开放 CUDA Graph；51 为 GP100 的 FP16 cuBLAS 预填充选择 ALGO6。41 项中仅十项限定 Pascal 时代硬件，三十项不限定架构，另有一项改动所有 GPU。作者用 `llama-bench`、`-ub 2048 -n 128`，对原版与补丁版做五轮交错、偶数轮倒序并降温至 45℃；CSV 可重算出 Q4_0 张量切分 pp512 为 233.62→406.92、tg128 为 23.43→33.28 tok/s。仓库实含四十一份补丁、七十二份结果文件，运行器逐轮记录构建号、温度与参数。35B 张量切分有一轮原版 tg 异常：全纳入是 39.8%，作者排除后引用 34.3%，数字解释仍含判断。

## 社区热议与争议点
RSS 身份匹配，共四个 entry、其中三条评论。starkruzr 追问是否在最大上下文测试；belligerent_vogue 指出这里只是表中的提示处理与生成吞吐，最大上下文是另一项测试；作者 Senigiro001 确认数字来自 llama-bench，并称困惑度刚完成、长上下文和推测解码真实场景仍待测。可见子集体现了方法透明度，却没有独立复现、明确支持或反对；也不能把 tg128 当端到端体验。

## 行业影响与未来展望
这套补丁说明旧卡仍可靠架构定向优化延寿，也暴露可迁移性边界：仅测双 P100，CUDA 13 已移除 Pascal 代码生成，NCCL 必须关闭；当前 v0.7.0 未跑 `test-backend-ops`，也无同版本 logits 身份检查。若要上游化，还需多架构、长上下文、正确性与真实服务负载验证；仓库目前没有自有 PR，上游相关 PR #27828 已吸收一项 sm_60 路径，#27721 则仍是面向 sm_61 的开放提案。

## 附带链接
- [Reddit 原帖](https://www.reddit.com/r/LocalLLM/comments/1x6xjbf/p100_sm_60_patches_for_llamacpp_42_decode_and_74/)
- [补丁仓库与提交](https://github.com/sbendhiba/llama-cpp-pascal-patches/commit/06f0dde6b443536c49add759bb921a840adca6c7)
- [v0.7.0 原始基准 CSV](https://github.com/sbendhiba/llama-cpp-pascal-patches/blob/v0.7.0/benchmarks/results/v0.7.0-p100x2-tensor-27b.csv)
- [上游 PR #27828](https://github.com/ggml-org/llama.cpp/pull/27828) · [PR #27721](https://github.com/ggml-org/llama.cpp/pull/27721)
- [NVIDIA GP100 混合精度说明](https://developer.nvidia.com/blog/mixed-precision-programming-cuda-8/)
