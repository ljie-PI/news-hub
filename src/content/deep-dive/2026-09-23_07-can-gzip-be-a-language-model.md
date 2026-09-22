---
title: "Can gzip be a language model?"
date: "2026-09-23"
generated: "2026-09-23 07:00"
source: "HN"
slug: "2026-09-23_07-can-gzip-be-a-language-model"
summary: "Nathan Barry 受论文《Language Modeling Is Compression》启发，把预测与压缩的等价关系做成 GziPT：不用神经网络或训练，只让 DEFLATE 延续提示。该帖本批冻结为 368 分、144 条评论；本轮 Algolia 实取 100 个可见节点，已触及上限，并非读完全部评论。实验因此刻意展示能力边界，而非宣称获得通用智能。"
---

# Can gzip be a language model?

## 事件背景
Nathan Barry 受论文《Language Modeling Is Compression》启发，把预测与压缩的等价关系做成 GziPT：不用神经网络或训练，只让 DEFLATE 延续提示。该帖本批冻结为 368 分、144 条评论；本轮 Algolia 实取 100 个可见节点，已触及上限，并非读完全部评论。实验因此刻意展示能力边界，而非宣称获得通用智能。

## 核心观点 / 产品机制
方法把语料窗口、提示和候选续写交给 zlib，以压缩后字节数越小表示越可能。逐字贪心会因 gzip 只返回整数长度而大量并列，故改用束搜索：每轮把语料中出现过的字节扩展到候选，向前搜索一段，再提交最优片段。默认前瞻 24 字节、束宽 32，并只保留最近 80 个生成字节，避免复制循环。Tiny Shakespeare 输出有角色格式和局部词形，却不连贯；仓库也承认示例经过挑选，通常更差。

## 社区热议与争议点
stingraycharles 佐证实用面：曾用不同语言的维基语料预置字典，快速做语言识别。Matumio 认为它揭示了共同数学问题、能祛魅，但不能外推到神经网络的复杂度与泛化。mg 指出束搜索只摸到巨大序列空间的一角，结果至多是 gzip 可行性的下界。StilesCrisis 更尖锐：截短历史是人为抑制重复，漂亮输出依赖解码调参。

## 行业影响与未来展望
它更像可解释、零训练的教学基线，也能启发小样本分类和异常检测，而非廉价替代 LLM。后续评测应同时报告搜索覆盖、生成质量、速度及解码器体积；32 KiB 窗口、局部复用偏好和束搜索成本决定了其泛化上限。

## 附带链接
- [原文](https://nathan.rs/posts/gzip-lm/)
- [HN 讨论](https://news.ycombinator.com/item?id=49797323)
- [GziPT 代码](https://github.com/nathanrs/gzipt)
- [相关论文](https://arxiv.org/abs/2309.10668)
