---
title: "小模型调度大模型：GitHub Copilot 中 5.4-mini 编排 5.4 子代理的实践与争议"
date: "2026-04-20"
source: "Reddit"
slug: "2026-04-20_07-54mini-calling-54-subagent"
summary: "Reddit 用户在 r/GithubCopilot 分享了一种使用模式：让 GPT-5.4-mini 作为编排器（orchestrator），同时调度多个 GPT-5.4 作为子代理（sub-agent）来并行处理编码任务"
---

# 小模型调度大模型：GitHub Copilot 中 5.4-mini 编排 5.4 子代理的实践与争议

> 来源：r/GithubCopilot · 分类：Vibe Coding · 2026-04-20

## 事件背景

Reddit 用户在 r/GithubCopilot 分享了一种使用模式：让 GPT-5.4-mini 作为编排器（orchestrator），同时调度多个 GPT-5.4 作为子代理（sub-agent）来并行处理编码任务。这一做法的核心逻辑是——用廉价的小模型做任务分解和调度决策，把真正需要深度推理的工作交给大模型执行，从而在成本和质量之间取得平衡。

这并非空穴来风。2026 年 4 月，GitHub 官方接连推出了两项关键能力：

1. **Copilot SDK 自定义代理与子代理编排**：允许开发者定义带有独立 prompt、工具集和 MCP 服务器的专用代理，运行时可自动根据意图将任务委派给子代理执行。
2. **Copilot CLI `/fleet` 命令**：在命令行中输入 `/fleet` 加目标提示词，后台编排器会自动将任务分解为可并行的工作项，分派多个子代理同时在不同文件和模块上工作。

这些基础设施让"小模型当指挥、大模型当士兵"的架构从理论变成了现实。

## 核心观点

帖子的关键洞察在于**模型分层调度的经济学**：

- **5.4-mini 的角色**：负责任务分解、依赖分析、进度轮询和结果汇总——这些都是相对简单的"管理"工作，不需要顶级推理能力。
- **5.4 的角色**：作为子代理执行具体的代码生成、重构、测试编写等需要深度理解的任务。
- **成本优势**：mini 模型的调用成本通常只有完整模型的 1/5 到 1/10，用它做编排可以大幅降低总体 token 消耗。

GitHub 官方文档也明确支持这种分层：在 `.github/agents/` 中定义自定义代理时，可以为不同代理指定不同模型——"用更重的模型处理复杂逻辑，用更轻的模型处理模板化文档"。

## 社区热议

**1. "编排开销反而更大"的质疑**

r/codex 上有用户指出了一个关键缺陷：当子代理的输出需要被编排器"理解"并整合时，编排器实际上会重复子代理已经完成的工作。原话是："它丢弃了子代理的工作（本应是更高效的 5.4-mini 聊天），然后在更贵的 5.4 编排聊天中重复了这些工作。比一开始就让它做所有工作还糟糕！"

**2. 文件分区是关键**

GitHub 官方博客在 `/fleet` 的使用指南中强调：子代理共享文件系统但无法直接通信，只有编排器负责协调。因此用户需要在 prompt 中明确划定文件和模块边界，否则并行化效果会大打折扣。多位社区成员分享了"声明依赖关系"的 prompt 模板来解决这个问题。

**3. 自定义代理生态的涌现**

有开发者搭建了完整的 [Agentic Project Management](https://github.com/sdi2200262/agentic-project-management) 框架，让编排器代理管理多个子代理在独立工作树上并行或串行工作。这代表了社区从"单个 AI 助手"向"AI 团队"的思维转变。

**4. 速率限制的现实约束**

多位 Pro+ 用户反映，频繁的子代理调用容易触发 Copilot 的速率限制。当编排器派出 5 个 5.4 子代理同时工作时，token 消耗速度是单代理的数倍，很容易在一天内耗尽配额。

## 行业影响

"小模型编排大模型"的模式正在成为 AI 编程工具的主流架构方向：

- **成本可控的智能扩展**：不再是"用最强模型做所有事"，而是按任务复杂度分配算力。这与传统软件工程中"微服务按需伸缩"的理念一脉相承。
- **Agent 工程成为新技能**：写好 `/fleet` prompt、定义代理边界、声明依赖关系——这些"提示词工程"正在演化为"代理工程"，成为开发者需要掌握的新能力。
- **平台竞争的新维度**：GitHub Copilot 的 SDK 子代理 + CLI Fleet 组合，直接对标 Claude Code 和 OpenAI Codex 的多代理能力。谁的编排体验更顺滑，谁就能吸引更多开发者。

不过，正如社区反馈所揭示的，当前的子代理架构仍存在编排开销、上下文丢失和速率限制等实际问题。这个方向是对的，但离"开箱即用"还有距离。

## 相关链接

- 原帖：https://www.reddit.com/r/GithubCopilot/comments/1sq37tg/
- GitHub 官方：[Custom agents and sub-agent orchestration](https://docs.github.com/en/copilot/how-tos/copilot-sdk/use-copilot-sdk/custom-agents)
- GitHub Blog：[Run multiple agents at once with /fleet in Copilot CLI](https://github.blog/ai-and-ml/github-copilot/run-multiple-agents-at-once-with-fleet-in-copilot-cli/)
- 社区讨论：[Subagent implementation has a big flaw for orchestration](https://www.reddit.com/r/codex/comments/1rxcmd4/subagent_implementation_has_a_big_flaw_for/)
- 社区项目：[Agentic Project Management](https://github.com/sdi2200262/agentic-project-management)
