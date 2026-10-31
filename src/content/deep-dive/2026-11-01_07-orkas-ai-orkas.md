---
title: "Orkas-AI/Orkas"
date: "2026-11-01"
generated: "2026-11-01 07:00"
source: "GitHub"
slug: "2026-11-01_07-orkas-ai-orkas"
summary: "Orkas 是 MIT 开源桌面多代理工作台，把一次性聊天变成持续项目：目标、规则、记忆、文件和待办留存，指挥官再拆给不同角色。它面向希望交付报告、媒体、办公文件或代码，却不想编写编排程序的个人和小团队。内置十六个研究、内容、开发、办公及电商专家为项目方自报。"
---

# Orkas-AI/Orkas

## 定位与痛点剖析

Orkas 是 MIT 开源桌面多代理工作台，把一次性聊天变成持续项目：目标、规则、记忆、文件和待办留存，指挥官再拆给不同角色。它面向希望交付报告、媒体、办公文件或代码，却不想编写编排程序的个人和小团队。内置十六个研究、内容、开发、办公及电商专家为项目方自报。

## 核心架构与技术细节

默认分支主体是 Electron、Node 与 TypeScript。指挥官直接执行或用派发、交接、匿名工作器组织任务；规划器最多八项，只能依赖较早任务，主机校验后才写任务板。Claude Code、Codex、OpenCode、OpenClaw、Hermes 以本地子进程接入；连接器经 OAuth、MCP 或本地适配器覆盖 Gmail、Drive、Notion、Slack 等。读写、外发、删除分级，未知自定义动作按高风险处理；默认权限允许工作区外访问但敏感操作需确认。对话、索引和自带密钥默认落本机；自带密钥直连模型商，内置模型、同步及协作仍涉及项目方服务。

## 竞品对比与生态站位

CrewAI 官方定义为供开发者构建多代理流程的 Python 框架，LangChain 是构建代理与大模型应用的组件框架；Orkas 的边界是可直接使用的桌面成品。Claude Code 聚焦终端、编辑器中的编码任务，而 Orkas 把它当团队成员，并补上跨角色待办、自动推进和定时任务；这属于产品形态差异，不代表性能领先。

## 开发者反馈与局限性

近期 issue #137 报告 Windows 并发任务时迟滞，维护者仅回复正在调查；#136 的自定义头像和仅工作日自动化也仍处评估。#131 报告跨资料库移动时并发编辑可能丢失，合并的 PR #140 用复制前后指纹和回滚修复，但作者明确仍有检查与删除间的极小窗口，且未跑完整 Electron 测试。另有运行边界：自动化依赖电脑开机，Linux 仅支持符合版本要求的源码运行。

## 附带链接

- [GitHub Repo](https://github.com/Orkas-AI/Orkas)
- [官网](https://orkas.ai/)
- [安全与数据边界](https://orkas.ai/security/)
- [Issue #137](https://github.com/Orkas-AI/Orkas/issues/137) · [Issue #131](https://github.com/Orkas-AI/Orkas/issues/131) · [PR #140](https://github.com/Orkas-AI/Orkas/pull/140)
