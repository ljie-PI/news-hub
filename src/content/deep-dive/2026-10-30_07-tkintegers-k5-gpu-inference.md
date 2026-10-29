---
title: "TKintegers K5: 3.21× prefill and 3.10× decode throughput vs TorchAO FP8 on NVIDIA L4 [R] [P]"
date: "2026-10-30"
generated: "2026-10-30 07:00"
source: "Reddit"
slug: "2026-10-30_07-tkintegers-k5-gpu-inference"
summary: "作者发布平衡三值权重表示、转换器与GPU推理实现。帖子以Qwen2.5-0.5B-Instruct、英伟达L4和固定匹配负载为范围，报告预填充3402.85对1061.58词元每秒，解码26.75对8.63词元每秒。"
---

# TKintegers K5: 3.21× prefill and 3.10× decode throughput vs TorchAO FP8 on NVIDIA L4 [R] [P]

## 事件背景
作者发布平衡三值权重表示、转换器与GPU推理实现。帖子以Qwen2.5-0.5B-Instruct、英伟达L4和固定匹配负载为范围，报告预填充3402.85对1061.58词元每秒，解码26.75对8.63词元每秒。

## 核心观点
K5用五个平衡三值位表示243级，每个代码占一字节；原生内核分块展开代码，以FP16张量核操作数、FP32累加执行，部分张量保留高精度。3.21倍与3.10倍只是作者在该固定工作负载上的自测，对手是运行于即时模式PyTorch的动态E4M3 TorchAO FP8；FP16控制组更快，结果不能外推为K5胜过所有FP8实现、模型或硬件。

## 社区热议
逐帖Atom共一条entry，仅为主帖，评论子集没有普通评论，故无可核验网友正反观点。可核验的三项反馈或争点均须标清身份：作者本人征求内核设计、方法和独立复现意见，并主动限定适用范围；仓库维护者在KERNELS文档承认基准驱动、私有运行卡未公开，公开材料不足以独立重跑标题数字；GitHub抓取时issues与PR均为空，尚无仓库内第三方复现或审查记录。

## 行业影响
源码确实公开了L4适配器、CUDA内核和校验哈希，说明非原生数值格式可借现有张量核探索带宽与计算折中。但适配器锁定Colab L4、特定格式及环境，解码还走保留的Triton路径；缺少任务质量、更多模型和端到端基准前，应视为待复现的工程原型，而非通用精度或性能结论。

## 附带链接
- [Reddit原帖](https://www.reddit.com/r/MachineLearning/comments/1xir3oa/tkintegers_k5_321_prefill_and_310_decode/)
- [逐帖Atom](https://www.reddit.com/r/MachineLearning/comments/1xir3oa/.rss)
- [GitHub仓库](https://github.com/CodeMasterCody3D/tkintegers)
- [内核与测量边界](https://github.com/CodeMasterCody3D/tkintegers/blob/master/benchmarks/KERNELS.md)
- [L4适配器源码](https://github.com/CodeMasterCody3D/tkintegers/blob/master/benchmarks/k5_prefill_cuda_l4.py)
- [CUDA内核源码](https://github.com/CodeMasterCody3D/tkintegers/blob/master/benchmarks/k5_group_cuda.cu)
- [Issues](https://github.com/CodeMasterCody3D/tkintegers/issues) / [Pull requests](https://github.com/CodeMasterCody3D/tkintegers/pulls)
