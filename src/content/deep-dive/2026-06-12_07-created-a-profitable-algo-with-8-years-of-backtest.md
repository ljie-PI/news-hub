---
title: "created-a-profitable-algo-with-8-years-of-backtest"
date: "2026-06-12"
generated: "2026-06-12 07:00"
source: "Reddit"
slug: "2026-06-12_07-created-a-profitable-algo-with-8-years-of-backtest"
---

---
title: "Created a Profitable Algo with 8 years of backtesting 深度调研"
date: "2026-06-12"
generated: "2026-06-12 07:00"
source: "Reddit"
slug: "created-a-profitable-algo-with-8-years-of-backtest"
---

## 1. 事件背景

r/algotrading 用户 **u/acowasacowshouldbe** 在 2026-06-11 发帖，分享一套基于 **NQ（纳斯达克 100 期货）** 的日内策略回测结果，并就"何时上实盘"向社区征求意见。资产类别为芝商所 NQ 连续合约，时间框架为 **5 分钟信号、1 分钟执行**，OP 自建了一套 replay 引擎，号称已与真实执行对齐到中位数 **$5 / trade** 的精度，回测数据覆盖 **8.7 年未调整数据**，并表示已计入真实手续费和滑点。整套讨论属于零售期货量化最高频出现的"backtest 到 live"过渡场景。

## 2. 核心观点 / 机制

OP 自我评价是"decent profit factor、controlled drawdowns、几千笔交易"，但被社区追问后逐步暴露关键指标：**Algo 2 胜率约 33%、Profit Factor 约 1、最大回撤约 60%**。OP 也承认："我的策略所捕捉的那种行情，只有 2019 年之后才足够频繁"——等于亲口承认权益曲线高度集中在后疫情牛市段。问题清单聚焦：PF / win rate / max DD / Sharpe / 年度一致性中究竟该赋予哪个最大权重，以及上实盘的客观门槛。

## 3. 社区热议与争议点

- **周期选择偏差（regime overfit）**：u/garamlund 直接指出"必须回测 2008 至今"，u/Longjumping-Cook-842 更严厉——"数据明显是过拟合到 post-COVID 牛市，其他时段要么平要么深红，60% DD 根本谈不上 controlled"。
- **过拟合 / 参数调优警示**：u/CODE_HEIST 建议看 **trade distribution**——如果权益曲线由少数几笔大单撑起，就要警惕；并强调 slippage 假设不能过于干净。
- **心理承受测试**：u/jrbp 反问"你过去 4 年都在浮亏 / 深 DD，如果实盘连续 4 年阴跌，你真能不关机？"——把回测漂亮与执行可行性切割开。
- **手续费 / 滑点细节**：虽然 OP 自称已计入，但 u/Good_Ride_2508 提醒，回测是静态数据，实盘是动态推进，5 分钟 K 线的高低点序列在 live 下完全不同，建议加 **regime gate** 过滤熊市。

## 4. 行业影响与未来展望

这条帖子是零售量化生态的典型缩影：自建 replay、几千笔样本、看似严谨，但只要拉长到 2008、2015、2018 等多重 regime，多数"profitable algo"都会被打回原形。社区呼吁的 **walk-forward / Monte Carlo p-ruin / regime filter** 已成事实标准。retail 想从公开帖直接抄到 alpha 并不现实，AI / LLM 辅助生成策略的边界仍卡在"能否跨 regime 稳健"。OP 被建议的"小仓位 + kill switch 绑定预期 DD"将成为 2026 年零售上实盘最务实的范式。

## 5. 附带链接

- Reddit 讨论：<https://www.reddit.com/r/algotrading/comments/1u2js33/created_a_profitable_algo_with_8_years_of/>
