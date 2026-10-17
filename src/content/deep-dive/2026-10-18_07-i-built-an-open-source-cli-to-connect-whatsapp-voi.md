---
title: "I built an open-source CLI to connect WhatsApp voice calls to LiveKit agents in 90 seconds"
date: "2026-10-18"
generated: "2026-10-18 07:00"
source: "Reddit"
slug: "2026-10-18_07-i-built-an-open-source-cli-to-connect-whatsapp-voi"
summary: "冻结候选确认发帖人为 yashubhakt，正文点名 `amitbhakt/wavoice`。逐帖 Atom RSS 成功返回十一项：一篇主帖、一个机器人、五名普通用户评论及四条作者回复，因此下述讨论仅代表该可见子集。项目要解决的是 Meta 呼叫开关、三层 webhook、SDP 与语音代理接线分散且易错的问题；“九十秒”仍是作者演示口径。"
---

# I built an open-source CLI to connect WhatsApp voice calls to LiveKit agents in 90 seconds

## 事件背景

冻结候选确认发帖人为 yashubhakt，正文点名 `amitbhakt/wavoice`。逐帖 Atom RSS 成功返回十一项：一篇主帖、一个机器人、五名普通用户评论及四条作者回复，因此下述讨论仅代表该可见子集。项目要解决的是 Meta 呼叫开关、三层 webhook、SDP 与语音代理接线分散且易错的问题；“九十秒”仍是作者演示口径。

## 核心观点 / 产品机制

仓库与 LiveKit 指南显示，当前源码用 Graph API v21 查询号码并提交 `/settings` 开启 Calling，再设置号码覆盖和 WABA 订阅。FastAPI 接收 `connect` webhook，从 `session.sdp` 取 offer，以内存锁去重，构造 v23 `AcceptWhatsAppCallRequest`，把来电、Meta 令牌、SDP、房间及 agent 名交给 LiveKit Connector。Cloudflare Quick Tunnel只暴露 webhook；媒体由连接器处理，并非穿越隧道。限制同样明确：连接器仅支持 LiveKit Cloud，临时域名重启即变；LiveKit 运行路径未实现 README 所称的 App 层订阅。仓库二十一项单测通过，但连接器均为模拟，未独立复现真实九十秒端到端通话。

## 社区热议与争议点

普通用户 Ok_Salamander 称 Graph API 隐藏开关难排查，同时担心隧道延迟；作者解释隧道仅做握手，音频走 WebRTC。QuanTradin 追问无人接听，作者称只在 `connected` 后启动；该用户进一步指出“已接听却静音”仍可能让代理空讲。Sweet-Atmos532 肯定免去 ngrok 与 SDP 调试；作者则披露纯文本 challenge、三级订阅遗漏及重复 connect 是主要坑。前两组是质疑与追问，作者回答属于项目方口径。

## 行业影响与未来展望

它把 WhatsApp 语音接入从媒体栈问题缩成可脚本化控制面，适合原型和既有 LiveKit agent；但生产化仍需固定 HTTPS 入口、持久化幂等、签名与密钥治理，并验证 Meta 版本、地区资格和通话生命周期。短期价值是降低接线成本，不等于消除平台依赖或获得自托管连接器。

## 附带链接

- [Reddit 原帖](https://www.reddit.com/r/AI_Agents/comments/1x8hyo0/i_built_an_opensource_cli_to_connect_whatsapp/)
- [wavoice 仓库](https://github.com/amitbhakt/wavoice)
- [wavoice LiveKit 文档](https://github.com/amitbhakt/wavoice/blob/main/docs/livekit.md)
- [LiveKit WhatsApp Connector 文档](https://docs.livekit.io/telephony/connectors/whatsapp/)
- [Meta Calling API 参考](https://developers.facebook.com/documentation/business-messaging/whatsapp/calling/reference)
