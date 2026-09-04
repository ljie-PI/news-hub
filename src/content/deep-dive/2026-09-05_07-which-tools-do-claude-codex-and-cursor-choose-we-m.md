---
title: "Which tools do Claude, Codex and Cursor choose? We measured 17k runs to find out"
date: "2026-09-05"
generated: "2026-09-05 07:00"
source: "HN"
slug: "2026-09-05_07-which-tools-do-claude-codex-and-cursor-choose-we-m"
summary: "Armature用七十五个合成仓库、一千一百六十三种提示与四类开发者画像完成一万六千八百九十三次实验，首批保留五千二百九十二个会话、五十一个代码库和十八个工具类别。它覆盖实际实施，但发布方销售开发工具增长服务，目标也包含“让代理选中产品”。本批冻结为二百八十七分、一百四十三条评论；调研时Algolia取得一百个可见节点且触及上限，两者不混算。"
---

# Which tools do Claude, Codex and Cursor choose? We measured 17k runs to find out

## 事件背景
Armature用七十五个合成仓库、一千一百六十三种提示与四类开发者画像完成一万六千八百九十三次实验，首批保留五千二百九十二个会话、五十一个代码库和十八个工具类别。它覆盖实际实施，但发布方销售开发工具增长服务，目标也包含“让代理选中产品”。本批冻结为二百八十七分、一百四十三条评论；调研时Algolia取得一百个可见节点且触及上限，两者不混算。

## 核心观点 / 产品机制
实验在临时沙箱执行：代理先分析推荐，Gemini模拟用户接受首选，另一Gemini结合对话和代码差异判定有效性及赢家。Codex在百分之九十四的会话搜索网页，Cursor约三分之二，Claude约三成；三者同选仅百分之四十二。语言上下文也改写邮件服务赢家，分别偏向Resend、SendGrid、Postmark和Azure。共同编排器与裁判，加上逾万次运行未进入首批，意味着这是筛后分布，不是普遍质量排名。

## 社区热议与争议点
hbarka称自己的Claude确需追加“先研究”才会联网，支持工具调用差异；ttul表示曾为公司做类似分析，认同文档可发现性会影响代理选择。反方中，ai_critic担心这会复制搜索时代的增长黑客与SEO；DrewADesign则指出，即便扩大测量，也难从结果辨别赞助操纵、真实产品优势或偶然偏好。

## 行业影响与未来展望
代理可读的文档、价格、兼容性和仓库上下文正成为工具采购入口。清晰约束可帮助小厂，但“被选—采用—进入先验”的回路也可能强化集中。团队应要求候选对比、来源、成本与合规核对，并审阅依赖和代码差异。后续基准还需真实留出仓库、人工复核、多裁判、淘汰原因及跨时复跑，才能区分可发现性与适配质量。

## 附带链接
- [原始研究](https://armature.tech/blog/which-tools-coding-agents-install)
- [Hacker News 讨论](https://news.ycombinator.com/item?id=49557206)
