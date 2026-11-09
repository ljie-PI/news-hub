---
title: "opensandbox-group/OpenSandbox"
date: "2026-11-10"
generated: "2026-11-10 07:00"
source: "GitHub"
slug: "2026-11-10_07-opensandbox-ai-agent-sandbox"
summary: "OpenSandbox 是面向 AI 应用的 Apache-2.0 自托管沙箱平台，把代码执行、文件、终端、浏览器与桌面任务置于隔离环境，并以同一生命周期 API 从本机 Docker 延伸到 Kubernetes。它针对代理直接操作宿主机风险高、运行时接口碎片化、集群冷启动与凭证暴露等问题。批次快照为 16903 星、1590 分叉、当日新增 159 星；本次 GitHub API 查询值恰与快照一致，不能视为后续增量。"
---

# opensandbox-group/OpenSandbox

## 定位与痛点剖析

OpenSandbox 是面向 AI 应用的 Apache-2.0 自托管沙箱平台，把代码执行、文件、终端、浏览器与桌面任务置于隔离环境，并以同一生命周期 API 从本机 Docker 延伸到 Kubernetes。它针对代理直接操作宿主机风险高、运行时接口碎片化、集群冷启动与凭证暴露等问题。批次快照为 16903 星、1590 分叉、当日新增 159 星；本次 GitHub API 查询值恰与快照一致，不能视为后续增量。

## 核心架构与技术细节

默认分支 main 的源码将系统拆为 FastAPI 控制面、运行时后端与数据面 execd。控制面只编排生命周期，Docker 或 Kubernetes 服务实际创建环境；Kubernetes 下，带 templateId 的请求转给 FastSandbox，并以 fsb- 前缀路由既有实例。Go 编写的 execd 通过 SSE 与 WebSocket 提供命令、终端、文件和 Jupyter 执行，并用 bubblewrap 隔离会话。FastSandbox 依靠预热 Fastlet、Firecracker 微虚机、CRD 持久意图及共享出口策略缩短热路径；README 自报创建延迟为串行 P50 64 毫秒、十并发 P99 125.4 毫秒，未见独立基准。五种 SDK、CLI、MCP 和 OpenAPI 契约构成接入层。

## 竞品对比与生态站位

对比 E2B，二者均开源并提供云端或自托管路径。E2B README 默认引导使用 API 密钥的托管云，核心 SDK 聚焦 JavaScript 与 Python，并另有代码解释器和桌面包；自托管走独立 runtime 的 Terraform 或 Embed。OpenSandbox 更突出本地 Docker 到 Kubernetes 的统一接口、多语言 SDK、出口策略与凭证注入，适合需要掌控基础设施的团队；代价是组件和运维面更宽，且无同口径实测可断言性能优于 E2B。

## 开发者反馈与局限性

近期问题显示成熟度仍在爬坡。issue #2660 报告未指定 mode 的上传会把文件设为 0755；PR #2661 的协作者明确确认属实，但因默认权限变化可能破坏下游流程，仍在评估且未合并，不能称已修复。issue #2675 则报告超时与外部终止在错误事件中不可区分，修复 PR #2684 仍开放。README 还明确承认当前整合版发布缺签名与来源证明，追踪于 #2463；部署者应锁定镜像摘要并自行验证供应链。

## 附带链接

- [GitHub 仓库](https://github.com/opensandbox-group/OpenSandbox)
- [项目文档](https://open-sandbox.ai)
- [架构总览](https://github.com/opensandbox-group/OpenSandbox/blob/main/docs/architecture/index.md)
- [上传权限问题 #2660](https://github.com/opensandbox-group/OpenSandbox/issues/2660)
- [超时错误问题 #2675](https://github.com/opensandbox-group/OpenSandbox/issues/2675)
- [竞品 E2B](https://github.com/e2b-dev/E2B)
