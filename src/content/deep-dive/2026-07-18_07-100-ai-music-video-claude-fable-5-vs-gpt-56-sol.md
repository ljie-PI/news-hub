---
title: "$100 AI 音乐视频对决：Claude Fable 5 vs. GPT-5.6 Sol"
date: "2026-07-18"
generated: "2026-07-18 07:00"
source: "HN"
slug: "2026-07-18_07-100-ai-music-video-claude-fable-5-vs-gpt-56-sol"
summary: "TryAI 团队搭建了一个 agentic harness，给 Claude Fable 5 与 GPT-5.6 Sol 同一首歌（Bruno Mars & Mark Ronson 的《Uptown Funk》）、一个硬性预算，以及 plan / web_search / get_b"
---

# $100 AI 音乐视频对决：Claude Fable 5 vs. GPT-5.6 Sol

## 事件背景

TryAI 团队搭建了一个 agentic harness，给 Claude Fable 5 与 GPT-5.6 Sol 同一首歌（Bruno Mars & Mark Ronson 的《Uptown Funk》）、一个硬性预算，以及 plan / web_search / get_budget / generate_image / generate_video / run_command 六个工具，让模型自主研究可用视频模型、生成片段、用本地 ffmpeg 剪辑并拼装成完整 MV。两模型各跑 $25 与 $100 两档，共四次运行，全部自主完成并产出可播放成片。该帖在 Hacker News 获 381 分。

## 核心观点

四段视频没有一段称得上出色，但过程揭示了前沿模型的能力边界。作者发现：角色与叙事一致性全线崩坏，人物在镜头间漂移；模型对歌词过于字面化（"make a dragon wanna retire" 就真出现一条龙）；节奏匹配薄弱，动作与曲速对不上；几乎无人回头重剪或自查片段质量。成本上 Claude Fable 5 更贵（最高 $73.65），token 成本占其总花费三到四成，而 GPT-5.6 Sol 的 token 成本稳定在 $3–4。

## 社区热议与争议点

评论区争论热烈。支持方 zhinit 认为只要加更多 scaffolding、改走动画/卡通风格避开真人镜头的诡异感，效果会更好。批评方 maerF0x0 直指输出 "过于逐字直译歌词"，而好的 MV 应有叙事弧线而非照搬歌词。由此引发关于 "字面化 MV 是否有效创作方向" 的辩论：anonova 举 Vance Joy《Riptide》为正例，wzdd 则反驳称那类视频 "完全在另一个层级"。还有用户戏谑两首歌都提到 Michelle Pfeiffer 实为原曲歌词的巧合。

## 行业影响与未来展望

这场实验把讨论从 "模型能不能生成视频" 推向 "agent 如何自主编排长时程创作任务"。亮点在于 GPT-5.6 Sol 在 $25 档最富创意，尝试文字叠加与图生视频管线；但普遍缺乏自我复审与迭代，暴露 agentic 工作流的核心短板。$100 预算反而过剩，模型都不愿逼近上限。整套 harness 已开源，为社区提供了可复现的 agent 评测范式；主观/风格化任务仍是前沿模型待突破的方向。

## 附带链接

- HN 讨论：https://news.ycombinator.com/item?id=48939524
- 原文：https://www.tryai.dev/blog/ai-music-video-arena-claude-vs-gpt-5.6
- 开源 harness：https://github.com/hershalb/music-video-arena
