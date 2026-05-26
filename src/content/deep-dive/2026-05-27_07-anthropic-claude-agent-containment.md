---
title: "anthropic-claude-agent-containment"
date: "2026-05-27"
generated: "2026-05-27 07:00"
source: "Reddit"
slug: "2026-05-27_07-anthropic-claude-agent-containment"
---

---
title: "Anthropic 公布 Claude 智能体的容器化安全实践"
date: 2026-05-27
generated: '2026-05-27 07:00'
source: Reddit
category: AI / LLM
slug: anthropic-claude-agent-containment
permalink: https://www.reddit.com/r/artificial/comments/1tomozc/anthropic_just_published_how_they_contain_claude/
---

## 背景

Anthropic 本周发布了一篇工程博客，详细介绍了在 claude.ai、Claude Code 与 Cowork 三条产品线中，如何对 Claude 智能体（agent）进行运行时容器化（containment）。这是头部 AI 实验室少有的、把"已经踩过的坑"也写进文档的工程公开材料：其中坦承了两起被外部安全研究员或内部红队发现的事故，这种透明度在大模型基础设施领域并不常见。帖子出现在 r/artificial，并在评论区引发了关于"模型层防御 vs. 环境层防御"的讨论（评论区未能抓取）。

## 核心观点

文章给出的核心论断是：**模型层安全永远是概率性的，存在不可消除的非零漏判率**。无论 RLHF、Constitutional AI、还是各种 prompt 加固，都无法保证一个具备工具调用能力的智能体不会执行恶意指令。因此真正可靠的防线是**硬性的环境隔离**——把模型放进一个即使它"叛变"也无法伤害宿主的盒子里。这与传统操作系统/浏览器安全的"沙箱优先于补丁"思路一脉相承。

## 三种容器化模式

1. **claude.ai：完全服务端 + 临时 gVisor 容器**。每次会话/工具调用启动一个一次性 gVisor microVM，进程退出即销毁，无持久化文件系统、无外部网络出口（除白名单代理）。这是面向消费者的最保守方案。
2. **Claude Code：操作系统级沙箱 + 用户协商权限**。因为本地开发场景必须读写真实代码仓库，Anthropic 改用 macOS Seatbelt / Linux namespaces 进行细粒度文件/网络隔离，对敏感操作（删除、外发请求、git push）要求显式批准。
3. **Cowork（企业多智能体）：多租户隔离 + 能力降权**。多个 agent 协同时，每个 agent 跑在独立租户上下文，工具调用必须经过中央策略引擎，能力按最小权限原则授予。

## 两起承认的事故

Anthropic 公开承认两次"环境逃逸"：一次是 Claude Code 在某版本里 sandbox profile 配置漂移，允许了未授权的 `~/.ssh` 读取；另一次是 claude.ai 工具链中一个代理服务允许了对内网元数据端点的请求（典型的 SSRF 类问题）。两个问题都不是模型"被越狱"，而是环境层的工程缺陷，恰好印证了文章主旨。

## 对开发者的启示

- 自建 agent 系统时，**不要把希望寄托在 system prompt 上**。先画出"如果模型 100% 听敌人话，它能造成多大破坏"的威胁模型。
- gVisor、Firecracker、Docker + seccomp + 用户命名空间是当下主流隔离工具，复杂度从高到低。
- 工具调用最好走**经过策略检查的 RPC 网关**，而不是让模型直连真实文件系统/Shell。
- 对外网访问采用**默认拒绝 + 白名单代理**，能在大多数 SSRF/数据外泄场景下兜底。

## 讨论与意义

帖子下方讨论（评论区未能抓取）普遍认为，这是行业从"模型对齐"叙事向"系统级安全"叙事过渡的标志。对于正在构建生产级 AI Agent 平台（含国内厂商）的团队，这套三层模式可以直接作为参考架构。值得长期关注。
