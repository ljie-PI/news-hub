---
title: "Grace Blackwell needs a new scheduler: 27% more usable GPUs from the same racks"
date: "2026-10-30"
generated: "2026-10-30 07:00"
source: "HN"
slug: "2026-10-30_07-grace-blackwell-gpu-scheduler"
summary: "GB200/GB300 NVL72把一架十八节点、七十二块GPU接入同一NVLink域；NVIDIA资料确认每卡双向带宽为1.8 TB/s。跨机架则回落到InfiniBand，故多节点训练的放置从性能优化变成硬约束。本批冻结热度为115 points、21 comments；调研时Algolia实际取得18个可见评论节点。"
---

# Grace Blackwell needs a new scheduler: 27% more usable GPUs from the same racks

## 事件背景
GB200/GB300 NVL72把一架十八节点、七十二块GPU接入同一NVLink域；NVIDIA资料确认每卡双向带宽为1.8 TB/s。跨机架则回落到InfiniBand，故多节点训练的放置从性能优化变成硬约束。本批冻结热度为115 points、21 comments；调研时Algolia实际取得18个可见评论节点。

## 核心观点
SkyPilot主张把大作业拆成可配置的十六节点切片，每片原子落在一架，留下两节点作故障热备；GPU Manager发现故障后由Frontier Trainer原位换节点，无热备才迁片。其称在约百分之二节点不可用率下，NVIDIA模型给出十六节点切片可用2037节点，较整架十八节点的1602多百分之二十七；自动碎片整理则只抢占可安全从检查点恢复的作业。该结果和节省金额均属厂商建模或自报，并非独立实测。

## 社区热议
支持者retiredpapaya希望调度器开源，认为有公共价值。质疑者jhgg称文章大量讲常识却缺调度器实现细节；发布方zhwu回应其建于Kueue之上，按十六节点原子切片并留两台热备，后续再公开细节。asaiacai指出Kueue早已有拓扑感知调度；zhwu承认这一前置基础，但称Kueue弹性作业目前不支持TAS，热替换需另补能力，均属发布方口径。

## 行业影响
NVIDIA一手资料同样把NVL72视为刚性调度块；Kueue文档则证实TAS已默认启用、支持机架层级与单节点热换，但多故障会驱逐作业，且弹性作业仍无TAS。这说明创新不在“拓扑感知”本身，而在把切片、故障恢复和碎片整理合成生产闭环；真正价值仍需源码、故障率分布及对照压测验证。

## 附带链接
- SkyPilot原文：https://skypilot.ai/blog/grace-blackwell-needs-a-new-scheduler
- Hacker News：https://news.ycombinator.com/item?id=50290912
- NVIDIA块调度：https://developer.nvidia.com/blog/achieving-peak-system-and-workload-efficiency-on-nvidia-gb200-nvl72-with-slurm-block-scheduling/
- Kueue TAS：https://kueue.sigs.k8s.io/docs/concepts/topology_aware_scheduling/
- Kueue弹性作业：https://kueue.sigs.k8s.io/docs/concepts/elastic_workload/
