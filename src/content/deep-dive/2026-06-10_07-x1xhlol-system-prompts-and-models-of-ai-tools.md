---
title: "《System Prompts and Models of AI Tools》深度解读"
date: "2026-06-10"
generated: "2026-06-10 07:00"
source: "GitHub"
slug: "2026-06-10_07-x1xhlol-system-prompts-and-models-of-ai-tools"
summary: "该仓库由 Lucas Valbuena（x1xhlol）维护，自 2025 年初上线已累计 **139k Stars、34.6k Forks**，是 GitHub 上最具影响力的 AI 工具情报库。它把 Cursor、Windsurf、Claude C"
---

---
title: "《System Prompts and Models of AI Tools》深度解读"
date: "2026-06-10"
source: "GitHub Deep Dive"
slug: "x1xhlol-system-prompts-and-models-of-ai-tools"
---

# 《System Prompts and Models of AI Tools》深度解读

## 项目定位与痛点剖析

该仓库由 Lucas Valbuena（x1xhlol）维护，自 2025 年初上线已累计 **139k Stars、34.6k Forks**，是 GitHub 上最具影响力的 AI 工具情报库。它把 Cursor、Windsurf、Claude Code、Devin AI、v0、Augment Code、Replit、Lovable、Manus、Perplexity、Warp.dev、Z.ai Code、Kiro、Trae、Junie、Notion AI 等 **30+ 主流 AI 编码与 Agent 产品**的"内部说明书"——完整 System Prompt、Tool Schema、模型清单——逐一抓取归档。

它解决了一个被营销页长期掩盖的痛点：用户无法直观看到 AI 工具被赋予了什么权限、被如何约束、调用哪些函数。营销文案只告诉你"能做什么"，而 System Prompt 才揭示了"被指示如何去做"——这是评估 AI 编码助手最具决定性却最不透明的信息。

## 核心架构与技术细节

仓库采用极简的**按产品分目录**结构，每个文件夹通常包含：

- `Prompt.txt`：完整系统提示（动辄上万 token，含人设、流程、安全约束、格式指令）；
- `Tools.json`：Function Calling 的 JSON Schema，揭示文件读写、终端执行、Web 搜索、Memory 等真实工具集；
- **多版本快照**：例如 Cursor 同时收录 Agent Prompt v1.0/v1.2/v2.0、CLI Prompt、Chat Prompt，可纵向追踪迭代轨迹；
- 部分产品附带模型路由配置，如 Augment Code 的 `gpt-5-tools.json` 即透露其多模型分发策略。

价值核心在于**Prompt 与工具定义成对呈现**——让对比成为可操作的工程参考，而非泛泛的文学赏析。

## 竞品对比与生态站位

同类项目中，[jujumilk3/leaked-system-prompts](https://github.com/jujumilk3/leaked-system-prompts) 走"按日期归档"路线，覆盖 ChatGPT、Claude、Gemini 等通用模型。x1xhlol 的**差异化护城河**有三：

1. **垂直聚焦 AI 编程/Agent 赛道**，对开发者群体共鸣最强；
2. **持续维护**：v0 提示词 2026 年 3 月仍有更新，Claude Sonnet 4.6 紧随官方版本同步；
3. **包含工具 JSON Schema**——多数竞品只搬运 Prompt 文本，无法还原 Agent 的真实能力边界。

它事实上已成为 Prompt 工程师、AI IDE 创业团队、安全研究员、Benchmark 设计者的**事实标准参考库**。

## 开发者反馈与局限性

社区反响两极：拥护者视之为"竞品逆向工程的金矿"，可直接借鉴 Cursor 的 Tool 设计或 Windsurf 11 个 "wave" 的函数调用迭代；批评者则担忧**法律与伦理灰区**——内容多通过 Prompt 注入获得，仅 GPL-3.0 覆盖整理工作本身。局限明显：时效性脆弱（厂商改版即过期）、完整性不可验证（可能为残片或诱导伪造）、缺乏结构化元数据。维护者顺势推广自家服务 [ZeroLeaks](https://zeroleaks.ai/) 销售"提示词防泄漏审计"，构成清晰商业闭环。

## 附带链接

- 仓库主页：https://github.com/x1xhlol/system-prompts-and-models-of-ai-tools
- 同类项目：https://github.com/jujumilk3/leaked-system-prompts
- 评论文章：https://www.augmentcode.com/learn/leaked-ai-system-prompts-github
- 维护者：[@Lucknite on X](https://x.com/Lucknite)
