---
title: "GitHub's new Git storage architecture"
date: "2026-11-08"
generated: "2026-11-08 07:00"
source: "HN"
slug: "2026-11-08_07-github-new-git-storage-architecture"
summary: "GitHub公布代号“Rubicon”的新一代Git存储架构，面向单仓库由大量智能体并行写入的场景。官方称内部测试曾让五千个智能体并发工作，并达到每秒七千二百次推送；但当前最繁忙仓库通常仍只是短时每秒数十次写入。该系统现处有限私测，计划明年扩大部署。本批次冻结数据为217分、62条评论。"
---

# GitHub's new Git storage architecture

## 事件背景
GitHub公布代号“Rubicon”的新一代Git存储架构，面向单仓库由大量智能体并行写入的场景。官方称内部测试曾让五千个智能体并发工作，并达到每秒七千二百次推送；但当前最繁忙仓库通常仍只是短时每秒数十次写入。该系统现处有限私测，计划明年扩大部署。本批次冻结数据为217分、62条评论。

## 核心观点 / 产品机制
设计关键是只让引用更新参与协调：不可变Git对象及索引先写入Azure Blob Storage，引用与包清单则进入复制日志服务Ref-CAS。虚拟副本把本地磁盘当作可重建缓存，写入时索引并上传包，再以一次事务更新清单和引用；读取时先比较日志序列号，落后才拉取必要包。Ref-CAS按引用执行比较交换和多数派提交，使不同分支可并行。压缩节点另行租约分片、合并包并校验对象集合，避免维护任务争抢服务请求的算力。

## 社区热议与争议点
本轮Algolia实际取得56个可见评论节点。yakkomajuri肯定其前瞻性，却质疑它主要解决单仓纵向扩展，未必能缓解近期故障；pksunkara反驳称，闲置仓库无需常驻磁盘，也会降低横向计算与存储负担。crote认为每仓每秒数千次推送本身就是错误的智能体协作方式，还会把压力转移到PR与Actions；clivedup则以共享后端存储的众多分叉和并行实验为例，认为该量级并非不可想象。

## 行业影响与未来展望
Rubicon把对象、引用一致性、在线计算和后台维护拆开，说明代码托管正在由“整仓副本”转向对象存储加细粒度日志。优势是热点仓库可按组件扩容，风险则是复杂度、云依赖及下游CI仍可能成为新瓶颈。其每秒七千二百次推送只是官方内测口径，有限私测能否保持延迟、可靠性与成本，仍需更广泛生产数据验证。

## 附带链接
- [GitHub官方架构原文](https://github.blog/engineering/architecture-optimization/inside-githubs-new-git-storage-architecture/)
- [Hacker News讨论](https://news.ycombinator.com/item?id=50397099)
