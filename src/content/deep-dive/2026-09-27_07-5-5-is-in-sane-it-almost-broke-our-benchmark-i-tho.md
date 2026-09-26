---
title: "5.5 is IN-SANE. It almost broke our benchmark. I thought it was a bug."
date: "2026-09-27"
generated: "2026-09-27 07:00"
source: "Reddit"
slug: "2026-09-27_07-5-5-is-in-sane-it-almost-broke-our-benchmark-i-tho"
summary: "Anthropic 于 9 月 22 日发布 Claude Opus 5.5；四天后，ToneBench 维护者称其写作表现出现“断层”。帖子口径为 2631 Elo、领先 Fable 307 分、首次超过 91/100，但同一正文的配置表又写 max 为 2600、旧榜首为 2303。当前榜单已重算为 2846 Elo、91.8/100、167 个配置第一，说明这些数字会随评审与全榜重评分变化。"
---

# 5.5 is IN-SANE. It almost broke our benchmark. I thought it was a bug.

## 事件背景
Anthropic 于 9 月 22 日发布 Claude Opus 5.5；四天后，ToneBench 维护者称其写作表现出现“断层”。帖子口径为 2631 Elo、领先 Fable 307 分、首次超过 91/100，但同一正文的配置表又写 max 为 2600、旧榜首为 2303。当前榜单已重算为 2846 Elo、91.8/100、167 个配置第一，说明这些数字会随评审与全榜重评分变化。

## 核心观点 / 产品机制
ToneBench 测的不是通用智能，而是模仿 Towards AI 的长篇 YouTube 脚本风格：10 个真实任务各生成 5 次，共 50 篇；Anthropic、OpenAI、DeepSeek 三家模型匿名评分九项指标，加权总分再做成对比较与自举置信区间。精确量表和参考稿不公开，人工基线也是团队协作定稿后再由同一模型面板评分，故仍属作者方基准。其页面记录 max 平均 1023 秒、约 14.64 万输入输出词元、每篇 3.43 美元；Anthropic 官方则公布标准价每百万输入/输出词元 4/20 美元，与榜单采用的 5/25 美元不一致，成本结论需谨慎。

## 社区热议与争议点
RSS 返回 1 篇主帖和 12 条可见评论。普通用户 BannedForThe7thTime 追问究竟测什么；作者回复称量表围绕自己的语气、转场和叙事，且人评尚难规模化、可靠性仍在完善。Rookie-dy 直接质疑 LLM 裁判是否可靠，未见作者作答。EzoLabsInc 肯定质量上限，却认为 17 分钟不适合生产；作者回应 max 仅用于重要初稿，多数任务会选 high。讨论因此同时支持质量跃升，也集中质疑外推性、裁判可信度与时延。

## 行业影响与未来展望
结果说明推理努力档位可能形成明显的质量—成本—时延前沿，但私有参考集、仅十类同风格任务、模型裁判偏差及动态重评分，都阻止把第一名等同于“最佳写作模型”。团队更应以自身文体建评测，加入独立人评，并按真实预算选择 high、xhigh 或 max。

## 附带链接
- [Reddit 原帖](https://www.reddit.com/r/ClaudeAI/comments/1wr03jc/55_is_insane_it_almost_broke_our_benchmark_i/)
- [ToneBench：Opus 5.5 max](https://benchmark.towardsai.com/models/claude-opus-5-5-max.html)
- [ToneBench 方法说明](https://benchmark.towardsai.com/methodology.html)
- [Anthropic 官方发布](https://www.anthropic.com/claude-opus-5-5)
