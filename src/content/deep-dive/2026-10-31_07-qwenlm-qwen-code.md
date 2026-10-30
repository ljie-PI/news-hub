---
title: "QwenLM/qwen-code"
date: "2026-10-31"
generated: "2026-10-31 07:00"
source: "GitHub"
slug: "2026-10-31_07-qwenlm-qwen-code"
summary: "Qwen Code 是开源编程代理，把代码理解、文件修改、命令执行与会话恢复带进终端，并延伸至编辑器、桌面、网页和聊天渠道，减少跨界面搬运上下文与配置。批次快照为二万八千八百四十星、三千二百九十次分叉，当日新增四十星；查询时 GitHub API 数值一致。README 所称“无厂商锁定”和能力对齐均属自报。"
---

# QwenLM/qwen-code

## 定位与痛点剖析

Qwen Code 是开源编程代理，把代码理解、文件修改、命令执行与会话恢复带进终端，并延伸至编辑器、桌面、网页和聊天渠道，减少跨界面搬运上下文与配置。批次快照为二万八千八百四十星、三千二百九十次分叉，当日新增四十星；查询时 GitHub API 数值一致。README 所称“无厂商锁定”和能力对齐均属自报。

## 核心架构与技术细节

当前默认分支显示它是 TypeScript 单仓，要求 Node.js 22 以上。`packages/cli` 负责终端界面、配置、无头模式与服务入口，`packages/core` 承担上下文、模型请求、工具、权限、记忆和会话。交互命令直接进入核心；网页、编辑器客户端经 SDK 连接 `qwen serve`，由 HTTP/SSE 控制面、ACP bridge 与 `qwen --acp` 子进程复用代理循环。内建工具覆盖文件、Shell、搜索、规划、技能和子代理，MCP 扩展外部能力；分层利于复用，也增加状态和权限一致性的成本。

## 竞品对比与生态站位

项目承认源自 Gemini CLI 0.8.2，随后停止同步并转向多协议框架。当前 Gemini CLI 官方定位偏 Google Cloud 企业工作流；OpenCode 同为开源替代，提供可写构建代理、只读规划代理和桌面测试版。Qwen Code 同时接入多家协议与本地模型，并覆盖 SDK、ACP、即时通信和多种界面；但 README 的 Claude Code 对齐表仍是自报，不能证明质量或性能领先。

## 开发者反馈与局限性

开放 issue #15920 报告 Windows 下 Git Bash 的 `/tmp` 与文件工具解析不一致，导致临时文件误入仓库；协作机器人从源码确认机制，但明确未在 Windows 执行复现，故仍是有静态依据的未关闭报告。issue #15919 指出 MCP 客户端内联了审计工具不可见的旧依赖；协作者已本地确认副本与升级路径，但双方均未证明可利用链，修复仍在推进。两例显示跨平台路径、预打包依赖和多进程边界仍是维护负担。

## 附带链接

- [GitHub Repo](https://github.com/QwenLM/qwen-code)
- [官方文档](https://qwenlm.github.io/qwen-code-docs/en/users/overview)
- [架构文档](https://github.com/QwenLM/qwen-code/blob/main/docs/developers/architecture.md)
- [Windows 路径 issue #15920](https://github.com/QwenLM/qwen-code/issues/15920)
- [依赖打包 issue #15919](https://github.com/QwenLM/qwen-code/issues/15919)
- [Gemini CLI](https://github.com/google-gemini/gemini-cli) / [OpenCode](https://github.com/anomalyco/opencode)
