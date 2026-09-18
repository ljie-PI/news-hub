---
title: "Fission-AI/OpenSpec"
date: "2026-09-19"
generated: "2026-09-19 07:00"
source: "GitHub"
slug: "2026-09-19_07-fission-ai-openspec"
summary: "OpenSpec 是面向 AI 编码助手的规格驱动开发工具。它针对需求只留在聊天上下文、实现容易跑偏且决策难追溯的问题，把人机共识固化进仓库。目标用户是希望先审计划再写代码的个人与团队；它不是模型或代理运行时，而是轻量协议层。"
---

# Fission-AI/OpenSpec

## 定位与痛点剖析
OpenSpec 是面向 AI 编码助手的规格驱动开发工具。它针对需求只留在聊天上下文、实现容易跑偏且决策难追溯的问题，把人机共识固化进仓库。目标用户是希望先审计划再写代码的个人与团队；它不是模型或代理运行时，而是轻量协议层。

## 核心架构与技术细节
默认分支清单显示公开包为 TypeScript 编写的 `@fission-ai/openspec` 1.13.1，要求 Node.js 20.19 以上，并使用 Commander、YAML 与 Zod。`specs/` 保存当前事实，`changes/` 按变更容纳提案、增量规格、设计和任务；归档时把新增、修改、删除合入主规格。默认 YAML 模式声明制品依赖，源码中的 `ArtifactGraph` 用拓扑排序计算可执行顺序，适配器注册表再为不同助手生成命令或技能。README 所称支持三十多种工具属于项目自报口径。

## 竞品对比与生态站位
GitHub Spec Kit 同样面向多种编码代理，但官方流程从章程、规格、计划到任务和实现，采用 Python 与 uv；OpenSpec 以 npm CLI、增量规格和可改写依赖图突出较轻的既有项目改造。OpenSpec README 称 Kiro 锁定 IDE，但 Kiro 近期官方文档已列出 IDE、CLI、网页和移动端，说明该营销对比已经过时；两者实际差别更在于开放规格层与一体化代理环境。

## 开发者反馈与局限性
开放 issue #1892 报告 1.13.0 遇到无法解析的配置时仅警告并以零退出，可能让规则被丢弃而 CI 仍通过；一名评论者支持改为失败关闭，但尚无维护者确认。#1895 则报告 Windows 工作树中归档重命名触发权限错误后，规格写入也被回滚。两者均是尚未关闭的用户复现，不能外推为普遍故障。官方概览也承认微小修复未必值得这套流程成本，且自由迭代依赖团队自律。

## 附带链接
- [GitHub Repo](https://github.com/Fission-AI/OpenSpec)
- [官方文档](https://openspec.dev/)
- [架构概览](https://github.com/Fission-AI/OpenSpec/blob/main/docs/overview.md)
- [问题 #1892](https://github.com/Fission-AI/OpenSpec/issues/1892)
- [问题 #1895](https://github.com/Fission-AI/OpenSpec/issues/1895)
- [Spec Kit](https://github.com/github/spec-kit)
- [Kiro 文档](https://kiro.dev/docs/)
