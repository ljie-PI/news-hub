---
title: "Asymptote-Labs/agent-beacon"
date: "2026-09-24"
generated: "2026-09-24 07:00"
source: "GitHub"
slug: "2026-09-24_07-asymptote-labs-agent-beacon"
summary: "Agent Beacon 面向同时使用多种编码代理的开发者与安全团队，试图解决会话历史散落、经验无法迁移的问题。仓库接口显示其为 MIT、主语言 Go；批次快照为一千二百九十六星，查询时增至一千二百九十九星。README 所称“支持二十余种工具”属于项目自报，并非独立覆盖率测试。"
---

# Asymptote-Labs/agent-beacon

## 定位与痛点剖析
Agent Beacon 面向同时使用多种编码代理的开发者与安全团队，试图解决会话历史散落、经验无法迁移的问题。仓库接口显示其为 MIT、主语言 Go；批次快照为一千二百九十六星，查询时增至一千二百九十九星。README 所称“支持二十余种工具”属于项目自报，并非独立覆盖率测试。

## 核心架构与技术细节
源码显示，钩子、插件、轮询与开放遥测输入先被归一化为统一事件，再写入本地 JSONL；学习资料存进按项目隔离的数据库。评估器把轨迹裁成最多八十个事件，保留首尾并清洗文本，调用 Jev 回答成功、可复用纠错、证据充分三项问题；均分达到零点六才生成候选，仍须人工批准，之后才可经只读 MCP 检索或写成 Agent Skill。由此可见，它是“采集—评分—审核—注入”流水线，不是自动改写代理。

## 竞品对比与生态站位
Mem0 主要让应用通过 SDK、服务端或云平台保存用户、会话与代理记忆；Beacon 则从既有编码工具外侧收集跨运行时轨迹，强调本地证据链与人工闸门。前者集成面和托管形态更成熟，后者更适合不愿绑定单一代理的工程审计；但 Beacon 默认评估器只给概率，不能直接生成可执行经验，所谓“自改进”仍依赖人工阅读与编辑。

## 开发者反馈与局限性
真实 issue #620 报告二十五条轨迹的七十五个理由均成“noul”；维护者确认误读响应类型并合并 PR #630，但修复只是明确“未提取经验文本”。issue #619 还报告大批量回填因日志轮转丢失九成五，PR #632 加入保留保护与容量参数。近期公开问题样本不多，且多由少数账号提交，故稳定性和广泛采用程度仍缺独立证据。

## 附带链接
- 仓库与 README：https://github.com/Asymptote-Labs/agent-beacon
- 评估器源码：https://github.com/Asymptote-Labs/agent-beacon/blob/main/cli/beacon/internal/learning/evaluator.go
- 问题与修复：https://github.com/Asymptote-Labs/agent-beacon/issues/620 ｜ https://github.com/Asymptote-Labs/agent-beacon/pull/630
- 回填缺陷与修复：https://github.com/Asymptote-Labs/agent-beacon/issues/619 ｜ https://github.com/Asymptote-Labs/agent-beacon/pull/632
- 竞品 Mem0：https://github.com/mem0ai/mem0
