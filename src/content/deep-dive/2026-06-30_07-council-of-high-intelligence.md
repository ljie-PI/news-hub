---
title: "0xNyk/council-of-high-intelligence"
date: "2026-06-30"
generated: "2026-06-30 07:00"
source: "GitHub"
slug: "2026-06-30_07-council-of-high-intelligence"
summary: "Council of High Intelligence 是一个以 Shell 实现的\"AI 议会\"工具，让 18 位历史与当代智者人格（亚里士多德、苏格拉底、费曼、卡尼曼、Torvalds、塔勒布等）跨"
---

# 0xNyk/council-of-high-intelligence

## 定位与痛点剖析
Council of High Intelligence 是一个以 Shell 实现的"AI 议会"工具，让 18 位历史与当代智者人格（亚里士多德、苏格拉底、费曼、卡尼曼、Torvalds、塔勒布等）跨多家 LLM 提供商对你最艰难的决策进行多轮审议，只需一条命令 `/council`。它解决的痛点是：单个 LLM 往往给出"流畅、结构化却错误"的自信答案，只呈现一条推理路径。它面向需要做架构、战略、定价、伦理等高风险决策的开发者与创业者。

## 核心架构与技术细节
项目以 Claude Code / Codex 技能形式安装，核心理念是"结构化的分歧"。18 名成员被设计为极性对（如苏格拉底自上而下解构 vs 费曼自下而上重建），并通过多提供商自动路由把成员分散到 Claude、OpenAI、Gemini、Ollama、NVIDIA NIM、Cursor 上以获得真正的模型多样性。审议含三种模式：Full（三轮：独立分析→交叉质询→最终立场）、Quick（两轮快速）、Duo（两人辩证）。Full 模式跑 7 步协议，含"问题重述门"、异议配额、新颖性门与反事实提示来防止群体思维；裁决以"未解问题"和"下一步建议"开头而非伪共识。

## 竞品对比与生态站位
相比直接单次 prompt 或 CrewAI、AutoGen 等多 agent 框架，本项目更轻量、决策导向，零配置的自动路由是其特色；采用 CC0 公共领域许可。它定位为 CLI agent 之上的"决策增强层"，预置 20 套领域三人组与 classic、exploration-orthogonal、execution-lean 等面板。

## 开发者反馈与局限性
项目单日涨 300+ 星，"召集一个董事会而非问一个顾问"的比喻颇受认可。局限在于：要获得真正的模型多样性需安装多个提供商 CLI 并配置密钥，否则全部回退到 Claude，多样性沦为"换装"；18 成员多轮审议的 token 成本与耗时较高，不适合简单问题；人格的"推理风格"本质仍是提示工程，深度有限。

## 附带链接
- GitHub Repo: https://github.com/0xNyk/council-of-high-intelligence
