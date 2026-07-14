---
title: "我们是否在错误的计算架构上构建未来 AI？"
date: "2026-07-15"
generated: "2026-07-15 07:00"
source: "Reddit"
slug: "2026-07-15_07-are-we-trying-to-build-future-ai-on-top-of-the-wro"
summary: "一位 r/LLM 用户发帖，从研究现代处理器工作原理出发，指出今天绝大多数计算仍然继承了上世纪四十年代中期确立的 von Neumann 架构。该架构把运算单元"
---

# 我们是否在错误的计算架构上构建未来 AI？

## 事件背景
一位 r/LLM 用户发帖，从研究现代处理器工作原理出发，指出今天绝大多数计算仍然继承了上世纪四十年代中期确立的 von Neumann 架构。该架构把运算单元与存储单元分离，二者通过总线来回搬运数据。发帖者质疑：当 AI 模型规模持续膨胀，我们把未来的 AI 建立在这一古老结构之上，是否从根本上就选错了地基。（受环境限制，未逐字引用评论。）

## 核心观点
帖子的核心是所谓 von Neumann 瓶颈与 memory wall：处理器必须先从内存取数据、算完再写回，AI 任务权重反复搬运，导致 GPU 常在等待中空转、能耗高企。发帖者认为，应认真考虑 neuromorphic（类脑）与 in-memory computing（存内计算）等新范式，让存储与计算在同一物理器件中融合，从架构层打破数据搬运的天花板。

## 社区热议与争议点
支持一方认为，IBM 等机构的研究已证实瓶颈真实存在，PIM、ReRAM 等方向值得投入。质疑一方则指出：NVIDIA H100、Blackwell 依旧沿用 von Neumann 结构却仍在推进 AI，说明工程生态、软件栈与制造成熟度才是现实约束；新架构精度、可编程性与量产良率均未验证，短期内难以撼动既有体系。

## 行业影响与未来展望
争论折射出算力路线的长期分歧：延续 GPU 渐进优化，还是押注存内与类脑的颠覆。可预见的是二者并存，新范式先在边缘推理、低功耗场景落地，再逐步向数据中心渗透。

## 附带链接
- 原帖：https://www.reddit.com/r/LLM/comments/1uwgs11/are_we_trying_to_build_future_ai_on_top_of_the/
- IBM Research：https://research.ibm.com/blog/why-von-neumann-architecture-is-impeding-the-power-of-ai-computing
