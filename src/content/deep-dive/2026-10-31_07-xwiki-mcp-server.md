---
title: "MCP Server by XWiki"
date: "2026-10-31"
generated: "2026-10-31 07:00"
source: "PH"
slug: "2026-10-31_07-xwiki-mcp-server"
summary: "XWiki把知识库接入MCP代理，使模型可检索、维护页面与结构化数据。本批冻结为Product Hunt日榜第4、152票、38条评论；官方GraphQL复核时三项未变。产品仍标为测试版，热度不等于生产成熟度。"
---

# MCP Server by XWiki

## 事件背景

XWiki把知识库接入MCP代理，使模型可检索、维护页面与结构化数据。本批冻结为Product Hunt日榜第4、152票、38条评论；官方GraphQL复核时三项未变。产品仍标为测试版，热度不等于生产成熟度。

## 核心观点 / 产品机制

它是XWiki内可选、开源、自托管的扩展，暴露页面搜索、树、历史、链接、附件及对象模式工具；八个写入或删除工具默认关闭。浏览器登录需OIDC Provider与令牌认证，也可由客户端提供Basic凭据。代理继承所认证账号的权限，工具开关、空间过滤和跨Wiki范围只能收窄，不能越权；因此官方建议专用低权限账号，勿授予脚本、编程或管理员权。自托管服务器不代表数据必然留在本地，仍取决于所接模型和代理的部署位置。

## 社区热议与争议点

API取得14条顶层、18条回复，共32个可见节点，少于冻结的38条；两页顶层及所有回复均无下一页，但差额仍可能来自删除、折叠或计数口径。用户字段全脱敏；普通用户昵称仅由回复的@对象恢复，产品方回复无法绑定具体Maker。普通用户oleksii_sekundant赞成先只读、审核后再开写，产品方称这正是默认策略；pronskiy追问并发冲突，答复称可锁页、协同同步或手动合并；jcbuilds进一步问局部回滚，产品方承认只能整页还原，保留后续修改需人工复制段落，暴露了自动写入的实际成本。

## 行业影响与未来展望

这类产品把企业Wiki从RAG资料源推进为代理可操作的知识系统，结构化对象与历史记录比纯向量检索更适合可审计工作流。但落地关键不是工具数量，而是最小权限、写前审阅、提示注入防护与变更回滚。当前测试版还需验证跨客户端兼容性、冲突处理及真实大规模知识库效果。

## 附带链接

- [Product Hunt](https://www.producthunt.com/products/xwiki)
- [官方仓库](https://github.com/xwiki-contrib/ai-llm)
- [MCP Server管理文档](https://www.xwiki.org/xwiki/bin/view/documentation/extensions/admin/llm/mcp-server)
- [官方发布说明](https://xwiki.com/en/news/xwiki-mcp-server-connect-ai-to-your-wiki)
