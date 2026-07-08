---
title: "I built iris a terminal dashboard that watches all your Claude Code sessions at once (open source, Rust)"
date: "2026-07-09"
generated: "2026-07-09 07:00"
source: "Reddit"
slug: "2026-07-09_07-i-built-iris-a-terminal-dashboard-that-watches-all"
summary: "作者习惯并行跑 3 到 5 个 Claude Code 会话，却总是难以同时掌握每个会话正在做什么、又烧掉了多少钱。据其自述，正是亲眼看着某个会话花费一路突破 "
---

# I built iris a terminal dashboard that watches all your Claude Code sessions at once (open source, Rust)

## 事件背景
作者习惯并行跑 3 到 5 个 Claude Code 会话，却总是难以同时掌握每个会话正在做什么、又烧掉了多少钱。据其自述，正是亲眼看着某个会话花费一路突破 100 美元，才让他下决心动手做一个能统揽全局的监控工具。

## 核心观点 / 产品机制
iris 是一个用 Rust 编写的终端 TUI，它直接 tail 那些 Claude Code 本就会写入的 transcript 文件，在单一界面里实时呈现每个会话的状态、模型、token 与估算成本，并在顶部 header 放置一个聚合成本计数器，外加一条实时活动流。它遵循 local-first、对 transcript 只读、每秒刷新，无需 daemon 或额外配置；进阶功能包括 Haiku 生成的"doing/done/next"摘要，以及把各会话的工具调用审批集中到一处的 PreToolUse hook。

## 社区热议与争议点
赞赏一方认为它提供了难得的"单一玻璃视角"与成本可见性，只读、零配置的设计也让人放心。质疑一方则提醒：header 里的花费只是基于每模型单价的估算，未必等于账单真实数字；工具强依赖 Claude Code 的 transcript 格式，一旦官方改动内部结构就可能失效；更深一层的争论是，同时并行五个会话本身是否是健康的工程实践，还是在放大失控与烧钱的风险。

## 行业影响与未来展望
随着多 agent、多会话并行成为 vibe coding 的常态，围绕可观测性与成本管控的周边工具正快速涌现。iris 这类轻量、只读、本地优先的监督器，代表了"给 agent 装上仪表盘"的方向，未来若能标准化 transcript 接口、支持更多 CLI，有望演化为跨工具的统一 agent 控制台。

## 附带链接
- Reddit 原帖：https://www.reddit.com/r/opencodeCLI/comments/1uqsi7s/i_built_iris_a_terminal_dashboard_that_watches/
- iris 项目仓库：https://github.com/itzenata/iris-tui
- 项目主页：https://itzenata.github.io/iris-tui/
