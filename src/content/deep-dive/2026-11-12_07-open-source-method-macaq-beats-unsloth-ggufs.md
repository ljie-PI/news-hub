---
title: "Open-source method (MACaQ) beats Unsloth GGUFs!"
date: "2026-11-12"
generated: "2026-11-12 07:00"
source: "Reddit"
slug: "2026-11-12_07-open-source-method-macaq-beats-unsloth-ggufs"
summary: "11月11日，Reddit用户acluk90贴出三组自测：Qwen3-4B的MACaQ IQ4_XS为2.260GB、平均KL为0.02804，较Unsloth的0.03663低23.5%，较Bartowski的0.03443低18.6%。这些数字与项目图表一致，但仍是作者口径。Hugging Face接口确认两家4B基线均约2.271GB，说明文件大小比较采用完整GGUF的十进制GB。"
---

# Open-source method (MACaQ) beats Unsloth GGUFs!

## 事件背景
11月11日，Reddit用户acluk90贴出三组自测：Qwen3-4B的MACaQ IQ4_XS为2.260GB、平均KL为0.02804，较Unsloth的0.03663低23.5%，较Bartowski的0.03443低18.6%。这些数字与项目图表一致，但仍是作者口径。Hugging Face接口确认两家4B基线均约2.271GB，说明文件大小比较采用完整GGUF的十进制GB。

## 核心观点 / 产品机制
MACaQ论文针对W4A4 MXFP4：逐线性层做通道缩放、块Hadamard变换，再以Hessian感知的Flip-Refinement调整量化码；流式处理只需一层驻留显存。仓库另提供IQ2/3/4 GGUF流程、固定种子校准示例和recipe侧车。完整MACaQ推理依赖随仓库修改的llama.cpp；只有MACaQ-R可直接跑标准版。仓库没有成品GGUF，也未附帖子三组对比的评测命令、语料、误差条或原始日志。平均KL按llama.cpp文档是量化模型与FP16逐词元输出分布的散度，不能直接代表任务正确率。

## 社区热议与争议点
RSS取得主帖及17条真实评论。普通用户Kahvana肯定同尺寸竞争力，也要求审计；ApprehensiveTart3158追问HF成品，发帖者承认官方未提供、仅自行托管。Chromix_质疑标准llama.cpp兼容性与独立复测，发帖者称量化和运行都用了项目版本。Dany0则提醒KL受文本与校准集强烈影响，跨语料名次未必稳定。

## 行业影响与未来展望
若同模型、同语料复现，MACaQ可能把GGUF竞争从静态舍入推进到校准与码字优化；但定制运行时削弱即插即用，作者自建HTTP模型也不是官方、可长期追踪的工件。下一步应发布固定提交、校准与评测文本、完整命令、哈希，并补充困惑度、top-1一致率和下游任务结果。

## 附带链接
- [Reddit原帖](https://www.reddit.com/r/LocalLLaMA/comments/1xto0fa/opensource_method_macaq_beats_unsloth_ggufs/)
- [MACaQ仓库](https://github.com/huawei-csl/MACaQ)
- [论文](https://arxiv.org/abs/2611.10649)
- [官方博客](https://huawei-csl.com/blog/macaq/)
- [发帖者提供的Qwen3-4B GGUF](http://31.165.97.47:20080/macaq-gguf/qwen3-4b-macaq-iq4_xs-had64-vq2-calsmoke.gguf)
- [Unsloth Qwen3-4B基线](https://huggingface.co/unsloth/Qwen3-4B-GGUF)
- [Bartowski Qwen3-4B基线](https://huggingface.co/bartowski/Qwen_Qwen3-4B-GGUF)
