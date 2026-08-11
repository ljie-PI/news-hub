---
title: "Cloudflare OS: an open platform for agents, apps, and work"
date: "2026-08-11"
generated: "2026-08-11 08:00"
source: "HN"
slug: "2026-08-11_08-cloudflare-os-an-open-platform-for-agents-apps-and"
summary: "Cloudflare 将五月起供内部数千名员工使用的代理工作台重写并开源，希望把编码代理的反馈循环扩展到文档、表格、演示和企业小应用。旧版偏个人会话"
---

# Cloudflare OS: an open platform for agents, apps, and work

## 事件背景
Cloudflare 将五月起供内部数千名员工使用的代理工作台重写并开源，希望把编码代理的反馈循环扩展到文档、表格、演示和企业小应用。旧版偏个人会话，静态产物难持续连接数据；多人共享后，MCP 只约束可调用工具、却不记录代理看过哪些底层资源，形成权限传播缺口。

## 核心观点 / 产品机制
平台由代理工作区、治理框架和可修改应用组成。代理在隔离的 Dynamic Worker 中写代码，应用以 Durable Object Facet 获得独立 SQLite 状态。所有主体默认无权限；Gatekeeper 保管凭证，以类型化能力限定仓库、字段和操作，记录读取并审批外部副作用。系统还把“观察过的资源”附着于产物，分享时复核接收者权限；蓝图只复制代码，不带数据、凭证或会话。

## 社区热议与争议点
HN 的 thehamkercat 认为“OS”只是夸大的平台命名，alt227 也指出它不管理硬件。项目作者 kentonv 则确认代码可在开源 workerd 上完全自托管，可直连 Ollama，AI Gateway 也可选；原本担心锁定的 mosura 因此转为认可。安全面仍有争议：techpression 警告低门槛应用会诱导用户授权并泄露敏感数据；kentonv 回应应用只能读取明确挂载资源，出站写入需 Gatekeeper 审批，且系统会追踪数据污染，但承认边界仍在演进。

## 行业影响与未来展望
其价值不在取代 Linux，而是把代理沙箱、最小权限、审计和人类批准做成企业公共层，降低每个“氛围编程”应用重复实现安全的成本。若资源沿袭与蓝图隔离经实战验证，企业代理可能从聊天框变成可共享软件；风险则是能力模型复杂、错误授权仍可能绕过技术防线，并形成对 Workers 运行时的事实依赖。

## 附带链接
- [原文](https://blog.cloudflare.com/cloudflare-os/)
- [Hacker News 讨论](https://news.ycombinator.com/item?id=49182996)
- [GitHub 仓库](https://github.com/cloudflare/cloudflare-os)
