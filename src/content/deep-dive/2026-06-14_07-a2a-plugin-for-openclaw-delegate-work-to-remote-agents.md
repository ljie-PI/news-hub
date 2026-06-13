---
title: "a2a-plugin-for-openclaw-delegate-work-to-remote-agents"
date: "2026-06-14"
generated: "2026-06-14 07:00"
source: "Reddit"
slug: "2026-06-14_07-a2a-plugin-for-openclaw-delegate-work-to-remote-agents"
---

---
title: "Reddit 深度：A2A Plugin for OpenClaw: Delegate Work to Remote Agents"
date: "2026-06-14"
generated: "2026-06-14 07:00"
source: "Reddit Deep Dive"
slug: "a2a-plugin-for-openclaw-delegate-work-to-remote-agents"
---

## 一、事件概述

r/openclaw 一位社区开发者发帖宣布，为 OpenClaw（前身为 Nous Research 的 Hermes Agent）打造了一个 A2A（Agent-to-Agent）协议插件，使本地 Agent 可把任务委派给远程 Agent，并在任务完成后将"延续状态"（continuation state）回放回本地会话。这意味着 OpenClaw 不再是孤立的单体 Agent，而能作为编排者，把子任务派发到任意符合 A2A 规范的外部 Agent。帖子附带 GitHub 仓库与端到端 demo：本地模型先规划任务，再通过 A2A 调用一个远端数据分析 Agent，最后无缝继续后续工具调用。

## 二、A2A 协议解读

A2A 是 Google 于 2025 年牵头推出的开放规范，定位类似 Agent 世界的 HTTP。核心是 `AgentCard`（自描述能力清单）、`Task` 对象，以及基于 JSON-RPC over HTTP/SSE 的双向流式通信。它与 MCP 形成互补：MCP 负责 Agent 与"工具"对话，A2A 负责 Agent 与"Agent"对话。该插件实现了 A2A 客户端与最小服务端，因此 OpenClaw 既能"喊"别人，也能被别人"喊"。

## 三、开放生态拼图

插件之所以引发讨论，是因为它把三块拼图拼到了一起：Google 的 A2A 规范、OpenAI Agents SDK 的 handoff 抽象，以及 Anthropic 推动的 MCP。社区评论指出，这种"协议套协议"的栈正在迅速形成事实标准：MCP 解决工具碎片化，A2A 解决 Agent 碎片化，Agents SDK 提供编排语法糖，三者并不冲突，OpenClaw 恰好位于交汇点。

## 四、Continuation State 的工程价值

最受好评的设计是 continuation state replay。传统远程调用一旦失败或断网，本地状态就丢失；该插件把工具调用链、思考链、上下文变量序列化为可重放结构，远程 Agent 返回后能精确恢复执行点。这对长任务（多步研究、CI/CD 自动化、夜间批处理）尤其关键，一位评论者称之为"Agent 世界的 TCP 重传"。

## 五、社区反应与展望

48 小时内帖子获得数百赞，讨论集中在三点：期待官方将插件吸纳入主仓；担心 A2A 在身份认证、计费、滥用防护上仍不成熟，呼吁加入 OAuth2 与 mTLS；提议与 LangGraph、CrewAI 互通测试。作者回应将开放 Discord 频道协作，并计划提交到 Google A2A 官方 conformance suite。整体看，这一插件标志着 OpenClaw 正从"个人桌面 Agent"演化为"分布式 Agent 网络节点"。
