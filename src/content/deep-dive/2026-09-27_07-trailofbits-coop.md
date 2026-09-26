---
title: "trailofbits/coop"
date: "2026-09-27"
generated: "2026-09-27 07:00"
source: "GitHub"
slug: "2026-09-27_07-trailofbits-coop"
summary: "Coop 是 Trail of Bits 面向 Claude Code、Codex 的 Rust 命令行工具，把可任意执行命令的编码代理放进虚拟机，避免直接暴露宿主环境。冻结的 Trending 快照是“本周新增 419 星”；查询时 GitHub REST 为 678 星、30 个分叉、44 个开放问题，两者口径不同。README 将“隔离、可复现、低成本销毁”作为项目主张，而非独立测评结论。"
---

# trailofbits/coop

## 定位与痛点剖析

Coop 是 Trail of Bits 面向 Claude Code、Codex 的 Rust 命令行工具，把可任意执行命令的编码代理放进虚拟机，避免直接暴露宿主环境。冻结的 Trending 快照是“本周新增 419 星”；查询时 GitHub REST 为 678 星、30 个分叉、44 个开放问题，两者口径不同。README 将“隔离、可复现、低成本销毁”作为项目主张，而非独立测评结论。

## 核心架构与技术细节

默认分支清单显示当前版本 0.6.0、Apache-2.0、Rust 2024。`VmBackend` 在编译期选择 Linux 的 Firecracker/KVM 或 macOS 的 Lima/Virtualization.framework；黄金镜像、实例状态和运行/停止类型封装生命周期。工作区经 SSH 用 rsync 或带 SHA-256 校验的 tar 流同步。来宾内允许免密 sudo，并默认让代理跳过确认，安全边界因此是整台虚拟机。可选 `coop-proxy` 把模型密钥留在宿主，经回环反向隧道注入请求，并以 Landlock 或 Seatbelt 限权。

## 竞品对比与生态站位

同类 Brood Box 也用硬件隔离微虚拟机，但以临时会话、写时复制工作区、逐文件差异审阅和出站策略为核心，还预置更多代理。Coop 更像可复用开发环境：支持多实例、镜像配置、停止后保盘、提交与恢复，以及双后端一致命令；代价是同步、凭据和长期状态的边界更复杂。

## 开发者反馈与局限性

开放问题 #479 报告 Linux 端仍以 sudo 直接启动 Firecracker，尚未接入 jailer；报告明确未复现逃逸。#427 给出可复现实例：`pull` 未带 `--delete`，可能残留文件甚至让宿主 Git 读取旧引用，近期评论支持增加删除选项。#405 及维护者实测还显示，macOS 长时运行实例在宿主切网后可能 DNS 失效，重启可恢复。README 同时注明 Linux arm64 构建尚未测试。

## 附带链接

- [GitHub 仓库](https://github.com/trailofbits/coop)
- [架构与信任模型](https://github.com/trailofbits/coop/blob/main/docs/ARCHITECTURE.md)
- [问题 #479](https://github.com/trailofbits/coop/issues/479) · [问题 #427](https://github.com/trailofbits/coop/issues/427) · [问题 #405](https://github.com/trailofbits/coop/issues/405)
- [对比项目 Brood Box](https://github.com/stacklok/brood-box)
