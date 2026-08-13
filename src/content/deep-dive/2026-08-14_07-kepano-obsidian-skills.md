---
title: "kepano/obsidian-skills"
date: "2026-08-14"
generated: "2026-08-14 07:00"
source: "GitHub"
slug: "2026-08-14_07-kepano-obsidian-skills"
summary: "obsidian-skills 是面向 Obsidian 的 Agent Skills 集合，按开放的 Agent Skills specification 编写，可供 Claude Code、Codex 与 OpenCode 等兼容代理加载。它解决通用模型不�"
---

# kepano/obsidian-skills

## 定位与痛点剖析
obsidian-skills 是面向 Obsidian 的 Agent Skills 集合，按开放的 Agent Skills specification 编写，可供 Claude Code、Codex 与 OpenCode 等兼容代理加载。它解决通用模型不熟悉 Obsidian 方言、命令和文件语义的问题：例如 wikilink、callout、properties、Bases 公式、JSON Canvas 连接关系，以及重命名笔记时保持链接一致。目标不是提供新聊天界面，而是给已有代理补充可移植的领域操作手册。

## 核心架构与技术细节
仓库本身不是常驻服务，核心资产是可发现的 `SKILL.md` 指令目录，因而没有主编程语言。五个模块分别覆盖 Obsidian Flavored Markdown、Bases、JSON Canvas、Obsidian CLI 与 Defuddle 网页正文提取；安装可走插件市场、`npx skills` 或复制到代理约定目录。设计上以 Markdown、`.base`、`.canvas` 等开放文件为中心，CLI 模块再调用已运行的 Obsidian 应用，形成“静态知识约束＋宿主工具执行”的轻量层。

## 竞品对比与生态站位
cyanheads/obsidian-mcp-server 代表另一条路线：它以 TypeScript 常驻进程通过 STDIO 或流式 HTTP 暴露读取、搜索、局部编辑、标签和前言管理工具，并借助 Local REST API、路径权限与只读开关实施运行时约束。obsidian-skills 无需启动服务器，跨 Agent 复制简单，也能教授格式知识；但缺少 MCP 的类型化参数、统一错误和权限边界，实际效果更依赖宿主模型是否正确遵循文本指令。

## 开发者反馈与局限性
近期 issue 主要指向知识时效性与环境差异：#129 核验 Obsidian 1.12.7 后发现 `silent` 已删除，且输出参数只能放在命令后，否则静默无效；#128 指出常用模式漏掉 rename、move、delete，会诱导代理转用更危险的 eval；#123 记录 Codex 沙箱阻断 IPC 时，技能会把“无法连接”误判为应用未启动；#127 还指出默认 SSH 安装形式会在无密钥机器失败。静态技能轻便，但必须随 CLI 版本持续维护。

## 附带链接
- [GitHub Repo](https://github.com/kepano/obsidian-skills)
- [Agent Skills specification](https://agentskills.io/specification)
- [Obsidian CLI 文档](https://help.obsidian.md/cli)
- [Issue #129](https://github.com/kepano/obsidian-skills/issues/129)
- [Issue #128](https://github.com/kepano/obsidian-skills/issues/128)
- [Issue #123](https://github.com/kepano/obsidian-skills/issues/123)
- [obsidian-mcp-server](https://github.com/cyanheads/obsidian-mcp-server)
