---
title: "Kimi K3 架构解读：2.8T 开源巨模型的效率工程"
date: "2026-07-30"
generated: "2026-07-30 07:00"
source: "HN"
slug: "2026-07-30_07-kimi-k3-architecture-overview-and-notes"
summary: "知名 LLM 研究者、畅销书作者 Sebastian Raschka 撰文剖析了刚发布的开源权重大模型 Kimi K3 的架构。K3 是目前最大的开源权重模型，从去年 480 亿参数的 Kimi "
---

# Kimi K3 架构解读：2.8T 开源巨模型的效率工程

## 事件背景

知名 LLM 研究者、畅销书作者 Sebastian Raschka 撰文剖析了刚发布的开源权重大模型 Kimi K3 的架构。K3 是目前最大的开源权重模型，从去年 480 亿参数的 Kimi Linear 一路放大到 2.8 万亿参数，本质是后者的"生产版放大"。文章配有架构图，并逐一点评其关键设计选择，在 HN 上引发一轮高质量的技术讨论。

## 核心观点 / 产品机制

Raschka 指出 K3 的整体趋势与 Nemotron 3、DeepSeek V4 一致——追求推理效率：用 LatentMoE 替代常规 MoE，用多头潜在注意力（MLA）和 Kimi Delta Attention（KDA）替代常规注意力。相比 Kimi Linear，新增的唯一组件是 LatentMoE，思路类似 MLA 对大线性层做压缩下投影。唯一非效率导向的改动是"注意力残差"：跨层连接残差路径，并用注意力分数为贡献加权，据报告能稳定提升验证损失与下游表现，代价约为 4% 训练成本、2% 推理成本。最引人注目的是 K3 彻底抛弃 RoPE，全程使用 NoPE（无位置编码），这与"局部层用 RoPE、全局层用 NoPE"的近期主流背道而驰。

## 社区热议与争议点

gokohl 直言 NoPE"处处使用"很反常，猜测是线性注意力（Kimi Delta）在悄悄承担位置信息的工作，好奇它能否在前沿规模站住脚。thunderbird120 补充 KDA 虽名带"Attention"实则更像可并行训练的 RNN，是对 Gated DeltaNet 的小改。反方声音来自 samuelknight，他指出 KDA 带来副作用：KV 缓存按固定 1024 token 块增量实现，而非缓存到最近输入，导致每次推理可能多出上千个缓存未命中 token；wren6991 则回应可通过为最后生成 token 额外保留 checkpoint 来缓解。此外 porridgeraisin 转述 DeepSeek CEO 观点，认为 K3 与 Opus 虽跑分相近，但活跃参数量可能差一个数量级，真实使用差距会显现。也有人（rsolva、thatsgcasey）盛赞这是 LLM 摘要泛滥中的"稀有珍品"。

## 行业影响与未来展望

K3 印证了开源前沿模型正集体转向"效率优先"的架构范式：MoE 潜在化、注意力线性化、位置编码简化。若 NoPE + 线性注意力的组合在万亿级规模持续有效，将改写业界对位置编码必要性的认知，也为家用/云端部署的状态 checkpoint 管理带来新工程挑战。

## 附带链接

- HN 讨论：https://news.ycombinator.com/item?id=49085698
- 原文：https://sebastianraschka.com/blog/2026/kimi-k3-architecture-notes.html