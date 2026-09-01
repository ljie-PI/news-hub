---
title: "Kilo Code for JetBrains"
date: "2026-09-02"
generated: "2026-09-02 07:00"
source: "PH"
slug: "2026-09-02_07-kilo-code-for-jetbrains"
summary: "2026年9月1日，Kilo Code以“原生JetBrains插件”再次登上Product Hunt；本批官方接口冻结为418票、69条评论、日榜第一。它并非首次适配：团队承认旧版只是把VS Code体验嵌进网页视图，此次才重写界面，回应原生交互与远程开发需求。"
---

# Kilo Code for JetBrains

## 事件背景

2026年9月1日，Kilo Code以“原生JetBrains插件”再次登上Product Hunt；本批官方接口冻结为418票、69条评论、日榜第一。它并非首次适配：团队承认旧版只是把VS Code体验嵌进网页视图，此次才重写界面，回应原生交互与远程开发需求。

## 核心观点 / 产品机制

插件前端采用Kotlin与Swing，后端调用随插件下载或捆绑的Kilo Core；所以“原生”主要指文件索引、工具窗口、差异视图等IDE整合，不代表模型在本机运行。它共享配置文件，可按工具设置允许、询问或拒绝；Agent Manager以Git工作树隔离并行任务，内联呈现改动和拉取请求。模型可走官方网关、自带密钥或本地服务。发布首帖曾写“Swift UI”，但官方博客与仓库均明确为Swing，应以后者为准。

## 社区热议与争议点

官方接口按帖子1198993分页取得39条顶层评论、33条回复；身份虽被脱敏，正文可与公开页面交叉。Artur追问Claude订阅，Maker Kirill只答可自带密钥，未真正确认订阅可用。Varun问能否按任务换模型，Kirill称可为模式或子代理设默认模型，属产品方口径。Rohit质疑超大代码库，产品方承认会停用快照回滚，JetBrains索引仍在路上。Sawyer担心五百多模型难选，产品方也承认现有成本与能力说明“不够”，拟接入榜单洞察。

## 行业影响与未来展望

它把竞争从代码补全推向跨IDE、并行代理与可审阅变更，也让开放模型选择进入JetBrains主场。公开问题还显示，无状态MCP服务器可能因可选SSE端点返回405而连接失败，协议兼容仍需打磨。不过截至调研时，Marketplace仅2.9分、70份评分；原生重写之后的权限一致性、远程可靠性和功能补齐，仍比模型数量更决定留存。

## 附带链接

- [Product Hunt发布页](https://www.producthunt.com/posts/kilo-code-for-jetbrains)
- [产品官网](https://kilo.ai/jetbrains)
- [JetBrains使用文档](https://kilo.ai/docs/code-with-ai/platforms/jetbrains)
- [JetBrains Marketplace](https://plugins.jetbrains.com/plugin/28350-kilo-code)
- [开源仓库](https://github.com/Kilo-Org/kilocode)
