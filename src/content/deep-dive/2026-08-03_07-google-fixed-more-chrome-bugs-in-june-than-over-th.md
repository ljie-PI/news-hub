---
title: "Google fixed more Chrome bugs in June than over the past two years, thanks to AI"
date: "2026-08-03"
generated: "2026-08-03 07:00"
source: "HN"
slug: "2026-08-03_07-google-fixed-more-chrome-bugs-in-june-than-over-th"
summary: "Google 安全团队在官方博客发文，披露 Chrome 借助 AI 大幅提升了漏洞发现、分诊与修复的效率。文中称，仅 Chrome 149 与 150 两个里程碑就修复了 1072 个安�"
---

# Google fixed more Chrome bugs in June than over the past two years, thanks to AI

## 事件背景

Google 安全团队在官方博客发文，披露 Chrome 借助 AI 大幅提升了漏洞发现、分诊与修复的效率。文中称，仅 Chrome 149 与 150 两个里程碑就修复了 1072 个安全漏洞，超过此前 23 个里程碑修复总和；2026 年 3 月收到的漏洞报告数已超过整个 2025 年。该文登上 HN，获 570 分与 599 条评论，围绕"AI 究竟带来了真实安全提升，还是营销叙事"展开激辩。

## 核心观点 / 产品机制

Google 展示了一条端到端的 AI 安全流水线：早在 2023 年就用 LLM 提升 fuzzing 覆盖率，2024 年推出 Naptime，2025 年联合 DeepMind 与 Project Zero 打造 Big Sleep。2026 年初的 Agent harness 用 Gemini 扫描全代码库，甚至挖出一个潜伏 13 年之久的沙箱逃逸漏洞。分诊环节将原本 5–30 分钟的人工流程自动化，每月节省数百工时；修复环节由多 Agent 工作流生成候选补丁；发布环节则试点每周两次安全更新以缩小"补丁间隙"。所有 AI 均在离线、无外网的锁定机器上分析静态代码。

## 社区热议与争议点

支持方 NitpickLawyer 认为这是 Google"自动化一切"传统的自然延伸："你的 LLM 好不好，取决于它运行的循环，而循环取决于验证器。"deeringc 指出 Chrome 是攻击者的头号目标，投入巨量算力先于对手找到漏洞合情合理。质疑方则尖锐：runarberg 猜测 Chrome 团队过去十年存在"不作为文化"，如今高层看到商业利益才动手修复并把功劳归给 AI 好卖更多 AI；dabedee 追问关键盲点——"有多少自动修复被回滚？引入了多少新 bug？发现 Agent 的误报率是多少？"文章只报喜不报忧。feelamee 则提醒：更可能是发现的 bug 从 50 个暴增到 500 个，修复率并未质变。

## 行业影响与未来展望

这场讨论超越了 Chrome 本身。Supermancho 援引 Linus 抱怨 AI"总在找到令人尴尬的 bug"，认为机器评估代码路径的能力让部分人不适；skydhash 反驳称 fuzzer、linter 早已是机器工具，关键在报告质量。无论如何，正如 gbalduzzi 所言，即便部分漏洞难以利用，整体仍是明显的安全增强。可以预见，微软等大厂也将跟进用 AI 清理代码并归功于自家模型，AI 攻防军备竞赛正全面加速。

## 附带链接

- 原文：https://blog.google/security/chrome-stronger-with-every-update/
- HN 讨论：https://news.ycombinator.com/item?id=49120097
