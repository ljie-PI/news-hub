---
title: "Sebastian Raschka's from-scratch video course on building reasoning models"
date: "2026-10-27"
generated: "2026-10-27 07:00"
source: "HN"
slug: "2026-10-27_07-sebastian-raschka-reasoning-models"
summary: "Sebastian Raschka于十月二十四日发布免费配套课程。按作者口径，课程含八段视频、超过十一小时编码，面向会使用Python和PyTorch、希望理解推理后训练的学习者；此前课程并非硬性前置。候选批次冻结为五百零四分、七十六条评论，不能与后续接口数据混算。"
---

# Sebastian Raschka's from-scratch video course on building reasoning models

## 事件背景

Sebastian Raschka于十月二十四日发布免费配套课程。按作者口径，课程含八段视频、超过十一小时编码，面向会使用Python和PyTorch、希望理解推理后训练的学习者；此前课程并非硬性前置。候选批次冻结为五百零四分、七十六条评论，不能与后续接口数据混算。

## 核心观点 / 产品机制

课程不是从头预训练基础模型，而是载入Qwen3 0.6B，在Python与PyTorch中逐层实现“推理方法”。路径先做流式生成、键值缓存及MATH-500答案验证器，再加入温度与核采样、自洽投票、候选评分和自我修正；随后以验证器作奖励，实现简化的GRPO与可验证奖励强化学习，跟踪熵、优势、裁剪比率和KL项，最后用DeepSeek R1生成的答案做监督蒸馏。作者称早期生成和评估可用中央处理器，后段训练更适合图形处理器；仓库提供各章笔记本、练习答案和环境建议。

## 社区热议与争议点

本轮Algolia实际取得六十八个可见节点，未触及一百条上限。kavalg称讲解复杂概念直观；hypfer质疑视频不足以支撑昂贵的真实建模，并担心“从零”叙事偏向个人品牌。CamperBob2反驳说讲课本就需配合作业和项目，玩具模型形成直觉仍有价值；kadoban则给出较现实出口：在自有数据上用LoRA等方法后训练中小开源模型，而非承担预训练成本。评论分歧集中在教学价值与生产可用性不能等同。

## 行业影响与未来展望

这套材料把推理模型拆成可运行、可修改的后训练组件，有助于开发者审视奖励、推断计算与蒸馏的取舍。不过小模型和数学验证器只证明教学链路；真实领域仍受数据、算力、奖励设计及泛化约束，课程结果不能外推为前沿模型复现。

## 附带链接

- [课程原文](https://magazine.sebastianraschka.com/p/building-reasoning-models)
- [课程代码与练习](https://github.com/rasbt/reasoning-from-scratch)
- [第一段视频](https://www.youtube.com/watch?v=Kh9mqTzjuEQ)
- [Hacker News讨论](https://news.ycombinator.com/item?id=50245138)
