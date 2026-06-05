---
title: "Changing how we develop Ladybird"
date: "2026-06-06"
generated: "2026-06-06 07:00"
source: "HN"
slug: "2026-06-06_07-changing-how-we-develop-ladybird"
summary: "2026 年 6 月 5 日，Ladybird 项目创始人 Andreas Kling 在官方博客发布了一则引发开源社区震动的公告：**Ladybird 浏览器即日起不再接受任何外部公共 Pull Request"
---

---
title: "Changing how we develop Ladybird 深度调研"
date: "2026-06-06"
source: "Hacker News"
slug: "changing-how-we-develop-ladybird"
---

# Changing how we develop Ladybird

## 一、事件背景

2026 年 6 月 5 日，Ladybird 项目创始人 Andreas Kling 在官方博客发布了一则引发开源社区震动的公告：**Ladybird 浏览器即日起不再接受任何外部公共 Pull Request**，所有代码变更只能由项目维护者引入，并且现有打开的 PR 队列也将被全部关闭。Ladybird 是近年来少有的从零起步、不基于 Chromium 或 Gecko 的独立浏览器引擎，由前 SerenityOS 内核开发者 Andreas Kling 主导，曾在 2024 年获得 Shopify、GitHub 前 CEO Chris Wanstrath 等多方资助，被视为打破浏览器单一文化的重要尝试。项目目前正在冲刺第一个 Alpha 版本，准备面向真实用户发行。HN 主帖在数小时内冲上 794 分、513 条评论，是当日最具争议的开源治理话题。

## 二、核心观点 / 产品机制

Kling 的论证逻辑非常直接：**AI 工具彻底改变了开源贡献的经济学**。过去，一份「看起来认真」的 patch 隐含了相当的人力投入，社区据此推断出贡献者的诚意；如今 LLM 让伪造「看似严肃的贡献」的成本骤降，而浏览器又恰恰是攻击者眼中最具价值的目标——一个精心隐藏的漏洞足以危害成千上万的终端用户。Ladybird 团队同时观察到「XZ Utils 后门事件」式的长线社工攻击在开源界已有先例，AI 只会让此类攻击的规模化复制更便宜。项目并未要求贡献者声明是否使用 AI——重点不是「代码是不是手写」，而是「代码进入浏览器后由谁负责」。Ladybird 仍保持开源许可证，但拒绝建立任何替代渠道（issue/email/fork patch dump），以避免变成「影子 PR 队列」。

## 三、社区热议与争议点

HN 评论区情绪极度撕裂。支持派如 **troupo** 评论："'通过可信贡献获得信任' 是 AI 生成 PR 的一个新攻击角度，但回头看其实早该想到——这条攻击链一直存在，只是过去成本太高。" **jsmailes** 提出建设性方案：能否参考 arxiv.org 模式，引入「已有贡献者背书新提交者」的信任系统作为折中？反对派则更悲观，**fguerraz** 直截了当写道："我感觉这个项目已经死了"，认为关闭外部 PR 等于切断 Ladybird 赖以成长的社区动力。还有 **sppfly** 指出 Zig 语言也在朝同方向收紧，暗示这可能成为 2026 年系统级开源项目的新趋势。围绕「Ladybird 是否还配称作开源」「Apache 2.0/BSD 许可下拒收 PR 是否违背精神」的辩论也极为激烈。

## 四、行业影响与未来展望

Ladybird 的决定可能成为后 AI 时代开源治理的标志性事件。若一个独立浏览器项目都被迫关闭外部贡献渠道，其他高安全敏感的基础设施（编译器、内核模块、加密库）大概率会跟进。短期来看，Ladybird 需在维护者人手与冲刺 Alpha 之间找到平衡；长期来看，"基于身份与责任的贡献模型"或将取代"基于 patch 工作量"的传统信任模型。

## 五、相关链接

- 原文: https://ladybird.org/posts/changing-how-we-develop-ladybird/
- HN 讨论: https://news.ycombinator.com/item?id=48409191
