---
title: "Notion 公开页面泄露所有编辑者邮箱地址：一个存在多年的隐私漏洞"
date: "2026-04-20"
source: "HN"
slug: "2026-04-20_07-notion-leaks-email-addresses"
summary: "---"
---

# Notion 公开页面泄露所有编辑者邮箱地址：一个存在多年的隐私漏洞

> 来源：[Hacker News](https://news.ycombinator.com/item?id=47824945) | [原始推文 @weezerOSINT](https://x.com/weezerOSINT/status/2045849358462222720)

---

## 1. 事件背景

2026 年 4 月，安全研究者 @weezerOSINT 在 Twitter/X 上公开披露了一个 Notion 的隐私问题：**所有公开（public）的 Notion 页面，都会泄露曾编辑过该页面的所有用户的邮箱地址、全名和头像。** 这条推文随后被提交到 Hacker News，引发广泛讨论。

值得注意的是，这并不是一个"新"漏洞——早在 **2020 年 9 月**，Reddit 的 r/Notion 社区就有用户发帖警告过同样的问题（通过浏览器 Network 面板的 `/loadPageChunk` API 调用即可看到编辑者信息）。时隔近六年，这个问题依然存在，说明 Notion 要么认为这是"设计如此"（by design），要么在优先级排序中长期忽视了它。

## 2. 核心机制

问题的技术细节极为简单：

- 访问任何一个 Notion 公开页面
- 向 Notion 的内部 API 发送一个 **POST 请求**（如 `loadPageChunk` 或类似端点）
- **无需任何身份验证**——不需要 Cookie、Token 或登录状态
- 返回的 JSON 数据中包含该页面所有编辑者的 **全名（full name）、邮箱地址（email）和头像（profile photo）**

正如 @weezerOSINT 在推文中所述：

> "every public Notion page is leaking the email addresses of everyone who edited it. zero authentication. no cookies. no tokens. one POST request returns full names, emails, and profile photos for every editor on the page."

这意味着：如果一家公司将内部 Wiki 设为公开访问，那么该公司所有参与编辑的员工邮箱地址都会被暴露。对于 OSINT（开源情报）研究者和潜在攻击者来说，这是一个极易利用的信息收集入口。

## 3. 社区热议与争议

HN 和 Reddit 社区对此事的讨论主要围绕几个焦点：

### "这是 Bug 还是 Feature？"
部分开发者认为，Notion 作为协作工具，显示编辑者信息是合理的产品设计——毕竟 Google Docs 也会显示协作者身份。但反对方指出，**公开页面的匿名访客不应该能获取编辑者的私人邮箱**，这与"查看谁在编辑"是完全不同的安全边界。

### 2020 年就有人报告，为何至今未修？
Reddit 上 2020 年的帖子标题直白地写道："PSA：我以为公开的 Notion 页面是匿名的，但你的姓名和邮箱会暴露在任何公开共享的页面上。" 有评论者当时就建议通过 HackerOne 等渠道进行负责任披露，但六年过去，问题依然存在。这让社区质疑 Notion 对用户隐私的重视程度。

### 企业用户面临的风险
多位评论者指出，许多公司使用 Notion 构建公开文档站（产品文档、招聘页面、开发者指南等），而员工往往不知道自己的邮箱地址因此暴露。这使得企业面临：
- **钓鱼攻击**：攻击者可轻松获取目标公司员工邮箱列表
- **社工攻击**：结合姓名和头像进行精准定向攻击
- **GDPR 合规风险**：在欧洲，未经同意暴露个人邮箱可能违反数据保护法规

### 与 Notion 历史隐私争议的关联
Notion 近年来的隐私争议并非孤例。2025 年曾有研究者披露 Notion AI 的 prompt injection 漏洞可导致私有页面数据外泄（CodeIntegrity 报告），加上 Notion 收购 Skiff Mail 后关闭服务引发的信任危机，这次邮箱泄露事件进一步加剧了社区对 Notion 隐私立场的质疑。

## 4. 行业影响与未来展望

这一事件对整个 SaaS 协作工具行业敲响了警钟：

- **API 设计中的隐私最小化原则**：公开页面的 API 返回数据不应包含编辑者的 PII（个人可识别信息），或至少应对未认证请求进行脱敏处理
- **默认安全（Secure by Default）**：用户将页面设为公开时，平台应明确告知哪些信息会被暴露，并提供精细化控制
- **长尾漏洞的治理**：一个已知六年的隐私问题未被修复，反映出许多公司对"低烈度"隐私风险的漠视——直到被公开披露引发舆论压力

对于正在使用 Notion 公开页面的团队，建议**立即审计公开页面**，评估是否有敏感人员信息因此暴露，并考虑使用匿名/服务账号进行公开内容的编辑。

---

## 5. 相关链接

- [HN 讨论帖](https://news.ycombinator.com/item?id=47824945)
- [原始推文 @weezerOSINT](https://x.com/weezerOSINT/status/2045849358462222720)
- [2020 年 Reddit 预警帖](https://www.reddit.com/r/Notion/comments/irni2d/psa_i_thought_public_notion_pages_were_anonymous/)
- [Notion AI 数据外泄漏洞报告 (CodeIntegrity, 2025)](https://www.codeintegrity.ai/blog/notion)
- [Notion AI Prompt Injection 披露 (PromptArmor)](https://www.promptarmor.com/resources/notion-ai-unpatched-data-exfiltration)
