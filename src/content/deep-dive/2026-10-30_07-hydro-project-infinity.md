---
title: "hydro-project/infinity"
date: "2026-10-30"
generated: "2026-10-30 07:00"
source: "GitHub"
slug: "2026-10-30_07-hydro-project-infinity"
summary: "Infinity 是面向长时运行、事件驱动代理的 Rust 运行时与工具协议，解决传统代理等待构建、审批或订阅事件时仍占进程、连接和内存的问题。选中时榜单冻结为 373 stars、35 forks、今日新增 162 stars；当前 REST API 为 374 stars、35 forks，二者分账保留而非互相覆盖。目标用户是需要大规模并发、故障恢复或无服务器部署的代理工程团队。"
---

# hydro-project/infinity

## 定位与痛点剖析

Infinity 是面向长时运行、事件驱动代理的 Rust 运行时与工具协议，解决传统代理等待构建、审批或订阅事件时仍占进程、连接和内存的问题。选中时榜单冻结为 373 stars、35 forks、今日新增 162 stars；当前 REST API 为 374 stars、35 forks，二者分账保留而非互相覆盖。目标用户是需要大规模并发、故障恢复或无服务器部署的代理工程团队。

## 核心架构与技术细节

默认分支 main 的 README 与架构文档把代理切成有界 execution slice：从存储恢复历史，消费统一 InputMessage，完成一次模型调用，先持久化回合再派发至多一个异步工具，随后退出。每线程 FIFO 保序、跨线程并行；稳定消息标识吸收至少一次投递的重复。RAP 以 HTTP 回调返回结果和订阅事件，MCP 通过代理兼容；本地常驻模式与 SQS FIFO、Lambda、DSQL、DynamoDB 的 step mode 共用核心流水线。README 与 AWS 文章自报 8GB 树莓派可容纳约 7.5 万个空闲代理，此为项目方基准，非独立测评。

## 竞品对比与生态站位

LangGraph 也以 checkpointer 保存线程状态并支持中断恢复；Infinity 的差异是把工具调用直接定义为让出点，以消息队列和回调实现进程完全退场，并用合成工具调用承载异步事件。代价是引入 RAP、队列与持久化设施；虽可复用 MCP 生态，集成复杂度高于单进程代理框架。Apache-2.0、Rust 与 AWS／UC Berkeley Hydro 背景强化系统研究定位，但仍属早期版本。

## 开发者反馈与局限性

当前 API 的 54 个开放条目分为 31 个 issue 与 23 个 PR。issue #93 仍开放，报告异常重启可能丢失全部会话，维护者评论指向并发重写造成损坏；对应崩溃安全、追加式日志 PR #178 仍是开放草稿，不能视为已修复。issue #177 仍开放，报告硬编码默认 Bedrock 模型会让无权限账户首次运行失败。另一方面，修复 SSO 配置的 PR #176 已于 10 月 27 日合并，显示维护活跃，但部署前仍需验证持久化和模型可用性。

## 附带链接

- [GitHub Repo](https://github.com/hydro-project/infinity)
- [架构文档](https://github.com/hydro-project/infinity/blob/main/docs/docs/infinity-runtime/architecture.md)
- [AWS 技术文章](https://aws.amazon.com/blogs/opensource/introducing-infinity-a-runtime-for-extreme-agent-concurrency/)
- [issue #93](https://github.com/hydro-project/infinity/issues/93) · [issue #177](https://github.com/hydro-project/infinity/issues/177) · [PR #176](https://github.com/hydro-project/infinity/pull/176) · [PR #178](https://github.com/hydro-project/infinity/pull/178)
