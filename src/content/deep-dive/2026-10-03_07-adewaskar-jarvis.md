---
title: "adewaskar/jarvis"
date: "2026-10-03"
generated: "2026-10-03 07:00"
source: "GitHub"
slug: "2026-10-03_07-adewaskar-jarvis"
summary: "JARVIS 是面向 Claude Code 用户的本地语音代理，把“唤醒—听写—调用工具—播报结果”封装成钢铁侠风格浏览器界面。它针对命令行代理不适合免手操作、工具状态不直观的问题；README 自报口径是只需现有 Claude Code 登录，ElevenLabs 为可选增强，但模型推理仍在 Anthropic 服务端。"
---

# adewaskar/jarvis

## 定位与痛点剖析
JARVIS 是面向 Claude Code 用户的本地语音代理，把“唤醒—听写—调用工具—播报结果”封装成钢铁侠风格浏览器界面。它针对命令行代理不适合免手操作、工具状态不直观的问题；README 自报口径是只需现有 Claude Code 登录，ElevenLabs 为可选增强，但模型推理仍在 Anthropic 服务端。

## 核心架构与技术细节
系统分成浏览器“脸”和 Node 桥接“脑”两进程。React、Vite、Three.js 与自定义着色器绘制界面，本地语音活动检测支持插话；听写和合成在 ElevenLabs 与浏览器能力间自动降级。桥接进程通过 WebSocket/HTTP 连接前端，以 Claude Agent SDK 拉起 Claude CLI，并显式装入本机 MCP 服务。界面控制暴露为固定工具，模型生成的面板经 DOMPurify、类名白名单和内容安全策略过滤；有副作用的工具默认由权限闸门拒绝。

## 竞品对比与生态站位
Open WebUI 提供多模型、Ollama 与多种语音引擎，更像通用自托管平台；Open Interpreter 强在供应商无关的终端编码、沙箱和审批。JARVIS 的差异是复用 Claude Code 登录及 MCP 配置，并把语音、三维界面和电脑控制连成单一体验。代价是绑定 Claude 生态，部署形态也更偏单用户桌面演示。

## 开发者反馈与局限性
默认分支清单仍为零版本，仓库没有标签或发布；核验时二十九个 PR 中二十四个开放、五个关闭且均未合并。开放 issue #11 报告 Windows 无法找到浏览器扩展套接字；issue #37 报告桥接监听全部网卡，代码确为未指定主机的 `server.listen(PORT)`。PR #26 已提出绑定回环地址的修复，但仍开放、未合并，因此不能写成已修复；issue #25 还在请求本地模型支持。上述均是报告或请求，未见维护者确认。

## 附带链接
- [GitHub 仓库](https://github.com/adewaskar/jarvis)
- [默认分支 README](https://github.com/adewaskar/jarvis/blob/main/README.md)
- [Claude Code 官方文档](https://docs.claude.com/en/docs/claude-code)
