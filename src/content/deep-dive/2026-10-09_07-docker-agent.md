---
title: "Docker Agent"
date: "2026-10-09"
generated: "2026-10-09 07:00"
source: "HN"
slug: "2026-10-09_07-docker-agent"
summary: "Docker 将原名 cagent 的实验推进为 Docker Agent：用声明式配置构建、运行和分享代理，也可作为独立二进制执行。HN 批次冻结为293分、137条评论；调研时 Firebase 显示294分、137个后代，而指定 Algolia 命令实际取得100个可见节点并触及上限，三种口径不混算。"
---

# Docker Agent

## 事件背景

Docker 将原名 cagent 的实验推进为 Docker Agent：用声明式配置构建、运行和分享代理，也可作为独立二进制执行。HN 批次冻结为293分、137条评论；调研时 Firebase 显示294分、137个后代，而指定 Algolia 命令实际取得100个可见节点并触及上限，三种口径不混算。

## 核心观点 / 产品机制

项目以 Go 实现，YAML 为代理绑定模型、指令和工具，兼容多家云模型及本地 Docker Model Runner。根代理可把任务委派给独立子会话，或在同一会话中交接；MCP 扩展工具，OCI 仓库负责分发。沙箱并非默认容器：启用后由 sbx 或 Docker Sandbox 创建虚拟机，工作目录仍以读写方式挂载，并以默认拒绝策略限制网络。权限规则只是客户端护栏，官方也明确不把它视作安全边界。

## 社区热议与争议点

genghisjahn 肯定 sbx 的密钥哨兵替换和可观察隔离，认为运行 Claude 更安心。CBLT 则报告 Codex 返回超长内容后会话损坏、挂起且难恢复；Docker 成员承认该组合使用较少并表示改进。esafak 质疑 Docker 的优势本应是沙箱，却未成为项目主轴；维护者 dgageot 回应项目早于 Sandbox，现可在虚拟机中运行，但也刻意保持平台无关。

## 行业影响与未来展望

其关键站位不是再造模型，而是把代理配置、编排、权限与分发收束成类似 Compose 的工程层，并让 Claude Code、Codex 等外部执行器成为子代理。若 OCI 签名、MCP、A2A 与虚拟机隔离形成稳定组合，代理工作流会更便于复用和审计；但生态已高度同质化，默认遥测、可选沙箱、外部执行器绕过原生工具审批及会话脆弱性，仍会决定团队能否放心采用。

## 附带链接

- [Hacker News 讨论](https://news.ycombinator.com/item?id=49996259)
- [Docker Agent 仓库](https://github.com/docker/docker-agent)
- [官方文档](https://docker.github.io/docker-agent/)
- [沙箱机制](https://docker.github.io/docker-agent/configuration/sandbox/)
