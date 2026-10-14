---
title: "razorpay/slashdocs"
date: "2026-10-15"
generated: "2026-10-15 07:00"
source: "GitHub"
slug: "2026-10-15_07-razorpay-slashdocs"
summary: "slashdocs 把智能体生成的自包含 HTML 变成团队可审阅的文档：智能体经 CLI、REST 或远程 MCP 发布，成员在浏览器按原文位置评论，智能体再读取反馈并推送新版本。它针对长报告塞进聊天后难分享、难定位意见、难确认最新版的问题，面向已采用编码智能体且愿意自托管的团队。批次快照为 286 星、36 个分叉、当日新增 42 星；本次 REST 查询的前两项仍为 286 与 36，口径未混用。"
---

# razorpay/slashdocs

## 定位与痛点剖析

slashdocs 把智能体生成的自包含 HTML 变成团队可审阅的文档：智能体经 CLI、REST 或远程 MCP 发布，成员在浏览器按原文位置评论，智能体再读取反馈并推送新版本。它针对长报告塞进聊天后难分享、难定位意见、难确认最新版的问题，面向已采用编码智能体且愿意自托管的团队。批次快照为 286 星、36 个分叉、当日新增 42 星；本次 REST 查询的前两项仍为 286 与 36，口径未混用。

## 核心架构与技术细节

默认分支显示，服务端是单个 Go 二进制，内嵌 React/Vite 前端、CLI 下载件与沙箱桥；Postgres 保存元数据、评论、授权、会话和搜索文本，S3 兼容存储保存不可变 HTML 版本。推送携带基础版本号，以乐观并发拒绝陈旧写入。应用域与渲染域必须使用不同主机名，上传内容在沙箱 iframe 中运行；同主机配置默认阻止启动。远程 MCP 采用授权码与 PKCE，也支持服务账号令牌。部署提供 Docker、Helm 和裸机路径，但生产环境仍需自备 Postgres、对象存储、OIDC 与双域名。

## 竞品对比与生态站位

Notion 以页面、属性和块 API 为核心，也提供评论接口；HedgeDoc 聚焦实时协作 Markdown。slashdocs 不以块编辑或同屏写作为中心，而把任意网页当可移植工件，换来图表、交互布局、不可变版本以及 CLI/MCP 闭环。代价是 HTML 工件更重，运维依赖更多，生态成熟度也明显低于两者。

## 开发者反馈与局限性

稳定版从 v0.1.0 到 v0.2.1 集中发布于两天内，迭代快也说明接口仍年轻。四项均为开放报告：#102 指出 `--json` 在错误、空响应和批量命令下破坏契约，评论者已在 v0.2.1 复测；修复 PR #114 尚未合并。#187 报告重复文本会让评论锚点跳位，对应 PR #194 也仍开放。#198 报告创建评论时不校验缺失或歧义锚点；#201 报告短语搜索约在第 16383 词后失效、可见文本超过 256 KiB 后不再索引。后二者暂无维护者确认或发布修复，不能提升为已确认缺陷。

## 附带链接

- [GitHub 仓库](https://github.com/razorpay/slashdocs)
- [项目官网](https://tryslashdocs.razorpay.com)
- [自托管与部署文档](https://github.com/razorpay/slashdocs/blob/master/docs/self-hosting.md)
- [安全说明](https://github.com/razorpay/slashdocs/blob/master/SECURITY.md)
- [版本发布](https://github.com/razorpay/slashdocs/releases)
- [issue #102](https://github.com/razorpay/slashdocs/issues/102)
- [issue #187](https://github.com/razorpay/slashdocs/issues/187)
- [issue #198](https://github.com/razorpay/slashdocs/issues/198)
- [issue #201](https://github.com/razorpay/slashdocs/issues/201)
- [Notion 页面接口](https://developers.notion.com/reference/post-page)
- [Notion 评论接口](https://developers.notion.com/reference/retrieve-a-comment)
- [HedgeDoc 仓库](https://github.com/hedgedoc/hedgedoc)
