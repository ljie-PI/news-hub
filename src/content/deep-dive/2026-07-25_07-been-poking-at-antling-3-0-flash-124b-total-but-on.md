---
title: "AntLing-3.0-flash：为 Agent 循环而生的稀疏执行模型"
date: "2026-07-25"
generated: "2026-07-25 07:00"
source: "Reddit"
slug: "2026-07-25_07-been-poking-at-antling-3-0-flash-124b-total-but-on"
summary: "蚂蚁集团旗下 inclusionAI 推出 AntLing-3.0-flash，延续 Ling 2.x 系列的稀疏 MoE 路线。该模型总参数达 124B，但每 token 仅激活约 5.1B，配合 256K 原生上下文与低�"
---

# AntLing-3.0-flash：为 Agent 循环而生的稀疏执行模型

## 事件背景
蚂蚁集团旗下 inclusionAI 推出 AntLing-3.0-flash，延续 Ling 2.x 系列的稀疏 MoE 路线。该模型总参数达 124B，但每 token 仅激活约 5.1B，配合 256K 原生上下文与低于 100ms 的首字延迟（TTFT）。与主打链式推理的模型不同，它被明确定位为 agent 循环中的"执行模型"，专注稳定的长程工具调用与指令遵循，而非解题式深度推理。发帖者正在实测其在真实工作流中的表现。

## 核心观点 / 产品机制
其核心是高稀疏度 MoE 加混合注意力：通过约 1/32 级别的稀疏激活，用极小的激活量换取接近数十 B 稠密模型的能力，同时维持高吞吐与低延迟。256K 上下文让它能容纳完整代码库或多轮工具轨迹；低 TTFT 意味着在 agent 每一步的频繁往返中不拖后腿。设计哲学是"少输出、稳执行"——不靠冗长思维链刷分，而靠可预测的格式遵循和函数调用来支撑生产级 agent。

## 社区热议与争议点
（以下为议题层面归纳，未逐字引用评论。）支持方认为，agent 场景真正稀缺的是稳定性与延迟，而非纸面推理分，激活量小意味着单位成本更低。质疑方则指出：定位"执行而非推理"可能在复杂规划任务上吃亏；124B 总参数对本地部署的显存/内存要求仍高，稀疏 MoE 的实际吞吐依赖良好的推理框架支持；此外"稳定长程工具调用"缺乏统一 benchmark，难以横向验证。

## 行业影响与未来展望
AntLing-3.0-flash 反映了行业分工趋势：推理模型与执行模型解耦，让 agent 系统按角色调度不同模型。若其低延迟与格式稳定性经得起社区检验，将强化"小激活、大上下文"作为 agent 骨干的范式，并给 Qwen、GPT-OSS 等 MoE 同类施压。未来关键在开放权重、工具调用 benchmark 与量化部署生态能否跟上。

## 附带链接
- 原帖：https://www.reddit.com/r/LLM/comments/1v5bras/
- inclusionAI Ling-V2：https://github.com/inclusionAI/Ling-V2
- Ling-2.6-flash 模型卡：https://huggingface.co/inclusionAI/Ling-2.6-flash
