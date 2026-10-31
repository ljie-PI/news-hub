---
title: "telemetry.dev"
date: "2026-11-01"
generated: "2026-11-01 07:00"
source: "PH"
slug: "2026-11-01_07-telemetry-dev-agent-observability"
summary: "telemetry.dev 于 10 月 31 日发布，定位是 AI 代理可观测平台。冻结批次显示其 Product Hunt 日榜第 3、190 票、12 条评论；本轮按官方 GraphQL 查询 post id 1296505，名称完全一致，调研时已变为 191 票、16 条评论，动态值不覆盖冻结口径。"
---

# telemetry.dev

## 事件背景

telemetry.dev 于 10 月 31 日发布，定位是 AI 代理可观测平台。冻结批次显示其 Product Hunt 日榜第 3、190 票、12 条评论；本轮按官方 GraphQL 查询 post id 1296505，名称完全一致，调研时已变为 191 票、16 条评论，动态值不覆盖冻结口径。

## 核心观点 / 产品机制

它把一次代理运行组织为 trace，模型、工具和函数操作成为树状 span，以 `gen_ai.operation.name` 区分 chat、execute_tool、invoke_agent；每层显示耗时、词元、成本、输入输出和错误。接入可用 TypeScript/Python SDK，也可由既有 OpenTelemetry 通过标准 OTLP/HTTP 上报。提示词保存不可变版本，以标签发布并按会话灰度；实验把版本或代码跑在数据集上，与基线比较，同一评估器也可抽样评分生产 trace。告警每五分钟检查成本、代理循环、调用失败及评测通过率下降。

## 社区热议与争议点

官方 API 取得 9 条顶层评论、8 条回复，身份均脱敏。一名用户称此前用表格拼“提示版本—生产 trace—评测”闭环，认可循环告警。另一人追问高流量、自托管和采样；产品方承认暂无自托管，按事件计费，采样交给 OTel sampler。远程 MCP 开发者问能否从服务端合并对话，产品方称 Claude.ai/桌面端不传会话或 trace ID，只能看独立调用。还有用户担心代理读取敏感 payload；产品方称完整内容需另授权并脱敏，但这是 Maker 口径。

## 行业影响与未来展望

它用开放遥测把线上故障、提示发布和离线评测串成证据链，降低更换分析后端的成本。但官网没有独立效果基准；提示和回复默认发送并存储，只有应用侧关闭采集才能保证内容不离开进程，规则脱敏也抓不住姓名、地址等自由文本。免费、Pro、Team 的遥测保留期为 14、30、90 天，数据集和实验不随其删除；产品仅托管、无自托管，敏感生产场景仍需先做数据分级。

## 附带链接

- [Product Hunt 产品页](https://www.producthunt.com/products/telemetry-dev)
- [官网](https://telemetry.dev/)
- [文档](https://telemetry.dev/docs)
- [OpenTelemetry 接入](https://telemetry.dev/docs/sdk/opentelemetry)
- [公开仓库](https://github.com/telemetry-dev/telemetry)
