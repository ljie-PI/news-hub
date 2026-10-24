---
title: "I built an open-source Telegram bridge for OpenCode, focused on reliability and remote control ."
date: "2026-10-25"
generated: "2026-10-25 07:00"
source: "Reddit"
slug: "2026-10-25_07-opencode-telegram-bridge"
summary: "十月二十四日，作者发布独立、采用MIT许可的OpenCode Telegram桥接器，希望离开电脑后仍能监督长任务、切换会话、审批权限和急停。逐帖Atom核得六个条目：一个未截断主帖与五条真实评论；它们只是当时可见子集，并非完整评论区。"
---

# I built an open-source Telegram bridge for OpenCode, focused on reliability and remote control .

## 事件背景

十月二十四日，作者发布独立、采用MIT许可的OpenCode Telegram桥接器，希望离开电脑后仍能监督长任务、切换会话、审批权限和急停。逐帖Atom核得六个条目：一个未截断主帖与五条真实评论；它们只是当时可见子集，并非完整评论区。

## 核心观点 / 产品机制

桥接器通过本机OpenCode HTTP API提交任务，以SSE推送文本和工具进度；源码把Telegram长轮询、队列调度、事件流、权限观察器和定时器分开，并为每个聊天启动独立任务线程。SSE断线会指数退避，完成状态仍以消息轮询的空闲标记为准；每聊天最多缓存五条后续指令。会话、忙碌状态、策略及更新偏移量以临时文件加原子替换持久化，重启后可报告遗留任务。权限依次经过强制拒绝规则、动作规则和审批模式，且聊天与发送者都须在白名单。离线测试本轮通过，但实时测试默认不运行。

## 社区热议与争议点

RSS中的五条均为普通评论，未见作者回复。Otherwise_Wave9374要求破坏性操作展示确切命令、目录和文件，并补短会话、急停及只追加日志；blehismyname认为Termux加tailnet已能远程终端，只缺通知；j0s3f主张OpenCode自带网页界面配VPN功能更多。正面一方中，CodeNomad维护者SeaworthinessFar56肯定重启恢复和权限处理，并认为聊天适合快速审批，完整客户端更适合审查差异与长历史。

## 行业影响与未来展望

这类工具把聊天软件变成代理控制面，竞争焦点将从“能发提示”转向状态一致性、失败可见性与最小权限。但仓库创建仅两天、抓取时仅两星、无公开问题单，十个已关闭条目全是合并请求；只验证Linux与systemd，macOS、Windows未测，OpenCode实时契约也仅记录到2.1.2。其可靠性设计有源码与测试支撑，长期运行、跨版本兼容和安全隔离仍待独立验证；项目也明确文件防护只是防误操作，真正隔离需专用系统用户。

## 附带链接

- [Reddit原帖](https://www.reddit.com/r/opencodeCLI/comments/1xej0o2/i_built_an_opensource_telegram_bridge_for/)
- [逐帖Atom](https://www.reddit.com/r/opencodeCLI/comments/1xej0o2/.rss)
- [GitHub仓库](https://github.com/hix-pro/opencode-telegram)
- [兼容性说明](https://github.com/hix-pro/opencode-telegram/blob/master/docs/COMPATIBILITY.md)
- [公开问题与合并请求](https://github.com/hix-pro/opencode-telegram/issues?q=sort%3Aupdated-desc)
