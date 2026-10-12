---
title: "Codex CLI installs a persistent, self-updating background daemon by default"
date: "2026-10-13"
generated: "2026-10-13 07:00"
source: "HN"
slug: "2026-10-13_07-codex-cli-installs-a-persistent-self-updating-back"
summary: "Codex CLI 0.157.0 于九月把 `daemon_auto_start` 升为稳定特性并默认开启。用户 Yihua-Liu-1997 随后在 issue #48195 要求改为选择加入：普通交互启动不应留下共享后台服务。截至调研，该 issue 仍为开放状态；最新稳定版 0.162.1 未宣布撤销默认值，主分支源码也仍设为开启。"
---

# Codex CLI installs a persistent, self-updating background daemon by default

## 事件背景

Codex CLI 0.157.0 于九月把 `daemon_auto_start` 升为稳定特性并默认开启。用户 Yihua-Liu-1997 随后在 issue #48195 要求改为选择加入：普通交互启动不应留下共享后台服务。截至调研，该 issue 仍为开放状态；最新稳定版 0.162.1 未宣布撤销默认值，主分支源码也仍设为开启。

## 核心观点 / 产品机制

启动编排在符合条件的交互会话中调用 `start_with_features`。若尚无 daemon 包，完整 CLI 包会被复制到独立托管目录；后台服务从该副本运行，因而可与包管理器安装的前台命令分离。官方 daemon 文档确认：符合条件的托管实例默认五分钟后检查更新，之后每小时检查；更新后可重启服务并替换更新器自身。报告者在 0.157.0 测得副本约 374MB，并指出首个启动会话的代理环境会被长期继承。当前主分支文档已提供 `autoUpdateEnabled=false` 和更新间隔设置，但自动启动的源码默认值仍为真。

## 社区热议与争议点

批次冻结热度为 399 points、217 comments；调研时 Algolia 显示 404 points，脚本实际取得 100 个可见节点并触及上限，不能视为完整评论区。支持方 dingaling911 认为工具变化快，像浏览器一样自动更新已属常态。反方 swatcoder 指出专业工具不应在项目进行中自行变化。isityettime 则强调系统包管理器本就能后台更新大量程序，每个应用自建安装器会越过用户对机器和版本的统一控制。

## 行业影响与未来展望

争议焦点不是“能否有 daemon”，而是共享服务、版本身份和更新权限是否默认透明。对个人用户，这是磁盘、代理环境与进程生命周期问题；对团队和持续集成，则直接影响可复现构建、版本冻结与长任务连续性。较稳妥的演进是按场景启用：远程控制可默认建议，纯 CLI 明示征得同意，并让包管理器、运行中服务版本和更新策略可审计。

## 附带链接

- [GitHub issue #48195](https://github.com/openai/codex/issues/48195)
- [Hacker News 讨论](https://news.ycombinator.com/item?id=50060694)
- [0.157.0 release](https://github.com/openai/codex/releases/tag/rust-v0.157.0)
- [默认开启的 PR #47179](https://github.com/openai/codex/pull/47179)
- [daemon 官方文档](https://github.com/openai/codex/blob/main/codex-rs/app-server-daemon/README.md)
