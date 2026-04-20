---
title: "FunctionGemma-270m 微调踩坑实录：为什么模型总在\"幻觉\"，不听你的路由逻辑？"
date: "2026-04-20"
source: "Reddit"
slug: "2026-04-20_07-functiongemma-finetuning-hallucination"
summary: "---"
---

# FunctionGemma-270m 微调踩坑实录：为什么模型总在"幻觉"，不听你的路由逻辑？

> 来源：Reddit r/LLM · 2026-04-20 · [原帖链接](https://www.reddit.com/r/LLM/comments/1sq6419/)

---

## 1. 事件背景

一位 Reddit 用户在 r/LLM 发帖，标题直指痛点：**用 Unsloth 微调 FunctionGemma-270m 后导出 GGUF 格式运行，模型不遵循自定义的 router 逻辑，反而大量"幻觉"**——生成自由文本而非结构化的函数调用，甚至凭空编造不存在的函数名。

FunctionGemma 是 Google 于 2025-2026 年间发布的 **270M 参数超小型函数调用专用模型**，基于 Gemma 3 270M 架构，用与 Gemini 相同的技术训练而成。其设计目标非常明确：**不做通用对话，专注 function calling**，可在手机 CPU 上以 125 tokens/s 的速度推理，量化后仅 ~288MB。Unsloth 团队提供了第一天即支持的微调工具链和 GGUF 量化版本。

然而，Google 在模型卡片上清楚写道：

> *"FunctionGemma is intended to be fine-tuned for your specific function-calling task, including multi-turn use cases."*

换言之，**开箱即用的 base 模型几乎不可用**——这正是该用户踩坑的根本原因。

## 2. 核心问题与机制分析

该用户的场景是：微调 FunctionGemma 后让它充当 **自定义路由器（router）**，根据用户输入选择正确的工具函数。但实际表现远低于预期：

- **幻觉函数名**：模型输出训练集中不存在的函数声明
- **格式崩坏**：本应输出结构化 JSON，却退化为自由文本
- **Slot 值丢失**：多轮对话中上下文参数无法正确传递
- **GGUF 转换后精度衰减**：量化可能进一步放大了 270M 小模型的脆弱性

distil labs 的独立基准测试佐证了这一现象：**未微调的 base FunctionGemma 在三个多轮任务上工具调用等价率仅 9.9%-38.8%**。以 5 轮对话计算，银行语音助手场景的全程正确率低至 **0.07%**——几乎等于随机。

关键的技术陷阱包括：

1. **chat template 格式严格**：FunctionGemma 要求 developer message 以 `You are a model that can do function calling with the following functions` 开头，后跟特殊的 `<start_function_declaration>` 标签。格式不对模型直接失控。
2. **推理参数敏感**：Google 推荐 `top_k=64, top_p=0.95, temperature=1.0`，很多用户沿用了通用 LLM 的低温设置，反而适得其反。
3. **270M 容量极限**：模型只有 2.7 亿参数，知识容量极低，需要高质量、任务特定的微调数据才能学会新路由逻辑。

## 3. 社区热议与争议点

虽然原帖评论区无法完整抓取，但综合 r/LocalLLaMA、r/LLMDevs 等社区的相关讨论，争议集中在以下几个方向：

**🔵 支持方观点——"这不是 bug，是 feature"**

- 有用户指出：*"270M 参数不可能记住通用知识，你必须 fine-tune 才能注入领域特定的函数目录，这是设计如此。"* （r/LocalLLaMA 评论）
- distil labs 的实验表明，经过知识蒸馏微调后，FunctionGemma 可以从 9.9% 飙升至 **96%** 的工具调用准确率，*"匹配甚至超越 120B 教师模型"*。

**🔴 反对方观点——"太脆弱，实用性存疑"**

- *"I'm using Python/Torch and working with Claude to fine-tune Gemma-3-270M to handle tool calls for a VERY focused application… 但效果依然不稳定"*（r/LocalLLaMA 用户反馈）
- 有人质疑 GGUF 量化对如此小的模型是否合理：*"小模型量化到 4-bit 后精度损失是灾难性的，不建议低于 BF16 运行。"*
- 多轮场景下的复合错误率让人担忧——即使单轮 95% 正确，5 轮对话也只剩 77%，*"用在生产环境就是在赌博"*。

**🟡 中立/建设性意见**

- LM Studio 团队发布了 [FunctionGemma + Unsloth 微调指南](https://lmstudio.ai/blog/functiongemma-unsloth)，强调 **数据质量 > 数据量**，建议用少量高质量示例而非大规模低质数据。
- Google 官方 cookbook 提供了移动端动作（日历、定时器）的微调 recipe，暗示 **场景越窄，效果越好**。

## 4. 行业影响与未来展望

FunctionGemma 代表了一个重要趋势：**超小模型 + 专项微调 = 端侧 AI agent 的可行路径**。但当前阶段的现实是：

- **微调门槛被低估**：社区普遍以为下载 GGUF → 跑起来就能用，忽视了 chat template、推理参数、数据格式等细节的严格要求。
- **量化不是免费午餐**：270M 模型的每一个参数都承载着关键信息，激进量化直接导致能力崩塌。
- **工具链逐渐成熟**：Unsloth、distil labs、LM Studio 等第三方工具正在降低微调和部署的门槛，但 "一键可用" 仍有距离。

展望未来，随着 Gemma 4 等新一代架构的推出以及微调工具链的完善，**sub-1B 参数的函数调用模型**有望成为移动端和 IoT 场景的标配。但在此之前，开发者需要做好心理准备：**小模型不是缩小版的大模型，而是一个需要精心"雕刻"的专用引擎。**

## 5. 相关链接

- [Reddit 原帖](https://www.reddit.com/r/LLM/comments/1sq6419/)
- [FunctionGemma 模型卡片 (HuggingFace)](https://huggingface.co/google/functiongemma-270m-it)
- [Unsloth FunctionGemma GGUF](https://huggingface.co/unsloth/functiongemma-270m-it-GGUF)
- [Unsloth 微调文档](https://unsloth.ai/docs/models/tutorials/functiongemma.md)
- [LM Studio 微调指南](https://lmstudio.ai/blog/functiongemma-unsloth)
- [distil labs: Making FunctionGemma Work](https://www.distillabs.ai/blog/making-functiongemma-work-multi-turn-tool-calling-at-270m-parameters/)
- [Google Gemma Cookbook - Mobile Actions](https://github.com/google-gemma/cookbook/blob/main/FunctionGemma/)
