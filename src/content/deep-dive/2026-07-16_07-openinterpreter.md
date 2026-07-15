---
title: "openinterpreter/openinterpreter"
date: "2026-07-16"
generated: "2026-07-16 07:00"
source: "GitHub"
slug: "2026-07-16_07-openinterpreter"
summary: "Open Interpreter 是一款专为低成本/开源权重模型优化的终端编码 Agent。行业主流 Coding Agent（Claude Code、Codex）大多围绕昂贵旗舰模型调优，直接把 GLM、DeepS"
---

# openinterpreter/openinterpreter

## 定位与痛点剖析

Open Interpreter 是一款专为低成本/开源权重模型优化的终端编码 Agent。行业主流 Coding Agent（Claude Code、Codex）大多围绕昂贵旗舰模型调优，直接把 GLM、DeepSeek、Kimi、Qwen 等低价模型塞进同一套 harness 往往表现骤降。该项目正是瞄准"用便宜模型也能跑好 Agent"这一痛点，通过模型专属的 harness 适配来榨取小模型的可用性能。

## 核心架构与技术细节

项目主语言为 Rust，是 OpenAI Codex 的一个 fork。核心是"Harness Emulation"：内置 native、claude-code、kimi-cli、qwen-code、deepseek-tui、swe-agent 等多套 harness，可用 `/harness` 热切换以匹配不同模型的最佳交互范式；`/model` 切换供应商与模型。具备 macOS/Linux/Windows 原生沙箱执行，内置 QA skill 可驱动真实浏览器（agent-browser）或原生应用（trycua）。支持 exec、MCP、skills、hooks、权限与 AGENTS.md，并可作为 ACP Agent 接入编辑器，配置与会话状态本地存于 `~/.openinterpreter`。

## 竞品对比与生态站位

相较 Claude Code、Codex 绑定单一高价模型，Open Interpreter 主打模型无关与低成本路线，直接对齐开源模型浪潮。它并非重造轮子，而是复用 Codex 骨架 + 多 harness 仿真，站位在"开源模型的应用层"，与官网口径"the application layer for open models"一致。

## 开发者反馈与局限性

GitHub 约 65.4k star、5.6k fork、约 274 open issues（截至抓取时）。热度延续了初代 Open Interpreter 的口碑。局限：作为 Codex fork 需持续跟进上游，一旦上游大改可能带来合并成本；多 harness 仿真的实际增益依模型而异，缺乏公开基准与横向对比数据；低成本模型在长链路复杂任务上的稳定性与工具调用准确率仍是共性风险，实际体验高度依赖所选模型质量。README 中的性能表述属自报口径，未见独立评测佐证。

## 附带链接

- GitHub: https://github.com/openinterpreter/openinterpreter
- 官网/文档: https://www.openinterpreter.com/docs/terminal
