---
title: "tbphp/gpt-load"
date: "2026-09-04"
generated: "2026-09-04 07:00"
source: "GitHub"
slug: "2026-09-04_07-tbphp-gpt-load"
summary: "这是自托管大模型网关：客户端只配置一个地址和访问密钥，管理员统一管理官方接口、兼容中转及订阅账号，减少多供应商鉴权、模型映射和故障切换的重复工作。冻结榜单快照为六千五百一十九星、六百九十二个分支，单日新增八十星。"
---

# tbphp/gpt-load

## 定位与痛点剖析

这是自托管大模型网关：客户端只配置一个地址和访问密钥，管理员统一管理官方接口、兼容中转及订阅账号，减少多供应商鉴权、模型映射和故障切换的重复工作。冻结榜单快照为六千五百一十九星、六百九十二个分支，单日新增八十星。

## 核心架构与技术细节

默认分支源码显示，后端采用 Go、Gin、GORM，前端为 Vue，数据可落到 SQLite、MySQL 或 PostgreSQL。调度器先按协议能力过滤候选，再合并分组手动权重、凭据手动权重和自动权重进行加权随机；请求亲和缓存可优先复用原凭据。代码还维护冷却、黑名单与尝试链。README 所称重试、故障隔离和用量估算因此有实现依据，但用量不等同供应商账单。

## 竞品对比与生态站位

LiteLLM 官方说明覆盖百余模型供应商，并提供开发包、代理、虚拟密钥、预算及护栏；Bifrost 官方说明覆盖二十三余供应商、回退和负载均衡，企业版另有集群。GPT-Load 的可辨识位置是把接口密钥与 Codex、Claude 等订阅账号纳入同一调度面，并保留三类原生客户端协议；代价是供应商广度较窄，当前明确只支持单应用实例，不能横向扩展。

## 开发者反馈与局限性

问题 #471 曾报告二代自动权重不均、失败切换不直观；维护者建议关闭请求亲和，并称测试版十七已完善错误与重试判断。问题 #534 仍在讨论：原生路由固定高于转换路由，跨层手动权重不会统一生效；维护者确认这是避免协议能力降级的有意设计。问题 #533 的探活误报则由维护者定位到参数处理，发布候选版四后报告者复测通过。另需注意二代不能原地迁移一代数据，主加密密钥也不支持轮换。

## 附带链接

- [GitHub 仓库](https://github.com/tbphp/gpt-load)
- [默认分支 README](https://github.com/tbphp/gpt-load/blob/main/README.md)
- [问题 #471](https://github.com/tbphp/gpt-load/issues/471) · [问题 #534](https://github.com/tbphp/gpt-load/issues/534) · [问题 #533](https://github.com/tbphp/gpt-load/issues/533)
- [LiteLLM](https://github.com/BerriAI/litellm) · [Bifrost](https://github.com/maximhq/bifrost)
- [官方网站](https://www.gpt-load.com)
