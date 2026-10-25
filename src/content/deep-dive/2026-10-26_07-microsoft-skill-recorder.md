---
title: "microsoft/skill-recorder"
date: "2026-10-26"
generated: "2026-10-26 07:00"
source: "GitHub"
slug: "2026-10-26_07-microsoft-skill-recorder"
summary: "这是把“人演示一次”转成代理可复用流程的桌面工具，面向不愿手写技能、又需保留审阅权的知识工作者。批次快照冻结为5052 stars、554 forks、周增650；本次 GitHub REST 为5054 stars、554 forks，默认分支为 `main`，两套口径不互相覆盖。它缓解跨应用操作难以结构化、录屏难转成可维护自动化的问题。"
---

# microsoft/skill-recorder

## 定位与痛点剖析

这是把“人演示一次”转成代理可复用流程的桌面工具，面向不愿手写技能、又需保留审阅权的知识工作者。批次快照冻结为5052 stars、554 forks、周增650；本次 GitHub REST 为5054 stars、554 forks，默认分支为 `main`，两套口径不互相覆盖。它缓解跨应用操作难以结构化、录屏难转成可维护自动化的问题。

## 核心架构与技术细节

当前 v0.7.0 是 Electron、React、TypeScript 桌面应用，要求 Node 24。采集器记录窗口、网址、剪贴板和变化帧，可选 Whisper 本地转写及会话终端；停止后流水线建立时间线，Copilot 描述器还原意图与有序步骤，构建器再产出 `SKILL.md` 或 Automation，并优先把界面动作泛化为 `gh`、`web_fetch` 等原生工具。README 自报录制与转写留在本机，但 Analyze 会把事件、图片、转写及受限终端片段送往 GitHub 云；其“99种语言、约252 MB模型”也是自报口径。固定样本评测分别覆盖描述器、构建器与脱敏，并非真实端到端保证。

## 竞品对比与生态站位

OpenAdapt 官方 README 同样从示范编译流程，但定位为无模型调用的本地执行程序，并在保存前后读回系统记录，更偏可验证的重复执行。Skill Recorder 则强调输出语义化 Agent Skill 或 Automation、替换输入并调用代理原生工具，但云分析与 Copilot 绑定。若目标已有 API，OpenAdapt 文档也明确建议直接调用 API，这是更短的替代路径。

## 开发者反馈与局限性

Issue #43 只是用户请求支持其他分析代理，目前开放且无维护者确认，显示单一后端限制。Issue #8 报告生成技能可扩宽已审核的 `allowed-tools`；修复 PR #40 仍开放，故只能定性为报告待确认、未发布。相反，#56 的 Windows 125% 缩放窗体膨胀获维护者确认，PR #61 并入 v0.5.0，报告者在发布版复测通过。README 还直言预览仅提供可见性而非安全保证；项目只发源码，且 macOS 是主要目标。

## 附带链接

- [仓库](https://github.com/microsoft/skill-recorder)｜[README](https://github.com/microsoft/skill-recorder/blob/main/README.md)｜[REST 元数据](https://api.github.com/repos/microsoft/skill-recorder)
- [评测说明](https://github.com/microsoft/skill-recorder/blob/main/evals/README.md)｜[v0.7.0](https://github.com/microsoft/skill-recorder/releases/tag/v0.7.0)
- [Issue #43](https://github.com/microsoft/skill-recorder/issues/43)｜[Issue #8](https://github.com/microsoft/skill-recorder/issues/8)｜[PR #40](https://github.com/microsoft/skill-recorder/pull/40)
- [Issue #56](https://github.com/microsoft/skill-recorder/issues/56)｜[PR #61](https://github.com/microsoft/skill-recorder/pull/61)｜[v0.5.0](https://github.com/microsoft/skill-recorder/releases/tag/v0.5.0)
- [OpenAdapt 官方 README](https://github.com/OpenAdaptAI/OpenAdapt/blob/main/README.md)
