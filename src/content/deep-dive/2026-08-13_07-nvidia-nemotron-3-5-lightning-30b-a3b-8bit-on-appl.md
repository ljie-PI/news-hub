---
title: "NVIDIA-Nemotron-3.5-Lightning-30B-A3B-8bit on Apple M5 Max — 110.1 tok/s — llm-bench.io"
date: "2026-08-13"
generated: "2026-08-13 07:00"
source: "Reddit"
slug: "2026-08-13_07-nvidia-nemotron-3-5-lightning-30b-a3b-8bit-on-appl"
summary: "这条帖子外链到llm-bench.io的一次社区基准：二〇二六年八月十二日，标为八比特的Nemotron三点五Lightning在六十四GB内存的Apple M5 Max上以oMLX零点五点七运行"
---

# NVIDIA-Nemotron-3.5-Lightning-30B-A3B-8bit on Apple M5 Max — 110.1 tok/s — llm-bench.io

## 事件背景
这条帖子外链到llm-bench.io的一次社区基准：二〇二六年八月十二日，标为八比特的Nemotron三点五Lightning在六十四GB内存的Apple M5 Max上以oMLX零点五点七运行。页面记录生成速度每秒一百一十点一个词元，并非NVIDIA官方硬件测评。

## 核心观点 / 产品机制
NVIDIA模型卡显示，原模型是三百亿总参数、每词元约三十亿激活参数的混合专家模型，交错使用Mamba二、专家层与注意力层。llm-bench记录本次占用三十一点七GB、首词元延迟四百二十一毫秒、上下文窗口六万五千五百三十六，测试使用一万九千零九十个词元。每秒词元数只计算完成输入处理后的生成阶段；质量分八十一点三则来自四个固定场景的模型裁判评分。

## 社区热议与争议点
本轮Reddit实时评论被封，未逐字取得评论；以下为页面数据支持的争点，并非网友引语。利好有二：三十亿激活参数解释了高解码速度；统一内存让模型在三十一点七GB占用下保留较长上下文。限制也有二：这是单次社区提交，站方仅以客户端一致性和异常启发式校验，页面未展示误差条；生成速度不含预填充，不能等同完整任务耗时。其代码场景质量仅六十六分，也提醒“快”不代表所有任务都强。

## 行业影响与未来展望
结果体现小激活量MoE与Apple统一内存的组合正接近可交互的本地代理体验，但选型应同时比较首词元、长上下文预填充、持续生成、任务正确率和功耗。后续若有相同量化文件、固定提示与多次重复数据，才适合与其他运行时或芯片作严谨横比。

## 附带链接
- [Reddit 原帖](https://www.reddit.com/r/LocalLLM/comments/1vmp4w6/nvidianemotron35lightning30ba3b8bit_on_apple_m5/)
- [llm-bench.io 基准页](https://llm-bench.io/benchmarks/cmsps6gj1000701nvhrax204m)
- [llm-bench.io 测试方法](https://llm-bench.io/benchmark-methodology)
- [NVIDIA 官方模型卡](https://huggingface.co/nvidia/NVIDIA-Nemotron-3.5-Lightning-30B-A3B-BF16)
