---
title: "Show HN: I trained a 125M model to autocomplete piano on-device"
date: "2026-08-21"
generated: "2026-08-21 07:00"
source: "HN"
slug: "2026-08-21_07-show-hn-i-trained-a-125m-model-to-autocomplete-pia"
summary: "作者耗时近一年、迭代十四次，把“钢琴版 Copilot”做成免费应用 RollTab：用户用 MIDI 键盘弹出短句，模型在 iPhone 或 iPad 本地续写。该帖抓取时获四百�"
---

# Show HN: I trained a 125M model to autocomplete piano on-device

## 事件背景
作者耗时近一年、迭代十四次，把“钢琴版 Copilot”做成免费应用 RollTab：用户用 MIDI 键盘弹出短句，模型在 iPhone 或 iPad 本地续写。该帖抓取时获四百六十三分、百余条评论，热度来自它不是云端整曲生成，而是可实时互动的小模型实验。

## 核心观点 / 产品机制
关键突破不在盲目扩参，而在表示与数据。作者把每个音符编码成音高、起音间隔、时值、力度等复合字段，让主干每次前向直接生成一个完整音符，较逐字段方案约少五倍自回归步骤；一亿两千五百万参数模型经 Core ML 转换和八位量化后，在 iPhone 15 达到约每秒一百零八个音符。训练集含数十万份 MIDI、约三亿音符事件，并按移调与等比例变速指纹去重；扩大五倍的噪声数据反而更差。预训练后，作者用 Gemini 成对评判续写并做直接偏好优化，官方实验中共识数据版本有约百分之六十九的结果胜过基础模型。

## 社区热议与争议点
支持者 Tepix 实测称效果不错，但希望把生成结果回传为 MIDI，而非只从手机扬声器播放。evalystai 认可创意，却指出节奏和曲式仍弱；作者回应可加入小节标记与长期规划。更尖锐的 rajivayyangar 认为效果不优于马尔可夫模型，主张先分解和声、旋律等高层结构。围绕“机器是否夺走即兴乐趣”的质疑，jamilton 则反驳：它只是爱好者做的玩具，并不会阻止任何人学习音乐，也没人把模型输出冒充演奏成果。

## 行业影响与未来展望
项目说明端侧生成式产品的杠杆可能是领域表示、清洗和交互延迟，而非模型规模竞赛；它也把音乐生成从“一键成曲”推向伴奏、即兴搭档和创作筛选器。不过短提示仍不稳定，模型会循环，偏好评测依赖 Gemini 且交换答案顺序后仅约七成一致，音乐结构与审美判断仍是落地瓶颈。

## 附带链接
- [原文](https://simedw.com/2026/08/20/midi-autocomplete/)
- [Hacker News 讨论](https://news.ycombinator.com/item?id=49373456)
