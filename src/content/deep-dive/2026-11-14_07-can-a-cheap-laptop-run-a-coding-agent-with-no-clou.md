---
title: "can a cheap laptop run a coding agent with no cloud at all? i tried a 4b and a 9b model on a 16gb macbook air"
date: "2026-11-14"
generated: "2026-11-14 07:00"
source: "Reddit"
slug: "2026-11-14_07-can-a-cheap-laptop-run-a-coding-agent-with-no-clou"
summary: "帖主把编码 Agent 从高端硬件拉回一台 16GB MacBook Air，离线运行 Qwen 3.5 4B 与 9B，任务是用 Python 做个人支出追踪器。其自报结果是：4B 完成单个银行 CSV 读取函数并过 10/10 隐藏测试；9B 同题 7/10；9B 再做五文件整应用，25 分钟内写出 638 行，通过 22/50。帖子自己已限定：每种设置仅跑一次，只是初探。"
---

# can a cheap laptop run a coding agent with no cloud at all? i tried a 4b and a 9b model on a 16gb macbook air

## 事件背景

帖主把编码 Agent 从高端硬件拉回一台 16GB MacBook Air，离线运行 Qwen 3.5 4B 与 9B，任务是用 Python 做个人支出追踪器。其自报结果是：4B 完成单个银行 CSV 读取函数并过 10/10 隐藏测试；9B 同题 7/10；9B 再做五文件整应用，25 分钟内写出 638 行，通过 22/50。帖子自己已限定：每种设置仅跑一次，只是初探。

## 核心观点 / 产品机制

所用 Atomic Agent 仓库确认为本地优先运行时：经 llama.cpp 推理，模型一次产出受 GBNF 约束的工具调用数组，运行文件与命令后压缩结果，再进入下一轮；源码中的 ToolLoopTracker 会对重复调用与相同结果先警告、再阻止，能解释帖主所说的“循环检查”。仓库也有 Qwen 4B/9B 的小模型矩阵、隔离工作区和确定性隐藏检查器，正式配置要求三次重复。不过当前 main 未见这次支出追踪器的题目、50 项测试或原始轨迹，因此分数仍是作者口径，不能视为仓库可复现基准。

## 社区热议与争议点

逐帖 Atom RSS 共 11 个 entry：主帖一条、评论十条，其中机器人一条、作者两条、普通用户七条，仅代表可见子集。普通用户 Far_Reindeer8428 称旧 ThinkPad 上的 9B 第二个文件即因导入和路径失败；作者回应自己的 9B 在杂乱 CSV 上仅 1/10，循环检查也介入过。QuanTradin 认为 4B 胜 9B 更像单次噪声，要求复跑；dustin_vk 则直接质疑 4B 对非平凡编码是否有用。前两例支持运行时护栏的价值，后两例击中样本量与任务外推问题。

## 行业影响与未来展望

实验说明“能在廉价设备上行动”已成立，但“稳定完成软件工程”仍未成立。本地路线的竞争点会从模型尺寸转向上下文压缩、结构化工具调用、循环制动和可审计测试。后续应公开题目与隐藏测试生成法，做多随机种子复跑，并同时报告墙钟、内存、步骤数及失败类型；否则不能把一个函数或一台 Mac 的结果外推为通用编码能力。

## 附带链接

- [Reddit 原帖](https://www.reddit.com/r/AI_Agents/comments/1xvkn0f/can_a_cheap_laptop_run_a_coding_agent_with_no/)
- [Atomic Agent 仓库](https://github.com/AtomicBot-ai/atomic-agent)
- [小模型评测运行说明](https://github.com/AtomicBot-ai/atomic-agent/blob/main/eval-agents/small-models/RUNBOOK.md)
