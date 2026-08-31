---
title: "Qwen3.8-Flash-Next beat every Claude model on my API bug-fixing bench, locally on an RTX 3060"
date: "2026-09-01"
generated: "2026-09-01 07:00"
source: "Reddit"
slug: "2026-09-01_07-qwen3-8-flash-next-beat-every-claude-model-on-my-a"
summary: "作者用含十二个播种缺陷的FastAPI待办服务做单轮修复：每次给干净文件，由同一脚本运行接口并按功能加权，满分二十三。其自测称三比特Qwen量化两次均得二十三，表中Claude型号为十四至十九点五；全部跑分及吞吐均未获独立复现。"
---

# Qwen3.8-Flash-Next beat every Claude model on my API bug-fixing bench, locally on an RTX 3060

## 事件背景
作者用含十二个播种缺陷的FastAPI待办服务做单轮修复：每次给干净文件，由同一脚本运行接口并按功能加权，满分二十三。其自测称三比特Qwen量化两次均得二十三，表中Claude型号为十四至十九点五；全部跑分及吞吐均未获独立复现。

## 核心观点 / 产品机制
模型仓确认发布物为Qwen官方基座及Unsloth的UD-IQ3_XXS三分片量化。官方卡写明语言模型一千二百五十亿参数、每词元激活六十亿，另含五百一十亿N-gram嵌入和四十亿MTP，与作者“一千七百七十亿、激活六十六点六亿”口径并非完全一致。作者回复披露自建llama.cpp-qwen4、十二GB显存配六十四GB内存、温度零点五五及采样、Q4_0键值缓存、闪存注意力和N-gram推测；但构建提交、严格提示、缺陷文件、评分脚本、逐项结果及Claude精确模型号均未公开，且上下文命令为二十万、另一回复称二十六万二千一百四十四。各模型仅一至两次，分母不足。

## 社区热议与争议点
Atom现有二十条目：主帖一条、普通评论十一条、作者回复八条；只是当前可见子集，并非完整评论区。普通用户Good_Force_8253想把它用于小修复；Murky-Routine-4255称无法运行并追问构建，作者才贴命令。DoubleNothing追问为何漏测二十七B，作者承认对其有偏见且因速度排除；saposmak询问参数，作者称仅改采样就让MiniMax相差二点五，反证榜单对设置敏感。后两项仍是作者口径。

## 行业影响与未来展望
结果提示消费级显卡加内存卸载可让稀疏模型承担局部代码修复，却不能把单一待办接口、非等量重复和不同量化外推为“胜过所有Claude”或通用编程领先。若要可复核，应公开仓库、提示、原始输出、运行时提交与API模型标识，固定采样并多随机种子报告逐缺陷成功率和区间。

## 附带链接
- [Reddit原帖](https://www.reddit.com/r/LocalLLM/comments/1w3k7zu/qwen38flashnext_beat_every_claude_model_on_my_api/)
- [Qwen官方模型卡](https://huggingface.co/Qwen/Qwen3.8-Flash-Next)
- [Unsloth量化仓](https://huggingface.co/unsloth/Qwen3.8-Flash-Next-GGUF)
