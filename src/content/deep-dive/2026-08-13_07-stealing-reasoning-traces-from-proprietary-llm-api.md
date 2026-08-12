---
title: "Stealing Reasoning Traces from Proprietary LLM APIs"
date: "2026-08-13"
generated: "2026-08-13 07:00"
source: "HN"
slug: "2026-08-13_07-stealing-reasoning-traces-from-proprietary-llm-api"
summary: "一组研究者报告，部分 Anthropic、OpenAI 与 Google 接口会把隐藏推理作为加密块交给客户端，再由后续请求回传。论文作者称，他们从公开的六千七百零八�"
---

# Stealing Reasoning Traces from Proprietary LLM APIs

## 事件背景
一组研究者报告，部分 Anthropic、OpenAI 与 Google 接口会把隐藏推理作为加密块交给客户端，再由后续请求回传。论文作者称，他们从公开的六千七百零八条代理轨迹重建三十一万五千三百二十个推理块，发现七百零四项隐私信息，其中六十四项只存在于隐藏推理；这些均属作者自报结果，而非独立审计。

## 核心观点 / 产品机制
攻击并不破解密码学：先让强模型生成签名推理块，再跨会话、用户或同厂模型重放给较弱模型。服务端照常解密并把明文放入弱模型上下文，攻击者再越狱诱导其复述，从而绕过强模型自身的反蒸馏防护。作者称在三个厂商上演示成功，恢复长度与接口报告的隐藏思考令牌数接近。

## 社区热议与争议点
HN 讨论集中于安全与可用性的交换。yojo 认为禁止跨模型重放会破坏对话中途切换模型，pas 建议至少绑定元数据并禁止降级。cryptonector 认为客户端加密状态本身合理，缺陷是推理块未与账户或会话严格绑定；aix1 提议服务端保存，但 dannyw 指出这会冲突于零数据保留企业需求。x312 解释真正“解密者”仍是厂商服务端，desterothx 补充弱模型防护较薄才让明文外泄。另有社区转述作者称漏洞已修补，但未披露方案。

## 行业影响与未来展望
接口设计今后需把推理密文视作高敏感能力令牌，而非普通可移植缓存。可选缓解包括账户或会话绑定、模型级授权、阻止向弱模型降级，以及发布轨迹前清除加密块；代价则是模型切换、无状态扩容和零保留承诺更难兼得。

## 附带链接
- [原文与论文入口](https://stolen-thoughts.com/)
- [Hacker News 讨论](https://news.ycombinator.com/item?id=49257876)
