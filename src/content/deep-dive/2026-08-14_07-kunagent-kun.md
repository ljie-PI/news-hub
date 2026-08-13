---
title: "KunAgent/Kun"
date: "2026-08-14"
generated: "2026-08-14 07:00"
source: "GitHub"
slug: "2026-08-14_07-kunagent-kun"
summary: "Kun 是本地优先的 AI Agent 工作台，把 Code、Write、Design、Research 与自动化纳入桌面 GUI 和终端 TUI。它要解决的不是单次问答，而是需求、计划、文件改动�"
---

# KunAgent/Kun

## 定位与痛点剖析
Kun 是本地优先的 AI Agent 工作台，把 Code、Write、Design、Research 与自动化纳入桌面 GUI 和终端 TUI。它要解决的不是单次问答，而是需求、计划、文件改动、测试、审查和交付散落在多个工具中的断链问题。目标用户从开发者延伸到写作者、设计师和研究人员；会话与日志默认留在本机，但选择云端模型时，提示、附件和上下文仍会发送给 Provider。

## 核心架构与技术细节
项目以 TypeScript 和 Electron 为主，要求 Node.js 22.19 以上。GUI 与 TUI 都连接同一个 `kun serve` 本地运行时，共享线程、计划、审批、模型连接、用量和后台任务。轻任务走 Direct；实验性的 Agent Graph 由 Lead 建立依赖图，再派发权限受限的子代理，节点须经真实校验与明确验收才向下游交接，并支持暂停、恢复和重试。模型层兼容 OpenAI、Anthropic 协议及自托管服务，扩展面还包括 MCP、Skills、Hook、Schedule 与 `.kunx`。

## 竞品对比与生态站位
OpenHands Agent Canvas 同样强调自托管和多 Agent 后端，能把 OpenHands、Claude Code、Codex 等接到本地、容器、虚拟机或云端，更聚焦软件工程自动化。Kun 的差异是把写作、设计、多模态研究和 GUI/TUI 连续体验放在单一运行时；但 OpenHands 仓库采用 MIT，Kun 使用 PolyForm Noncommercial，仅允许非商业使用，商用、托管或集成需另行授权，企业落地门槛明显更高。

## 开发者反馈与局限性
issue 已暴露长任务记账和状态治理问题：#1155 报告失败子代理的已产生用量未汇总，界面账单低于供应商账单；#1154 指出工具结果累计超过默认预算后，动态摘要会反复改写历史中段，导致提示缓存命中率骤降。另有 #1152 报告 Windows 本地备份一天占用超过十吉字节，#1151 则称子代理模型配置会被 Provider 默认值覆盖。加上 Graph 仍标注实验性，当前更适合可容忍快速迭代的个人用户。

## 附带链接
- [GitHub Repo](https://github.com/KunAgent/Kun)
- [官方文档](https://www.kun-agent.com/docs)
- [Graph Mode 文档](https://github.com/KunAgent/Kun/blob/master/docs/graph-mode.md)
- [Issue #1155](https://github.com/KunAgent/Kun/issues/1155)
- [Issue #1154](https://github.com/KunAgent/Kun/issues/1154)
- [Issue #1152](https://github.com/KunAgent/Kun/issues/1152)
- [OpenHands Repo](https://github.com/OpenHands/OpenHands)
