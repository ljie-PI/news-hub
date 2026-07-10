---
title: "GPT-5.6 Sol Ultra produces proof of the Cycle Double Cover Conjecture"
date: "2026-07-11"
generated: "2026-07-11 07:00"
source: "HN"
slug: "2026-07-11_07-gpt-5-6-sol-ultra-produces-proof-of-the-cycle-doub"
summary: "OpenAI 发布了一份 PDF，声称其 GPT-5.6 Sol Ultra 模型独立产出了\"环双重覆盖猜想\"的完整证明。该猜想由 Tutte、Itai 和 Rodeh、Szekeres、Seymour 等人提出，断言每"
---

# GPT-5.6 Sol Ultra produces proof of the Cycle Double Cover Conjecture

## 事件背景
OpenAI 发布了一份 PDF，声称其 GPT-5.6 Sol Ultra 模型独立产出了"环双重覆盖猜想"的完整证明。该猜想由 Tutte、Itai 和 Rodeh、Szekeres、Seymour 等人提出，断言每个无桥无向图都存在一组圈，使每条边恰好被覆盖两次。文档明确注明"本证明完全由 GPT-5.6 Sol Ultra 完成，撰写借助 Codex"。据宣布，模型在不到一小时内解出。HN 讨论获得 266 分。

## 核心观点
证明的核心思路是：先归约到立方图，利用 8-流定理与 Tutte 的结果，得到用 F₃₂ 非零元标记边、每顶点求和为零的标记。关键归约是把它转换为给每条边分配两元素集合，使每个元素在每顶点旁出现零次或两次，最终归结为一个初等线性代数论证。提示词中"至少花 8 小时再考虑放弃"的措辞引发关注——它被用作激励而非欺骗，让智能体不轻易中途退出。

## 社区热议与争议点
评论区争论主要围绕可信度与成本。legulere 质疑幸存者偏差：他们尝试了多少失败的问题、用了多少种提示变体？therobots927 追问是否用了证明检查软件反复打磨。关于成本，riknos314 估算若 64 个子智能体全速运行一小时，输出成本约 275 至 485 美元，但若用 Sol Fast 则可能高达一万三千美元。围绕 Sol 是否跑在 Cerebras 750 tok/s 硬件上也有分歧，Anuiran 指出常规 Sol 并不运行在 Cerebras 上。

## 行业影响与未来展望
这一事件标志着前沿模型在纯数学开放问题上的能力跃升。bgirard 好奇是否已有数学社区在系统性地用每个新模型攻击未解难题，以及解题成功率如何。not-a-llm 预言随着模型增强，会有数百万乃至十亿美元投入黎曼猜想等最著名难题——为名垂青史。若属实且经同行验证，这将重塑数学研究范式，但成本透明度与可复现性仍是悬而未决的关键。

## 附带链接
- HN 讨论：https://news.ycombinator.com/item?id=48863490
- 证明原文 PDF：https://cdn.openai.com/pdf/04d1d1e4-bc75-476a-97cf-49055cd98d31/cdc_proof.pdf
