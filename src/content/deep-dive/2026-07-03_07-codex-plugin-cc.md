---
title: "openai/codex-plugin-cc"
date: "2026-07-03"
generated: "2026-07-03 07:00"
source: "GitHub"
slug: "2026-07-03_07-codex-plugin-cc"
summary: "codex-plugin-cc 是 OpenAI 官方推出的 Claude Code 插件，让用户在 Claude Code 里直接调用 Codex 做代码审查或委派任务。它解决的痛点是：许多开发者习惯了 Claude "
---

# openai/codex-plugin-cc

## 定位与痛点剖析
codex-plugin-cc 是 OpenAI 官方推出的 Claude Code 插件，让用户在 Claude Code 里直接调用 Codex 做代码审查或委派任务。它解决的痛点是：许多开发者习惯了 Claude Code 的工作流，却又想借助 Codex 的审查与执行能力，此前只能在两个工具间来回切换。有了该插件便能一站式获得第二意见与后台代理。目标用户是同时青睐 Claude Code 与 Codex、希望多模型协作的开发者。

## 核心架构与技术细节
插件以斜杠命令形式集成：/codex:review 做只读常规审查，/codex:adversarial-review 做可引导的对抗式质疑审查，另有 rescue、transfer、status、result、cancel 等命令用于委派工作、交接会话与管理后台任务。审查支持 --base 指定分支比较，以及 --wait 与 --background 模式。它需要 ChatGPT 订阅或 OpenAI API Key，运行依赖 Node 18.18 以上，用量计入 Codex 额度。

## 竞品对比与生态站位
与社区自制的桥接脚本相比，它由 OpenAI 官方维护，稳定性与兼容性更有保障，并把 Codex 的审查质量原样带入 Claude Code。它体现了"智能体互操作"的新趋势：不再逼用户二选一，而是让不同厂商的代理在同一界面协同，在 Claude Code 插件生态中占据官方一席。

## 开发者反馈与局限性
作为官方跨阵营合作产物，它上线即获得关注，被视为多智能体协作走向成熟的信号。局限在于：使用会消耗 Codex 付费额度，成本随审查规模上升；多文件审查耗时较长，官方建议后台运行；功能聚焦审查与委派，并非通用 Codex 全能力封装；且依赖外部登录与网络，离线或受限环境难以使用。

## 附带链接
- GitHub 仓库：https://github.com/openai/codex-plugin-cc
- Codex 定价说明：https://developers.openai.com/codex/pricing
