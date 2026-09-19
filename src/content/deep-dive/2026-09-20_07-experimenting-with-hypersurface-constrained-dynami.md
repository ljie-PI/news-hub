---
title: "Experimenting with hypersurface-constrained dynamic weight updating [P]"
date: "2026-09-20"
generated: "2026-09-20 07:00"
source: "Reddit"
slug: "2026-09-20_07-experimenting-with-hypersurface-constrained-dynami"
summary: "Reddit 冻结记录与帖子 Atom 均指向 `1wksamz`，标题、作者 `manila_danimals` 和发布时间一致。作者把 LoopSLM 定位为业余架构实验：以较少训练参数缓解显存瓶颈，并让小模型更适合本地运行。目前公开成果是代码仓库、说明和训练曲线，不是经同行评审的论文。"
---

# Experimenting with hypersurface-constrained dynamic weight updating [P]

## 事件背景
Reddit 冻结记录与帖子 Atom 均指向 `1wksamz`，标题、作者 `manila_danimals` 和发布时间一致。作者把 LoopSLM 定位为业余架构实验：以较少训练参数缓解显存瓶颈，并让小模型更适合本地运行。目前公开成果是代码仓库、说明和训练曲线，不是经同行评审的论文。

## 核心观点 / 产品机制
模型让输入反复经过共享解码块，却不只复用固定权重：它以三角波函数组成连续超曲面，按循环深度切片生成 `ΔW`，再用 `Wₗ=W₀+ΔWₗ` 改写注意力与前馈层；GLA 状态向量又按输入调制曲面振幅。作者称实验采用冻结的 GPT-2 词嵌入、无位置编码、长度 1024、批量 16、训练一万步。其图表显示三阶段版本约 2720 万参数，是 24 层基线约 1.699 亿参数的 16%，损失优于固定权重循环基线但仍落后于完整 24 层模型。按所列步数计算实际处理约 1.64 亿词元，因此“10B”指所用 FineWeb-Edu 样本池，并不等于已经遍历全部样本。

## 社区热议与争议点
本次 Atom 仅返回一个主帖条目，没有普通用户评论、机器人评论或作者回复；仓库公开 issue 也为零。因此没有足够证据列出二至四个真实社区例子，更不能把作者自评伪装成社区共识。现阶段唯一可核实的评价是作者口径：三角波与上下文调制带来增益，但绝对损失仍不及标准深层基线，且更大函数基和更长训练尚待实验。

## 行业影响与未来展望
该方案把逐层独立参数改成“共享基座加函数生成增量”，为参数压缩与条件化权重提供了可研究方向；但循环 24 次仍有计算成本，参数减少也不自动等于峰值显存、吞吐或生成质量改善。仓库尚无训练脚本、配置、测试和检查点，曲线属于作者自报。下一步应在等词元、等算力和多随机种子下公布验证集困惑度、峰值显存及速度，才能判断收益是否可复现。

## 附带链接
- [Reddit 原帖](https://www.reddit.com/r/MachineLearning/comments/1wksamz/experimenting_with_hypersurfaceconstrained/)
- [LoopSLM 仓库](https://github.com/morgengramlich/LoopSLM)
- [Universal Transformers](https://arxiv.org/abs/1807.03819)
- [Gated Linear Attention](https://arxiv.org/abs/2312.06635)
- [NoPE 相关论文](https://arxiv.org/abs/2305.19466)
- [FineWeb-Edu 数据集](https://huggingface.co/datasets/HuggingFaceFW/fineweb-edu)
