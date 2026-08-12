---
title: "[New Quant] Kimi K3 Neuron IQ1_S GGUF — ~308GB (all experts kept, ~40% smaller than Unsloth 594GB), HumanEval 94.5% matching full, 12.5 t/s on 3× DGX Sparks"
date: "2026-08-13"
generated: "2026-08-13 07:00"
source: "Reddit"
slug: "2026-08-13_07-new-quant-kimi-k3-neuron-iq1-s-gguf-308gb-all-expe"
summary: "发帖人宣布一个面向 Kimi K3 的 Neuron 剪枝 IQ1_S GGUF，目标是在不删除路由专家的前提下降低超大模型的本地部署门槛。帖子称其耗时约五天、使用约一千�"
---

# [New Quant] Kimi K3 Neuron IQ1_S GGUF — ~308GB (all experts kept, ~40% smaller than Unsloth 594GB), HumanEval 94.5% matching full, 12.5 t/s on 3× DGX Sparks

## 事件背景
发帖人宣布一个面向 Kimi K3 的 Neuron 剪枝 IQ1_S GGUF，目标是在不删除路由专家的前提下降低超大模型的本地部署门槛。帖子称其耗时约五天、使用约一千二百美元算力，产物约三百零八GB；这些成本、体积、分数与速度均是作者自报，本次未找到独立复现实验。

## 核心观点 / 产品机制
方案保留八万余个路由专家，但以极低比特量化和专门剪枝压缩权重。作者报告 HumanEval 为百分之九十四点五、AIME 为百分之九十二点五、MMLU 为百分之七十九点四九，并称在三台 DGX Spark 上结合张量并行与自定义推测解码达到每秒十二点五个 token。对照公开的常规 IQ1_S 版本约五百四十至五百九十GB，可见体积差异显著，但两者测试流程并不相同。

## 社区热议与争议点
Reddit 评论页在本轮抓取中被反爬拦截，无法逐字核对回复。可验证的争议集中在四点：保留全部专家是否等于保留能力；HumanEval 接近原版能否代表长上下文和视觉任务；三机吞吐是否包含提示处理与通信开销；一比特级量化在不同提示分布下是否会放大失败。支持者会看重更低存储与可下载性，谨慎者则需要模型文件、量化参数、评测脚本和多次运行方差。

## 行业影响与未来展望
若结果可复现，这类“保专家、压权重”的路线可让更多实验室研究巨型 MoE，而不必直接承担完整权重容量。但三百GB仍远超普通工作站，极低比特的质量波动也不能靠单一代码基准证明。后续价值取决于公开校验哈希、复现实验与同硬件同参数对照。

## 附带链接
- [Reddit 原帖](https://www.reddit.com/r/LocalLLM/comments/1vmt01v/new_quant_kimi_k3_neuron_iq1_s_gguf_308gb_all/)
- [Kimi K3 官方说明](https://platform.kimi.ai/docs/guide/kimi-k3-quickstart)
- [公开 Kimi K3 GGUF 对照](https://huggingface.co/AtomicChat/Kimi-K3-GGUF)
