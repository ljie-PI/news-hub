---
title: "Do the math: How we took over ChatGPT accounts"
date: "2026-11-01"
generated: "2026-11-01 07:00"
source: "HN"
slug: "2026-11-01_07-chatgpt-account-takeover-math"
summary: "Parameter研究团队称，攻击者可把恶意对话制成ChatGPT分享链接，已登录者打开即会执行。批次冻结热度为293 points、142 comments；Firebase核对故事身份及293分、142个后代节点。研究方10月18日报告，OpenAI于21日复现并把等级由P2升至P1，26日确认修复。"
---

# Do the math: How we took over ChatGPT accounts

## 事件背景
Parameter研究团队称，攻击者可把恶意对话制成ChatGPT分享链接，已登录者打开即会执行。批次冻结热度为293 points、142 comments；Firebase核对故事身份及293分、142个后代节点。研究方10月18日报告，OpenAI于21日复现并把等级由P2升至P1，26日确认修复。

## 核心观点 / 产品机制
漏洞来自跨边界组合：图表先在主页面加载MathLive监听器；隔离Preview再用`postMessage`提交键盘布局。接收器未校验来源域与获准窗口，布局允许原始HTML进入`innerHTML`。直接脚本不会执行，但无`sandbox`的`srcdoc` iframe继承`chatgpt.com`身份；CSP虽禁内联脚本，却放行YouTube，研究者遂借oEmbed的JSONP回调执行代码。前提是受害者已登录、监听已就绪且Preview启动；稳定版本还需点一次Preview，研究方称自动版本跨账户复现三次，并用有限重试处理竞态。载荷读取会话信息，调用会话列表和私聊详情API，再以图片请求外传片段；这证明私聊可读，其他账户操作范围则是同源权限推论。

## 社区热议与争议点
本轮Algolia取得100个可见节点，已触及`--limit 100`，不能等同冻结的142条评论。dpark纠正“邮件扫描器自动取链即可触发”：攻击必须处在真实登录会话里。yellow_lead认可风险，却认为研究方披露的5000美元奖金过低，恐削弱上报激励；jryle70则强调，OpenAI承认并修复本身价值很大。someothherguyy反驳“代码行数越少越安全”，认为可理解、可测试、可模糊测试比行数更关键。

## 行业影响与未来展望
事件说明公开分享面也应按攻击输入处理：跨窗消息须同时验证`event.origin`与`event.source`，跨窗设置不应承载原始HTML，受影响的动态文档仍需沙箱。OpenAI据研究方披露分两版前端部署修复；仅封堵YouTube回调只能切断一条CSP绕路，不能消除不可信帧向主站注入HTML的根因。

## 附带链接
- [研究原文](https://www.parameter.ai/labs/we-found-a-gap-at-openai)
- [HN讨论](https://news.ycombinator.com/item?id=50314699)
- [Firebase故事元数据](https://hacker-news.firebaseio.com/v0/item/50314699.json)
