---
title: "weave-os/router"
date: "2026-09-05"
generated: "2026-09-05 07:00"
source: "GitHub"
slug: "2026-09-05_07-weave-os-router"
summary: "这是面向 Claude Code、Codex、Cursor 与自建代理的逐请求模型网关：以端点替换接管调用，避免固定模型处理所有任务造成浪费，并统一割裂的厂商协议。批次快照显示本周新增 2082 星。README 所称“路由低于 50 毫秒、节省四至七成”均属项目方自报，未见独立基准验证。"
---

# weave-os/router

## 定位与痛点剖析

这是面向 Claude Code、Codex、Cursor 与自建代理的逐请求模型网关：以端点替换接管调用，避免固定模型处理所有任务造成浪费，并统一割裂的厂商协议。批次快照显示本周新增 2082 星。README 所称“路由低于 50 毫秒、节省四至七成”均属项目方自报，未见独立基准验证。

## 核心架构与技术细节

Go 服务接收 Anthropic Messages、OpenAI Chat／Responses 与 Gemini 原生请求；`proxy` 串起鉴权、格式转换、任务类型识别、会话固定、重新评分及转发。默认 `cluster` 的 v0.75 工件以本机 Jina 768 维 INT8 ONNX 嵌入，在十六个质心中取前四，再按每簇质量与成本混合分数选模型；输入截为 1024 字符，失败返回 503 而非静默降级。缓存感知规划器比较保留原模型缓存与切换收益。Postgres 保存配置、密钥和用量，OTLP 输出遥测；可选 HMM 边车只分类，Go 按声明式名单选臂。

## 竞品对比与生态站位

LiteLLM 的可验证边界更广：统一百余供应商并覆盖图像、音频、嵌入等端点；本项目聚焦代理文本链路，特色是逐请求学习路由、会话缓存与跨协议保真。RouteLLM 主要是强弱双模型的 OpenAI 兼容研究及评测框架；本项目补齐多供应商网关、持久化和运维面，但采用限制托管转售的 ELv2，而非 Apache 2.0。

## 开发者反馈与局限性

开放 issue #867 报告一小时缓存写入仍按五分钟倍率计费，可能低估账单，讨论者建议先修扣费、后补遥测，当前仍未关闭。近期合并 PR #1180 修复长工具循环裁剪掉用户边界而触发 503，PR #1181 修复会话缓存键漂移与 Responses 完成原因缺失，说明迭代快但兼容面仍在磨合。自托管还依赖带 CGO 的 ONNX、Postgres；未配置加密 key 时源码会明示以明文保存 BYOK，弱于 README 的概括性表述。

## 附带链接

- [仓库](https://github.com/weave-os/router)
- [架构](https://github.com/weave-os/router/blob/main/AGENTS.md)
- [配置](https://github.com/weave-os/router/blob/main/docs/CONFIGURATION.md)
- [issue #867](https://github.com/weave-os/router/issues/867)
- [PR #1180](https://github.com/weave-os/router/pull/1180)
- [PR #1181](https://github.com/weave-os/router/pull/1181)
- [LiteLLM](https://github.com/BerriAI/litellm)
- [RouteLLM](https://github.com/lm-sys/RouteLLM)
