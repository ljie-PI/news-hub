---
title: "Skills Janitor（154票）"
date: "2026-04-14"
source: "PH"
slug: "2026-04-14_09-04_skills_janitor"
summary: "**Product Hunt 排名：#4 | 2026-04-14**"
---

# Skills Janitor（154票）

**Product Hunt 排名：#4 | 2026-04-14**

---

## 事件背景

随着 Claude Code、Cursor、Windsurf 等 AI 编程 Agent 的普及，开发者越来越多地使用 CLAUDE.md、.cursorrules、AGENTS.md 等配置文件来定义 Agent 的行为规范和技能指令（"skills"）。这些文件在实际使用过程中往往会快速膨胀——同一个功能被多次描述、不同版本的指令互相矛盾、过时规则积累……最终导致 Agent 上下文拥塞、行为不可预期。

**Skills Janitor** 正是针对这一问题而生：一个专门用于**审计和去重 Claude Code（及其他 AI Agent）技能配置文件**的工具。

目标用户：重度使用 Claude Code 的开发者、维护大型 AI Agent 配置的工程团队、以及任何管理多个 Agent 工作空间的人。

---

## 核心观点 / 产品机制

Skills Janitor 的核心功能是对 Agent 配置文件（主要是 CLAUDE.md 及相关技能文件）进行静态分析和语义去重：

- **重复检测**：通过语义相似度分析，找出功能重叠或措辞相似的技能条目
- **冗余审计**：标记过时、冲突或永远不会被触发的规则
- **上下文压缩**：将冗余内容合并，帮助开发者在保留核心能力的同时缩减 token 消耗
- **可视化报告**：以清晰的 diff 视图展示建议删除/合并的内容，由开发者确认
- **支持多种格式**：CLAUDE.md、AGENTS.md、.cursorrules、OpenClaw 的 SKILL.md 等

这一产品的出现，本身就是 AI 开发工具成熟度的一个缩影：当 Agent 配置变得足够复杂，就需要工具来管理工具。

---

## 社区热议与争议点

1. **"终于有人做这个了"**：大量 Claude Code 重度用户在评论中表示，CLAUDE.md 文件的膨胀是真实痛点，有人分享自己的 CLAUDE.md 已超过 300 行，"Agent 开始'忘记'早期的指令。"

2. **自动合并的信任问题**：有开发者表示，"我不太放心让工具自动决定哪些技能是冗余的，语义相似不等于功能等价。" 大家更希望工具提供建议而非自动执行。

3. **与 Claude 自身能力竞争**：有用户提问，"Anthropic 未来会不会直接内置这个功能？"——这是所有工具层产品面临的根本风险。

4. **适用范围局限性**：目前主要针对 Claude Code 生态，部分使用 Cursor 或自定义 Agent 的用户表示支持度不够完整。

---

## 行业影响与未来展望

Skills Janitor 代表的是 **"AI 工具的工具"** 这一新兴品类的崛起。随着 AI Agent 在软件工程中的应用深化，Agent 配置管理将成为一个正式的工程纪律。这一产品虽然当前面向早期采用者，但指向的是一个更大的方向：Agent 可观测性、可维护性和版本管理。

长期来看，类似 ESLint 之于 JavaScript，Agent 配置的 Linting/审计工具将成为 AI-native 开发流程的标配。

---

## 附带链接

- **Product Hunt 页面**：https://www.producthunt.com/posts/skills-janitor
- **官网**：（待查，可搜索 Product Hunt 页面获取最新链接）
