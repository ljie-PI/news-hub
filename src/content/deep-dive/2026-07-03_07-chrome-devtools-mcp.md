---
title: "ChromeDevTools/chrome-devtools-mcp"
date: "2026-07-03"
generated: "2026-07-03 07:00"
source: "GitHub"
slug: "2026-07-03_07-chrome-devtools-mcp"
summary: "chrome-devtools-mcp 是 Chrome 官方推出的 MCP 服务器，让编码智能体能够操控并检查一个真实运行的 Chrome 浏览器。它瞄准的痛点是：智能体写完前端代码后往"
---

# ChromeDevTools/chrome-devtools-mcp

## 定位与痛点剖析
chrome-devtools-mcp 是 Chrome 官方推出的 MCP 服务器，让编码智能体能够操控并检查一个真实运行的 Chrome 浏览器。它瞄准的痛点是：智能体写完前端代码后往往"盲写盲改"，无法真正看到页面渲染、网络请求与控制台报错，调试与性能分析全靠猜。接入后，Claude、Cursor、Copilot、Antigravity 等助手便可获得完整的 DevTools 能力。目标用户是做 Web 前端与性能优化、希望智能体闭环验证的开发者。

## 核心架构与技术细节
它以 Model-Context-Protocol 服务器形式运行，底层用 puppeteer 自动化 Chrome 并自动等待动作结果，保证操作可靠。功能上可录制性能 trace 并提取可执行的优化建议、分析网络请求、截屏、读取带源码映射堆栈的控制台消息。项目用 TypeScript 编写，通过 npx 一行配置即可接入 MCP 客户端，另提供 CLI 供无 MCP 场景使用，仅需 Node LTS 与稳定版 Chrome。

## 竞品对比与生态站位
相比 Playwright MCP 等通用浏览器自动化方案，它由 Chrome 团队亲自维护，深度绑定 DevTools 与 CrUX 真实用户数据，在性能诊断上更专业权威。作为官方一方项目，它在 MCP 浏览器工具生态中占据标杆地位，可信度与更新节奏都有保障。

## 开发者反馈与局限性
凭借官方背书，项目迅速积累大量星标，开发者普遍称赞其性能洞察与调试体验。局限在于：官方仅保证支持 Google Chrome 与 Chrome for Testing，其他 Chromium 内核浏览器可能异常；默认开启使用统计与更新检查需手动关闭；浏览器内容会暴露给 MCP 客户端，处理敏感数据时存在隐私顾虑。

## 附带链接
- GitHub 仓库：https://github.com/ChromeDevTools/chrome-devtools-mcp
- 工具参考文档：https://github.com/ChromeDevTools/chrome-devtools-mcp/blob/main/docs/tool-reference.md
