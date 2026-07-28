---
title: "NanmiCoder/MediaCrawler"
date: "2026-07-28"
generated: "2026-07-28 07:00"
source: "GitHub"
slug: "2026-07-28_07-mediacrawler"
summary: "MediaCrawler 定位为「多平台自媒体数据采集工具」，覆盖小红书、抖音、快手、B站、微博、贴吧、知乎七大主流平台的公开笔记、视频与评论抓取。传统"
---

---
title: NanmiCoder/MediaCrawler
date: 2026-07-28
source: github
slug: mediacrawler
---
# NanmiCoder/MediaCrawler

## 定位与痛点剖析
MediaCrawler 定位为「多平台自媒体数据采集工具」，覆盖小红书、抖音、快手、B站、微博、贴吧、知乎七大主流平台的公开笔记、视频与评论抓取。传统爬虫最大的痛点是各平台的加密签名参数（如 x-s、a_bogus）需要繁琐的 JS 逆向，门槛极高且易随平台更新失效。该项目针对性地绕开了这一难题。

## 核心架构与技术细节
核心思路是基于 Playwright 浏览器自动化框架登录并保存登录态，利用保留登录态的浏览器上下文，通过执行 JS 表达式直接获取签名参数，从而「无需 JS 逆向」。项目默认采用 CDP 模式连接用户已有的 Chrome 浏览器（版本 ≥144），复用真实 Cookie 与扩展以降低风控检测风险，也可切回标准 Playwright 模式。功能上支持关键词搜索、指定帖子 ID、二级评论、创作者主页、登录态缓存、IP 代理池与评论词云图。依赖 uv 管理 Python 环境、Node.js ≥16，并提供 FastAPI + Vite 的 WebUI 可视化界面。

## 竞品对比与生态站位
相较需硬逆向的爬虫方案，其「浏览器上下文取签名」显著降低了门槛，可维护性更强。项目还衍生出闭源商业版 MediaCrawlerPro，主打断点续爬、多账号代理池、去除 Playwright 依赖、内容拆解 Agent 及 AI Agent Skill（对接 Claude Code/Cursor），形成开源引流、Pro 变现的生态。

## 开发者反馈与局限性
凭 58141 stars（当日 +349，自报口径）稳居 Trendshift 榜单，社区活跃。局限在于：仅供学习研究、明令禁止商用；强依赖浏览器与真实登录态，规模化与 Linux 无头部署受限（这些正是 Pro 版卖点）；平台风控更新仍可能导致失效。

## 附带链接
- 仓库：https://github.com/NanmiCoder/MediaCrawler
- Pro 版：https://github.com/MediaCrawlerPro
