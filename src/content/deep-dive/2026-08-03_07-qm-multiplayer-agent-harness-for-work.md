---
title: "qm – Multiplayer agent harness for work"
date: "2026-08-03"
generated: "2026-08-03 07:00"
source: "HN"
slug: "2026-08-03_07-qm-multiplayer-agent-harness-for-work"
summary: "QM 是由 yc-software 开源的一款\"多人协作型 Agent 工作框架\"，在 Slack 与 Web 端运行，目前已收获 4.5k Star、427 Fork。它主打面向初创团队：每位员工拥有各自�"
---

# qm – Multiplayer agent harness for work

## 事件背景

QM 是由 yc-software 开源的一款"多人协作型 Agent 工作框架"，在 Slack 与 Web 端运行，目前已收获 4.5k Star、427 Fork。它主打面向初创团队：每位员工拥有各自隔离的工作区（独立的记忆、文件、密钥视图、权限、定时任务与沙箱），同时又能在频道、群组与项目中协同。该项目登上 Hacker News 首页，获得 665 分与 159 条评论，讨论焦点却意外落在其"人工书写"的贡献规则上。

## 核心观点 / 产品机制

QM 的架构核心是一个无头（headless）中枢，通过 Postgres 持久化会话与记忆，Agent 循环可自由切换 Pi、OpenCode、Codex、Claude Code 等多种 harness 与模型，不绑定单一厂商。每个 scope 拥有独立的耐久沙箱，`execute` 工具在其中运行命令。安全上提供 Strict、Auto、Dangerous 三档姿态，Agent 以使用者身份行事且全程审计。最引发热议的是其贡献政策：项目希望收到"人工书写的文本描述"而非代码 PR，因为"编码 Agent 已能写大部分底层代码"。

## 社区热议与争议点

支持方 meagher 作为维护者表示："比收到一个毫无上下文的垃圾 PR 好多了。"tptacek 点明核心："他们要的是你的提示词，不是你的代码"，并称这是"有趣的好规则"。2001zhaozhao 补充：核心团队握有 AI harness，实现成本极低，真正稀缺的是想法质量，筛选文本远比审代码高效。反对方则火力十足：Drupon 讥讽这是"行业 AI 精神错乱"的又一例证；john_strinlai 觉得讽刺——一个由 AI 写就的项目却要求人类手写、且禁止用 AI 润色提案。stefan_ 更直接吐槽 README 满是"AI 味"（如"Two skills maintain the boundary"），而本应存放人类文本的 adrs/ 目录竟是空的。

## 行业影响与未来展望

QM 折射出 Agent 时代开源协作范式的深刻转变。正如 stephenway 所言，真正的挑战不在于运行 Agent，而在于审阅其产出——代码越多，溯源、审阅工效与信任就越关键，代码托管平台未来数年或将为此演进。jez 指出 SQLite 早有"不接受陌生人补丁"的先例，并非新发明。QM 的实验意义在于，它把"想法"而非"实现"确立为贡献的硬通货，若这一模式被更多项目采纳，开源社区的门槛与形态都将被重新定义。

## 附带链接

- 原文：https://github.com/yc-software/qm
- HN 讨论：https://news.ycombinator.com/item?id=49126604
