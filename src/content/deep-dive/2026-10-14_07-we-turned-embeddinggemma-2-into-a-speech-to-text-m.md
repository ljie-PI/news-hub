---
title: "We turned EmbeddingGemma 2 into a speech-to-text model"
date: "2026-10-14"
generated: "2026-10-14 07:00"
source: "HN"
slug: "2026-10-14_07-we-turned-embeddinggemma-2-into-a-speech-to-text-m"
summary: "Google DeepMind 的 EmbeddingGemma 2 原本是把文本、图像、音频和视频映射到统一向量空间的嵌入模型。独立开发者借此做出端侧英文转写实验，批次冻结热度为 374 points、82 comments；这不是 Google 官方产品。"
---

# We turned EmbeddingGemma 2 into a speech-to-text model

## 事件背景
Google DeepMind 的 EmbeddingGemma 2 原本是把文本、图像、音频和视频映射到统一向量空间的嵌入模型。独立开发者借此做出端侧英文转写实验，批次冻结热度为 374 points、82 comments；这不是 Google 官方产品。

## 核心观点 / 产品机制
方案保持音频编码器不变，只训练小型 reader：它读取带约二十词上下文的短音频片段，以 CTC 方式输出 EmbeddingGemma 自身约二十二万九千个英文词的文本嵌入，取最近邻拼成转录，再由小模型补标点和大小写。作者称训练不到两小时、使用八张 H100；在基础款 M3 MacBook Air 上每小时音频耗时十二点六秒、约二百八十八倍实时，词错误率约百分之五。这些均为作者自报；对照还跨硬件、音频集和运行后端，不能视作同条件排名。

## 社区热议与争议点
调研时 Algolia 实取七十八个可见节点，未触及一百条上限，与冻结八十二条评论分账。martianvoid 认可这是嵌入模型的巧用；robotswantdata 认为当前误差仅适合业余项目。mikemzz1 建议普通 CTC 头，作者回应现有 reader 本就是 CTC，但输出词嵌入；字母级版本虽在干净有声书更好，在讲座上因拼写错误更差。drakirus 追问未登录词，作者称可新增其嵌入，但新词靠近已知词时仍会被吸附误判。

## 行业影响与未来展望
实验说明共享多模态空间可被低成本改造成新任务头，为端侧、离线且重隐私的转写提供另一条路径。不过当前仅英文，固定词表、专业准确率、基准可复现性与源码发布仍是落地门槛；更丰富训练数据能否缩小与专用语音模型的差距，尚待独立复测。

## 附带链接
- 原文：https://eg2.haku.sh/
- HN 讨论：https://news.ycombinator.com/item?id=50069971
- 官方模型卡：https://ai.google.dev/gemma/docs/embeddinggemma/model_card_2
