---
title: "ran minervini's full trend template on 171 us stocks: 11.97% cagr vs 13.20% for equal weight"
date: "2026-10-12"
generated: "2026-10-12 07:00"
source: "Reddit"
slug: "2026-10-12_07-ran-minervini-s-full-trend-template-on-171-us-stoc"
summary: "作者 Embarrassed-Ad-7032 用自建回测工具机械化检验 Minervini 趋势模板。逐帖 RSS 身份与 canonical raw 一致，共五个 entry：首项是作者主帖，后四项均为普通评论，没有作者回复或机器人。样本是“今天仍在”的美国大、小盘股共 171 只，并非历史时点成分股。"
---

# ran minervini's full trend template on 171 us stocks: 11.97% cagr vs 13.20% for equal weight

## 事件背景
作者 Embarrassed-Ad-7032 用自建回测工具机械化检验 Minervini 趋势模板。逐帖 RSS 身份与 canonical raw 一致，共五个 entry：首项是作者主帖，后四项均为普通评论，没有作者回复或机器人。样本是“今天仍在”的美国大、小盘股共 171 只，并非历史时点成分股。

## 核心观点 / 产品机制
策略把七项均线、趋势及价格区间条件，与第八项“126 日收益位居前 30%”叠加；合格股等权、按月调仓，无标的时持现，双边各收 0.05%。窗口为 2017-09-15 至 2025-03-14，策略与同股票等权基准都先预热 252 日。作者自报模板 CAGR 11.97%、最大回撤 35.1%、夏普 0.63，基准分别为 13.20%、39.1%、0.72；仅保留规则八的消融为 13.54%，较基准高 0.34 个百分点，p=0.44。尚缺“仅规则一至七”及去除持现机制的消融。

## 社区热议与争议点
普通评论者 StratIQAI 肯定测试思路，同时要求拆测规则一至七及持现状态过滤；traderpier 质疑按月退出漏掉 Minervini 常用的买入价下方 7%—8% 止损，并建议加入 8% 止损复测；Aggressive_Listen849 追问 171 只股票如何挑选，指出当前成分股排除了退市失败者，可能扭曲双方收益。三例分别是支持性改进、止损边界质疑和样本偏差质疑。

## 行业影响与未来展望
结果只说明这套机械筛选在该样本中未胜等权，不能外推到含 VCP 入场、选股判断和止损的真实交易。作者也承认幸存者偏差，并称它有利于规则，但偏差究竟更抬高筛选还是基准仍需历史成分股验证。全部数字均为作者自报；帖子没有代码、逐日数据或交易清单，无法独立复现。后续至少应采用时点化股票宇宙，并补齐止损、持现与两组规则的正交消融及多窗口样本外检验。

## 附带链接
- [Reddit 原帖](https://www.reddit.com/r/algotrading/comments/1x38lcn/ran_minervinis_full_trend_template_on_171_us/)
- [逐帖 Atom RSS](https://www.reddit.com/r/algotrading/comments/1x38lcn/.rss)
