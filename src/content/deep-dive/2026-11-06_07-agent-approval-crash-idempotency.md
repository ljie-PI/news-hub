---
title: "Approval, crash, resume: the approved action ran twice in 3 agent frameworks. How do you handle this?"
date: "2026-11-06"
generated: "2026-11-06 07:00"
source: "Reddit"
slug: "2026-11-06_07-agent-approval-crash-idempotency"
summary: "作者把“付款”简化为本地文件追加：批准后执行，以`os._exit`杀死进程，再按文档恢复。仓库三十份JSON含九十组框架结果，本轮逐份核对均为无防护两次、有外部防护一次。成功判据只是追加行数，不是真实支付成功率；数字属作者本地自测，并非独立复现。"
---

# Approval, crash, resume: the approved action ran twice in 3 agent frameworks. How do you handle this?

## 事件背景
作者把“付款”简化为本地文件追加：批准后执行，以`os._exit`杀死进程，再按文档恢复。仓库三十份JSON含九十组框架结果，本轮逐份核对均为无防护两次、有外部防护一次。成功判据只是追加行数，不是真实支付成功率；数字属作者本地自测，并非独立复现。

## 核心观点 / 产品机制
批准只回答“允许做”，不能原子证明副作用“已做一次”。若崩溃落在副作用提交与保存进度之间，旧检查点会重放。补救是预先持久化操作标识，把操作、工具名和规范化参数绑定为稳定幂等键；无原子去重时记录结果未知，先权威对账。官方能力须分账：LangGraph明确恢复会从节点开头重跑；Pydantic AI支持延迟审批后以历史开启新运行，其议题仅获项目分诊复现；OpenAI Agents SDK文档已明确批准不等于恰好一次。

## 社区热议与争议点
逐帖Atom十五项含普通评论十二项，只代表可见子集。Fit-Fennel主张把审批账本置于框架外并绑定参数；bostonaholic类比Kafka先产生副作用后提交偏移，建议逐边界杀进程；Significant_Door提醒Stripe键可能二十四小时后失效，长暂停仍须对账；leafar建议把运维动作写成目标状态，避开“再增加一次”。这些讨论也暴露单一崩溃点和永久有效键的假设。

## 行业影响与未来展望
这不是框架排名，也不能证明所有版本都会重复：实验仅含一台Windows机器、伪模型、本地文件和一个崩溃窗口，未覆盖真实网络、磁盘故障、分布式工作者。生产验收应检查批准参数绑定、稳定键、外部账本、未知态与人工处置，并逐写入边界注入故障。

## 附带链接
- [Reddit原帖](https://www.reddit.com/r/AI_Agents/comments/1xoqoyq/approval_crash_resume_the_approved_action_ran/)
- [实验说明、脚本与逐次数据](https://github.com/salahmakboul/call4agents/tree/main/docs/finding)
- [LangGraph恢复文档](https://docs.langchain.com/oss/python/langgraph/interrupts)
- [Pydantic AI复现议题](https://github.com/pydantic/pydantic-ai/issues/10926)
- [OpenAI Agents SDK崩溃恢复文档](https://openai.github.io/openai-agents-python/human_in_the_loop/#recovering-after-a-crash)
