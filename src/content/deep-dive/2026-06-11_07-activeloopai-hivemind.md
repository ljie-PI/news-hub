---
title: "Hivemind：AI 编码 Agent 的共享\"群体大脑\""
date: "2026-06-11"
generated: "2026-06-11 07:00"
source: "GitHub"
slug: "2026-06-11_07-activeloopai-hivemind"
summary: "Hivemind 由 Y Combinator 投资的 Activeloop（同时也是向量数据库 Deeplake 的作者）出品，是一个**跨 AI 编码 Agent 的云端共享记忆与技能层**。它要解决的核心痛"
---

---
title: "activeloopai/hivemind"
date: "2026-06-11"
source: "GitHub"
slug: "activeloopai-hivemind"
---

# Hivemind：AI 编码 Agent 的共享"群体大脑"

## 1. 定位与痛点剖析

Hivemind 由 Y Combinator 投资的 Activeloop（同时也是向量数据库 Deeplake 的作者）出品，是一个**跨 AI 编码 Agent 的云端共享记忆与技能层**。它要解决的核心痛点可以一句话概括：*"周一一个工程师的 Agent 摸索出了一次棘手的迁移方案，周二团队里每个 Agent 都能直接执行同样的模式。"*

当前 AI 编码助手（Claude Code、Cursor、Codex、Hermes Agent、pi 等）几乎都有"会话内记得，会话外失忆；本人记得，同事不知"的问题——每次新会话都要重新摸索上下文、踩同样的坑。Hivemind 把记忆从单一 Agent 升格为**团队级、跨工具的共享层**，并不只是"存上下文"，而是从 Agent 轨迹里**自动挖掘可复用的 skill 文件**（`SKILL.md`），让模式沉淀变成可直接调度的资产。

## 2. 核心架构与技术细节

技术栈：Node.js ≥22，NPM 包名 `@deeplake/hivemind`，Apache 2.0 协议。底层存储复用 Activeloop 自家的 Deeplake（向量+多模态数据库），技能与记忆默认落在 `~/.deeplake/memory/`。

工作流分四步：**Capture → Codify → Propagate → Compound**——

1. **Capture**：每一次 Agent 交互（prompt、tool call、response）作为结构化 trace 写入 Deeplake。
2. **Codify**：后台 worker 挖掘重复模式，把它们抽象成 `SKILL.md`。
3. **Propagate**：技能自动注入所有已连接 Agent 的上下文。
4. **Compound**：使用越多，团队"群体大脑"越厚。

集成层面 Hivemind 覆盖了当下主流 Agent 工具，且都做到 **auto-capture + auto-recall** 双向自动化：

| 平台 | 集成方式 |
| --- | --- |
| Claude Code | 官方 Plugin Marketplace |
| OpenClaw | Native extension |
| Codex | `hooks.json` |
| Cursor 1.7+ | `hooks.json`，6 个生命周期事件 |
| Hermes Agent | shell hooks + skill + MCP server |
| pi | extension API + skill + AGENTS.md |

检索采用 hybrid lexical + semantic 混合方式。在 LoCoMo 长上下文记忆基准测试中（100 QA、Claude Haiku）：成本从 $8.94 降到 $6.65（**便宜 25%**），每问题 token 从 1700 降到 1008（**省 1.7 倍**），轮次从 8.9 减到 6.2（**少 31%**）。

## 3. 竞品对比与生态站位

记忆/上下文这一赛道近一年异常拥挤：**Mem0**、**Letta**（前 MemGPT）、**Zep**、Cursor 的内置 memory、Claude 的 Project Memory，以及 OpenClaw 内置的 `memory-core`，都在解决"Agent 长期记忆"。Hivemind 的差异化点有三：

- **跨工具而非锁定单一 Agent**：六大主流 Agent 一键打通，团队混用 Cursor + Claude Code + Hermes 不需要再各装一套。
- **从记忆到"技能"的抽象升级**：`SKILL.md` 是可执行的过程性知识，而不只是历史聊天检索。
- **与现有方案共存而非替换**：例如在 OpenClaw 中与 `memory-core` 并行运行，不抢占 memory slot，原生的 dreaming cron 仍可工作。

底层数据库直接复用自家 Deeplake，对 Activeloop 而言也是一条把基础设施变现到 Agent 工作流上层的清晰路径。

## 4. 开发者反馈与局限性

作为 Activeloop 力推的新项目，Hivemind 上线即拿到较高声量，主要吸引点是 *"装一次，覆盖整个团队的全部 Agent"*。但在使用前有几点值得注意：

- **强依赖 Activeloop 云**：需要登录 deeplake.ai 账号，记忆数据上云，对于代码/客户信息高度敏感的团队需要评估合规与私有部署可能。
- **Hook 信任问题**：例如 Codex 集成首次启动会弹出 "Hooks need review"，必须选 "Trust all and continue" 才会生效，潜在攻击面值得审计。
- **生态新、模式提取质量待验证**：自动 "codify" 出的 `SKILL.md` 质量高度依赖团队 trace 的丰富度，小团队短期未必能体会到"compound"效果。
- **Node 22+** 限制对一些老环境是个门槛。

## 5. 附带链接

- GitHub Repo：<https://github.com/activeloopai/hivemind>
- Activeloop 官网：<https://activeloop.ai>
- Deeplake（底层数据库）：<https://github.com/activeloopai/deeplake>
- NPM 包：`@deeplake/hivemind`
