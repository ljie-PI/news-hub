---
title: "I made an Obsidian plugin to organize Claude Code skills and other AI tools"
date: "2026-10-05"
generated: "2026-10-05 07:00"
source: "Reddit"
slug: "2026-10-05_07-i-made-an-obsidian-plugin-to-organize-claude-code"
summary: "作者 notenerd 因 Claude Code、Codex 等工具的技能、代理、命令和规则散落在全局与项目目录，做了免费 MIT 许可的 Obsidian 桌面插件 AI Skills Manager。目标帖 Atom 已核对为 `t3_1wxpkrj`，标题一致；正文称早期分享后，Windows 实机测试、遗留技能与自动记忆反馈推动了安全删除、用量清理和记忆管理。"
---

# I made an Obsidian plugin to organize Claude Code skills and other AI tools

## 事件背景

作者 notenerd 因 Claude Code、Codex 等工具的技能、代理、命令和规则散落在全局与项目目录，做了免费 MIT 许可的 Obsidian 桌面插件 AI Skills Manager。目标帖 Atom 已核对为 `t3_1wxpkrj`，标题一致；正文称早期分享后，Windows 实机测试、遗留技能与自动记忆反馈推动了安全删除、用量清理和记忆管理。

## 核心观点 / 产品机制

插件直接扫描各工具真实目录，不复制原文件；标签、收藏等元数据另存为 vault 内 Markdown。源码证实它读取 Claude Code 与 Codex 会话记录，统计调用与最近使用时间；启停会把文件或链接移入同级禁用目录，自动记忆还会同步改写 `MEMORY.md`。删除进入系统废纸篓，插件包切换前备份设置文件；MCP 仅查看。权限边界也很明确：仅桌面可用，可读写 vault 外目录，并调用本机 `git` 获取、安装和更新 GitHub 内容；健康检查针对格式、路径和重复描述，不是恶意技能审计。

## 社区热议与争议点

目标帖 RSS 共三条 entry，仅一条非机器人评论，unkownuser436 评价“looks cool”，没有作者回复，当前样本不足以形成正反共识。为还原作者所说的早期反馈，相关前帖 RSS 中，harthren_developing 质疑同一技能被多个工具软链接后，禁用是否会误伤共享源，并要求显示确切变更路径；作者回复称只移动所选工具的链接，其他链接与源文件不动，随后又称该建议已在 0.1.7 加入确认、断链检测和文件管理器定位。后两条属于作者口径，不是独立复现。

## 行业影响与未来展望

它把“提示词文件堆”提升为可观察、可清理的本地资产库，顺应多代理工具共存与技能格式趋同；会话用量、上下文估算和真实启停比单纯目录浏览更接近控制面。但插件拥有广泛文件写权限，GitHub 来源也不等于可信，团队采用仍应配合来源审查、版本固定和备份。若后续补上变更历史、MCP 安全编辑及恶意内容检测，才可能从个人整理器走向治理工具。

## 附带链接

- [Reddit 目标帖](https://www.reddit.com/r/ClaudeCode/comments/1wxpkrj/i_made_an_obsidian_plugin_to_organize_claude_code/)
- [相关前帖](https://www.reddit.com/r/ClaudeCode/comments/1wogzy0/i_made_an_obsidian_plugin_to_organize_claude_code/)
- [Obsidian 插件页](https://community.obsidian.md/plugins/ai-skills-manager)
- [GitHub 仓库](https://github.com/NoteNerdOfficial/ai-skills-manager)
- [Windows 安全改进 PR](https://github.com/NoteNerdOfficial/ai-skills-manager/pull/1)
