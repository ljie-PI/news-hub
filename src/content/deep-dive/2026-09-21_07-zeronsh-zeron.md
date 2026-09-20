---
title: "zeronsh/zeron"
date: "2026-09-21"
generated: "2026-09-21 07:00"
source: "GitHub"
slug: "2026-09-21_07-zeronsh-zeron"
summary: "Zeron 不是新的编程代理，而是把 Claude Code、Codex、Cursor、Devin、Grok、Hermes、Pi 等现有工具收进同一原生工作台：统一查看会话、终端、分支差异和工作区，并可跨设备继续操控。它瞄准多代理并行后窗口散乱、状态难追踪，以及离开主机便无法干预的痛点；本批 GitHub 周榜快照新增 389 星。"
---

# zeronsh/zeron

## 定位与痛点剖析

Zeron 不是新的编程代理，而是把 Claude Code、Codex、Cursor、Devin、Grok、Hermes、Pi 等现有工具收进同一原生工作台：统一查看会话、终端、分支差异和工作区，并可跨设备继续操控。它瞄准多代理并行后窗口散乱、状态难追踪，以及离开主机便无法干预的痛点；本批 GitHub 周榜快照新增 389 星。

## 核心架构与技术细节

设备侧以 Rust 单二进制实现，既可运行 GPUI 桌面界面，也可只启动无头引擎；两者通过同一套类型化 RPC 通信。会话与工作区注册表采用 Loro CRDT，本地快照落入 SQLite；启用同步后，经 WebSocket 接入 TypeScript 编写的 Cloudflare Worker、Durable Objects 与 R2。架构文档称本地模式无需账号或网络，登录只为切换到同步资料域，避免运行中悄然换库。

## 竞品对比与生态站位

与同样提供多代理、独立 worktree 和手机端遥控的 Orca 相比，Zeron 的辨识度是 Rust/GPUI 原生客户端、可复用既有代理会话，以及明确的本地优先资料边界；它更像代理控制台，而非 Paperclip 那种围绕组织架构、预算和目标治理的“代理公司”编排层。代价是同步仍依赖官方边缘服务，架构文档明确尚未承诺自托管后端接口。

## 开发者反馈与局限性

真实反馈显示适配层仍受上游版本牵制：开放 issue #477 报告 Claude CLI 2.1.81 不识别程序强制加入的参数，导致运行直接退出，而 2.1.278 可用，当前尚无能力探测。issue #406 曾报告 Devin 消息静默无响应；维护者定位为连续回车误触中断，修复 PR #412 已合并。安全边界也需注意：同步账号下设备互信，开启显示忽略文件后，远端可读写包括 `.env` 在内的文件。官网仍显示 v0.2.66，而仓库最新稳定版为 v0.2.79，存在版本漂移。

## 附带链接

- [Repo](https://github.com/zeronsh/zeron)
- [官网](https://zeron.sh)
- [架构文档](https://github.com/zeronsh/zeron/blob/main/ARCHITECTURE.md)
- [兼容性问题 #477](https://github.com/zeronsh/zeron/issues/477)
- [静默中断报告 #406](https://github.com/zeronsh/zeron/issues/406)
- [修复 PR #412](https://github.com/zeronsh/zeron/pull/412)
- [竞品 Orca](https://github.com/stablyai/orca)
- [竞品 Paperclip](https://github.com/paperclipai/paperclip)
