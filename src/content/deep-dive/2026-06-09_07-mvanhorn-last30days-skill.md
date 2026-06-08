---
title: "mvanhorn-last30days-skill"
date: "2026-06-09"
generated: "2026-06-09 07:00"
source: "GitHub"
slug: "2026-06-09_07-mvanhorn-last30days-skill"
---

---
title: "mvanhorn/last30days-skill"
date: "2026-06-09"
source: "GitHub"
slug: "mvanhorn-last30days-skill"
---

## 定位与痛点剖析

`last30days-skill` 是一款 "AI agent skill",用一行命令 (`/last30days <topic>`) 调研任意话题。它打破 Google 以编辑器为中心的聚合逻辑,转而抓取 Reddit、X/Twitter、YouTube、HN、Polymarket、TikTok、Bluesky 等 14 个"墙内花园"平台的真实用户讨论,再交由 LLM 进行 grounded summary。面向痛点很清楚——任何单一 AI 都没法跨平台拿数据 (各家 API/Auth 各自封闭),开发者、研究员、PR/营销人员在做"快速尽调"时往往要分别打开 5-6 个 tab 手动比对。该 skill 把这些异源信号统一成一份按 upvote、点赞和真金白银下注分数排序的报告。GitHub 上 34K stars、近 30 天涨 3,558 stars,曾登顶 GitHub Trending 第一。

## 核心架构与技术细节

技术栈以 Python 为主,遵循 Anthropic 推出的 Agent Skills 规范,可在 Claude Code、Codex、Cursor、Copilot、Gemini CLI 等 50+ 宿主上跑。仓库 623 commits、1,012 个测试,License MIT。两大工程亮点:一是"BYOK (Bring Your Own Keys)"模型,Reddit/HN/Polymarket/GitHub 零配置即用,其余在 30 秒 wizard 内补 Key;二是 v3 引入"Intelligent Search",在搜索前先做语义解析,例如输入"OpenClaw"会自动解析到 @steipete、r/openclaw、r/ClaudeCode、TikTok hashtag 等多个端点,做到 person↔company、product↔founder 双向映射。新版本还增加了 `--emit=html` 输出 self-contained dark-mode brief。

## 竞品对比与生态站位

与 Perplexity、SearchGPT 等 grounded search 工具相比,`last30days` 更偏"社群信号聚合",而非通用网页爬虫;与 Exa、Tavily 等 search API 相比,它定位 skill 而非 SaaS,直接嵌入 IDE/Agent 上下文。生态层面,它顺势成为 Anthropic Agent Skills 生态早期标杆 case,也是 OpenClaw、Paperclip 等新一代 agent 客户端的 must-have plugin。

## 开发者反馈与局限性

社区评价以正面为主:开发者反馈 brief 质量明显高于 Perplexity 单源结果,Polymarket 投注数据带来差异化"置信度"信号。局限在于 BYOK 模式对非技术用户门槛偏高,且 X/Instagram/TikTok 在不同地区 API 稳定性参差;部分 issue 提到中文/日文 source coverage 较弱、Xiaohongshu 仍在开发中。

## 附带链接

- GitHub: <https://github.com/mvanhorn/last30days-skill>
