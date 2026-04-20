---
title: "GitHub Copilot 上下文压缩（Context Compaction）与\"AI 遗忘症\"深度解读"
date: "2026-04-20"
source: "Reddit"
slug: "2026-04-20_07-context-compaction-avoid-amnesia"
summary: "---"
---

# GitHub Copilot 上下文压缩（Context Compaction）与"AI 遗忘症"深度解读

> 原帖：[Context Compaction and How to Avoid Amnesia?](https://www.reddit.com/r/GithubCopilot/comments/1sq370p/)
> 分类：Vibe Coding | 日期：2026-04-20

---

## 1. 事件背景

随着 GitHub Copilot Agent 模式（VS Code Chat、Copilot CLI、Codex 等）被越来越多开发者用于长会话编码，一个系统性痛点浮出水面——**上下文压缩（Context Compaction）导致的"AI 遗忘症"**。

所谓 Compaction，是 Copilot 在对话 token 占用达到上下文窗口约 80% 时自动触发的机制：它将历史对话发送给模型生成结构化摘要，然后用摘要替换原始历史，从而腾出空间继续工作。GitHub 官方文档明确说明，这是维持长会话连续性的核心手段——没有它，老消息会被直接丢弃，连摘要都没有。

问题在于：**摘要≠原文**。细粒度信息（具体命令输出、工具调用结果、早期的微小决策）在压缩后不可避免地丢失，导致模型"失忆"——不是忘了你说了什么，而是忘了**它自己做了什么**。

## 2. 核心观点

Reddit 原帖提出了一个实用问题：既然 Compaction 不可避免，如何最大限度减少信息丢失？社区和技术博客给出的共识是：

- **不要把进度存在对话里，存在文件里。** 让模型把关键发现、已完成步骤写入 Markdown 文件（类似 spec-driven development），这样即使上下文被压缩，文件系统中的"外部记忆"仍然可读。
- **每次 Compaction 后主动验证状态。** 不要假设模型记得之前做了什么，显式要求它检查当前进度。
- **善用 `/compact` 手动触发。** 在任务阶段切换时主动压缩，而不是等自动触发在不合适的时机打断工作流。

## 3. 社区热议

**案例一：支付迁移的灾难重做。** 一位开发者在博客 [Context Amnesia](https://blog.heftiweb.ch/p/context-amnesia) 中详述：他用 Codex 完成了 webhook 处理器和测试，一切绿灯。Compaction 触发后，Codex 开始**从零重做同样的工作**——重写已有的 handler、创建重名模块、破坏刚通过的测试。终端历史还在，但模型看到的只有摘要和最近几条消息。他总结道："这不是人类式的遗忘，而是 agent 丢失了自己的收据。"

**案例二："幽灵数据"持续触发压缩。** VS Code Issue [#299810](https://github.com/microsoft/vscode/issues/299810) 报告：在 v1.110+ 版本中，上下文窗口指示器累积"幽灵数据"，压缩后仍占 50% 空间（以前只占约 20%），导致频繁二次压缩，模型可用上下文急剧缩小。

**案例三：40% 预留输出空间的争议。** GitHub 社区讨论 [#188691](https://github.com/orgs/community/discussions/188691) 指出 Copilot 为输出预留了约 30-40% 的上下文窗口，实际可用空间远低于标称值。用户刚过 50% 使用率就触发压缩，"失忆"来得比预期更早。

**案例四：社区的 workaround——用 MD 文件做外部记忆。** 在 GPT-5.4 百万上下文讨论帖中，高赞建议是"让模型把重要发现写入 MD 文件，类似小步骤的 spec-driven 开发，这样 Compaction 造成的伤害会小得多"。这本质上是把 AI 的短期记忆外化为持久存储。

## 4. 行业影响

Context Compaction 问题并非 Copilot 独有——Claude Code、Cursor、Windsurf、LibreChat 等所有基于长会话的 AI 编码工具都面临相同困境。这揭示了当前 LLM 架构的根本限制：

- **上下文窗口是硬约束。** 即使模型支持 200K token，系统指令+工具定义+安全预留已经吃掉大量空间，真正可用的远没有看起来那么多。
- **"外部记忆"模式正在成为最佳实践。** 无论是 AGENTS.md/MEMORY.md 这样的约定，还是 spec 文件、进度日志，核心思想一样：不要信任对话上下文，信任文件系统。
- **用户要求更多控制权。** GitHub 已收到多个 Feature Request（如 [copilot-cli#1761](https://github.com/github/copilot-cli/issues/1761)）要求可配置压缩阈值，目前固定的 80% 触发点无法满足所有场景。

对于 Vibe Coding 实践者来说，这意味着：**长会话编码需要纪律性的状态管理**。把 AI 当作一个随时可能失忆的搭档，关键进度必须落盘，而不是留在"脑子里"。

## 5. 相关链接

- [Reddit 原帖](https://www.reddit.com/r/GithubCopilot/comments/1sq370p/)
- [GitHub 官方文档：Managing context in Copilot CLI](https://docs.github.com/en/copilot/concepts/agents/copilot-cli/context-management)
- [VS Code 文档：/compact 命令](https://code.visualstudio.com/docs/copilot/chat/copilot-chat-context)
- [Context Amnesia 深度博客](https://blog.heftiweb.ch/p/context-amnesia)
- [VS Code Issue #299810：幽灵数据与频繁压缩](https://github.com/microsoft/vscode/issues/299810)
- [GitHub 社区讨论 #188691：上下文预留争议](https://github.com/orgs/community/discussions/188691)
- [Feature Request：可配置压缩阈值](https://github.com/github/copilot-cli/issues/1761)
