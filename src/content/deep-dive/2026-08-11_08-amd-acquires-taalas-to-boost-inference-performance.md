---
title: "AMD acquires Taalas to boost inference performance by etching models in silicon"
date: "2026-08-11"
generated: "2026-08-11 08:00"
source: "HN"
slug: "2026-08-11_08-amd-acquires-taalas-to-boost-inference-performance"
summary: "AMD 宣布收购多伦多推理芯片公司 Taalas，交易金额未披露，预计第四季度完成。此举意在补齐高吞吐生成能力，对抗英伟达与 Groq。Taalas 的首颗六纳米 HC"
---

# AMD acquires Taalas to boost inference performance by etching models in silicon

## 事件背景
AMD 宣布收购多伦多推理芯片公司 Taalas，交易金额未披露，预计第四季度完成。此举意在补齐高吞吐生成能力，对抗英伟达与 Groq。Taalas 的首颗六纳米 HC1 测试芯片运行 Llama 3.1 8B 时，厂商演示约每秒一万六千九百六十词元；这是概念验证和自报结果，模型也已较旧。

## 核心观点 / 产品机制
与 GPU 从 HBM 读取参数不同，Taalas 把固定模型权重写入 mask-ROM 召回结构，另以 SRAM 保存 KV 缓存和微调适配器。下一代 HC2 计划每芯片容纳二百亿参数，大模型可用流水线并行跨芯片部署。报道推测 AMD 会让 Instinct GPU 处理计算密集的提示阶段，再把逐词元生成交给 Taalas 加速器；较大模型更新需重新流片，但公司称只改两层金属即可。

## 社区热议与争议点
HN 用户 wxw 称演示有“魔法感”，varun_ch 期待推理快到让终端和网络工具调用反成代理瓶颈。反方更关注质量：axus 测到硬件问题回答出现幻觉、戏剧生成缺乏深度；badatnames 则担心小团队并入 AMD 后技术未必产品化，且消费级版本机会降低。讨论因此区分了吞吐纪录与模型智能，快并不能修复旧八十亿参数模型的知识和推理短板。

## 行业影响与未来展望
若模型长期稳定且调用量巨大，固化权重可显著降低每词元成本，并让测试时扩展承担更长思考链。但模型迭代以月计，重新流片的成本、周期和锁定风险决定其只适合少数成熟模型。更现实的路线可能是 GPU 加专用生成芯片加 LoRA 适配层，而非全面替代通用加速器。

## 附带链接
- [原文](https://www.theregister.com/systems/2026/08/06/amd-acquires-ai-chip-startup-taalas-to-boost-inference-performance-by-etching-models-into-silicon/5284344)
- [Hacker News 讨论](https://news.ycombinator.com/item?id=49201970)
- [Taalas](https://taalas.com/)
