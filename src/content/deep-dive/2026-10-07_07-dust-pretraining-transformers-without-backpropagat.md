---
title: "Dust: Pretraining Transformers Without Backpropagation"
date: "2026-10-07"
generated: "2026-10-07 07:00"
source: "HN"
slug: "2026-10-07_07-dust-pretraining-transformers-without-backpropagat"
summary: "Q Labs 发布 Dust，尝试用零阶搜索替代反向传播来预训练 Transformer，并公开论文式长文、附录与 MIT 代码。批次冻结为 269 points、79 comments；调研时 Algolia 实取 75 个可见评论节点，未触及 100 条上限，不能与冻结互动数混算。"
---

# Dust: Pretraining Transformers Without Backpropagation

## 事件背景

Q Labs 发布 Dust，尝试用零阶搜索替代反向传播来预训练 Transformer，并公开论文式长文、附录与 MIT 代码。批次冻结为 269 points、79 comments；调研时 Algolia 实取 75 个可见评论节点，未触及 100 条上限，不能与冻结互动数混算。

## 核心观点 / 产品机制

Dust 不扰动整套权重，而是在每层线性输出处按 token 独立注入高斯噪声，把每个 token 当作“虚拟种群成员”。它以损失下降奖励噪声，多次采样后平均得到输出误差，再与缓存输入做外积形成权重更新；注意力内部则依据估计的注意力输出误差分配信用。作者自报：在 FineWeb、小至 20M token 的实验中，100k 与 1M token 的部分设置测试损失优于同协议反传；10M、20M 的实测最佳点仍落后，20M 仅幂律外推极限优于反传。其相对 EGGROLL 的千至万倍效率同样主要来自外推，并非墙钟实测。公开仓库是保留估计器和调参默认值的最小实现，明确省略完整实验的执行优化。

## 社区热议与争议点

支持者 eriwang915 认为 243M 模型反而更省种群样本是最意外的信号；Den_VR 提议让零阶搜索发现候选、再由反传固化。质疑方 oofbey 将其概括为用大量前向采样近似梯度，认为实用性不足；soltanov 则要求按等损失补齐墙钟、能耗、峰值内存和下游质量。争论核心不是“能否训练”，而是额外计算能否换来更强并行性或非可微架构自由度。

## 行业影响与未来展望

Dust 的近期价值更像研究基线：它把激活空间搜索推进到 Transformer 预训练，并提供可读实现；若扩展到含外部程序、离散模块或难以跨深度同步的硬件，可能出现反传不易覆盖的场景。但现有结论限于小模型、小数据预算、三种子与精细调参，尚不足以证明可替代主流反传；等算力复现和更大规模下游评测才是关键。

## 附带链接

- [原文与论文](https://qlabs.sh/research/dust)
- [实验附录](https://qlabs.sh/research/dust/appendix.html)
- [官方代码](https://github.com/qlabs-eng/dust)
- [Hacker News 讨论](https://news.ycombinator.com/item?id=49970871)
