---
title: "Heston model issue (stock-measure probability)"
date: "2026-07-26"
generated: "2026-07-26 07:00"
source: "Reddit"
slug: "2026-07-26_07-heston-model-issue"
summary: "在 r/quant 社区，一位量化从业/学习者发帖求助：在实现 Heston 随机波动率模型的期权定价时，使用 Gil-Pelaez 反演公式计算风险中性概率 P_1 和 P_2，结果�"
---

# Heston model issue (stock-measure probability)

## 1. 事件背景
在 r/quant 社区，一位量化从业/学习者发帖求助：在实现 Heston 随机波动率模型的期权定价时，使用 Gil-Pelaez 反演公式计算风险中性概率 P_1 和 P_2，结果与预期（如闭式解或蒙特卡洛基准）数值不符。这是衍生品定价领域的经典实现陷阱，几乎每个手写 Heston 模型的人都会踩到。

## 2. 核心议题
Heston 模型的半闭式期权定价公式将看涨期权价格表示为 C = S·P_1 − K·e^(−rT)·P_2，其中 P_1、P_2 是两个概率（分别在股票计价单位/股价测度与风险中性测度下），通过对特征函数做 Gil-Pelaez 傅里叶反演积分得到。数值不符通常并非公式错误，而是实现细节问题：特征函数存在两种形式（原始 Heston 版与 Little Heston Trap / Albrecher 修正版），前者在积分区间内复对数会跨越分支切割导致不连续。

## 3. 社区热议与争议点
（Reddit 评论区未逐字引用，以下基于该问题的通用共识在议题层面呈现 pros/cons）
- 常见诊断方向：优先怀疑复对数分支问题——应改用 Albrecher 等人提出的"Little Trap"特征函数形式以保证被积函数连续；检查 P_1 与 P_2 所用的 u=1/2 与 u=−1/2（或 b1、b2）参数是否搞混；核对积分数值方法（截断上限、节点数）是否收敛。
- 争议点：有人主张放弃 Gil-Pelaez，改用 Carr-Madan FFT 或 COS 方法，数值更稳更快；也有人认为理解经典反演更有教学价值。两种测度下概率的直觉解释也常引发讨论。

## 4. 行业影响与未来展望
Heston 仍是业界随机波动率定价的基石之一，其数值实现的鲁棒性直接影响校准与风险管理。COS 方法、FFT 与控制变量等现代技术已大幅缓解反演的数值不稳定问题。对学习者而言，亲手排查分支切割与测度混淆的过程，是理解随机波动率与傅里叶定价的必经之路。

## 5. 附带链接
- Reddit 原帖: https://www.reddit.com/r/quant/comments/1v6a1ky/heston_model_issue_stockmeasure_probability/
