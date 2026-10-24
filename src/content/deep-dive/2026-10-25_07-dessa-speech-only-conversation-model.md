---
title: "Dessa: Conversation Model trained only on speech"
date: "2026-10-25"
generated: "2026-10-25 07:00"
source: "HN"
slug: "2026-10-25_07-dessa-speech-only-conversation-model"
summary: "Block于十月二十三日公开语音对话模型Dessa，试图绕过“语音转文字—文本模型—语音合成”的级联路线。批次冻结热度为498 points、192 comments；调研刷新时Algolia为499 points，实际取得100个可见评论节点并触及本次上限，两组数字不可互换。"
---

# Dessa: Conversation Model trained only on speech

## 事件背景
Block于十月二十三日公开语音对话模型Dessa，试图绕过“语音转文字—文本模型—语音合成”的级联路线。批次冻结热度为498 points、192 comments；调研刷新时Algolia为499 points，实际取得100个可见评论节点并触及本次上限，两组数字不可互换。

## 核心观点 / 产品机制
据Block自述，Dessa从人类对话音频零起点训练，不使用文本或预训练模型；它直接接收、生成音频，并在全双工状态下边听边说，从重叠对话学习插话、附和、停顿与情绪。官方还称推理快于实时、可在M4 Max本地运行，训练只用一套NVIDIA GB200 NVL72。上述均未获独立复现；页面没有披露架构、参数量、音频时数、数据来源、语言覆盖、量化延迟或基准，也未发布论文、模型卡、权重和API。

## 社区热议与争议点
本轮仅引用实取节点。IshKebab认为其对话流畅度明显胜过替代品，但同时判断语音逼真、智能仍约停在较早水平。paxy则指出首段演示频繁抢话，笑声突兀，用户几乎无法说完。actualwitch观察到模型按要求提高音量后很快回落，还忘记刚才话题。hypfer肯定纯语音路线值得探索，却质疑若这些已是精选最佳样本，实用智能仍未到位。

## 行业影响与未来展望
若语音原生训练经验证，语调、迟疑和笑声可不必先压成文字，有望改善陪伴、辅导与无障碍交互；但全双工并非首创，Moshi论文已用文本骨干与并行音频流实现约200毫秒实测延迟。Dessa真正待证的是“纯语音”能否兼顾知识、推理、工具调用和多语言。现阶段它更像研究预告，需等待技术报告、开放测试与统一基准。

## 附带链接
- [Block原文](https://block.xyz/dessa)
- [Hacker News讨论](https://news.ycombinator.com/item?id=50213925)
- [HN Algolia数据](https://hn.algolia.com/api/v1/items/50213925)
- [The Verge试听报道](https://www.theverge.com/ai-artificial-intelligence/1017906/jack-dorsey-block-dessa-ai-voice-speech)
- [Moshi论文](https://arxiv.org/abs/2410.00037)
