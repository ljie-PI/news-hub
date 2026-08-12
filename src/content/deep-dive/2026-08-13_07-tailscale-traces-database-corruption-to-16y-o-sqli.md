---
title: "Tailscale Traces Database Corruption to 16y/o SQLite WAL-Reset Bug"
date: "2026-08-13"
generated: "2026-08-13 07:00"
source: "HN"
slug: "2026-08-13_07-tailscale-traces-database-corruption-to-16y-o-sqli"
summary: "Tailscale 自述，其分片控制平面自二〇二二年起以单个 Go 进程访问各自的 SQLite 数据库；从去年八月至今年初，六个月内发生十九次损坏，部分分片恢复�"
---

# Tailscale Traces Database Corruption to 16y/o SQLite WAL-Reset Bug

## 事件背景
Tailscale 自述，其分片控制平面自二〇二二年起以单个 Go 进程访问各自的 SQLite 数据库；从去年八月至今年初，六个月内发生十九次损坏，部分分片恢复早期耗时逾一小时。数据库只含设备与网络配置元数据，不含私钥或流量，但曾有少量新设备及配置未能保留。

## 核心观点 / 产品机制
原文称，团队记录写事务、持续校验备份，并购买 SQLite 专业支持。新建的虚拟文件系统追踪工具最终定位到检查点与写事务之间的罕见竞态：检查点误以为部分页已从预写日志写回主库，实际页却丢失，索引等引用页仍落盘，遂造成损坏。SQLite 将其称为 WAL 重置缺陷，估计已存在至少十六年，并在三点五一版补丁中加入重置检测。Tailscale 的手动、高频检查点放大了命中概率；公司自报修复后四个月未再发生事故。

## 社区热议与争议点
社区既肯定治理，也质疑架构。simonw 与 saghm 赞赏公司购买支持并资助可复用追踪工具，认为这是商业用户反哺开源的实例；calmingsolitude 指出该竞态需要多个连接，认为“单进程单写者”的表述容易让人误解。riknos314 批评分片内数据库仍是单点；Spivak 反驳说分片已限制爆炸半径，只是受影响用户仍会完整感知中断。Ariarule 则提醒普通 SQLite 用户风险很低，异常之处在 Tailscale 激进接管检查点。

## 行业影响与未来展望
案例说明“成熟技术”不等于非标准运行方式无风险。可借鉴之处不是盲目弃用 SQLite，而是为罕见故障保留事务审计、在线完整性监测、分阶段发布和上游专家支持；同时应把分片隔离与单分片恢复目标分别评估。

## 附带链接
- [原文](https://tailscale.com/blog/sqlite-wal-reset-bug)
- [Hacker News 讨论](https://news.ycombinator.com/item?id=49272832)
