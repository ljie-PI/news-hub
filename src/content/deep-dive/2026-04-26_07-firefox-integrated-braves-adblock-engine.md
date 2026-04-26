---
title: "Firefox 悄然集成 Brave 广告拦截引擎：开源协作的典范还是 MV2 末日的信号？"
date: "2026-04-26"
generated: "2026-04-26 07:00"
source: "HN"
slug: "2026-04-26_07-firefox-integrated-braves-adblock-engine"
summary: "2026 年 3 月发布的 Firefox 149 带来了内置 VPN、分屏视图等亮点功能，但一项不在发布说明中的改动直到近日才引起广泛关注——Firefox 现已内置 **adblock-rus"
---

# Firefox 悄然集成 Brave 广告拦截引擎：开源协作的典范还是 MV2 末日的信号？

## 事件背景

2026 年 3 月发布的 Firefox 149 带来了内置 VPN、分屏视图等亮点功能，但一项不在发布说明中的改动直到近日才引起广泛关注——Firefox 现已内置 **adblock-rust**，即 Brave 开源的 Rust 广告/追踪拦截引擎。这一变更由 Mozilla 工程师 Benjamin VanderSloot 通过 Bugzilla Bug 2013888 提交，Brave 隐私安全副总裁 Shivan Kaul Sahib 随后撰写博文予以确认。消息一经传出，在 Hacker News 上迅速获得 367 分、217 条评论的热议。

## 核心机制

adblock-rust 是 Brave 浏览器原生内容拦截器的核心，用 Rust 编写，采用 MPL-2.0 许可证，支持网络请求拦截和外观过滤（cosmetic filtering），兼容 uBlock Origin 的过滤规则语法。

Firefox 的集成目前处于**原型实验阶段**：默认关闭、无 UI 入口、不附带任何过滤列表。用户需要手动在 `about:config` 中启用 `privacy.trackingprotection.content.protection.enabled`，并自行填入 EasyList/EasyPrivacy 等过滤列表 URL 才能生效。引擎支持两种模式：**Protection**（匹配并拦截请求）和 **Annotation**（仅标记不拦截，用于遥测或 UI 展示）。

值得注意的是，Firefox 分支浏览器 Waterfox 已直接在 Firefox 的实现基础上启用了 adblock-rust，而新兴的 Perplexity Comet 浏览器也采用了同一引擎。正如 Shivan 所说：**"如今发布一款严肃的浏览器，不内置广告和追踪拦截已经不可想象了。"**

## 社区热议与争议

HN 评论区的讨论迅速聚焦于几个核心分歧：

**1. 这对 uBlock Origin 用户意味着什么？**  
用户 nextaccountic 首先发问："这对 uBlock Origin 用户有好处吗？也许 uBO 可以利用这个引擎。"但 toofy 实测后发现，当前实现**效果不如 uBlock Origin**——广告位的空白区域仍然存在，只是广告内容被移除了，说明尚未启用外观过滤（cosmetic filtering）。fabrice_d 补充解释，这正是因为 Firefox 还没调用 adblock-rust 的 cosmetic filtering API。

**2. 这是否预示着 MV2 即将被 Firefox 抛弃？**  
这是争论最激烈的话题。用户 devsda 较为乐观地推测，内置广告拦截引擎可能是 Firefox 准备弃用 MV2 扩展支持的铺垫，"长期同时维护 MV2 和 MV3 并不可持续"。但 zephyreon 立刻反驳："Firefox 提供的**最具差异化的功能就是 uBlock Origin**，只要网页能加载、安全问题能修补，它就是人们选择 Firefox 的理由。"另一用户 Dylan16807 则从技术角度指出，uBlock Origin 所需的 MV2 功能实际上只是一个与 MV3 中类似的回调接口，维护成本极低。用户 lxgr 也明确表示："Firefox 的 MV3 中包含了 Chrome MV3 缺失的 API，uBlock Origin 在 Firefox 上的 MV2 和 MV3 功能是等价的。"

**3. Safari 的广告拦截是否被高估了？**  
一些评论将 Safari 称为"最后的堡垒"，但 rs_rs_rs_rs_rs 严厉反驳："Safari 是第一个彻底移除 MV2 的浏览器，在所有主流浏览器中广告拦截扩展支持最差。" nuker 则为 Apple 辩护，列举了 Safari 自 2003 年以来在隐私保护方面的多项行业首创——包括默认拦截第三方 Cookie（2003）和智能追踪防护 ITP（2017）。但 potatoproduct 冷静指出："Apple 做隐私只是因为广告业务失败后转向了订阅模式，现在他们又在建立自己的广告业务了。"

**4. 浏览器生态的未来在哪里？**  
不少用户提到了 Zen（一个带 Arc 式 UX 的 Firefox 分支）和 Ladybird（独立渲染引擎项目）作为替代方案。pjjpo 表示 Zen 体验极佳且与 Firefox 完美同步，但也坦言"整个 Firefox 生态的长期资金可持续性令人担忧"。

## 行业影响与未来展望

Firefox 集成 adblock-rust 是开源生态良性循环的一个缩影：Brave 贡献了基础设施级组件，Firefox 和其分支浏览器得以低成本获得成熟的广告拦截能力。这种跨项目的代码复用在浏览器领域并不常见，尤其考虑到 Brave 和 Firefox 分属不同阵营（Chromium vs. Gecko）。

但更深远的问题在于：如果 Firefox 未来将 adblock-rust 正式化并默认启用，是否会成为弃用 MV2 扩展 API 的契机？目前 Firefox 是唯一一个完整支持 uBlock Origin（MV2 版本）全部能力的主流浏览器，这是它相对 Chrome 最核心的竞争优势。任何在这个方向上的动摇，都可能引发用户的大规模流失。

最务实的路径或许是：**将 adblock-rust 作为"兜底层"**——为不安装扩展的普通用户提供基础保护，同时继续保留 MV2 API 以支持 uBlock Origin 等高级工具。这正是社区最希望看到的结果。

---

**链接**

- 原始新闻：[Firefox Has Quietly Integrated Brave's Adblock Engine (It's FOSS)](https://itsfoss.com/news/firefox-ships-brave-adblock-engine/)
- Brave VP 博文：[Firefox browser has started shipping Brave's adblock-rust engine](https://shivankaul.com/blog/firefox-bundles-adblock-rust)
- HN 讨论帖：[Hacker News (367 points, 217 comments)](https://news.ycombinator.com/item?id=47897891)
- adblock-rust 仓库：[github.com/brave/adblock-rust](https://github.com/brave/adblock-rust)
- Bugzilla 追踪：[Bug 2013888 - Add a prototype rich content blocking engine](https://bugzilla.mozilla.org/show_bug.cgi?id=2013888)
