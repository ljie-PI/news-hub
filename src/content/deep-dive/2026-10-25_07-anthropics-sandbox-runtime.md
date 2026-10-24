---
title: "anthropics/sandbox-runtime"
date: "2026-10-25"
generated: "2026-10-25 07:00"
source: "GitHub"
slug: "2026-10-25_07-anthropics-sandbox-runtime"
summary: "Sandbox Runtime（srt）用操作系统原语给任意进程套上文件与网络边界，不必先制作容器镜像，适合约束编码代理、MCP 服务及本地工具。批次冻结热度是总计 6456 stars、当日新增 592、569 forks；本次 REST 查询为 6459 stars、569 forks、304 个开放 issue/PR，两种口径不混用。"
---

# anthropics/sandbox-runtime

## 定位与痛点剖析

Sandbox Runtime（srt）用操作系统原语给任意进程套上文件与网络边界，不必先制作容器镜像，适合约束编码代理、MCP 服务及本地工具。批次冻结热度是总计 6456 stars、当日新增 592、569 forks；本次 REST 查询为 6459 stars、569 forks、304 个开放 issue/PR，两种口径不混用。

## 核心架构与技术细节

默认分支 main 的清单为 0.0.81，要求 Node.js 22.12 以上；TypeScript 的 SandboxManager 统一编排 HTTP、SOCKS5 与复用代理，再分派到 macOS Seatbelt、Linux bubblewrap 加网络命名空间和 seccomp、Windows 独立账户加 WFP 与 NTFS ACL。文件写入和网络均默认拒绝，再显式放行；源码还包含凭据遮蔽、TLS 终止及域名过滤，形成双重隔离。

## 竞品对比与生态站位

OpenShell 面向代理集群，带 gateway、容器或虚拟化、凭据注入及形式化策略检查，治理面更完整但部署更重。Docker 还提供 namespaces、cgroups 与镜像生命周期，偏通用容器。bubblewrap 官方则强调自己只是低层构件；srt 在 Linux 正是借它补成跨平台、面向单进程的策略层，优势是接入轻，代价是平台能力并不齐平。

## 开发者反馈与局限性

issue #779 仅报告代理小包往返慢三十至四十倍；评论为零，不能视为维护者确认，PR #781 也仍开放未合并且只覆盖 CONNECT 路径。issue #773 报告 Windows 端口占用会以 EACCES 阻断启动，同样零评论；对应 PR #777 开放未合并。main 源码仍只对 EADDRINUSE 换端口，最新发布 0.0.81 早于两项修复，因此应区分用户报告、贡献者方案与已发布修复；Windows 仍标为 alpha。

## 附带链接

- [仓库](https://github.com/anthropics/sandbox-runtime)｜[README](https://github.com/anthropics/sandbox-runtime/blob/main/README.md)｜[清单](https://github.com/anthropics/sandbox-runtime/blob/main/package.json)
- [issue #779](https://github.com/anthropics/sandbox-runtime/issues/779)｜[PR #781](https://github.com/anthropics/sandbox-runtime/pull/781)｜[issue #773](https://github.com/anthropics/sandbox-runtime/issues/773)｜[PR #777](https://github.com/anthropics/sandbox-runtime/pull/777)
- [OpenShell](https://github.com/NVIDIA/OpenShell)｜[Docker 安全说明](https://docs.docker.com/engine/security/)｜[bubblewrap](https://github.com/containers/bubblewrap)
