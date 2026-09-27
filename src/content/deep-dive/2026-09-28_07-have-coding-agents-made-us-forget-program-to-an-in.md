---
title: "Have coding agents made us forget ‘program to an interface, not an implementation’?"
date: "2026-09-28"
generated: "2026-09-28 07:00"
source: "Reddit"
slug: "2026-09-28_07-have-coding-agents-made-us-forget-program-to-an-in"
summary: "作者回顾自己先为 Cursor 编写规则，随后迁移到 Claude Code，又遇到 Codex、Pi、OpenCode；同一套约束在文件名、作用域、加载顺序和工具配置间反复搬运。随着模型差距缩小，竞争转向外围运行框架，团队却可能把长期资产锁进短命的产品约定。"
---

# Have coding agents made us forget ‘program to an interface, not an implementation’?

## 事件背景
作者回顾自己先为 Cursor 编写规则，随后迁移到 Claude Code，又遇到 Codex、Pi、OpenCode；同一套约束在文件名、作用域、加载顺序和工具配置间反复搬运。随着模型差距缩小，竞争转向外围运行框架，团队却可能把长期资产锁进短命的产品约定。

## 核心观点 / 产品机制
主张是把对话式编码工具视为可替换实现，把工作流与工具逻辑放进稳定接口：复杂能力做成本地 CLI 或经标准输入输出运行的 MCP 服务，规则层只保留薄适配。官方资料也显示部分收敛：Cursor 同时支持专有的规则文件与 AGENTS.md；Codex 按目录合并 AGENTS.md；Pi 可读取 AGENTS.md 或 CLAUDE.md；OpenCode 以 AGENTS.md 为主并回退兼容 CLAUDE.md。Claude Code 则仍以 CLAUDE.md、路径规则、设置和钩子分层。

## 社区热议与争议点
本次 Atom 源核对到帖子编号、标题与作者，但仅返回一条主帖，未暴露评论条目。本轮Reddit实时评论被封，未逐字取得评论；以下为页面数据与公开资料支持的争点，并非网友引语。具体有四例：支持者可指出，一份 AGENTS.md 已能覆盖 Cursor、Codex、Pi、OpenCode，迁移成本确在下降；MCP 的主机、客户端、服务端分层也让工具可跨宿主复用。反方则会强调，各家嵌套覆盖、字节上限及“提示”与强制钩子的语义仍不同；而 MCP 只规范上下文交换，不能统一审批、沙箱和界面，本地服务还扩大权限与供应链风险。

## 行业影响与未来展望
较稳妥的方向不是追求零平台差异，而是形成“可移植能力核心＋轻量宿主适配器”：业务接口、测试与遥测独立维护，提示文件负责项目语境，权限策略留在可强制执行层。下一步竞争会从谁拥有最多专属规则，转向谁能证明跨代理一致性、安全边界和可观测性；团队也应为接口做契约测试、版本锁定与最小权限审计。

## 附带链接
- [Reddit 原帖](https://www.reddit.com/r/artificial/comments/1wrujdv/have_coding_agents_made_us_forget_program_to_an/)
- [Cursor Rules](https://cursor.com/docs/rules)
- [Claude Code 项目记忆](https://docs.anthropic.com/en/docs/claude-code/memory)
- [Codex AGENTS.md](https://developers.openai.com/codex/guides/agents-md)
- [OpenCode Rules](https://opencode.ai/docs/rules)
- [Pi Coding Agent](https://github.com/badlogic/pi-mono/blob/main/packages/coding-agent/README.md)
- [AGENTS.md 开放格式](https://agents.md/)
- [MCP 架构](https://modelcontextprotocol.io/docs/learn/architecture)
- [MCP 安全建议](https://modelcontextprotocol.io/docs/2026-07-28/tutorials/security/security_best_practices)
