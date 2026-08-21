---
title: "We Rebuilt the Linux MicroVM Stack on Apple Silicon"
date: "2026-08-22"
generated: "2026-08-22 07:00"
source: "HN"
slug: "2026-08-22_07-we-rebuilt-the-linux-microvm-stack-on-apple-silico"
summary: "Encore 自二〇二二年起用 Firecracker 微虚拟机隔离后端构建，但它依赖 Linux 的 KVM，团队的苹果芯片笔记本无法直接运行。四年来，工程师只能经由 Tailscale"
---

# We Rebuilt the Linux MicroVM Stack on Apple Silicon

## 事件背景

Encore 自二〇二二年起用 Firecracker 微虚拟机隔离后端构建，但它依赖 Linux 的 KVM，团队的苹果芯片笔记本无法直接运行。四年来，工程师只能经由 Tailscale、SSH 和 rsync 在共享远端主机调试，断点、日志、镜像重建都拖慢反馈。此次文章在冻结快照中获一百四十三分、八十二条评论。

## 核心观点 / 产品机制

团队开发了 crackling：以统一接口在 Linux 驱动 Firecracker，在 macOS 驱动 Virtualization.framework，并让同一访客代理经由 vsock 执行命令、传文件和转发端口。它用纯 Rust 解析 OCI 层、白化文件、内核与 initramfs，绕过 macOS 缺少 root、loop mount 和 cpio 的问题；苹果对象则集中到单一串行队列，以适配其不可跨线程约束。两端能力被显式建模：Firecracker 可恢复快照和接管进程，苹果后端可用内建网络、virtiofs 与 Rosetta，却因私有授权不能保存虚拟机状态。

## 社区热议与争议点

支持者 bit_rot73 把结束四年远端开发视为“何时该投资工具”的案例；Lovable 工程师 bittermandel 也称跨平台一致测试很有价值，但其替代方案花约一个工程月搭建 vfkit、QEMU、Kind 与 Firecracker 的嵌套链，srcreigh 随即提醒 M1、M2 不支持硬件嵌套虚拟化。技术路线也有对立：huerne 认为 VZ 能力有限、Hypervisor.framework 才像 KVM，jdub 则反驳说高层的 Firecracker 对应高层 VZ 更合理。gregwebs 追问为何不用 libkrun，前 Encore 工程师 DomBlack 则直接询问 crackling 是否会开源，显示复用性仍待交代。

## 行业影响与未来展望

这套做法表明，生产继续采用 Linux 专用隔离栈时，本地开发未必只能退回容器或远端机器；以能力协商隔离后端差异，可把镜像和访客协议保持一致。不过它不是完整等价层：苹果私有授权封住快照，VZ 虚拟机也不能在守护进程重启后接管。后续价值取决于是否开源、性能与一致性基准，以及苹果是否开放关键授权。

## 附带链接

- [原始文章](https://encore.dev/blog/firecracker-apple-silicon)
- [Hacker News 讨论](https://news.ycombinator.com/item?id=49384716)
- [Firecracker 的 macOS 支持讨论](https://github.com/firecracker-microvm/firecracker/discussions/5019)
