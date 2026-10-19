---
title: "I reimplement Opencode v2 and v1 in Rust"
date: "2026-10-20"
generated: "2026-10-20 07:00"
source: "Reddit"
slug: "2026-10-20_07-i-reimplement-opencode-v2-and-v1-in-rust"
summary: "OpenCode 用户 microbass 称，自己的长期运行服务搭配三十三GB数据库时常驻内存约二点四GB，单会话搜索约六秒，因此另写 Rust 服务 ocserve。它不是客户端分叉，而是让原版终端界面和网页端通过既有协议直接连接。"
---

# I reimplement Opencode v2 and v1 in Rust

## 事件背景
OpenCode 用户 microbass 称，自己的长期运行服务搭配三十三GB数据库时常驻内存约二点四GB，单会话搜索约六秒，因此另写 Rust 服务 ocserve。它不是客户端分叉，而是让原版终端界面和网页端通过既有协议直接连接。

## 核心观点 / 产品机制
ocserve 以 SQLite、游标分页和有界缓存重做存储，保留 HTTP、SSE、终端、权限、问题、MCP、插件及快照回滚；一版契约冻结在一点十八点三十一，二版引擎需显式开启。帖子自报同机同数据下，空闲内存约一百MB、搜索零点二毫秒，闭环只读负载约六千七百对四百二十次每秒。仓库原始汇总确有六千七百三十六对四百一十七次每秒，但仅一轮、主机最低可用内存降至零点一GB；这是作者材料，不是独立跑分。

## 社区热议与争议点
RSS只返回一条普通评论和一条作者回复：gandazgul 建议改试 RunWield，并未确认性能；microbass 拒绝，称正基于 ocserve 经验打造自己的框架，仍属作者口径。更关键的是本轮复现：下载校验后的零点四点零发布包可通过录制语料回放，二十六项通过、零失败，破坏语料也会令负控变红；但用最新主分支产物对真实一点十八点三十一运行双端自测，干净阶段仍有四条路由因额外字段分歧而失败。仓库没有公开议题，现有评论不足以形成广泛共识。

## 行业影响与未来展望
项目说明兼容重实现可用协议测试替换重量级服务端，但性能数字受单机、缓存、闭环模型和数据集影响。若要成为稳健替代品，仍需修复实时差分闸门，并由外部机器复跑开放到达率、跨平台终端及真实工作流。

## 附带链接
- [Reddit 原帖](https://www.reddit.com/r/opencodeCLI/comments/1xab2a4/i_reimplement_opencode_v2_and_v1_in_rust/)
- [Reliary/ocserve](https://github.com/Reliary/ocserve)
- [性能方法与限制](https://github.com/Reliary/ocserve/blob/main/bench/load/BASELINE.md)
- [v0.4.0 发布](https://github.com/Reliary/ocserve/releases/tag/v0.4.0)
