---
title: "02 · forrestchang/andrej-karpathy-skills"
date: "2026-04-15"
source: "GitHub"
slug: "2026-04-15_09-02_andrej-karpathy-skills"
summary: "这是一个极简但影响深远的项目：**一个单文件 CLAUDE.md**，衍生自 Andrej Karpathy 对 LLM 编程助手行为缺陷的公开批评。"
---

# 02 · forrestchang/andrej-karpathy-skills

> ⭐ 21,795 stars / week | 33,847 total | 2026-04-15

## a. 定位与痛点剖析

这是一个极简但影响深远的项目：**一个单文件 CLAUDE.md**，衍生自 Andrej Karpathy 对 LLM 编程助手行为缺陷的公开批评。

Karpathy 在 X 上直白指出了 LLM Coding Agent 的核心病症：
1. **假设驱动**：模型对不确定的事情默默做假设然后执行，不会主动求证；
2. **过度工程化**：本来100行能解决的问题硬写成1000行，热衷于"灵活性"和"可配置性"；
3. **手贱改动**：在修改指定代码时，顺手改掉了它不完全理解的注释或相邻代码；
4. **弱成功标准**：接收到模糊指令时不会建立可验证的完成标准，只会一直"努力执行"。

该项目将这些痛点精炼为**4条原则**，写进一个可直接复用的 CLAUDE.md 文件，以 Claude Code Plugin 或 per-project 配置文件两种方式注入到编程会话中。

## b. 核心架构与技术细节

这不是传统意义上的"软件项目"，而是一个**提示词工程规范文件**。技术核心在于 Claude Code 的 Plugin/Context File 机制：

**4条核心原则（技术实现逻辑）**：

1. **Think Before Coding（编码前思考）**：
   - 触发机制：遇到模糊需求时停止执行，显式列出所有假设
   - 行为约束：存在多种解读时必须呈现选项，不得静默选择
   - 反模式打击：禁止"直接跑起来再说"的惯性

2. **Simplicity First（简洁优先）**：
   - 禁止生成未被要求的功能、抽象层、错误处理
   - "Is this over-engineered?" 作为自检标准
   - 若200行可以解决问题，禁止写50行以上的额外代码

3. **Surgical Changes（外科手术式修改）**：
   - 只改被要求修改的代码
   - 不"顺手优化"相邻代码或格式
   - 自己改动造成的孤儿代码（unused imports等）需清理，但不清理既有死代码

4. **Goal-Driven Execution（目标驱动执行）**：
   - 将命令式指令转化为可验证的成功标准（写测试 → 使其通过）
   - 多步任务前列出计划并标明每步验证方法

**安装方式**：
- Plugin 市场：`/plugin marketplace add forrestchang/andrej-karpathy-skills` → `/plugin install andrej-karpathy-skills@karpathy-skills`
- 单项目：`curl -o CLAUDE.md https://raw.githubusercontent.com/.../CLAUDE.md`

## c. 竞品对比与生态站位

该项目开创了一个新的品类：**LLM 行为规范文件（Behavior Constraint Files）**。类似产品包括：

- **awesome-cursorrules**：Cursor 的 rules 文件集合，但偏项目特定规范，缺乏 LLM 行为层面的通用约束
- **各种 CLAUDE.md 模板**：通常是项目上下文注入，不是行为约束
- **openai/evals**：评估导向而非行为约束

forrestchang 的这个文件的独特性在于它对准了**模型的认知行为缺陷**而非具体项目规范，因此有极强的可移植性。加上 Karpathy 的背书效应（AI 领域 KOL），一周 2 万星完全可以理解。

## d. 开发者反馈与局限性

**正面**：
- 极低的使用门槛（一个文件，一条 curl 命令）
- 解决了每个 Claude Code 用户都遇到过的真实痛点
- 可与项目专属规范叠加使用

**局限性**：
- 本质是提示词，效果随模型版本更新可能退化（Claude 3.7 vs 4.x 行为差异未测试）
- 4条原则之间存在张力：Simplicity First 与 Goal-Driven Execution 在某些场景下会冲突（测试驱动开发本身也会增加代码量）
- 没有配套的量化验证方法，用户无法客观评估是否真的"更少无关改动"
- 偏向 cautious-mode，对于明确简单的任务会引入不必要的停顿

## e. 附带链接
- GitHub: https://github.com/forrestchang/andrej-karpathy-skills
- Karpathy 原推: https://x.com/karpathy/status/2015883857489522876
