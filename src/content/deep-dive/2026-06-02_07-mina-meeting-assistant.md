---
title: "mina-meeting-assistant"
date: "2026-06-02"
generated: "2026-06-02 07:00"
source: "PH"
slug: "2026-06-02_07-mina-meeting-assistant"
---

---
title: "Mina Meeting Assistant"
date: "2026-06-02"
generated: "2026-06-02 07:00"
source: "Product Hunt"
slug: "mina-meeting-assistant"
---

## 1. 背景

会议 AI 赛道在 2024-2025 年由 Otter、Fireflies、Granola 主导，但绝大多数产品定位为“会后纪要”。2026 年 6 月 1 日 Product Hunt 日榜第一的 **Mina Meeting Assistant**（360 赞、68 评）把战场推进到“会中实时参与”：AI 队友在通话过程中即可发声、调工具、产出物。

## 2. 核心机制 / 项目定位

据官方描述，Mina 不仅听录与转写，还能：(1) 在会议中以语音回应主持人或参与者；(2) 调用预设 skills（CRM 查询、文档生成、数据查表等）；(3) 跨阶段串联——会前准备资料、会中产出、会后跟进。它面向销售、面试、站会、客户沟通等场景，本质是把 LLM 工具调用嵌入实时音频流水线，需要解决低延迟 ASR + TTS + Function Calling 的协同。

## 3. 社区 / 竞品观察

直接竞品：Read AI、Granola、Spinach；语音 Agent 角度的对手是 Retell AI、Vapi 等基础设施。Mina 的差异化是“产品级实时桌面 Agent”，而非开发者 API。PH 评论关注隐私（是否所有与会者知情）、打断逻辑、以及对 Zoom/Meet/Teams 的接入深度。

## 4. 行业影响

“实时发声的 AI 队友”可能重塑会议礼仪：当 AI 主动发言成为常态，公司需要新治理框架（合规录音、AI 发言权限）。这也加速“Voice-first Agent”从 demo 走向 SaaS，挤压传统会议笔记类产品的差异空间——若只做转写很可能在 12 个月内被实时型对手吞并。

## 5. 链接

- Product Hunt：https://www.producthunt.com/products/mina-meeting-assistant
