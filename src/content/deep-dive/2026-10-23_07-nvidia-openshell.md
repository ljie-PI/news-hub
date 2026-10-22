---
title: "NVIDIA/OpenShell"
date: "2026-10-23"
generated: "2026-10-23 07:00"
source: "GitHub"
slug: "2026-10-23_07-nvidia-openshell"
summary: "OpenShell 是面向自主代理集群的开源运行时，让代理可读写、装包和联网，又不直接接触宿主数据与密钥。批次快照为新增 221 星、总计 17681 星；查询时 API 为 17693 星，默认分支仍是 `main`。其“安全、私有”定位来自 README 自报，适合需自托管和集中治理的团队。"
---

# NVIDIA/OpenShell

## 定位与痛点剖析

OpenShell 是面向自主代理集群的开源运行时，让代理可读写、装包和联网，又不直接接触宿主数据与密钥。批次快照为新增 221 星、总计 17681 星；查询时 API 为 17693 星，默认分支仍是 `main`。其“安全、私有”定位来自 README 自报，适合需自托管和集中治理的团队。

## 核心架构与技术细节

当前默认分支以 Rust 2024 单仓组织网关、沙箱、监督器、策略与多种驱动。网关管理状态和身份；Docker、Podman、Kubernetes 或微虚机驱动分别创建不可信工作负载与可信监督器。Linux 侧以非根用户、Landlock 和 seccomp 截获文件、系统调用、域名解析及连接，流量经双向认证通道交由监督器判策，并只向获准端点注入凭据。Z3 策略证明器可检查边界和变更风险，但官方文档明确其模型尚未覆盖 GraphQL、MCP、WebSocket 等规则，不能把“形式验证”理解为全系统正确性证明。

## 竞品对比与生态站位

E2B 主打云端微虚机、暂停恢复与简洁的 Python/JavaScript 接口；Daytona 主打专用内核、持久沙箱和多语言 SDK，但其公开主仓已于 2026 年 6 月停止维护、核心转为私有。OpenShell 的差异是自托管、多计算驱动、细粒度出站策略及凭据代理；代价是网关、内核能力和策略配置的运维面更大，且不以托管即用和极短冷启动为核心卖点。

## 开发者反馈与局限性

开放 issue #4769 报告切换计算驱动后，旧驱动创建的已停止沙箱记录可能被清除；评论仅确认默认分支代码路径，尚未完成端到端复现。issue #4829 则通过临时单测复现日志与平台事件共用游标时的静默漏事件，修复仍待维护者决定。二者显示多驱动一致性和流式恢复仍是成熟度边界，不应据单例外推全部部署。

## 附带链接

- [GitHub 仓库](https://github.com/NVIDIA/OpenShell)
- [README](https://github.com/NVIDIA/OpenShell/blob/main/README.md)
- [架构文档](https://github.com/NVIDIA/OpenShell/blob/main/docs/about/architecture.mdx)
- [策略证明器](https://github.com/NVIDIA/OpenShell/blob/main/docs/how-it-works/policies/prover.mdx)
- [GitHub REST 元数据](https://api.github.com/repos/NVIDIA/OpenShell)
- [Issue #4769](https://github.com/NVIDIA/OpenShell/issues/4769)
- [Issue #4829](https://github.com/NVIDIA/OpenShell/issues/4829)
- [E2B 官方文档](https://e2b.dev/docs)
- [Daytona 官方仓库](https://github.com/daytonaio/daytona)
