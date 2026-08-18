---
title: "I got tired of maintaining 10 different config files for Claude Code, Cursor, and Codex, so I built a single-source harness for all of them"
date: "2026-08-19"
generated: "2026-08-19 07:00"
source: "Reddit"
slug: "2026-08-19_07-i-got-tired-of-maintaining-10-different-config-fil"
summary: "帖子作者同时使用 Claude Code、Cursor、Codex、Windsurf 与 Antigravity，反复维护各自规则文件后遭遇“规则与上下文漂移”：一处更新了禁止读取密钥、破坏性"
---

# I got tired of maintaining 10 different config files for Claude Code, Cursor, and Codex, so I built a single-source harness for all of them

## 事件背景

帖子作者同时使用 Claude Code、Cursor、Codex、Windsurf 与 Antigravity，反复维护各自规则文件后遭遇“规则与上下文漂移”：一处更新了禁止读取密钥、破坏性命令等边界，另一工具仍沿用旧配置。为把多客户端配置从复制粘贴变成可审计流程，作者发布了 Agnostic AI Harness。仓库与帖子均在八月十八日出现，项目仍属发布初期。

## 核心观点 / 产品机制

项目把 `core/rules/global-rules.md` 作为单一真源，由同步引擎读取目标映射，为十八种客户端生成对应路径和前言；`sync:check` 比较编译结果，`sync` 写入规则并链接共享技能目录。仓库还提供规则合并、技能归集和四级经验蒸馏：错误先成为观察与仓库事实，多日重复后再晋升为通用规则或核心特质。安全策略可本地执行，也可选接 DashClaw 审批高风险动作；这些能力目前主要由项目代码与说明自证。

## 社区热议与争议点

本轮Reddit实时评论被封，未逐字取得评论；以下为页面数据与公开资料支持的争点，并非网友引语。

- **支持点一：**统一更新可减少遗漏，让密钥访问和危险命令边界跨工具同步。
- **支持点二：**目标映射、差异检查与合并命令把散落约定变成可版本化、可复查资产。
- **质疑点一：**单一真源也会集中放大错误；一条误写规则可能同时污染全部客户端。
- **质疑点二：**仓库刚创建，暂无正式发布或标签；十八目标的长期兼容性、升级迁移和真实环境覆盖尚缺独立验证。

## 行业影响与未来展望

它反映编码代理竞争正从模型能力转向“工作约定层”：团队需要把规则、技能、记忆与审批从某一厂商配置中解耦。若后续补齐版本化适配器、回滚、迁移测试和多人权限，类似中间层可能成为代理开发环境的基础设施；若维护速度跟不上各客户端格式变化，统一层反而会成为新的漂移源。

## 附带链接

- [Reddit 原帖](https://www.reddit.com/r/AI_Agents/comments/1vs1ls8/i_got_tired_of_maintaining_10_different_config/)
- [Agnostic AI Harness 仓库](https://github.com/ucsandman/agnostic-harness)
- [项目 README](https://github.com/ucsandman/agnostic-harness/blob/master/README.md)
