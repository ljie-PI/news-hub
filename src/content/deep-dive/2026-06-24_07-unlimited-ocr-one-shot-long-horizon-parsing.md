---
title: "Unlimited OCR: One-shot long-horizon parsing"
date: "2026-06-24"
generated: "2026-06-24 07:00"
source: "HN"
slug: "2026-06-24_07-unlimited-ocr-one-shot-long-horizon-parsing"
summary: "这条 HN（425 分、约 96 条评论，抓取时 Algolia API 显示 17 个一级评论）讨论的是百度开源的 **Unlimited-OCR**。项目在 2026-06-22 发布技术报告与代码/权重，定"
---

# Unlimited OCR: One-shot long-horizon parsing

## 1. 事件背景

这条 HN（425 分、约 96 条评论，抓取时 Algolia API 显示 17 个一级评论）讨论的是百度开源的 **Unlimited-OCR**。项目在 2026-06-22 发布技术报告与代码/权重，定位为把 DeepSeek-OCR 推向“one-shot long-horizon parsing”：不再把长 PDF 拆成一页页 OCR 后拼接，而是尝试在一次前向过程中解析几十页文档。其论文称，端到端 OCR 近年来因 LLM 解码器重新升温，但标准注意力会让输出越长、KV cache 越大，导致显存和延迟持续上升。

## 2. 核心观点/产品机制

Unlimited-OCR 的关键机制是 **Reference Sliding Window Attention（R-SWA）**。模型沿用 DeepSeek-OCR 的高压缩 DeepEncoder，并把解码器中的注意力替换为 R-SWA：生成每个 token 时，始终可见所有“参考 token”（图像/提示等前缀），但只关注最近一段已生成输出（默认窗口 128）。这样 KV cache 近似保持为“前缀长度 + 窗口长度”的常量，不随完整输出线性增长。模型规模为 3B MoE、约 500M 激活参数；README 提供 Transformers 与 SGLang/OpenAI-compatible API 两种推理方式，单图可用 gundam/base 配置，多页/PDF 使用 1024 图像尺寸并可先用 PyMuPDF 渲染 PDF。论文报告在 OmniDocBench v1.5 达到 93%+，较 DeepSeek-OCR 基线提升约 6%；长文档测试覆盖 2、5、10、15、20、40+ 页，40+ 页编辑距离约 0.1069、Distinct-35 约 96.90%。

## 3. 社区热议与争议点

HN 的讨论集中在“这到底是不是新 OCR”与“LLM OCR 是否可靠”。例如，用户 **Oras** 质疑 OCR 早已由视觉模型解决，为什么还要重做引擎；回复者则指出这里的重点不是普通单页识别，而是降低长输出时的 KV cache、成本、吞吐与延迟。**robotswantdata** 用“AI 不再囤积全部短期记忆”解释 R-SWA，认为它能减少把 PDF 切页再胶水拼接的工程负担，并看好本地 AI 场景。**pmarreck** 提出生产环境中 AI OCR 常会“发明”内容，甚至把外语自动翻译成英语；其下讨论强调，许多档案/法律/转写任务需要标注不确定性，而不是语言模型自信地猜测。另有 **gettingoverit** 问它如何对比 ABBYY FineReader，认为只和 transformer OCR 比较不足以说明法律文档质量；**aliljet** 则追问与 Infinity Parser 2、olmOCR-bench 等基准的关系，指出 OCR 尚无单一权威榜单。还有评论把机制延伸到长对话、音乐识别（OMR）和开源商业策略。

## 4. 行业影响与未来展望

如果 R-SWA 的实测表现能被社区复现，它的意义不只在 OCR：它把“稳定参考输入 + 局部生成状态”的任务抽象出来，可能适用于 ASR、翻译、长视频/长音频转写等。对文档 AI 公司而言，价值在于减少分页编排、跨页阅读顺序、表格/公式续接等复杂胶水逻辑，并让本地部署在长 PDF 上更可行。但仍有三类风险：第一，“Unlimited”并非真正无限，论文也承认 32K/前缀长度仍限制可处理页数，短期计划转向 128K 与 prefill pool；第二，多页模式 1024 分辨率可能让小字成为瓶颈；第三，LLM 解码器的幻觉、纠错过度和合规审计仍需置信度、对齐校验或重建比对等机制补强。

## 5. 附带链接

- GitHub: https://github.com/baidu/Unlimited-OCR
- HN discussion: https://news.ycombinator.com/item?id=48643426
- arXiv HTML: https://arxiv.org/html/2606.23050v1
- HN Algolia item API: https://hn.algolia.com/api/v1/items/48643426
