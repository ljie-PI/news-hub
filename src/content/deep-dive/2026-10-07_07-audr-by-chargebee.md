---
title: "AUDR by Chargebee"
date: "2026-10-07"
generated: "2026-10-07 07:00"
source: "PH"
slug: "2026-10-07_07-audr-by-chargebee"
summary: "AUDR（Agent Usage Detail Record）由 Chargebee 起草，借鉴电信详单，为一次代理运行跨模型、工具与网关后的归属和成本提供共同记录。批次冻结为日榜第2、278票、46条评论；调研时官方 GraphQL 仍为278票、46条，但实际只取得20条顶层评论和19条回复的可见子图，不能把两种口径混为一谈。"
---

# AUDR by Chargebee

## 事件背景

AUDR（Agent Usage Detail Record）由 Chargebee 起草，借鉴电信详单，为一次代理运行跨模型、工具与网关后的归属和成本提供共同记录。批次冻结为日榜第2、278票、46条评论；调研时官方 GraphQL 仍为278票、46条，但实际只取得20条顶层评论和19条回复的可见子图，不能把两种口径混为一谈。

## 核心观点 / 产品机制

规范1.0.0把每个计量操作写成一条 JSON：`record_id`负责幂等，`run_id + span_id`构成跨组件合并键；harness、router、provider各写自己有权负责的字段，冲突拒绝。更正必须用新`record_id`、`corrects`指向旧记录并完整重述，不能原地改写。必填块包括 emitter、timing、resource、run、attribution、usage；cost只是可选断言，下游可忽略。缺少environment的记录不得计费，生产记录还需account_id。计价、开票、孤儿记录等待策略和代理内部状态均不在规范范围；项目方还要求不写提示词、密钥或个人信息。

## 社区热议与争议点

三组真实问答划出了边界。普通用户Kirthika认可其衔接OpenTelemetry与FOCUS；Maker Dinesh称可用trace_id关联追踪、子代理复用父run_id，这是产品方说明。普通用户Jeetendra追问延迟账单会否重复计数，Dinesh以合并键及全量替换式更正回应。普通用户Sandy询问Stripe迁移，Dinesh明确AUDR不是账单系统，仍需另写Stripe sink；这既支持供应商中立，也暴露现成目的地覆盖有限。

## 行业影响与未来展望

若框架和网关共同采用，它可能把“每客户、每结果成本”从分散遥测变成可审计输入，并与现有追踪、计费层解耦。但目前仓库仍有MCP服务标识、Protobuf传输和SDK失败回调等开放问题；标准能否成立取决于更多非Chargebee实现、严格合并语义及真实生产互操作，而非发布方自报的早期支持名单。

## 附带链接

- [Product Hunt 发布页](https://www.producthunt.com/posts/audr-by-chargebee)
- [AUDR 官网](https://openaudr.dev/)
- [规范 v1.0.0](https://openaudr.dev/spec/v1.0.0/)
- [GitHub 仓库](https://github.com/openaudr/audr)
