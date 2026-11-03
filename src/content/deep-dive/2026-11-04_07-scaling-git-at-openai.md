---
title: "Scaling Git at OpenAI"
date: "2026-11-04"
generated: "2026-11-04 07:00"
source: "HN"
slug: "2026-11-04_07-scaling-git-at-openai"
summary: "Codex让单个工程师并行推进多项变更，分支、推送与CI拉取同步暴涨。OpenAI称旧单仓库服务的合并可靠性一度低于90%，于是用十周构建Pando，在不改Git协议和开发习惯的前提下替换后端。批次冻结263 points、178 comments；调研刷新实际取得100个可见节点，已触及本次上限。"
---

# Scaling Git at OpenAI

## 事件背景

Codex让单个工程师并行推进多项变更，分支、推送与CI拉取同步暴涨。OpenAI称旧单仓库服务的合并可靠性一度低于90%，于是用十周构建Pando，在不改Git协议和开发习惯的前提下替换后端。批次冻结263 points、178 comments；调研刷新实际取得100个可见节点，已触及本次上限。

## 核心观点 / 产品机制

Pando将推入的packfile流式校验后存入对象存储，以Turtle记录每个ref版本及依赖；不同分支只争用各自指针，换取因果一致性而非全库瞬时快照。读取端据have/want选择既有包，用packfile-uri和区域缓存并行下载；后台按类似LSM的层级合并小包。OpenAI自报中位推送延迟下降近80%、缓存命中超99%，但模拟是教学模型，生产数字亦未获独立复现。

## 社区热议与争议点

评论呈两极：paxy肯定文章少营销、数据和可视化扎实；jsnell认为代码变便宜会扩大值得实施的项目边界。反方mrbungie警告高代码量会吞噬代理上下文并拖慢后续决策；Sol-观察生成式开发易产生重复的一次性工具，甚至把提交代码理解为省去再次生成的“缓存”。

## 行业影响与未来展望

关键不是抛弃Git，而是将协议稳定性与后端一致性解耦：多代理团队可能更依赖按分支扩写、可缓存传输和后台压实。OpenAI已把部分packfile-uri、并行下载与恢复改进贡献上游；不过Pando尚未公开，跨分支快照语义变弱，是否适合审计严格或分支关系复杂的组织仍需验证。

## 附带链接

- [OpenAI 原文](https://openai.com/index/scaling-git-at-openai/)
- [Hacker News 讨论](https://news.ycombinator.com/item?id=50345924)
