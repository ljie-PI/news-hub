---
title: "pbakaus-impeccable"
date: "2026-06-02"
generated: "2026-06-02 07:00"
source: "GitHub"
slug: "2026-06-02_07-pbakaus-impeccable"
---

---
title: "pbakaus/impeccable"
date: "2026-06-02"
generated: "2026-06-02 07:00"
source: "GitHub"
slug: "pbakaus-impeccable"
---

## 1. 背景

AI 编程助手（Cursor、Claude Code、Codex）在“写代码”上日臻成熟，但在“做设计”——UI/UX、视觉一致性、组件审美——表现仍参差。前 Google 设计师 Paul Bakaus 推出 `impeccable`，自我定位为“让 AI harness 在设计上变得更好的设计语言”，登上 GitHub Trending。

## 2. 核心机制 / 项目定位

据仓库描述，impeccable 是一套“设计语言”而非单纯组件库——可以被注入到 AI Agent 的系统提示与工具上下文中，使其生成的界面遵守一套统一的视觉、间距、层级、动效原则。其交付物可能包括：可机读的 design tokens、规则化文档（供 LLM 引用）、参考组件实现。本质是把“资深设计师审美”编码成 LLM 可消费的规范。

## 3. 社区 / 竞品观察

相似思路的有 shadcn/ui（组件 + 规范）、Vercel 的 v0 prompt 模板、以及各家“AI-friendly design system”。impeccable 的差异在于显式定位“AI harness 的设计层”，承认设计输出的主体是 Agent 而非人。社区关注点是它能否被 Cursor/Claude Code 等以 skill 形式直接挂载。

## 4. 行业影响

随着 vibe coding 普及，设计一致性反而成了稀缺品。impeccable 代表一种趋势：设计师不再只交付 Figma，而是交付“可被 LLM 理解的规范包”。如果该模式成立，design system 行业会出现“AI-native”分支，传统组件库需要重新组织文档结构以适配 LLM 上下文。

## 5. 链接

- 项目地址：https://github.com/pbakaus/impeccable
