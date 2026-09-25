---
title: "mvschwarz/openrig"
date: "2026-09-26"
generated: "2026-09-26 07:00"
source: "GitHub"
slug: "2026-09-26_07-mvschwarz-openrig"
summary: "OpenRig 是把 Claude Code、Codex 等终端代理编成持久团队的本地控制面，面向同时维护多会话、重启后难恢复上下文的开发者。用户以 YAML 定义席位、Pod、边和连续性策略，再统一启动、寻址、通信与恢复。批次快照为 440 星、57 次派生、当日新增 86 星；查询 GitHub REST 时前两项一致。"
---

# mvschwarz/openrig

## 定位与痛点剖析

OpenRig 是把 Claude Code、Codex 等终端代理编成持久团队的本地控制面，面向同时维护多会话、重启后难恢复上下文的开发者。用户以 YAML 定义席位、Pod、边和连续性策略，再统一启动、寻址、通信与恢复。批次快照为 440 星、57 次派生、当日新增 86 星；查询 GitHub REST 时前两项一致。

## 核心架构与技术细节

当前默认分支为 `main`，源码是 TypeScript 单仓，拆为 daemon、CLI、TUI 与维护模式的旧网页 UI。CLI、TUI、MCP 经 Hono HTTP 守护进程进入领域服务，SQLite 保存状态，tmux 承载可直接接管的代理进程，运行时适配器连接 Claude、Codex、终端及 Pi。RigSpec 负责声明拓扑；快照记录席位与启动上下文，恢复时明确区分续接、新建和失败。项目要求 Node 20、22 或 24，并会写入信任设置、钩子和工作区资源，部署前应先审查干跑计划。

## 竞品对比与生态站位

LiteLLM-Labs/lite-harness 侧重以统一的 Python、TypeScript 流式接口切换多种代理，适合把编码代理嵌入程序，但官方 README 仍标为预览且尚未发布软件包。OpenRig 不统一模型调用协议，而把原生终端会话、持久拓扑、人工接管和本机恢复做成产品，因此更像“代理团队的进程与状态编排层”；代价是依赖 tmux、本地守护进程及各供应商登录与额度。

## 开发者反馈与局限性

开放 issue #51 指出当前 Claude 席位启动姿态只有 `acceptEdits` 与完全绕过权限两档；默认分支 `yolo-mode.ts` 仍可验证这一点，缺少适合无人值守又保留保护的 `auto` 中间档。已合并 PR #50 为 0.5.15 改进 Codex 首次启动恢复、Pi 错误显示与终端输入封帧，说明项目在快速修补真实运行边界。README 还明确提示多席位会触发供应商限流；本地配置写入与实验性旧网页 UI 也提高运维成本。

## 附带链接

- 仓库：https://github.com/mvschwarz/openrig
- 官网与文档：https://openrig.dev ｜ https://openrig.dev/docs
- 元数据：https://api.github.com/repos/mvschwarz/openrig
- 反馈与修复：https://github.com/mvschwarz/openrig/issues/51 ｜ https://github.com/mvschwarz/openrig/pull/50
- 替代方案：https://github.com/LiteLLM-Labs/lite-harness
