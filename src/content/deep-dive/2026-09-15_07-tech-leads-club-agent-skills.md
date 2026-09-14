---
title: "tech-leads-club/agent-skills"
date: "2026-09-15"
generated: "2026-09-15 07:00"
source: "GitHub"
slug: "2026-09-15_07-tech-leads-club-agent-skills"
summary: "这是面向 Claude Code、Cursor、Copilot、Codex 等编码代理的技能目录与分发工具，解决技能发现、跨客户端安装、更新及可信校验分散的问题。批次快照为 6035 星、514 个复刻，当日新增 506 星。它适合希望统一管理团队代理能力的开发者，而非新的推理框架。"
---

# tech-leads-club/agent-skills

## 定位与痛点剖析

这是面向 Claude Code、Cursor、Copilot、Codex 等编码代理的技能目录与分发工具，解决技能发现、跨客户端安装、更新及可信校验分散的问题。批次快照为 6035 星、514 个复刻，当日新增 506 星。它适合希望统一管理团队代理能力的开发者，而非新的推理框架。

## 核心架构与技术细节

项目是 Node.js 24、TypeScript 与 Nx 单仓：`skills-catalog` 保存技能及生成注册表，`core` 复用代理路径、缓存和安装逻辑，CLI 支持复制或符号链接，Marketplace 负责浏览，MCP 则以搜索、读取主指令、按需取附件、准备可执行文件的渐进披露链路降低上下文占用。当前代码先从 npm 解析目录版本，再固定 jsDelivr 地址；下载注册表声明的全部文件后，按路径排序计算 SHA-256，与 `contentHash` 不符即拒绝。README 所称“全部技能经扫描”等安全成效属于项目方自报。

## 竞品对比与生态站位

相较只规定 `SKILL.md` 目录格式的 Agent Skills 开放规范，本项目补齐目录、安装器、锁文件、审计和 MCP 服务；相较 Anthropic 官方插件市场，它覆盖更多客户端，也能同时落盘或会话内调用。代价是自建目录与各代理路径持续漂移，治理权和兼容维护集中于单一社区。

## 开发者反馈与局限性

公开 issue 提供了明确反例：[#193](https://github.com/tech-leads-club/agent-skills/issues/193) 报告 Antigravity 全局技能被写入不会扫描的数据目录；[#188](https://github.com/tech-leads-club/agent-skills/issues/188) 指出 Codex 仍使用旧的 `.codex/skills` 路径，二者均未关闭。历史安全报告 [#114](https://github.com/tech-leads-club/agent-skills/issues/114) 曾质疑可变 `@latest` 与缺少完整性校验；已合并 [PR #156](https://github.com/tech-leads-club/agent-skills/pull/156) 改为版本固定和全文件哈希验证。另有开放 [#197](https://github.com/tech-leads-club/agent-skills/issues/197) 提议签名注册表、权限清单与离线快照，说明来源签名和可复现分发尚未成为现行能力。

## 附带链接

- [仓库](https://github.com/tech-leads-club/agent-skills)
- [项目文档](https://tech-leads-club.github.io/agent-skills/)
- [MCP 文档](https://github.com/tech-leads-club/agent-skills/tree/main/packages/mcp)
- [开放规范](https://agentskills.io/specification)
