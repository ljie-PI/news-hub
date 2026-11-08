---
title: "Llama-modchip: 284B DeepSeek on 64GB RAM, no GPU"
date: "2026-11-09"
generated: "2026-11-09 07:00"
source: "HN"
slug: "2026-11-09_07-llama-modchip-deepseek-64gb-no-gpu"
summary: "该帖介绍 llama-modchip：作者称在零 GPU、六十四吉字节内存上，运行总参数二千八百四十三亿、每词元激活约一百三十二亿参数的 DeepSeek-V4-Flash。批次冻结热度为三百三十分、一百三十条评论；本次刷新 Algolia 实取一百个可见节点，已触及查询上限，两种口径不可互换。"
---

# Llama-modchip: 284B DeepSeek on 64GB RAM, no GPU

## 事件背景

该帖介绍 llama-modchip：作者称在零 GPU、六十四吉字节内存上，运行总参数二千八百四十三亿、每词元激活约一百三十二亿参数的 DeepSeek-V4-Flash。批次冻结热度为三百三十分、一百三十条评论；本次刷新 Algolia 实取一百个可见节点，已触及查询上限，两种口径不可互换。

## 核心观点 / 产品机制

仓库不是新模型，而是带补丁的 llama.cpp 推理栈。源码按门控、上投影权重计算重要度，将专家压至极低比特、注意力矩阵转为自定义块六十四量化；并加入缓存分块、预取和推测解码。项目方报告模型文件由七十六点八七降至五十六点五六吉字节，进程常驻不足六十吉字节，解码约每秒六点四至十四点七词元；这些仍是作者硬件上的自报结果。

## 社区热议与争议点

正面意见中，lastdong 称这种逆常规优化令人惊喜；rpdillon 表示自己使用另一套二比特 DeepSeek 配置仍有实用性。反方更关注质量：akie 直问量化精度并怀疑二比特输出；adrian17 指出 README 对 IQ1 与 IQ2 基线的称呼和文件尺寸存在混淆，且裁剪专家可能继续损伤能力。仓库虽附评测脚本与结果，但一百分质量门针对三百亿参数 Nemotron，并非这款二千八百四十三亿参数 DeepSeek，尚缺同任务独立对照。

## 行业影响与未来展望

它证明稀疏专家模型可通过量化、内存层级优化与专用内核，把“装不下”推进到消费级内存可启动；但装载成功不等于长上下文质量、首词延迟和真实编码效率达标。后续关键是上游审查补丁、公开统一提示与输出长度的端到端数据，并比较同内存预算下较小高精度模型，才能判断极低比特大模型是否真正占优。

## 附带链接

- [Hacker News 原帖](https://news.ycombinator.com/item?id=50411961)
- [项目仓库](https://github.com/synchopate/llama-modchip)
- [上游技术讨论](https://github.com/ggml-org/llama.cpp/discussions/31699)
