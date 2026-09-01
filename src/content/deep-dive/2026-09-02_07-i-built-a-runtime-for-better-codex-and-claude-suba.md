---
title: "I built a runtime for better Codex and Claude subagent experience"
date: "2026-09-02"
generated: "2026-09-02 07:00"
source: "Reddit"
slug: "2026-09-02_07-i-built-a-runtime-for-better-codex-and-claude-suba"
summary: "9月1日，r/AI_Agents用户lochid_om发布Oh My Subagents（OMS），直指父代理反复轮询子代理既耗费词元，断电或终端中断又会丢失运行状态。目标帖Atom身份与标题匹配；本次取得八个节点，包括主帖、六条普通或作者评论及AutoModerator。"
---

# I built a runtime for better Codex and Claude subagent experience

## 事件背景

9月1日，r/AI_Agents用户lochid_om发布Oh My Subagents（OMS），直指父代理反复轮询子代理既耗费词元，断电或终端中断又会丢失运行状态。目标帖Atom身份与标题匹配；本次取得八个节点，包括主帖、六条普通或作者评论及AutoModerator。

## 核心观点 / 产品机制

OMS把可复用团队定义为责任树，由控制器将一批子任务、父级等待和检查点写入数据库；子项全部返回后再唤醒父级，并提供暂停、语义重试、人工请求和有界恢复。官方仓库显示默认SQLite，也可用PostgreSQL；Codex任务每次开启临时线程，Claude任务明确关闭会话持久化，续跑依赖Task、Assignment与Dispatch等控制器记录，而非聊天历史。README也承认不保证分布式故障转移、外部副作用恰好一次或文件字节重建。

## 社区热议与争议点

普通评论者ThingIndependent3238认可持久状态，认为暂停后切换任务再回来很实用；RealisticImage2192则追问运行时若自带基础设施，对小工作流是否本末倒置。artyomsv警告：若以启动时会话ID作恢复键，压缩、清空或恢复会轮换ID，最需要续跑时反会失效。作者lochid_om回复称项目开源、自托管；进一步核验发现本地默认无需独立数据库服务器，但要常驻控制器服务，且“开源”需限定：核心为MIT，视觉控制台采用Sustainable Use License。

## 行业影响与未来展望

这代表代理工程从提示词编排转向可审计控制平面：责任、等待、重试和结果不再只寄托于模型对话，适合长时研究、迁移与审计任务。代价是状态机、服务运维和版本兼容复杂度上升；仓库与文档能证明设计和实现入口，本轮未找到独立生产压测或断电恢复复现，可靠性仍待外部验证。

## 附带链接

- [Reddit 原帖](https://www.reddit.com/r/AI_Agents/comments/1w4anmo/i_built_a_runtime_for_better_codex_and_claude/)
- [Product Hunt](https://www.producthunt.com/products/oh-my-subagents)
- [GitHub 仓库](https://github.com/ringlochid/oh-my-subagents)
