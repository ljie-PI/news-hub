---
title: "Harness showdown: Claude Code vs OpenCode vs Pi with DeepSeek V4 Flash"
date: "2026-07-27"
generated: "2026-07-27 07:00"
source: "Reddit"
slug: "2026-07-27_07-harness-showdown-claude-code-vs-opencode-vs-pi"
summary: "r/LocalLLaMA 用户 xquarx 发布了一份自制基准测试，将 DeepSeek V4 Flash 模型分别接入 Claude Code、OpenCode 与 Pi 三种编码代理\"外壳\"（harness），在同一套任务上对"
---

# Harness showdown: Claude Code vs OpenCode vs Pi with DeepSeek V4 Flash

## 事件背景

r/LocalLLaMA 用户 xquarx 发布了一份自制基准测试，将 DeepSeek V4 Flash 模型分别接入 Claude Code、OpenCode 与 Pi 三种编码代理"外壳"（harness），在同一套任务上对比表现。起因是 Theo 上周发布视频《GPT-5.6 is better in Claude Code》，引发了一个关键疑问：编码结果的质量到底取决于底层模型，还是取决于承载模型的 harness？作者决定用自己的 benchmark 亲自验证。

## 核心观点

测试得出一个反直觉的结论：三种 harness 产出的代码**质量基本相同**，但耗费的时间与 token 数量却天差地别。其中 Claude Code（通过 CLIProxyAPI 接入 DeepSeek）落地相同 diff 所需的时间，几乎是最快方案的 4 倍。换言之，在这项任务里 harness 并未改变最终产出的正确性，却极大影响了效率与成本。这暗示 harness 的价值更多体现在工程效率而非质量增益上。

## 社区热议与争议点

围绕该帖的讨论集中在几个层面（非逐字引用，基于议题归纳）。支持者认为该结果说明大量所谓"某模型在某 harness 里更强"的说法，可能只是提示词工程与工具调用循环的差异，而非质量本质。质疑者则指出单人基准样本量小、任务面窄，Claude Code 的慢可能源于 CLIProxyAPI 代理层的额外开销，而非 harness 本身设计。也有人关注 Pi 这类较新工具能否在更复杂的多文件重构中保持同样优势。

## 行业影响与未来展望

随着开源模型能力逼近闭源，"harness 战争"正成为新焦点。本次对比提示：本地用户在选择编码代理时，应把 token 效率与响应延迟纳入核心考量，而不仅看模型排行榜。未来若有更大规模、可复现的多 harness 基准出现，或将重塑开发者对代理工具链的选型逻辑，并推动各 harness 在工具调用效率上展开竞争。

## 附带链接

- 原帖：https://www.reddit.com/r/LocalLLaMA/comments/1v7d8px/harness_showdown_claude_code_vs_opencode_vs_pi/
- 配图：https://i.redd.it/93nz4nc02gfh1.png
