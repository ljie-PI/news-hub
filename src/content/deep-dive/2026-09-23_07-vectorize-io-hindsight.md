---
title: "vectorize-io/hindsight"
date: "2026-09-23"
generated: "2026-09-23 07:00"
source: "GitHub"
slug: "2026-09-23_07-vectorize-io-hindsight"
summary: "Hindsight 是面向智能体的持久记忆层，把跨会话事实、经历和归纳知识放进记忆库，供 `retain`、`recall`、`reflect` 写入、检索与推理。它针对向量检索难处理的时间范围、实体关联、知识更新和偏好演化。冻结周榜新增 1337 星；GitHub API 查询为 25243 星、2101 叉，两种口径分开计算。"
---

# vectorize-io/hindsight

## 定位与痛点剖析

Hindsight 是面向智能体的持久记忆层，把跨会话事实、经历和归纳知识放进记忆库，供 `retain`、`recall`、`reflect` 写入、检索与推理。它针对向量检索难处理的时间范围、实体关联、知识更新和偏好演化。冻结周榜新增 1337 星；GitHub API 查询为 25243 星、2101 叉，两种口径分开计算。

## 核心架构与技术细节

当前公开版为 0.10.1，核心 API 使用 Python。写入时由模型抽取世界事实、经验事实与实体关系；TEMPR 并行执行语义、关键词、图遍历、时间检索，再融合重排；`reflect` 结合原始事实、观察和人工维护的心智模型生成答案。主存储采用 PostgreSQL：pgvector/HNSW 负责向量，全文索引负责词项，递归查询承载图关系。后台把重复事实合并成观察，保留原文证据、证明计数及矛盾演化历史。

## 竞品对比与生态站位

可核验竞品 Mem0 同样提供开源、自托管与云服务；其当前 README 已列出语义、BM25、实体和时间多信号检索，因此不能把“四路检索”写成 Hindsight 独占。Hindsight 的辨识度在证据化观察、心智模型与独立 `reflect` 层；Mem0 则有更大的社区规模，当前 API 为 65841 星，并采用 Apache-2.0。项目方自报 Hindsight 在 LongMemEval 最高达 91.4%，该营销数字不等同于本文独立复测。

## 开发者反馈与局限性

开放 issue #4532 报告自动心智模型刷新失败后每五分钟重排，空闲时仍持续消耗付费模型；四条评论中有用户报告相同扣费，另有开发者在 0.10.1 复现“失败后仍保持过期、下一轮再提交”的机制，现仍开放。#4589 还报告真实规模记忆库会让 TypeSafe 重排请求超过令牌预算并静默回退。两者都是具体部署报告，尚不宜外推为所有配置必现；也提示后台归纳成本、超时保护和大库容量规划仍是采用门槛。

## 附带链接

- [GitHub Repo](https://github.com/vectorize-io/hindsight)
- [官方文档](https://hindsight.vectorize.io/)
- [版本 v0.10.1](https://github.com/vectorize-io/hindsight/releases/tag/v0.10.1)
- [成本循环 issue #4532](https://github.com/vectorize-io/hindsight/issues/4532)
- [重排预算 issue #4589](https://github.com/vectorize-io/hindsight/issues/4589)
- [竞品 Mem0](https://github.com/mem0ai/mem0)
