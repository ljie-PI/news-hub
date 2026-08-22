---
title: "browser-use/browser-harness"
date: "2026-08-23"
generated: "2026-08-23 07:00"
source: "GitHub"
slug: "2026-08-23_07-browser-use-browser-harness"
summary: "Browser Harness 面向 Claude Code、Codex 等编码代理用户，接入真实 Chrome，复用登录态完成交互、抓取与测试。它解决固定脚本遇新控件失效、隔离浏览器需重复登录的问题。README 所称“可完成任何任务”和“越用越强”属于项目自报；效果仍取决于模型能否写出可靠助手。"
---

# browser-use/browser-harness

## 定位与痛点剖析

Browser Harness 面向 Claude Code、Codex 等编码代理用户，接入真实 Chrome，复用登录态完成交互、抓取与测试。它解决固定脚本遇新控件失效、隔离浏览器需重复登录的问题。README 所称“可完成任何任务”和“越用越强”属于项目自报；效果仍取决于模型能否写出可靠助手。

## 核心架构与技术细节

当前 GitHub API 与项目清单均显示它是 Python 项目，并非 Rust；0.1.9 尚属早期版本，要求 Python 3.11 以上。后台守护进程持有单条 CDP WebSocket，再经本机进程间通信转发命令：类 Unix 系统使用权限收紧的 Unix 套接字，Windows 使用带随机令牌的回环端口。命令行从标准输入执行预导入助手的 Python；核心源码受保护，代理只改本地 `agent_helpers.py`，并可沉淀站点技能。它以无障碍树、坐标点击和原始 CDP 为主，标签默认在后台运行。

## 竞品对比与生态站位

Playwright 提供跨 Chromium、Firefox、WebKit 的确定性测试、自动等待与断言；BrowserGym 与 WebArena 更偏可复现实验、基准和自托管评测。Browser Harness 聚焦真实浏览器、现成会话与代理自写助手，接入轻，但缺少前两类工具的跨浏览器覆盖和标准评测。在 Browser Use 生态中，它是本地薄执行层；批量、代理和隐身能力由商业云承接。

## 开发者反馈与局限性

近期开放报告显示边界仍在收敛：问题 #630 称 0.1.9 在 Windows 后台标签滚动会超时；#631 称 Chrome 144 以后守护进程反复重连，导致重复授权弹窗；#638 称邮箱验证后设备登录仍循环失败。三者均无维护者评论，宜视为个案报告而非已确认通病。未合并的 PR #639 还拟修正守护日志暴露完整远程 CDP 地址的问题。真实登录态加可写助手也放大隐私与任意代码风险，共享本地浏览器不适合并发代理。

## 附带链接

- [项目仓库](https://github.com/browser-use/browser-harness)
- [安装说明](https://github.com/browser-use/browser-harness/blob/main/install.md)
- [操作技能](https://github.com/browser-use/browser-harness/blob/main/SKILL.md)
- [问题 #630](https://github.com/browser-use/browser-harness/issues/630) · [问题 #631](https://github.com/browser-use/browser-harness/issues/631) · [问题 #638](https://github.com/browser-use/browser-harness/issues/638) · [PR #639](https://github.com/browser-use/browser-harness/pull/639)
- [Playwright](https://github.com/microsoft/playwright) · [BrowserGym](https://github.com/ServiceNow/BrowserGym) · [WebArena](https://github.com/web-arena-x/webarena) · [Browser Use](https://github.com/browser-use/browser-use)
