---
title: "Faster than strata and ninfer"
date: "2026-10-19"
generated: "2026-10-19 07:00"
source: "Reddit"
slug: "2026-10-19_07-faster-than-strata-and-ninfer"
summary: "2026年10月18日，FeydRowan发布个人推理引擎capy-flash。Atom源核对到帖子ID为1x8wa22、标题一致，并取回未截断正文及19条当时可见评论。作者还预告27B预填充将超过8000词元每秒、Flash-Next生成超过150词元每秒，均指后续版本。其双卡方案快于Strata和ninfer且不损质量的结论，只是作者自测，尚无独立复现。"
---

# Faster than strata and ninfer

## 事件背景
2026年10月18日，FeydRowan发布个人推理引擎capy-flash。Atom源核对到帖子ID为1x8wa22、标题一致，并取回未截断正文及19条当时可见评论。作者还预告27B预填充将超过8000词元每秒、Flash-Next生成超过150词元每秒，均指后续版本。其双卡方案快于Strata和ninfer且不损质量的结论，只是作者自测，尚无独立复现。

## 核心观点 / 产品机制
Qwen官方模型卡显示，Flash-Next为1250亿参数、约60亿激活，另含510亿n-gram嵌入和40亿MTP；27B则是稠密模型。仓库并非“全模型四位”：27B混用NVFP4与FP8，Flash-Next仅专家为NVFP4，索引器为BF16、GDN为Q8。引擎在两张16GB RTX 5070 Ti间做无P2P张量并行，将放不下的专家卸载到96GB内存和AVX-512 CPU，并以自定义MTP推测解码。README作者自测同机同提示下，15K预填充为3778对2703词元每秒，解码为100.8对78.3；公开回放仅含三组合成会话、53轮及固定256输出词元，私有编码任务无法审查。“无损”依据GSM8K、MMLU-Pro及私有任务，不能外推。

## 社区热议与争议点
Atom可见子集中，wholesale_lighting要求补同硬件vLLM基准，同时认可自定义MTP值得关注；GME_MONKE认为方案有潜力，但追问V100能否运行；Kind-Leading表示单张4080 Super仍会选Strata，作者也承认单卡应选Strata、当前主要优化双卡；Trademarkd则批评帖子未说清相对既有引擎的架构变化。以上仅是RSS取得的评论子集，不代表完整社区意见。

## 行业影响与未来展望
该项目说明两张消费卡配合主存卸载，可能让大MoE进入个人工作站，但当前要求Linux、CUDA 13.1、两张sm_120显卡、AVX-512及约70GiB空闲内存，且仅支持单请求。性能还受模型、量化混合、提示长度、缓存、MTP接受率和PCIe拓扑影响，不能据此推断普通硬件或生产并发。

## 附带链接
- [Reddit原帖](https://www.reddit.com/r/LocalLLM/comments/1x8wa22/faster_than_strata_and_ninfer/)
- [capy-flash仓库](https://github.com/ValerioDolci/capy-flash)
- [Qwen3.8-Flash-Next模型卡](https://huggingface.co/Qwen/Qwen3.8-Flash-Next)
- [NVIDIA NVFP4说明](https://docs.nvidia.com/deeplearning/transformer-engine/features/low_precision_training/nvfp4/nvfp4.html)
