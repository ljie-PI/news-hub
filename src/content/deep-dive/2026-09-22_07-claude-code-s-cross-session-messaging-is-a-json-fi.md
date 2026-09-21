---
title: "Claude Code's cross-session messaging is a JSON file and a Unix socket"
date: "2026-09-22"
generated: "2026-09-22 07:00"
source: "Reddit"
slug: "2026-09-22_07-claude-code-s-cross-session-messaging-is-a-json-fi"
summary: "LeonKohli 于九月二十一日发帖拆解 Claude Code 跨会话消息，并发布把 Codex 任务伪装成可达会话的桥接器。官方周报确认该能力在二点一二二四版上线：Claude 以 ListAgents 发现会话、用 SendMessage 传递文本，而非共享对话历史或文件。"
---

# Claude Code's cross-session messaging is a JSON file and a Unix socket

## 事件背景

LeonKohli 于九月二十一日发帖拆解 Claude Code 跨会话消息，并发布把 Codex 任务伪装成可达会话的桥接器。官方周报确认该能力在二点一二二四版上线：Claude 以 ListAgents 发现会话、用 SendMessage 传递文本，而非共享对话历史或文件。

## 核心观点 / 产品机制

官方文档确认，同机会话以磁盘注册文件互相发现，在苹果与 Linux 上通过逐会话套接字投递，数据不经过 Anthropic；容器与宿主因文件系统隔离而不可互见。消息不能代替用户批准，接收端权限规则照常生效，并可用 crossSessionInbound 接受、暂存或拒绝。帖子进一步给出注册目录、进程号字段、套接字路径、零六零零权限及换行分隔 JSON 帧；这些是作者逆向所得，并非官方承诺的稳定协议。其桥接仓库只能证明适配实现存在，不等于 Anthropic 支持第三方客户端。

## 社区热议与争议点

本轮 Atom 共四个条目，即主帖加三个可见评论。KH10304 说自己在交接新代理时意外发现两端已先联系，作者回复称这正是其继续拆解的起点；andrewcooke 则让意见相左的两个会话直接沟通，称运行正常。样本全为正面体验，没有安全质疑或失败案例，且订阅源只是实时可见子集，不能代表完整评论区。

## 行业影响与未来展望

这套轻量发现与本地投递可减少并行工作树间的人工转述，也给构建跨代理桥接留下入口。但它传的是文本而非状态迁移；精确帧格式又来自逆向，版本升级可能破坏兼容。可靠编排仍需稳定身份、失败重试、权限审计和官方协议边界。

## 附带链接

- [Reddit 原帖](https://www.reddit.com/r/ClaudeAI/comments/1wmnqyu/claude_codes_crosssession_messaging_is_a_json/)
- [Claude Code 官方文档](https://code.claude.com/docs/en/cross-session-messaging)
- [官方二点一二二四版周报](https://code.claude.com/docs/en/whats-new/2026-w32)
- [作者桥接仓库](https://github.com/LeonKohli/claude-uds-bridge)
