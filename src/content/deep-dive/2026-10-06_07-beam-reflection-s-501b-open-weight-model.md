---
title: "Beam: Reflection's 501B open-weight model"
date: "2026-10-06"
generated: "2026-10-06 07:00"
source: "HN"
slug: "2026-10-06_07-beam-reflection-s-501b-open-weight-model"
summary: "Reflection于十月五日公布Beam，定位为面向编程、推理与代理任务的开放权重模型；但权重、模型卡、技术报告和运行工具当时仍未发布，只承诺月内提供。该帖批次冻结为236点、65条评论，调研刷新Algolia后实取63个可见节点，未触及100条上限，不代表完整评论区。"
---

# Beam: Reflection's 501B open-weight model

## 事件背景
Reflection于十月五日公布Beam，定位为面向编程、推理与代理任务的开放权重模型；但权重、模型卡、技术报告和运行工具当时仍未发布，只承诺月内提供。该帖批次冻结为236点、65条评论，调研刷新Algolia后实取63个可见节点，未触及100条上限，不代表完整评论区。

## 核心观点 / 产品机制
Beam采用稀疏混合专家架构，总参数501B、每词元激活23B，并结合交错的局部与全局注意力、细粒度路由专家、无辅助损失负载均衡、深度残差缩放及FP32残差累加。官方自报预训练使用23.8万亿词元；强化学习在10.5K张NVIDIA GB300上持续四周，生成逾一亿次轨迹。其基准分数、三至四倍推理计算效率及近乎均匀的专家利用率也均为官方自报，尚非独立复现。

## 社区热议与争议点
支持方中，dotancohen认为新参与者本身值得欢迎，不必首版即破纪录；eaf7e281赞赏官方承认Kimi K3原始能力仍领先。反方更关注可验证性：wronglebowski直言没有权重和Hugging Face仓库，发布只停留在口头；aeetes则批评图表把更强开放模型放在折叠区域，造成领先错觉。这些意见共同指向“开放权重”承诺与可下载、可复测之间的时间差。

## 行业影响与未来展望
若Apache 2.0权重及完整工具链如期交付，Beam可增加企业自部署与代理模型的选择；23B激活量有利于降低单词元计算，但501B总权重仍意味着较高存储和多卡门槛。真正竞争力要等模型卡、量化版本、复现实验和实际吞吐公布后判断。

## 附带链接
- [官方原文](https://reflection.ai/blog/introducing-beam)
- [Hacker News原帖](https://news.ycombinator.com/item?id=49969183)
- [Algolia评论树](https://hn.algolia.com/api/v1/items/49969183)
