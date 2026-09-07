---
title: "jo-inc/camofox-browser"
date: "2026-09-08"
generated: "2026-09-08 07:00"
source: "GitHub"
slug: "2026-09-08_07-jo-inc-camofox-browser"
summary: "这是面向人工智能代理的反检测浏览器服务，而非新内核：它把上游 Camoufox 封装为接口、模型上下文协议及 OpenClaw 工具，解决普通无头浏览器易被识别、原始网页源码耗费令牌、登录态与任务隔离难管理等问题。批次快照为九千六百四十三星、当日新增二百八十五星。"
---

# jo-inc/camofox-browser

## 定位与痛点剖析

这是面向人工智能代理的反检测浏览器服务，而非新内核：它把上游 Camoufox 封装为接口、模型上下文协议及 OpenClaw 工具，解决普通无头浏览器易被识别、原始网页源码耗费令牌、登录态与任务隔离难管理等问题。批次快照为九千六百四十三星、当日新增二百八十五星。

## 核心架构与技术细节

当前公开包为一点十四点零，要求 Node.js 二十二及以上，依赖 camoufox-js、playwright-core 与 Express。反检测发生在上游 Firefox 的 C++ 层；本仓库维护“单浏览器—用户上下文—会话键—标签页”层级，以可访问性快照和稳定元素引用驱动点击，超长快照可分页。插件总线承载持久化、远程桌面等扩展。README 所称快照缩小约九成、空闲内存约四十兆均属自报口径。

## 竞品对比与生态站位

Playwright 以同一接口覆盖 Chromium、Firefox、WebKit 及多种语言，适合通用测试；直接用 Camoufox 更贴近内核及 Python 工作流。本项目牺牲跨浏览器广度，换取接口、模型上下文协议、会话回收、代理与登录态；相较修改 Playwright 的 Rebrowser 路线，它采用 Firefox 分支并增加代理服务层。

## 开发者反馈与局限性

一点十四点零已合并拉取请求九三二四，将故障恢复收敛到单用户；维护者在议题八五五四确认已发布。开放议题一零零四二报告 Windows 进程树清理仍按 Linux 条件实现，议题九五二零指出同版容器仍内置 Firefox 一三五；自动遥测议题九四三零聚合了一百四十条事件循环停顿重复报告，且含一点十四点零实例。这些只是报告层证据，不能外推为必现；生产使用仍应压测长会话、核对容器内核版本，并按需关闭或自托管默认遥测。

## 附带链接

- [代码仓库](https://github.com/jo-inc/camofox-browser)
- [一点十四点零发布说明](https://github.com/jo-inc/camofox-browser/releases/tag/v1.14.0)
- [恢复修复拉取请求](https://github.com/jo-inc/camofox-browser/pull/9324)
- [开放议题列表](https://github.com/jo-inc/camofox-browser/issues)
- [上游 Camoufox 文档](https://camoufox.com)
