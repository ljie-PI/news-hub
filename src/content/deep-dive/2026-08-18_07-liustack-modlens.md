---
title: "liustack/modlens"
date: "2026-08-18"
generated: "2026-08-18 07:00"
source: "GitHub"
slug: "2026-08-18_07-liustack-modlens"
summary: "ModLens 是为 DeepSeek、GLM 等纯文本编码代理补视觉输入的 TypeScript 工具，不是新模型。它把粘贴图或路径交给多模态引擎，返回结构化证据，解决换模型�"
---

# liustack/modlens

## 定位与痛点剖析

ModLens 是为 DeepSeek、GLM 等纯文本编码代理补视觉输入的 TypeScript 工具，不是新模型。它把粘贴图或路径交给多模态引擎，返回结构化证据，解决换模型、存图及纯文字识别丢失版面语义的问题。GitHub API 抓取时显示采用 MIT 许可，有 2786 星、76 个分叉和 7 个开放事项。

## 核心架构与技术细节

项目要求 Node 22.19 以上，提供命令行、代理技能和 DeepSeek Harness 插件。插件可把粘贴图写入私有临时路径，也可包装文本模型路由，在请求时替换为证据块。提供方抽象连接 Gemini、OpenAI 兼容接口、Anthropic 及本地代理登录，失败时切换并记录尝试。统一模式校验全文、阅读顺序、实体关系、视觉风格和不确定项。README 自报六类内置提供方、四类可复用命令行，读取分别约五至十秒、十五至四十五秒，属项目方口径。文件权限、类型嗅探、容量限制及私网防护降低暴露，但临时目录不是系统沙箱。

## 竞品对比与生态站位

原生多模态模型链路更短，却会改变既有模型、路由或成本；视觉 MCP 更协议化，但常需额外服务与工具配置；Tesseract 类本地识别可离线，却不擅长场景和关系。ModLens 位于宿主体验与多家视觉引擎之间，强项是粘贴交互、统一证据契约和故障转移，识别质量仍取决于上游。

## 开发者反馈与局限性

开放的 #62 指出网络抖动时固定三分钟超时拖慢代理循环；#61 报告宿主升级后设置卡片消失；#60 指出 Windows 后台调用会闪出控制台。#57 的重试策略继承和 #51 的临时文件堆积已在相邻版本修复，响应较快。局限包括 Node 门槛、跨宿主兼容，以及第三方抓取远程地址时无法应用本地防护。仓库由单作者维护并关闭拉取请求，不接受 PR，协作只能走事项或分叉，存在总线风险。

## 附带链接

- [GitHub 仓库](https://github.com/liustack/modlens)
- [README](https://github.com/liustack/modlens/blob/main/README.md)
- [输出契约](https://github.com/liustack/modlens/blob/main/docs/output-schema.md)
- [安全说明](https://github.com/liustack/modlens/blob/main/docs/security.md)
- [近期 Issues](https://github.com/liustack/modlens/issues)
- [版本记录](https://github.com/liustack/modlens/releases)
- [Model Context Protocol](https://modelcontextprotocol.io/specification/2025-06-18/server/tools)
- [Tesseract OCR](https://github.com/tesseract-ocr/tesseract)
