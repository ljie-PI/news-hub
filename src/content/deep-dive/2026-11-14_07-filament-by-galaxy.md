---
title: "Filament by Galaxy"
date: "2026-11-14"
generated: "2026-11-14 07:00"
source: "PH"
slug: "2026-11-14_07-filament-by-galaxy"
summary: "Filament 于 11 月 13 日在 Product Hunt 发布，本批冻结为当日第 2、248 票、55 条评论。Galaxy 将其定位为可自托管或嵌入 Go 程序的数据复制引擎，覆盖全量、增量与 CDC；但[官方文档](https://filament.getgalaxy.io/pages/guides/get-started/introduction)仍明确标注 pre-1.0，接口和部分连接器可能变化。"
---

# Filament by Galaxy

## 事件背景

Filament 于 11 月 13 日在 Product Hunt 发布，本批冻结为当日第 2、248 票、55 条评论。Galaxy 将其定位为可自托管或嵌入 Go 程序的数据复制引擎，覆盖全量、增量与 CDC；但[官方文档](https://filament.getgalaxy.io/pages/guides/get-started/introduction)仍明确标注 pre-1.0，接口和部分连接器可能变化。

## 核心观点 / 产品机制

数据先进入有界 Arrow 批次：管线在 `Sink.Apply` 前计算 CRC32-C，接收端在最终内存边界重算；仅声明 encoded integrity 的 sink 再校验交给传输层的精确序列化字节。它不等于普遍回读目标库。checkpoint 只在写入达到相应耐久边界后推进，恢复采用至少一次语义，宁可重读而不跳过未提交数据。事件运行时由 Server 接单、Control Plane 调度、Worker 执行；PostgreSQL 存状态，NATS JetStream 传生命周期事件。

## 社区热议与争议点

官方 GraphQL 按 post id 分三页取得 21 条顶层、26 条回复，用户身份均脱敏。四组实际问答最有信息量：一位用户追问能否给 Agent 返回可读校验凭据，团队承认 CRC receipt 尚未开放 API；一位问 PostgreSQL 17 故障转移 slot，团队称目前没有 `failover` 标志；另有用户询问运行中 schema 变化，团队称新增可空列可通过，类型变化会暂停待审；还有人问 sink 短暂掉线，团队答复成功写入前不会刷新 offset。仓库开放的 [#596](https://github.com/galaxy-io/filament/issues/596) 与 [#593](https://github.com/galaxy-io/filament/issues/593) 又分别暴露状态回写竞态和事件折叠失败后可能丢事实，说明控制面仍在成熟。

## 行业影响与未来展望

它把“速度、可恢复、可核验”放进同一开源引擎，可能压低自建数据移动门槛。但 Galaxy 的 298M 行、约 2.6M 行每秒来自厂商自建基准：只测 full load，以行数而非逐值验真，准备与校验不计时，各工具并行度也不同，且 Debezium 被测的是非主场的初始快照，不能外推 CDC 或生产稳定性。长期竞争力取决于 pre-1.0 接口收敛、连接器覆盖及上述一致性问题能否关闭。

## 附带链接

- [Product Hunt 发布页](https://www.producthunt.com/products/galaxy)
- [GitHub 仓库](https://github.com/galaxy-io/filament)
- [完整性与 checkpoint 文档](https://filament.getgalaxy.io/pages/guides/concepts/integrity-and-checkpoints)
- [厂商基准方法与限制](https://filament.getgalaxy.io/pages/benchmarks/overview)
