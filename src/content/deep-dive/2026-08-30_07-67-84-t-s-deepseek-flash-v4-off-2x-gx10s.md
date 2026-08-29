---
title: "67-84 t/s DeepSeek flash v4 off 2x GX10s"
date: "2026-08-30"
generated: "2026-08-30 07:00"
source: "Reddit"
slug: "2026-08-30_07-67-84-t-s-deepseek-flash-v4-off-2x-gx10s"
summary: "帖子把两台搭载GB10的桌面节点运行DeepSeek-V4-Flash-0731的结果概括为每秒六十七至八十四词元，并链接一套双节点部署仓库。仓库实际拓扑是每节点一块GPU、张量并行二，经RoCE通信；它是特定旧版vLLM、B12X内核与补丁叠加的作者实验，不是通用GX10成绩。"
---

# 67-84 t/s DeepSeek flash v4 off 2x GX10s

## 事件背景
帖子把两台搭载GB10的桌面节点运行DeepSeek-V4-Flash-0731的结果概括为每秒六十七至八十四词元，并链接一套双节点部署仓库。仓库实际拓扑是每节点一块GPU、张量并行二，经RoCE通信；它是特定旧版vLLM、B12X内核与补丁叠加的作者实验，不是通用GX10成绩。

## 核心观点 / 产品机制
方案用DSpark一次草拟五个词元，再由目标模型验证；模型权重配置为FP8，而`nvfp4_ds_mla`仅指KV缓存，不能称为全模型四比特。官方配置给出一百万词元位置上限，仓库却只用短解码及最高约十万词元预填充测速度，未做完整百万词元正确性测试。标题来自温热、零温度、非流式、固定提示的旧基准：五类均值六十七点六，数数玩具峰值八十四点三，叙事仅三十四点六；四路真实混合流量则约每路二十二点三。较新的带随机前缀方法测得基线均值六十三点九六、获胜配置六十五点一零，说明口径不可混用。

## 社区热议与争议点
本轮Reddit实时评论被封，未逐字取得评论；以下为页面数据与公开资料支持的争点，并非网友引语。两次RSS请求均为四二九且零字节，因此没有可核验评论可引用。仓库后续议题还撤回过固定提示并发结论：重复文本可能受草稿状态与缓存影响，且不同主题接受率波动很大；公开材料也记录共享编译缓存、冷启动、空输出和长上下文稳定性问题。

## 行业影响与未来展望
该项目证明两台小型GB10系统可承载超大MoE模型，并把推测解码、低精度KV和双节点通信组合成可复现配方；但数字仍是单一作者硬件上的自测。后续应以唯一提示、重复种子、误差区间、完整原始日志及百万上下文质量集独立复现，并分别报告首词元、预填充、解码、端到端延迟与并发吞吐。

## 附带链接
- [Reddit原帖](https://www.reddit.com/r/LocalLLaMA/comments/1w1uug2/6784_ts_deepseek_flash_v4_off_2x_gx10s/)
- [部署仓库](https://github.com/tonyd2wild/DeepSeek-v4-Flash-0731-DSpark-1M-NVFP4-KV-2x-DGX-Spark)
- [旧版运行时基准](https://github.com/tonyd2wild/DeepSeek-v4-Flash-0731-DSpark-1M-NVFP4-KV-2x-DGX-Spark/blob/main/RUNTIME-BAKEOFF-2026-07-29.md)
- [新版受控实验](https://github.com/tonyd2wild/DeepSeek-v4-Flash-0731-DSpark-1M-NVFP4-KV-2x-DGX-Spark/blob/main/benchmarks/campaign-2026-08-20/RESULTS-BLUEY-2026-08-20.md)
- [官方模型卡](https://huggingface.co/deepseek-ai/DeepSeek-V4-Flash-0731)
