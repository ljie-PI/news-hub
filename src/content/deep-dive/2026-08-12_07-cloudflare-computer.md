---
title: "cloudflare/computer"
date: "2026-08-12"
generated: "2026-08-12 07:00"
source: "GitHub"
slug: "2026-08-12_07-cloudflare-computer"
summary: "Cloudflare Computer 面向在 Workers 上构建智能体的开发者，把持久工作目录与代码执行统一起来。它解决临时沙箱重启后文件丢失、不同运行时各有一套存储"
---

# cloudflare/computer

## 定位与痛点剖析
Cloudflare Computer 面向在 Workers 上构建智能体的开发者，把持久工作目录与代码执行统一起来。它解决临时沙箱重启后文件丢失、不同运行时各有一套存储、工具接口难复用的问题：权威状态驻留于 Durable Object 的 SQLite，智能体可读写、搜索、执行并延续上次任务。不过项目明确标为预览版，只适合实验和原型。

## 核心架构与技术细节
这是以 TypeScript 为主的单仓库。底层 dofs 实现 SQLite 虚拟文件系统；computerd 在容器内以 FUSE 挂载文件，并经 capnweb 通道同步。统一的 runtime.exec 可选择完整 Linux 容器、基于 just-bash 的 Worker Shell，或隔离的 JavaScript 动态 Worker。后两者直接通过 Workers RPC 访问权威存储，避免第二份数据库。上层还提供文件工具、Git 客户端和只读 R2 挂载。

## 竞品对比与生态站位
相较 Docker Sandboxes、E2B 等一次性容器，它的关键差异不是再造命令沙箱，而是让同一份耐久文件跨容器与隔离运行时使用；相比只提供内存 Shell 的 just-bash，又补上持久化、同步和智能体工具。代价是与 Durable Objects、Worker Loader、Cloudflare Containers 绑定，更适合既有 Cloudflare 技术栈，而非通用本地或多云执行层。

## 开发者反馈与局限性
README 给出的限制包括单工作区约十吉字节、容器侧文件驻内存，大型依赖安装和压缩包解包会受 FUSE I/O 拖累。Issue #68“Make gc() reachable so orphaned blobs and manifests are actually reclaimed”指出清理逻辑不可调用，失败写入可能遗留对象；#67“Prune acknowledged tombstones from vfs_changes so the table stops growing without bound”指出删除记录会无限增长。已关闭的 #71 还暴露真实 Durable Object SQLite 测试曾未进入持续集成。

## 附带链接
- 仓库：https://github.com/cloudflare/computer
- 使用文档：https://github.com/cloudflare/computer/tree/main/docs
- 软件包说明：https://github.com/cloudflare/computer/tree/main/packages/computer
