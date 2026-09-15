---
title: "I built a tool to find agent failures that repeat across runs."
date: "2026-09-16"
generated: "2026-09-16 07:00"
source: "Reddit"
slug: "2026-09-16_07-i-built-a-tool-to-find-agent-failures-that-repeat"
summary: "帖子关注定时抓取、报表与队列任务的“失忆”：同一外部接口每晚返回429，代理每次从零重试，小模型甚至静默跳过。作者因此发布FailEcho本地扫描器，并把问题扩展为跨代理共享恢复经验。仓库于9月10日建立，当前仍是早期MVP。"
---

# I built a tool to find agent failures that repeat across runs.

## 事件背景
帖子关注定时抓取、报表与队列任务的“失忆”：同一外部接口每晚返回429，代理每次从零重试，小模型甚至静默跳过。作者因此发布FailEcho本地扫描器，并把问题扩展为跨代理共享恢复经验。仓库于9月10日建立，当前仍是早期MVP。

## 核心观点 / 产品机制
扫描器读取Claude Code的本地JSONL会话，只统计MCP、网页搜索等外部工具；按“工具、错误类别、状态码”跨会话聚类，计算重复次数、首次恢复后的重试税，并记录失败后紧邻的工具及同会话稍后是否成功。后者明确只是相关线索，不等于因果。源码不导入网络库，错误原文与路径不输出；配套包装器则为LangChain等上报服务、操作、错误类别和耗时，恢复动作仍需显式回报。笔者在提交bb2c9c6上运行两组相关测试，共43项通过。

## 社区热议与争议点
Atom源共返回6项：主帖、机器人及4条可见评论/作者回复，并非完整评论区。pushpendraagrawal指出不同模型会把同一根因重试成不同表象，简单分桶可能漏报；ShowerAnnual9741以“假成功写入”为支持案例，但建议加入恢复路径，避免把过期令牌导致的未找到、未授权和挂起误并；Big-Sky-9500追问发现重复429后，系统究竟会给下次代理提示，还是只生成供人查看的仪表盘。作者仅回复称会共享失败形态与有效修复，尚未提供独立效果数据。

## 行业影响与未来展望
方向契合从单次追踪转向跨运行聚类、回归样本与恢复反馈的可观测性趋势，但价值取决于指纹质量、成功调用分母和恢复闭环。官网统计在2026年9月15日仍为零外部观测、零跨代理帮助；项目也承认空网络、私有工具重叠稀薄、无认证和可被投毒等边界。因此它目前更像可审计的故障记忆原型，而非已验证的自治修复层。

## 附带链接
- [Reddit原帖](https://www.reddit.com/r/AI_Agents/comments/1wh93xq/i_built_a_tool_to_find_agent_failures_that_repeat/)
- [GitHub仓库](https://github.com/FailEcho/failecho)
- [项目说明](https://failecho.com/about)
- [实时统计](https://failecho.com/v1/stats)
