---
title: "Claude Opus 4.6 → 4.7 系统提示词变更深度解读"
date: "2026-04-20"
source: "HN"
slug: "2026-04-20_07-claude-opus-system-prompt-changes"
summary: "2026 年 4 月 16 日，Anthropic 发布了 Claude Opus 4.7。作为业内唯一公开系统提示词（system prompt）的主要 AI 实验室，Anthropic 在其平台文档中同步更新了 Claude.a"
---

# Claude Opus 4.6 → 4.7 系统提示词变更深度解读

> 来源：Simon Willison 博客 | HN 讨论 | 2026-04-18

## 1. 事件背景

2026 年 4 月 16 日，Anthropic 发布了 Claude Opus 4.7。作为业内唯一公开系统提示词（system prompt）的主要 AI 实验室，Anthropic 在其平台文档中同步更新了 Claude.ai 的系统提示词。知名开发者 Simon Willison 随即用 Claude Code 将历代系统提示词拆分为独立文件并构建了 Git 历史，方便社区通过 `git diff` 精确追踪每次变更。这篇分析文章迅速登上 Hacker News 热榜。

## 2. 核心变更与产品机制

本次系统提示词更新涵盖多个维度，以下为最关键的变化：

**行动优先，减少追问（Act vs. Clarify）**：新提示词明确要求 Claude 在细节不完整时"先合理尝试，而非先面试用户"。当有工具可以消除歧义时（搜索、日历、位置查询等），Claude 应直接调用工具而非反问用户。

**更简洁的输出**：新增语言要求 Claude 保持回复"focused and concise"，即使有免责声明也应简短带过，避免信息过载。

**tool_search 机制**：新增要求 Claude 在断言"我无法访问 X"之前，必须先调用 `tool_search` 检查是否有延迟加载的工具可用。这反映了 Claude.ai 正在构建一个更动态的工具生态。

**儿童安全扩展**：相关章节大幅扩充，新增规则——一旦因儿童安全拒绝请求，同一对话中后续所有请求都需极度谨慎。

**饮食障碍保护**：新增专门章节，禁止在用户表现出饮食障碍迹象时提供精确的营养数据或饮食计划。

**反"逼问式"截图攻击**：针对社交媒体常见的"用 yes/no 逼 AI 表态争议问题"手法，新增防御条款——Claude 可以拒绝给出简短回答，转而提供有层次的分析。

**移除了对特定措辞的限制**：4.6 中禁止使用"genuinely""honestly"等词汇、禁止星号动作表演的条款被删除，说明 4.7 基座模型已不再有这些问题。

**移除 Trump 总统声明**：4.6 需要特别声明"Donald Trump 是现任美国总统"，4.7 的知识截止日期已更新至 2026 年 1 月，不再需要此补丁。

## 3. 社区热议与争议点

HN 评论区围绕几个焦点展开了激烈讨论：

**正方 — "行动优先"大受欢迎**：用户 **dmk** 表示这是体感最明显的变化——"以前的 Claude 做任何事之前都要问三个澄清问题，现在直接选最合理的解读就干了，摩擦感大幅降低。"

**反方 — 行动过于激进**：用户 **sersi** 直言"我真的很讨厌这个改动，它现在经常选了一个糟糕的解读而不是来问我"，**poszlem** 也表示"它现在会做出离谱的假设，我不得不比以前更频繁地打断它"。用户 **verve_rat** 总结："这种行为应该做成用户偏好设置。"

**关于安全与"恶意软件偏执"**：用户 **cfcf14** 提到 Claude 在编程辅助场景中对恶意软件的过度警觉问题。**daemonologist** 指出这些是 Claude.ai 聊天界面的系统提示词，Claude Code 使用的是不同的提示词，且这种行为变化可能来自基座模型本身而非仅仅是提示词。

**工具调用与成本透明度**：用户 **dhedlund** 深入分析了 Claude Code 系统提示词中关于 `delaySeconds` 和 Anthropic prompt cache 的细节，揭示了一个被普通订阅用户忽视的事实——每次工具调用或超过 5 分钟的等待都会触发完整上下文重新加载，带来额外成本。

## 4. 行业影响与未来展望

Anthropic 公开系统提示词这一做法在行业中独树一帜，持续为 AI 透明度树立标杆。本次更新体现了几个重要趋势：

- **从"安全至上"到"平衡体验"**：减少冗余追问、缩短输出长度，表明 Anthropic 正在平衡安全性与用户体验，避免过度保守导致产品不可用。
- **工具生态动态化**：`tool_search` 的引入暗示 Claude.ai 正在向一个可扩展的 Agent 平台演进——Chrome 浏览器代理、Excel/PowerPoint 代理、MCP 注册表搜索等工具的出现说明 Anthropic 正构建完整的工作流生态。
- **精细化安全治理**：儿童安全、饮食障碍、反截图攻击等条款的细化，展示了 AI 安全不再是笼统的"拒绝有害内容"，而是针对具体场景的精细化策略。
- **提示词即产品**：系统提示词越来越像产品经理的需求文档——它定义了 AI 的人格、边界、工具使用策略和交互风格，是理解一个 AI 产品设计哲学的最佳入口。

## 5. 相关链接

- 原文：[Changes in the system prompt between Claude Opus 4.6 and 4.7](https://simonwillison.net/2026/Apr/18/opus-system-prompt/)
- HN 讨论：[Hacker News #47823270](https://news.ycombinator.com/item?id=47823270)
- Git Diff：[Opus 4.6 → 4.7 diff](https://github.com/simonw/research/commit/888f21161500cd60b7c92367f9410e311ffcff09)
- Anthropic 官方系统提示词：[System Prompts Archive](https://platform.claude.com/docs/en/release-notes/system-prompts)
- Claude Code 系统提示词变更追踪：[cchistory.mariozechner.at](https://cchistory.mariozechner.at/?from=2.1.98&to=2.1.112)
