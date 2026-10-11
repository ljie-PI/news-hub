---
title: "CopilotKit/OpenIntelligentUI"
date: "2026-10-12"
generated: "2026-10-12 07:00"
source: "GitHub"
slug: "2026-10-12_07-copilotkit-openintelligentui"
summary: "这是一个 MIT 许可的生成式界面参考应用，把普通问答变成解释、比较、计算器、图表或可交互工具，面向智能体界面开发者。[README](https://github.com/CopilotKit/OpenIntelligentUI/blob/main/README.md) 显示它同时选择文本、原生组件和自定义界面，突破纯文本回答。批次快照记录日增三百零九星；本次 [REST](https://api.github.com/repos/CopilotKit/OpenIntelligentUI) 查询为二千六百五十二星、三百零三个分叉，默认分支为主分支。"
---

# CopilotKit/OpenIntelligentUI

## 定位与痛点剖析

这是一个 MIT 许可的生成式界面参考应用，把普通问答变成解释、比较、计算器、图表或可交互工具，面向智能体界面开发者。[README](https://github.com/CopilotKit/OpenIntelligentUI/blob/main/README.md) 显示它同时选择文本、原生组件和自定义界面，突破纯文本回答。批次快照记录日增三百零九星；本次 [REST](https://api.github.com/repos/CopilotKit/OpenIntelligentUI) 查询为二千六百五十二星、三百零三个分叉，默认分支为主分支。

## 核心架构与技术细节

主分支以 pnpm、Turborepo 管理：前端是 Next.js、React、CopilotKit 和 Websandbox，代理端是 FastAPI、LangGraph、Deep Agents，另含 MCP 服务和设计系统。[架构文档](https://github.com/CopilotKit/OpenIntelligentUI/blob/main/docs/architecture.md) 给出的链路是浏览器经 CopilotKit 路由到代理，再把文本、原生组件或六段有序的网页参数流回隔离框架；宿主桥只开放经校验的继续提问、外链和尺寸消息。会话检查点仅存进程内存，重启或横向扩容可能丢失或分裂状态。

## 竞品对比与生态站位

[A2UI](https://github.com/a2ui-project/a2ui/blob/main/README.md) 传递声明式数据，只允许受信组件目录渲染，并可映射多种客户端；它以受限自由度缩小执行面。Vercel [AI SDK](https://ai-sdk.dev/docs/ai-sdk-ui/generative-user-interfaces) 则把工具结果映射到预先编写的 React 组件，控制更强但每类工具都要配套界面。本项目以 A2UI 处理基础表格，以沙箱网页承载复杂图形，更像可改造的完整样板，而非独立协议。

## 开发者反馈与局限性

开放的 [问题八十七](https://github.com/CopilotKit/OpenIntelligentUI/issues/87) 报告非 Claude 的 GLM 模型在规划工具后不再调用界面生成工具；两条评论均来自机器人，其中一条明确标注低置信度，尚无人工结论。开放的 [问题三](https://github.com/CopilotKit/OpenIntelligentUI/issues/3) 指出同源沙箱风险；协作者评论确认导入映射曾依赖该标志，并列出内容安全策略等缓解。主应用现称无同源权限，但 MCP 文档仍保留旧示例，开放的 [合并请求一百一十](https://github.com/CopilotKit/OpenIntelligentUI/pull/110) 正尝试移除，说明文档与实现边界仍在收敛。

## 附带链接

- [代码仓库](https://github.com/CopilotKit/OpenIntelligentUI)
- [项目官网](https://opengenerativeui.copilotkit.ai/)
- [前端清单](https://github.com/CopilotKit/OpenIntelligentUI/blob/main/apps/app/package.json)
- [代理清单](https://github.com/CopilotKit/OpenIntelligentUI/blob/main/apps/agent/pyproject.toml)
