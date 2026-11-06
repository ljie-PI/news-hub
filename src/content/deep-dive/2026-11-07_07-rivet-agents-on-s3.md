---
title: "Launch HN: Rivet (YC W23) – Scale and Orchestrate Agents on S3"
date: "2026-11-07"
generated: "2026-11-07 07:00"
source: "HN"
slug: "2026-11-07_07-rivet-agents-on-s3"
summary: "Rivet由游戏服务器编排转向代理基础设施：团队认为为每个代理常驻微型虚拟机，启动慢且大量时间在等待模型。原帖把长期会话、实时连接与状态恢复归入Actor。批次冻结为118 points、58 comments；本轮刷新Algolia实际取得55个可见节点，未触及100上限，两者因抓取时点、删除或折叠而分账。"
---

# Launch HN: Rivet (YC W23) – Scale and Orchestrate Agents on S3

## 事件背景

Rivet由游戏服务器编排转向代理基础设施：团队认为为每个代理常驻微型虚拟机，启动慢且大量时间在等待模型。原帖把长期会话、实时连接与状态恢复归入Actor。批次冻结为118 points、58 comments；本轮刷新Algolia实际取得55个可见节点，未触及100上限，两者因抓取时点、删除或折叠而分账。

## 核心观点 / 产品机制

每个Actor是按键寻址的长驻进程，内含队列、WebSocket与SQLite或POSIX卷；控制平面负责调度、唤醒和路由。写入先由承载该卷的多数实例落盘后确认，发布配置为跨可用区三副本取二，再异步批量下沉S3；读取先查磁盘缓存，休眠后可在别的节点恢复。仓库确认为Apache-2.0，包含Rust控制平面及TypeScript、Rust SDK。官方基准公开脚本与原始样本，但延迟、密度和成本仍是项目方环境结果，不等同独立复现。

## 社区热议与争议点

正面例子是fastball：其称已把孤立于Cloudflare Durable Objects的组件迁入AWS与Vercel所在VPC，体验顺畅。反方有三类：esafak认为代理主要耗时在等模型，编排速度不是首要痛点；chicagobuss提醒跨可用区复制会增加AWS流量费；minraws则称当前体验让自己及Codex、Claude都不清楚如何使用。讨论认可自托管与耐久状态，也暴露定位、成本和上手门槛。

## 行业影响与未来展望

若Actor密度与恢复语义经更多生产负载验证，代理平台的伸缩单位可从“每代理一沙箱”转为“持久Actor加按需执行器”，让会话状态与高权限运行环境分离。代价是团队仍须验证冷数据恢复、跨区费用、故障一致性及工具结果是否完整持久化；任意代码隔离仍依赖独立的agentOS或外部沙箱，不能由S3分层本身保证。

## 附带链接

- [Hacker News 原帖](https://news.ycombinator.com/item?id=50381687)
- [Rivet 官网](https://rivet.dev/)
- [GitHub 仓库](https://github.com/rivet-dev/rivet)
- [架构文档](https://rivet.dev/docs/architecture/)
- [存储文档](https://rivet.dev/docs/deploy/self-host/control-plane/storage/)
- [基准方法与结果](https://rivet.dev/docs/benchmarking/)
