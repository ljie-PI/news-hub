---
title: "WorldFlowAI/everything-claude-code"
date: "2026-09-06"
generated: "2026-09-06 07:00"
source: "GitHub"
slug: "2026-09-06_07-worldflowai-everything-claude-code"
summary: "这是面向 Claude Code 用户的配置工具箱，把代理、技能、命令、规则、钩子与 MCP 示例集中交付，缓解个人配置散落及评审测试流程难复用。目标用户是想快速建立规划、测试驱动、代码审查与安全检查流程的开发者；它并非代理运行时。README 所称“十余月生产实践”和获奖背景均属作者自报口径。"
---

# WorldFlowAI/everything-claude-code

## 定位与痛点剖析

这是面向 Claude Code 用户的配置工具箱，把代理、技能、命令、规则、钩子与 MCP 示例集中交付，缓解个人配置散落及评审测试流程难复用。目标用户是想快速建立规划、测试驱动、代码审查与安全检查流程的开发者；它并非代理运行时。README 所称“十余月生产实践”和获奖背景均属作者自报口径。

## 核心架构与技术细节

默认分支含九个代理、十五个命令、十一个技能及八份规则。插件清单注册命令和技能目录；钩子覆盖调用前后、会话始末、压缩前与停止阶段，可拦截开发服务器、触发格式化和类型检查、保存会话及抽取模式。Node.js 共享库按环境变量、项目配置、清单字段、锁文件、全局配置和可用命令依次选择 npm、pnpm、yarn 或 bun。README 自称支持三大桌面系统；源码只能证明跨平台设计，不能替代各系统实测。

## 竞品对比与生态站位

相较手工维护点文件，它提供可安装清单、模块化目录和验证闭环，便于按需取用；代价是预设较强，钩子会介入命令与文件写入。仓库虽未被 GitHub 标记为分叉，但 README、作者和安装地址仍指向现已迁移的 affaan-m/ECC；当前元数据又显示本仓默认分支自一月二十三日未推送，而该上游九月仍活跃，因此其站位更像滞后的导入快照，而非独立演进实现。

## 开发者反馈与局限性

开放 issue #6 报告三项技能和十一条命令缺少发现所需的前置元数据；默认分支逐项检查仍以一级标题开头。相关 PR #5 仍为开放、未合并状态，只能说已有修复提案，不能称问题已解决。另一个治理风险是 README 与插件清单声称采用 MIT，但默认分支没有许可证文件，REST 元数据也未识别许可证，且仓库没有正式发行版。采用者应挑选组件、审查高干预钩子，并优先核对活跃上游。

## 附带链接

- 仓库：https://github.com/WorldFlowAI/everything-claude-code
- README：https://github.com/WorldFlowAI/everything-claude-code/blob/main/README.md
- 问题报告：https://github.com/WorldFlowAI/everything-claude-code/issues/6
- 修复提案：https://github.com/WorldFlowAI/everything-claude-code/pull/5
- 活跃上游：https://github.com/affaan-m/ECC
