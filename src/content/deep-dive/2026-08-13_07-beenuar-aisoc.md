---
title: "beenuar/AiSOC"
date: "2026-08-13"
generated: "2026-08-13 07:00"
source: "GitHub"
slug: "2026-08-13_07-beenuar-aisoc"
summary: "AiSOC 是可自托管的开源安全运营栈，把事件接入、规则检测、告警融合、代理调查和响应控制放进一套系统。它针对传统 SOC 在多套 SIEM、工单与威胁情�"
---

# beenuar/AiSOC

## 定位与痛点剖析

AiSOC 是可自托管的开源安全运营栈，把事件接入、规则检测、告警融合、代理调查和响应控制放进一套系统。它针对传统 SOC 在多套 SIEM、工单与威胁情报工具间切换，以及 AI 自动分诊难以审计的问题；调查账本逐步记录提示、证据、工具调用与理由，便于复盘。

## 核心架构与技术细节

数据经连接器和 Go 编写的 OCSF 接入服务进入 Kafka，规则、UEBA 与机器学习融合并行消费；PostgreSQL、ClickHouse、OpenSearch、Qdrant、Neo4j 和 Redis 分担事务、湖仓、搜索、向量、关系图与缓存。FastAPI 对接 Next.js 控制台，LangGraph 编排检测、分诊、狩猎和响应代理。README 中连接器、规则数量及降噪指标均为项目方自报，不能视作独立测评。

## 竞品对比与生态站位

Wazuh 偏开源采集与规则检测，Splunk ES 生态成熟但按摄入计费；闭源 AI SOC 通常产品化更完整。AiSOC 的差异是 MIT 自托管、可替换代理、可回放决策和公开评测门禁，适合重视数据主权与可审计性的团队；但多种存储、消息队列和模型服务也意味着明显高于轻量 SIEM 的运维负担。

## 开发者反馈与局限性

真实 issue #601 曾复现代理运行耗时完成却因默认租户无法解析而未写入账本，且只留调试日志，随后由 #602 修复。更早的 #220 证明攻击者控制的遥测可向分类代理注入指令，诱导高置信误报并自动关单，说明自动化必须依赖内容净化、人审和回滚策略。README 也标注在线演示可能离线、部分 npm 与可视化资产要到后续版本落地，成熟度需逐项核验。

## 附带链接

- GitHub：https://github.com/beenuar/AiSOC
- 官方文档：https://beenuar.github.io/AiSOC/docs/intro
- 演示站：https://tryaisoc.com
- 账本缺陷：https://github.com/beenuar/AiSOC/issues/601
