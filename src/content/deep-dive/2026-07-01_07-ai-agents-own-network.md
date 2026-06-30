---
title: "AI agents just got their own network. They can finally discover each other."
date: "2026-07-01"
generated: "2026-07-01 07:00"
source: "Reddit"
slug: "2026-07-01_07-ai-agents-own-network"
summary: "这是 r/AI_Agents 近日的高热帖。发帖人自述「过去几个月一直在构建 AI agent」，被一个反复出现的痛点困扰：每个 agent 只认识它被手动连接过的其他 agent"
---

# AI agents just got their own network. They can finally discover each other.

## 事件背景
这是 r/AI_Agents 近日的高热帖。发帖人自述「过去几个月一直在构建 AI agent」，被一个反复出现的痛点困扰：每个 agent 只认识它被手动连接过的其他 agent——它们能调用工具、浏览网页、连 MCP server，却没有任何办法去**发现**一个从未见过的新 agent。作者点出行业现状的矛盾：大家一直在谈「多智能体系统（multi-agent systems）」，但绝大多数人其实仍在用手工方式把 agent 一个个硬连起来。于是他动手做了「一个面向 agent 的网络」——每个 agent 拿到自己的地址、对外发布自己能做什么，从而让彼此可被检索、可被发现。帖子之所以现在引爆，是因为它击中了 2026 年 agent 生态从「单体 agent」走向「agent 互联」的集体焦虑。

## 核心观点 / 产品机制
作者的核心主张是把互联网早期「主机各自孤立 → DNS + 目录让彼此可寻址」的演进，复刻到 agent 世界：与其继续在 n×n 的连接矩阵里手工布线，不如给每个 agent 一个稳定地址 + 一份能力清单（capability manifest），再由一个共享的发现层（discovery / registry）负责索引与路由。这本质上是把 MCP（解决 agent↔工具）和 A2A（agent↔agent 通信协议）尚未覆盖的「陌生 agent 之间如何先找到对方」这一环补齐——通信协议解决「怎么说话」，发现网络解决「先找到跟谁说话」。

## 社区热议与争议点
此类帖在 r/AI_Agents 通常呈现明显对立。支持方认为：手工编排确实是多智能体落地的最大摩擦，一个开放的 agent 注册/发现层是刚需，类比 DNS、npm registry 或服务网格的服务发现，方向正确。质疑方则集中在三点：其一，**安全与信任**——能被任意发现也意味着攻击面扩大，如何防止恶意 agent 冒充能力、做 prompt 注入或耗尽预算？其二，**是否重复造轮子**——已有 A2A、MCP、各类 agent marketplace，再来一个网络会不会沦为又一个互不兼容的孤岛？其三，**疑似软性推广**——这类「我造了个 X」的帖常被老用户质疑是引流，要求作者亮出开源代码与真实采用数据而非概念叙事。

## 行业影响与未来展望
不论这一具体实现能否跑出来，「agent 可发现性（discoverability）」正成为 2026 年 agent 基础设施的关键拼图。可以预见的趋势是：身份与寻址（每个 agent 一个可验证地址）、能力声明（标准化 manifest）、信任与鉴权（谁授权了这个 agent、它的预算与权限边界）会逐步标准化，并与 MCP/A2A 融合成完整的 agent 互联栈。真正的胜负手不在「能否发现」，而在「发现之后的信任与计费」——这恰是评论区反复追问的部分。

## 附带链接
- 原帖: https://www.reddit.com/r/AI_Agents/comments/1ujmou3/ai_agents_just_got_their_own_network_they_can/
- 相关协议: MCP（Model Context Protocol）/ A2A（Agent-to-Agent）
