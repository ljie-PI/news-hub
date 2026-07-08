---
title: "Chatto is now open source"
date: "2026-07-09"
generated: "2026-07-09 07:00"
source: "HN"
slug: "2026-07-09_07-chatto-is-now-open-source"
summary: "资深开发者 Hendrik Mans(网名 hmans)宣布将其打造的群组聊天应用 Chatto 正式开源。据评论区多位相识多年的老友透露,他有近三十年开发经验,且几乎是借助 "
---

# Chatto is now open source

## 事件背景
资深开发者 Hendrik Mans(网名 hmans)宣布将其打造的群组聊天应用 Chatto 正式开源。据评论区多位相识多年的老友透露,他有近三十年开发经验,且几乎是借助 agentic coding 独自完成该项目。帖子在 Hacker News 获逾六百赞、近两百条评论。Chatto 被定位为 Slack、Discord 之外,一款让人真正愿意使用的自托管替代品。

## 核心观点 / 产品机制
Chatto 以紧凑的自包含二进制文件交付,运行即用并自带前端。底层依赖 NATS 消息代理做流持久化,可选接入 S3 兼容对象存储,音视频通话由 LiveKit 驱动,内置屏幕共享与端到端加密。个人及聊天数据均以每用户独立密钥加密,账号注销时密钥随即销毁。每台服务器只承载单一社区,不做联邦、无第三方追踪。当前版本 0.4,并推出可选付费托管 Chatto Cloud,承诺无锁定、可随时迁出。

## 社区热议与争议点
长期用户 moeffju 力挺其性能,称 Chatto"飞快",相比之下 Slack 迟钝不堪、设计也更精致。vsviridov 赞赏 SSO 开箱即用,不像某些产品把单点登录锁进"企业版"。但争议随 AI 编程而来:ori_b 直言拒绝支持任何"建立在盗窃之上"的项目,批评 AI 加速内容劣化、破坏环境;urbandw311er 则反驳称此论太过刻薄,一位三十年经验的开发者用 AI 辅助并不等于粗制滥造。

## 行业影响与未来展望
在开源聊天赛道日益"开源核心化"、把 SSO 等功能锁进订阅的当下,Chatto 主打完全免费自托管、隐私优先,颇具号召力。但短板亦明显:移动端尚不成熟,目前仅有社区维护的 Tauri 封装与 PWA,原生桌面应用付之阙如,能否补齐企业级功能将决定它能走多远。

## 附带链接
- 原文:https://www.hmans.dev/blog/chatto-is-open-source
- HN 讨论:https://news.ycombinator.com/item?id=48833116
- 文档:https://docs.chatto.run/
