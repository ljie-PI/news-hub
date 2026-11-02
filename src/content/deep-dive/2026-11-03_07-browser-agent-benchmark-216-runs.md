---
title: "I ran the same browser job 216 times with Claude Code and Codex. A script beat every agent run, and the best browser tool depended on the agent"
date: "2026-11-03"
generated: "2026-11-03 07:00"
source: "Reddit"
slug: "2026-11-03_07-browser-agent-benchmark-216-runs"
summary: "Maximilian Fabian Kirchner让Claude Code（Opus 5.5）与Codex（GPT 6 Astra）在同一商业网页应用中选部门、另开报告、核对并保存500行，再关页返回。三种工具、三种连接方式组成18套配置，每套在macOS、WSL、Windows各跑4次，共216次；以下数字均为作者本地自测。"
---

# I ran the same browser job 216 times with Claude Code and Codex. A script beat every agent run, and the best browser tool depended on the agent

## 事件背景

Maximilian Fabian Kirchner让Claude Code（Opus 5.5）与Codex（GPT 6 Astra）在同一商业网页应用中选部门、另开报告、核对并保存500行，再关页返回。三种工具、三种连接方式组成18套配置，每套在macOS、WSL、Windows各跑4次，共216次；以下数字均为作者本地自测。

## 核心观点 / 产品机制

固定版本、中等推理、全新会话下，成功须同时满足保存结果与参考值完全一致、页面状态正确、只用指定工具、不求助且30分钟内结束，最终216次全过。Codex中Chrome DevTools“CLI＋skill”中位输入19.7万词元、75秒；Claude Code中agent-browser无skill最省，为30.4万、96秒，Chrome DevTools MCP最快为72秒但用51.7万。作者另让Python经CDP跑258次，中位1.5秒、最慢10.3秒，仍快于代理最快59秒；但未计脚本编写成本。公开文章列出逐次表和版本，却因应用、报告、提示、脚本、harness及原始日志未公开，无法精确复现，也不能把单任务排名泛化。

## 社区热议与争议点

逐帖Atom共9个entry：主帖1、机器人1、普通评论7，未见作者回复。HeadDaikon3411与TakenakaKerda-17支持“代理找一次选择器，稳定后跑脚本”。InOneSecretary指出216次零失败只能排成本和速度，建议用改标签、增弹窗、延迟加载等扰动测恢复。zer0_state补充重复元素会令引用点击匹配多个目标，需限定容器。Sentient_Dawn则警告脚本可能无报错却读错登录或双重验证页面，应等待状态变化并失败即停；这只是RSS可见子集，不代表社区共识。

## 行业影响与未来展望

更合理的分层是让代理探索和修复，让确定性脚本执行高频稳定流程，并以精确断言、显式失败和扰动回归守住边界。工具选择应按具体代理、连接方式、任务变动率和上下文开销实测，而非追逐单一冠军；下一步需要公开任务、等价预算、随机化界面、失败率和置信区间。

## 附带链接

- [Reddit原帖](https://www.reddit.com/r/AI_Agents/comments/1xm0ac4/i_ran_the_same_browser_job_216_times_with_claude/)
- [作者完整报告与逐次表](https://maximilianfabian.dev/blog/browser-tools-for-agents/)
- [agent-browser](https://github.com/vercel-labs/agent-browser/tree/v0.39.1/skills/agent-browser)
- [Playwright CLI](https://github.com/microsoft/playwright-cli/tree/v0.1.22/skills/playwright-cli)
- [Chrome DevTools CLI](https://github.com/ChromeDevTools/chrome-devtools-mcp/tree/chrome-devtools-mcp-v1.11.0/skills/chrome-devtools-cli)
