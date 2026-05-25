---
title: "LLM 对战：让大模型在《帝国时代》与《核战争》中互相博弈"
date: "2026-05-26"
generated: "2026-05-26 07:00"
source: "Reddit"
slug: "2026-05-26_07-llms-play-age-of-empires"
summary: "这是 r/LLM 上一个典型的\"agentic benchmark\"型项目。作者把多个 LLM（很可能是 GPT-4 系、Claude、Gemini、Qwen、DeepSeek 等主流模型）接入到经典即时战略游戏《帝"
---

---
title: "I made LLMs play Age of Empires and Nuclear War against each other"
date: 2026-05-26
source: reddit
slug: llms-play-age-of-empires
permalink: https://www.reddit.com/r/LLM/comments/1tnnnig/i_made_llms_play_age_of_empires_and_nuclear_war/
---

# LLM 对战：让大模型在《帝国时代》与《核战争》中互相博弈

## 背景与动机

这是 r/LLM 上一个典型的"agentic benchmark"型项目。作者把多个 LLM（很可能是 GPT-4 系、Claude、Gemini、Qwen、DeepSeek 等主流模型）接入到经典即时战略游戏《帝国时代》以及冷战题材桌游《核战争》（Nuclear War card game）中，让它们作为独立 agent 互相对抗。这类项目延续了过去一年里非常火的 "LLM Arena via games" 思路——从 Diplomacy、Werewolf、Among Us 到 Civilization，研究者越来越倾向用复杂的、需要长期规划与博弈的游戏来评估模型，而不是再依赖容易被刷分的静态 benchmark。

## 技术结构（结构 B 推断）

典型实现路径有三层：

1. **游戏状态抽象层**：将《帝国时代》的地图、单位、资源、科技树序列化为结构化文本或 JSON，供 LLM 读取。AoE 是即时制，因此通常会通过 mod / API（例如 AoE2 的 CaptureAge / aoe-api）做"回合化"封装——每隔 N 秒暂停一次，把当前世界状态交给模型决策。
2. **Agent 决策层**：每个 LLM 通过 system prompt 拿到角色设定（文明、战略风格），并用工具调用方式输出动作（建造、采集、攻击、外交）。《核战争》则是天然回合制，更适合纯文本交互，重点考察 bluffing 与威慑推理。
3. **裁判 / 复盘层**：脚本统计胜率、资源效率、决策延迟、token 消耗，并生成对战回放。

## 看点与社区讨论

- **战略 vs 战术**：LLM 在宏观规划（科技路线、外交结盟）上往往表现尚可，但在微操和资源平衡上容易崩盘，这与之前 Civilization、StarCraft LLM 实验结论一致。
- **《核战争》的博弈学价值**：这款 1965 年的卡牌游戏核心机制是"谁先按按钮谁就死"，非常适合测试模型的威慑推理与心智理论（ToM）。看模型会不会理性地"互相保证毁灭"是社区最关心的点。
- **复现性**：评论区典型问题是开源代码、prompt 模板、以及使用的模型版本——作者若开源 repo，会成为后续 LLM benchmark 工作的有用基线。

## 价值评估

这是一份偏 hobby、强 demo 的工作，价值不在 SOTA，而在于：(1) 提供一个直观的、可视化的模型能力差异展示；(2) 为长上下文规划评估贡献新场景；(3) 引发对"游戏作为 LLM benchmark"方法论的讨论。对从业者来说，值得关注其代码框架是否可复用到自家模型评测中。
