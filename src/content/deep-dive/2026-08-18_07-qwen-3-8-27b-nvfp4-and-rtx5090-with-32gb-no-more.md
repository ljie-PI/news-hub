---
title: "Qwen 3.8 27B NVFP4 and RTX5090 with 32GB, no more than 128K context possible."
date: "2026-08-18"
generated: "2026-08-18 07:00"
source: "Reddit"
slug: "2026-08-18_07-qwen-3-8-27b-nvfp4-and-rtx5090-with-32gb-no-more"
summary: "发帖者以单张三十二吉字节显存的RTX 5090运行Unsloth版Qwen3.8-27B，称上下文无法超过十二万八千。参数把显存使用率设为百分之九十四，关闭处理器卸载，"
---

# Qwen 3.8 27B NVFP4 and RTX5090 with 32GB, no more than 128K context possible.

## 事件背景

发帖者以单张三十二吉字节显存的RTX 5090运行Unsloth版Qwen3.8-27B，称上下文无法超过十二万八千。参数把显存使用率设为百分之九十四，关闭处理器卸载，并把并发限为一。模型卡原生上限是二十六万二千一百四十四，故这是单卡容量而非结构上限。

## 核心观点 / 产品机制

NVFP4以四位E2M1、每十六值共享E4M3比例及张量级比例压缩权重；该仓库实为混合精度，多数前馈层用NVFP4，注意力、输出头及末八层前馈仍用八位。公开索引显示权重约二十三点四吉字节。六十四层中仅十六层为全注意力，且只有四个KV头；按头维二百五十六和一字节KV粗算，十二万八千词元约需四吉字节缓存。余量还须容纳线性注意力状态、激活与图捕获，翻倍便逼近上限。`max-model-len`包含输入和输出；批处理词元数只是单轮调度量，分块预填充、前缀复用与并发一均不扩容KV。

## 社区热议与争议点

本轮Reddit实时评论被封，未逐字取得评论；以下为页面数据与公开资料支持的争点，并非网友引语。支持一：NVFP4与八位KV使权重和缓存可落入三十二吉字节区间。支持二：混合注意力令缓存增长低于全注意力模型。质疑一：配置原生支持二十六万词元，标题不能外推为模型硬上限。质疑二：帖子未给版本、启动日志和失败阈值；降低运行时开销或启用权重、KV卸载可能改变边界，但会增加延迟。

## 行业影响与未来展望

四位权重量化并未消除长上下文的动态内存成本。部署比较应披露权重与KV精度、缓存预算、并发和延迟；多卡并行、缓存卸载及更低位KV可继续扩窗，但能启动不等于长提示下稳定可用。

## 附带链接

- [Reddit 原帖](https://www.reddit.com/r/unsloth/comments/1vr3o4w/qwen_38_27b_nvfp4_and_rtx5090_with_32gb_no_more/)
- [Unsloth 模型卡](https://huggingface.co/unsloth/Qwen3.8-27B-NVFP4)
- [vLLM 引擎参数](https://docs.vllm.ai/en/latest/configuration/engine_args/)
- [NVIDIA NVFP4 说明](https://developer.nvidia.com/blog/introducing-nvfp4-for-efficient-and-accurate-low-precision-inference/)
- [RTX 5090 官方规格](https://www.nvidia.com/en-us/geforce/graphics-cards/50-series/rtx-5090/)
