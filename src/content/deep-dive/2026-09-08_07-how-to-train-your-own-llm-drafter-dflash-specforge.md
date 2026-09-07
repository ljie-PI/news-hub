---
title: "How to Train Your Own LLM Drafter: DFlash, SpecForge, Mooncake, vLLM & SGLang"
date: "2026-09-08"
generated: "2026-09-08 07:00"
source: "Reddit"
slug: "2026-09-08_07-how-to-train-your-own-llm-drafter-dflash-specforge"
summary: "作者希望改善 DGX Spark 上 Qwen3.8-27B 的解码速度，公开了从数据蒸馏、训练、导出到部署的实践。[1][2] 需纠正的是：Spark 是本地推理目标，模型卡记载训练实际使用单张 NVIDIA B300；这不是“在 Spark 上完成训练”。[3]"
---

# How to Train Your Own LLM Drafter: DFlash, SpecForge, Mooncake, vLLM & SGLang

## 事件背景

作者希望改善 DGX Spark 上 Qwen3.8-27B 的解码速度，公开了从数据蒸馏、训练、导出到部署的实践。[1][2] 需纠正的是：Spark 是本地推理目标，模型卡记载训练实际使用单张 NVIDIA B300；这不是“在 Spark 上完成训练”。[3]

## 核心观点 / 产品机制

DFlash 让轻量块扩散草稿器一次并行预测一组 token，再由目标模型批量验证并接受匹配前缀；它还利用目标模型多层隐藏特征，兼顾草稿速度与接受长度。[4] SpecForge 把目标模型和草稿器解耦：离线模式先落盘隐藏状态，在线模式由 SGLang 捕获特征、Mooncake 传递对象引用，再训练、导出 Hugging Face 权重，最终交给 vLLM 或 SGLang 服务。[5][6][7]

## 社区热议与争议点

该帖 RSS 仅返回主帖，未逐字取得评论；以下为公开材料支持的四个具体争点，并非网友引语。①作者自测从 14.36 tok/s 提至 SGLang 18.55、vLLM 20.25，说明端到端可获益，但均属小样本自报。[3] ②SpecForge 复现实例强调先用目标模型重生成数据，支持“贴近真实流量训练”的路线。[8] ③作者又测得官方 DFlash2 约 30 tok/s，明显胜过自训版本，反驳了“自训必然更优”。[2] ④其 vLLM 使用较新的修复分支、SGLang 版本较旧，运行时横比并非严格受控；接受率高也可能被草稿开销抵消。

## 行业影响与未来展望

这条链路把草稿模型变成可针对代码、工具调用等负载定制的独立加速资产，但收益依赖数据分布、并发、硬件和内核版本。vLLM 将推测解码定位于中低 QPS、内存带宽受限场景；SGLang 还列出流水线并行、重叠调度等限制，故生产采用应以同版本、同提示集和同并发的端到端基准为准。[6][7]

## 附带链接

- [Reddit 原帖][1]
- [作者视频][2]
- [作者模型卡][3]
- [DFlash 论文][4]
- [SpecForge][5]
- [vLLM 文档][6]
- [SGLang 文档][7]
- [SpecForge 复现实例][8]

[1]: https://www.reddit.com/r/LLM/comments/1w9w2ws/how_to_train_your_own_llm_drafter_dflash
[2]: https://www.youtube.com/watch?v=HKQ9NTwcdkM
[3]: https://huggingface.co/kstoyanov99/Qwen3.8-27B-Dflash
[4]: https://arxiv.org/abs/2602.06036
[5]: https://github.com/sgl-project/SpecForge
[6]: https://docs.vllm.ai/en/latest/features/speculative_decoding
[7]: https://docs.sglang.ai/advanced_features/speculative_decoding.html
[8]: https://github.com/sgl-project/SpecForge/issues/465
