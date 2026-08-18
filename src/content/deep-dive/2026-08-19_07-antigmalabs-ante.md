---
title: "AntigmaLabs/ante"
date: "2026-08-19"
generated: "2026-08-19 07:00"
source: "GitHub"
slug: "2026-08-19_07-antigmalabs-ante"
summary: "Ante 是面向终端开发者的自包含编码智能体，主打摆脱特定模型、账号与运行时依赖：既能交互使用，也能以无头、服务端或 Slack、Discord 网关方式接入�"
---

# AntigmaLabs/ante

## 定位与痛点剖析

Ante 是面向终端开发者的自包含编码智能体，主打摆脱特定模型、账号与运行时依赖：既能交互使用，也能以无头、服务端或 Slack、Discord 网关方式接入自动化。GitHub REST 快照显示其获 1807 星、55 个分叉，采用 Apache-2.0；但当前仍是仅支持 macOS、Linux 的预览版，Windows 建议使用 WSL。

## 核心架构与技术细节

核心以单个 Rust 可执行文件交付。TUI、无头命令和 `ante serve` 客户端统一进入守护进程，内部按会话、轮次、步骤组织工具、权限、技能与子智能体，再连接 Anthropic、OpenAI、Gemini、OpenRouter 或本地模型。内置受管的 llama.cpp，可直接运行 GGUF；配置档可整体替换系统提示、工具、技能和记忆。公开仓库实际包含文档、JSONL 协议、Rust SDK、进程执行库及 Harbor 评测适配器，核心仍在私有仓库并以二进制发布。README 自报压缩包约十五兆、相较 Claude Code 峰值内存约低七倍、平均 CPU 约低九倍，并报告 Terminal-Bench 通过率百分之八十二点七；这些均属项目方自报口径。

## 竞品对比与生态站位

它直接对标 Claude Code、Codex、OpenCode 与 Pi。优势是单文件、跨模型目录、原生离线推理及可复现实验入口，适合容器、远程机和批量智能体；代价是核心不可审计、二进制另受预览条款约束，开放程度弱于真正可从源码构建的同类。其 `serve` 使用自有 JSONL 协议，尚未支持 ACP，编辑器生态也不及成熟竞品。

## 开发者反馈与局限性

近期 issue 给出具体边界：#155 指出 OpenAI 兼容端的推理强度被压成开关；#154 显示无头模式虽注册 MCP 工具，却未写入模型工具模式；#140 报告 Discord 网关无法传递审批并会丢失会话。#21 仍在追踪核心开源，#141 则建议给三个公开 Rust crate 补齐拉取请求持续集成。再叠加默认启用但可关闭的匿名遥测，现阶段更适合可隔离、愿意验证预览行为的用户。

## 附带链接

- [GitHub Repo](https://github.com/AntigmaLabs/ante)
- [官网](https://antigma.ai)
- [文档](https://docs.antigma.ai)
- [Issues](https://github.com/AntigmaLabs/ante/issues)
