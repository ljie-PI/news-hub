---
title: "codebase-memory-mcp"
date: "2026-06-29"
generated: "2026-06-29 07:00"
source: "GitHub"
slug: "2026-06-29_07-codebase-memory-mcp"
summary: "DeusData 出品的高性能代码智能 MCP 服务器，号称面向 AI 编码代理的\"最快代码理解引擎\"。它将整个代码库索引为持久化知识图谱，普通仓库毫秒级完成，"
---

# codebase-memory-mcp

## 定位
DeusData 出品的高性能代码智能 MCP 服务器，号称面向 AI 编码代理的"最快代码理解引擎"。它将整个代码库索引为持久化知识图谱，普通仓库毫秒级完成，Linux 内核（2800 万行、7.5 万文件）仅需 3 分钟，结构查询响应低于 1 毫秒。仓库 2 月底创建，已破 1.9 万星、单日约 2000 星，处于强势爆发期，MIT 许可。

## 架构
纯 C 编写、零依赖、单一静态二进制，覆盖 macOS/Linux/Windows。基于 tree-sitter AST 解析 158 种语言，并为 Python、TS/JS、Go、Rust 等 11 种主流语言叠加 Hybrid LSP 语义类型解析，生成函数、类、调用链、HTTP 路由及跨服务链接的图谱。索引采用 RAM 优先管线（LZ4 压缩、内存 SQLite、Aho-Corasick），完成后释放内存。提供 14 个 MCP 工具：语义检索、BM25、Cypher 查询、死代码检测、架构总览、影响分析等；内置 Nomic 嵌入与 localhost:9749 的 3D 图谱可视化。

## 竞品
对标 Sourcegraph、ctags 等传统代码导航，以及 Serena、各类 grep-MCP 等代码智能服务器。差异在于本地零依赖二进制、毫秒级索引与 sub-ms 查询，并主打"token 省 99%"——五次结构查询约 3400 token，远低于逐文件读取的 41 万 token。安装命令自动探测并配置 Claude Code、Codex CLI、Gemini CLI、Cursor、Zed、Aider 等 11 个代理，下载即用免 Docker、免 API key，相比同类需自建索引服务的方案部署门槛极低，对个人开发者尤其友好。

## 反馈
有 arXiv 预印本背书：在 31 个真实仓库测评中答案质量达 83%、token 减少 10×、工具调用减 2.1×；5604 项测试通过、SLSA3 等级、每次发布经 70+ 杀毒引擎扫描，安全工程扎实，且全部本地处理代码不外传。星标短期飙升至 1.9 万、分叉超 1400，显示社区高度认可。隐忧在于约 167 个开放 issue、纯 C 实现的维护门槛，以及工具需读写 agent 配置文件带来的信任担忧，审慎用户宜先审计源码再运行。

## 链接
仓库：https://github.com/DeusData/codebase-memory-mcp ；论文：arXiv:2603.27277
