---
title: "Your agent forgets every correction you give it. I built a memory loop that mines session history and found the same 11 corrections repeated across my sessions."
date: "2026-07-09"
generated: "2026-07-09 07:00"
source: "Reddit"
slug: "2026-07-09_07-your-agent-forgets-every-correction-you-give-it-i-"
summary: "每一次与 coding agent 的会话都从零开始：你纠正它，它道歉，会话一结束，这条纠正也随之消亡。发帖者想弄清楚自己以这种方式究竟损失了多少反馈，"
---

# Your agent forgets every correction you give it. I built a memory loop that mines session history and found the same 11 corrections repeated across my sessions.

## 事件背景
每一次与 coding agent 的会话都从零开始：你纠正它，它道歉，会话一结束，这条纠正也随之消亡。发帖者想弄清楚自己以这种方式究竟损失了多少反馈，于是对个人的会话历史（涵盖 Claude Code、Codex 与 Cursor）做了一次系统分析，试图量化那些被反复丢弃的经验。

## 核心观点 / 产品机制
分析从历史记录中抽取出 235 条作者亲手敲给 agent 的反馈，令人意外的是，它们最终收敛成同样的 11 类问题，在不同会话里一次次重现。作者据此搭建了一个 memory loop：自动挖掘会话历史、识别高频纠正，再把这些反复出现的偏好沉淀为持久化记忆，在新会话启动时回喂给 agent，从而避免同一个错误被纠正十几遍。上述 235、11 等数字均为作者自述。

## 社区热议与争议点
支持一方认为，把重复纠正固化为记忆确实能显著减少返工，正是当下 agent 最缺的一环。质疑一方则提出几点：记忆可能过时或过拟合，旧偏好搬到新项目里反而变成噪声；挖掘完整会话历史牵涉隐私与敏感代码泄露风险；仅 11 个聚类能否泛化到他人、他项目仍存疑；此外把记忆持续塞进 context，也会挤占本就宝贵的 token 预算。

## 行业影响与未来展望
persistent memory 正成为 agent 赛道的核心竞争点，Claude Code、Cursor 等主流工具已陆续内建各自的 memory 机制。这类"从自身历史中学习"的闭环若能做好去重、时效衰减与作用域隔离，有望把一次性纠正转化为可复用的团队级规范，但如何在记忆的新鲜度与稳定性之间取得平衡，仍是长期待解的课题。

## 附带链接
- Reddit 原帖：https://www.reddit.com/r/AI_Agents/comments/1uqtdn8/your_agent_forgets_every_correction_you_give_it_i/
