---
title: "Claude Code reads AGENTS.md only when telemetry is on [fixed]"
date: "2026-09-24"
generated: "2026-09-24 07:00"
source: "HN"
slug: "2026-09-24_07-claude-code-reads-agents-md-only-when-telemetry-is"
summary: "Claude Code 2.1.277 宣布：项目路径没有 `CLAUDE.md` 时改读 `AGENTS.md`。作者在 macOS 版 2.1.280 复现：空目录仅放含暗号的 `AGENTS.md`，以 `claude -p` 提问且禁止主动读文件；每种配置跑两次。只要 `DISABLE_TELEMETRY` 或 `CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC` 存在，即使值为 `0`，文件仍被无提示跳过；首轮尚未缓存开关、第三方网关及当时的 Bedrock、Vertex 也可能触发。故原题只适用于该版本与这些条件，并非 Claude Code 永久行为。"
---

# Claude Code reads AGENTS.md only when telemetry is on [fixed]

## 事件背景
Claude Code 2.1.277 宣布：项目路径没有 `CLAUDE.md` 时改读 `AGENTS.md`。作者在 macOS 版 2.1.280 复现：空目录仅放含暗号的 `AGENTS.md`，以 `claude -p` 提问且禁止主动读文件；每种配置跑两次。只要 `DISABLE_TELEMETRY` 或 `CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC` 存在，即使值为 `0`，文件仍被无提示跳过；首轮尚未缓存开关、第三方网关及当时的 Bedrock、Vertex 也可能触发。故原题只适用于该版本与这些条件，并非 Claude Code 永久行为。

## 核心观点 / 产品机制
2.1.280 包中内置 `agents-md` Mod 的默认值是 `false`，远程开关 `tengu_agents_md_mod` 拉取失败便回落为关闭。清空两个变量的会话级 `--settings` 可在后续会话生效；稳定绕法是让 `CLAUDE.md` 写入 `@AGENTS.md`。Anthropic 工程师 mpoteat 称其为需要远程熔断的发布瑕疵，并指向 2.1.281。该版已于 9 月 23 日发布；本轮核对 Linux 发布包，`--version` 为 2.1.281，且同段默认值已由 `false` 改为 `true`。但发行说明未单列此修复，相关 issue 仍开放，不能宣称所有渠道都已实测恢复。

## 社区热议与争议点
批次冻结为 435 分、242 条评论；本轮 Algolia 实取前 100 个可见节点并触及上限。四个具体例子：piltdownman 赞赏团队快速承认并披露；pdpi 认为用小功能试验插件、保留熔断合理；rickette 反问读取另一文件名何需整套插件，批评过度工程；nijave 则称无遥测拿不到阶段功能是旧现象，标题略显吸睛。支持方强调大规模发布的回滚能力，反方聚焦本地规则被远程开关静默改变。

## 行业影响与未来展望
事件提醒代理工具：项目指令属于供应链配置，漏载会让模型“看似不听话”，比显式报错更难排障。团队应固定最低版本、在 CI 放暗号探针，并展示实际加载文件与优先级；厂商则应让远程开关失联时回落到已发布行为，而非把隐私选择和本地能力耦合。

## 附带链接
- [原文](https://blog.szypowi.cz/p/claude-code-reads-agents.md-only-when-telemetry-is-on/)
- [Hacker News 讨论](https://news.ycombinator.com/item?id=49814947)
- [GitHub issue #95690](https://github.com/anthropics/claude-code/issues/95690)
- [Claude Code v2.1.281](https://github.com/anthropics/claude-code/releases/tag/v2.1.281)
