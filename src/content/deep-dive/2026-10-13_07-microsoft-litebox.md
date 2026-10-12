---
title: "microsoft/litebox"
date: "2026-10-13"
generated: "2026-10-13 07:00"
source: "GitHub"
slug: "2026-10-13_07-microsoft-litebox"
summary: "LiteBox 是微软用 Rust 编写、MIT 许可的安全导向 library OS 与沙箱框架。其目标不是再套一层容器，而是缩窄来宾可见的宿主接口，以减少攻击面；面向承载不可信 Linux、OP-TEE 程序、机密计算或跨系统运行环境的系统工程师。冻结入选快照为 3123 stars、165 forks，当日新增 54 stars；当前 REST 元数据显示默认分支为 main。"
---

# microsoft/litebox

## 定位与痛点剖析

LiteBox 是微软用 Rust 编写、MIT 许可的安全导向 library OS 与沙箱框架。其目标不是再套一层容器，而是缩窄来宾可见的宿主接口，以减少攻击面；面向承载不可信 Linux、OP-TEE 程序、机密计算或跨系统运行环境的系统工程师。冻结入选快照为 3123 stars、165 forks，当日新增 54 stars；当前 REST 元数据显示默认分支为 main。

## 核心架构与技术细节

main 分支 README 与源码表明，核心是可组合的“North—South”边界：上层以接近 nix、rustix 的 Rust 接口服务 shim，下层由宿主实现 Platform、Provider traits。核心 crate 采用 no_std，含文件描述符、文件系统、内存、网络、同步等模块；公开清单版本为 0.1.0，Provider 汇聚互斥锁、网络、时间与架构能力，便于逐项裁剪宿主依赖；workspace 再组合 Linux、Windows 用户态、Linux 内核、LVBS、SEV-SNP 与 OP-TEE runner。同一 North shim 可换 South 平台，但安全收益仍取决于各 Provider 的实现与暴露能力，README 所称“减少攻击面”应视为项目自述。

## 竞品对比与生态站位

gVisor 官方 README 将其定位为 Go 用户态 application kernel，并以 OCI 的 runsc 接入 Docker、Kubernetes。LiteBox 的差异是 Rust、no_std 及内核、用户态和 TEE 多宿主组合，更像可嵌入框架；gVisor 则已有容器工具链入口。前者灵活但集成责任更重；这只是官方公开边界对比，不代表性能结论。

## 开发者反馈与局限性

issue #1084 由仓库成员报告：broker 的对象引用与管道容量曾为全局预算，单会话可耗尽 4096 个引用或 64 MiB，影响可用性；报告也明确未发现跨会话泄露。该 issue 仍为 open，且零评论。不能据此断言 main 现存缺陷：它指向 ulitebox 分支，PR #1300 已合并“每会话配额”，当前该分支代码也可见相应字段。更直接的局限是 README 明示 API 尚未稳定，长期用户需承受接口变化。

## 附带链接

- [GitHub 仓库](https://github.com/microsoft/litebox)
- [默认分支 README](https://github.com/microsoft/litebox/blob/main/README.md)
- [issue #1084](https://github.com/microsoft/litebox/issues/1084)
- [修复 PR #1300](https://github.com/microsoft/litebox/pull/1300)
- [gVisor 官方仓库](https://github.com/google/gvisor)
