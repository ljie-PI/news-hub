---
title: "GPT-6 Astra, looped transformers, and hidden reasoning"
date: "2026-09-13"
generated: "2026-09-13 07:00"
source: "HN"
slug: "2026-09-13_07-gpt-6-astra-looped-transformers-and-hidden-reasoni"
summary: "OpenAI 已正式发布 GPT-6 Astra，并公布电脑操作、编码等评测；本批次冻结为 516 分、162 条评论。已证实的是模型发布与官方评测，官方并未披露其层结构。所谓 Astra 采用“循环 Transformer”，源自媒体报道；作者 Sebastian Raschka 明确称其仍是未获官方确认的推测。"
---

# GPT-6 Astra, looped transformers, and hidden reasoning

## 事件背景
OpenAI 已正式发布 GPT-6 Astra，并公布电脑操作、编码等评测；本批次冻结为 516 分、162 条评论。已证实的是模型发布与官方评测，官方并未披露其层结构。所谓 Astra 采用“循环 Transformer”，源自媒体报道；作者 Sebastian Raschka 明确称其仍是未获官方确认的推测。

## 核心观点 / 产品机制
循环 Transformer 的已知机制，是让中间表示多次通过同一组模块，以权重共享换取更深的计算：参数和权重显存可减少，但每轮仍需运算，独立 KV 缓存也未必节省。论文已验证这种通用设计，不能据此反推 Astra 的具体实现。作者判断 Astra“很可能”采用某种变体，但认为训练配方与数据或更关键；他也把“循环导致隐藏推理”列为缺乏因果证据的假说，而非事实。

## 社区热议与争议点
本次从 Algolia 实取完整评论树中的 146 个可见节点。libraryofbabel 赞同文章去魅：固定循环近似重复堆层，不会自动把逐词思维链藏起来。famouswaffles 反驳说，官方材料显示 Astra 对思维链形式的控制力显著提高，未知实现不能被简单化。throw3954 进一步指出，若循环深度由模型动态决定，单个输出词之间可承载更多隐状态计算；libraryofbabel 则回应，官方所称计算图深度仅在 GPT-4 两倍以内，更像有限循环，尚不足以证明“内部思维链”。

## 行业影响与未来展望
循环深度可能把竞争从单纯增参推向“共享参数、按需分配计算”，但可解释性结论必须拆开验证：架构、思维链可控性、可监测性并非同一指标。后续需要公开循环策略、同算力对照和隐藏状态审计；在此之前，较短或较可控的推理轨迹不能归因于循环结构。

## 附带链接
- [原文](https://magazine.sebastianraschka.com/p/gpt-6-astra-looped-transformers-and)
- [OpenAI 发布页](https://openai.com/index/gpt-6-astra/)
- [Hacker News 讨论](https://news.ycombinator.com/item?id=49627370)
