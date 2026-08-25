---
title: "I benchmarked AutoGen, CrewAI, LangGraph, and MetaGPT against my own Agent OS. The \"LLM-as-a-judge\" paradigm is completely broken. Here is the local data."
date: "2026-08-26"
generated: "2026-08-26 07:00"
source: "Reddit"
slug: "2026-08-26_07-i-benchmarked-autogen-crewai-langgraph-and-metagpt"
summary: "作者在 RTX A4500 上以 qwen2.5-coder:14b 和相同脚手架，让五套系统编写需加密、万次请求低于一毫秒、测试全覆盖且静态检查无警告的 Rust 中间件。他承认竞品流程依据官网简化；正文虽称日志与工具可复现，却未附下载地址，故这是作者本地自测，并非独立基准。"
---

# I benchmarked AutoGen, CrewAI, LangGraph, and MetaGPT against my own Agent OS. The "LLM-as-a-judge" paradigm is completely broken. Here is the local data.

## 事件背景

作者在 RTX A4500 上以 qwen2.5-coder:14b 和相同脚手架，让五套系统编写需加密、万次请求低于一毫秒、测试全覆盖且静态检查无警告的 Rust 中间件。他承认竞品流程依据官网简化；正文虽称日志与工具可复现，却未附下载地址，故这是作者本地自测，并非独立基准。

## 核心观点 / 产品机制

作者自测称，AutoGen 消耗五十一万七千输入词元后跑题；CrewAI 编译通过却偏离需求；MetaGPT 仅产出一行源码却宣告成功；LangGraph 编译失败但如实停止；GenOS 用快照、分叉、回放及 Cargo 闸门交付一百一十七行代码，不过五项测试只过三项。编译器、测试、断言能为可执行属性提供客观信号。官方资料显示，AutoGen 可由模型选发言者，CrewAI 层级管理者负责委派与验证，LangGraph 兼容预定工作流和动态代理，MetaGPT 采用角色化 SOP；这说明所测模式存在，却不代表各框架全部能力，更不能由单任务推出“模型裁判普遍失效”。

## 社区热议与争议点

RSS 六个条目含主帖、两条普通评论、两条作者回复及一条 AutoModerator，仅是抓取时可见子集。普通用户 Ok-Click-2390 赞同词元消耗荒唐，却指出 GenOS 也只是诚实返回失败。Remarkable_Training9 支持机械校验，并举出代理连续六天“绿色运行”却无产出的经历。作者强调快照、隔离假设、轨迹血缘与回放，但这仍属作者口径。机器人通知不计观点；样本中缺少独立复现和强反方，不能据此宣称社区已有共识。

## 行业影响与未来展望

更稳妥的方向是分层验收：编译、属性测试与安全扫描守硬约束，人工或模型评审补足意图和体验。框架比较还应公开提示、代码、停止条件与计费口径，采用多任务、多随机种子及盲评；否则差异可能来自配置，而非框架本身。

## 附带链接

- [Reddit 原帖与 RSS 评论来源](https://www.reddit.com/r/AI_Agents/comments/1vya95u/i_benchmarked_autogen_crewai_langgraph_and/)
- [AutoGen：Selector Group Chat](https://microsoft.github.io/autogen/stable/user-guide/agentchat-user-guide/selector-group-chat.html)
- [CrewAI：Hierarchical Process](https://docs.crewai.com/en/learn/hierarchical-process)
- [LangGraph：Workflows and agents](https://docs.langchain.com/oss/python/langgraph/workflows-agents)
- [MetaGPT 官方仓库](https://github.com/FoundationAgents/MetaGPT)
