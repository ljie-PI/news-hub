---
title: "Eleventy 的终结：Font Awesome 将 11ty 改造为 \"Build Awesome\""
date: "2026-04-13"
generated: "2026-04-13 09:00"
source: "HN"
slug: "2026-04-13_09-end-of-eleventy"
summary: "**日期**: 2026-04-13 | **来源**: Hacker News | **票数**: 195 | **评论**: 170"
---

# Eleventy 的终结：Font Awesome 将 11ty 改造为 "Build Awesome"

**日期**: 2026-04-13 | **来源**: Hacker News | **票数**: 195 | **评论**: 170

---

## 事件背景

2026 年 4 月，Font Awesome 团队在 Kickstarter 上为新项目"Build Awesome"发起众筹，目标金额 $40,000，并在第一天就实现了目标——但众筹随即因邮件系统故障（邮件未能发出，破坏了项目"势头"）而被暂停并计划重新发起。

更重要的是：Build Awesome 本质上是 Eleventy（11ty）的重新品牌化和商业化。Eleventy 是一个被 NASA、CERN、W3C、Google、Mozilla、freeCodeCamp 等机构广泛使用的静态网站生成器，其创始人 Zach Leatherman 于 2024 年 9 月加入 Font Awesome，现在这个开源项目正被转向商业产品。

对于数千名依赖 11ty 构建网站的开发者来说，这引发了对"我最喜欢的开源工具是否会变成付费产品"的深度担忧。Brennan Day 的这篇文章是 11ty 社区最具代表性的反应之一，在 HN 获得 195 票和 170 条评论。

---

## 核心观点/产品机制

### Eleventy 的历史与地位

作者 Brennan Day 梳理了静态网站生成器（SSG）的发展脉络：
- **Jekyll** (2008)：GitHub 联创 Tom Preston-Werner 创建，集成 GitHub Pages，掀起 SSG 复兴
- **Hugo** (2013)：Go 语言写成，编译速度极快，适合大型站点
- **Gatsby** (2015)：React + GraphQL 的"内容网格"，代表了 Jamstack 潮流
- **Eleventy** (2017)：Zach Leatherman 创建，定位为"反框架"SSG——灵活、轻量、不绑定客户端 JS 框架

Eleventy 的三大优势：
1. **灵活性**：支持 Liquid、Nunjucks、Markdown、Handlebars、EJS 多种模板引擎，可混用
2. **Node.js 生态**：利用 npm，但不强加客户端 JS 框架
3. **零配置启动**：The A11y Project 的维护者指出，近三年后从零冷启动仍无障碍

### "Build Awesome"是什么？

根据文章，Build Awesome 将 11ty 从"纯静态网站生成器"扩展为"Font Awesome 和 Web Awesome 生态的一体化站点构建器"——即商业化的付费附加功能与开源核心的结合体。Kickstarter 目标 $40K，提示存在付费功能计划。

### 核心问题：开源工具如何盈利？

作者直白地提出了 Jamstack/SSG 生态的根本困境（第三章标题："How the fuck do we make money off of this?"）：
- Netlify 通过托管平台盈利（2015 Jamstack 概念推广者）
- Gatsby 通过 Gatsby Cloud 盈利，最终被 Netlify 收购
- Vercel 通过 Next.js 生态盈利
- Eleventy 一直没有找到可持续的商业模式——先是 Netlify 雇佣 Leatherman，后转至 Font Awesome

---

## 社区热议与争议点

**1. 文章本身的排版设计引发元讨论**

> **SoftTalker**: "（网站的）自定义鼠标光标和其他的废话让我直接关掉标签页。"

> **Dylan16807**: "你说的是自定义鼠标光标是让你离开网站的废话，还是有什么我错过了？如果是的话，这是相当大的反应。而且你可以在 userContent.css 里一行禁用。"

> **SoftTalker** 回复: "是的……选一个清晰的字体、大小、适当对比度的颜色，把其他的留着。"

这与同日 HN 头条"Bring Back Idiomatic Design"形成有趣的跨帖共鸣——Build Awesome 网站本身就是"创意设计优于可用性"的一个案例。

> **uxcolumbo**: "即使是这篇文章也不那么舒服阅读，所以我不得不用阅读模式。我不明白为什么阅读模式不总是可用的。文字就在那里。"

> **swiftcoder** 解释: "主要是因为我们没有标准标记来说'这是内容'。阅读模式必须猜测哪些标签包含内容，这整个事情归结为两个正则表达式。"

**2. 11ty 用户的真实担忧**

评论中多个 11ty 使用者表达了担忧：
- Build Awesome 会不会将核心功能付费化？
- Font Awesome 的商业利益是否与 11ty 的"反框架"哲学冲突？
- 即使核心仍然免费，"品牌消失"（11ty → Build Awesome）本身就破坏了工具的身份认同

**3. 关于 Kickstarter 众筹本身的批评**

Kickstarter 因邮件未发出暂停众筹的决定也被批评：
- 目标已经达到，为什么还需要"势头"？
- 暂停是否说明 Font Awesome 对于商业计划信心不足？
- "先发布 Kickstarter 再解释产品是什么"的顺序令人困惑

---

## 行业影响与未来展望

**开源工具的"可持续性陷阱"**

11ty 的商业化是开源生态一个典型困境的缩影：核心工具免费，被数千/数万个重要项目依赖，但维护者无法从中获得可持续收入。解决方案通常是：
1. 被大公司收购（Jekyll → GitHub，Gatsby → Netlify）
2. 引入付费附加功能（Build Awesome 模式）
3. 开放集体（Open Collective）捐款（Eleventy 之前的模式）
4. SaaS 托管平台（Vercel/Next.js 模式）

每条路都有代价：独立性换商业化，开源精神换商业持续性。

**11ty 的未来**

- 核心功能预计保持开源，但"Build Awesome"品牌预示着未来重心向付费/云端服务迁移
- 对于已有大型 11ty 站点的组织（NASA、CERN 等），迁移成本极高，这给了 Font Awesome 一定的锁定优势
- 替代工具（Astro、Hugo、Zola）将受益于 11ty 用户的不确定性——特别是 Astro，它在现代感和灵活性上最接近 11ty 的定位

**更宏观：Jamstack 的式微？**

这一事件也标志着 2015-2022 Jamstack 运动的"终章"——当初宣扬"前后端分离、静态优先"的关键工具和平台（Gatsby Cloud 关闭、Netlify 裁员、Eleventy 被商业化），都在 AI 全栈开发工具（Vercel AI、v0）的浪潮下寻找新的定位。

---

## 附带链接

- 原文: https://brennan.day/the-end-of-eleventy/
- HN 讨论: https://news.ycombinator.com/item?id=47735535
