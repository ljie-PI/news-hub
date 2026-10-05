---
title: "VictorTaelin/OptMem"
date: "2026-10-06"
generated: "2026-10-06 07:00"
source: "GitHub"
slug: "2026-10-06_07-victortaelin-optmem"
summary: "OptMem 是给可调用命令行的编码代理用的本地持久记忆：把跨会话身份、决策和经验写到普通文件，不绑定模型、厂商或向量库。它面向希望以一段代理指令接入记忆、又不想部署服务的个人开发者。README 所称“提示仅 426 个词元”属于项目自报口径。"
---

# VictorTaelin/OptMem

## 定位与痛点剖析

OptMem 是给可调用命令行的编码代理用的本地持久记忆：把跨会话身份、决策和经验写到普通文件，不绑定模型、厂商或向量库。它面向希望以一段代理指令接入记忆、又不想部署服务的个人开发者。README 所称“提示仅 426 个词元”属于项目自报口径。

## 核心架构与技术细节

默认分支的产品主体只有无第三方依赖的 Python 脚本 `memo`。`note` 把每条记忆追加为 320 字节定宽记录；`TREE` 以 288 字节记录缓存按二次幂区间合并的二叉摘要，原始日志不改写。摘要不是后台模型生成，而由代理响应 `nap` 提示写回；`wake` 在默认 96 行预算内保留近期细节、压缩旧记忆，`zoom` 逐层展开，`recall` 全量正则扫描。本次在默认分支实跑测试为 109099 项通过、零失败；README 的“百万条唤醒耗时 0.03 秒”仍只应视为自测自报。

## 竞品对比与生态站位

Mem0 官方仓库提供库、自托管服务和云平台，默认需要大模型与嵌入模型，并支持混合检索；Letta 则是含代理运行时、应用服务器、终端和多渠道的完整有状态代理平台。OptMem 的优势是单文件、纯本地、存储可审计且迁移成本低；代价是没有语义检索、共享服务、鉴权和应用运行时，更像最小记忆协议而非生产基础设施。

## 开发者反馈与局限性

开放 issue #14 的报告者称，在十四个完成唤醒的会话中，记忆调用占工具调用百分之四点七，且笔记大量记录短期状态；这是用户报告，维护者尚未确认。#9 反映跨项目记忆混杂。更具体的 #12 行分隔符注入和 #10 断裂树记录问题仍开放；修复 PR #13、#11 及汇总 PR #18 均未合并，不能写成已修复。仓库树也无许可证文件，#8 的许可询问仍开放。

## 附带链接

- [项目仓库](https://github.com/VictorTaelin/OptMem)
- [核心脚本](https://github.com/VictorTaelin/OptMem/blob/main/memo)与[测试](https://github.com/VictorTaelin/OptMem/blob/main/test.py)
- [问题列表](https://github.com/VictorTaelin/OptMem/issues)、[汇总修复 PR #18](https://github.com/VictorTaelin/OptMem/pull/18)
- [Mem0](https://github.com/mem0ai/mem0)、[Letta](https://github.com/letta-ai/letta)
