---
title: "Qwen3.6-35B-A3B Q4_K_M 量化评测：3B 激活参数跑出旗舰级性能？"
date: "2026-04-18"
generated: "2026-04-18 21:00"
source: "Reddit"
slug: "2026-04-18_21-qwen-36-35b-a3b-quant-evaluation"
summary: "---"
---

# Qwen3.6-35B-A3B Q4_K_M 量化评测：3B 激活参数跑出旗舰级性能？

> 来源：[r/LocalLLaMA](https://www.reddit.com/r/LocalLLaMA/comments/1sotj4n/qwen_36_35b_a3b_q4_k_m_quant_evaluation/) · 2026-04-18

---

## 一、事件背景

2026 年 4 月 16 日，阿里巴巴 Qwen 团队正式开源了 Qwen3.6-35B-A3B——Qwen3.6 系列的首个公开权重模型。该模型采用**稀疏混合专家（Sparse MoE）架构**，总参数量 35B，但推理时仅激活约 3B 参数，从而在推理成本和延迟上接近一个 3B 级别的稠密模型，却在性能上对标数倍于其激活量的大模型。

模型发布后，社区迅速涌现各类 GGUF 量化版本。其中 **Q4_K_M**（4-bit 混合量化）凭借在显存占用和推理质量之间的良好平衡，成为本地部署用户最关注的量化档位之一。r/LocalLLaMA 社区随即展开了对 Q4_K_M 量化版本的实测评估与讨论。

## 二、核心观点与评测数据

### 官方 Benchmark（全精度基准）

Qwen3.6-35B-A3B 在多项权威基准上取得了令人瞩目的成绩：

| 基准 | 得分 | 对比参考 |
|------|------|----------|
| **SWE-bench Verified** | 73.4 | Qwen3.5-35B-A3B: 70.0; Gemma4-31B: 52.0 |
| **Terminal-Bench 2.0** | 51.5 | 所有对比模型中最高 |
| **AIME 2026 (I & II)** | 92.7 | 竞争力对标超大模型 |
| **GPQA Diamond** | 86.0 | 研究生级科学推理 |
| **MMMU** | 81.7 | 超 Claude-Sonnet-4.5 (79.6) |
| **QwenWebBench** | 1397 | Qwen3.5-35B-A3B: 978 |

### Q4_K_M 量化的实际表现

Q4_K_M 量化后模型文件约 **20GB** 左右，可在 24GB 显存的消费级 GPU（如 RTX 4090）或配备 32GB 统一内存的 Apple Silicon Mac 上流畅运行。社区用户反馈，在日常编码辅助、对话和推理任务中，Q4_K_M 版本与全精度模型之间的差距「几乎感知不到」，尤其在 MoE 架构下，由于每次推理仅涉及 3B 激活参数，量化带来的精度损失相较稠密模型更加可控。

## 三、社区热议与争议点

**1. MoE 量化是否比稠密模型更「抗量化」？**  
多位用户指出，MoE 模型的专家路由机制意味着每个 token 只激活 8/256 个专家，量化误差的累积效应比稠密模型更小。但也有人持保留意见，认为路由决策本身对精度敏感，低比特量化可能导致"选错专家"的连锁问题。

**2. 与 Qwen3.5-35B-A3B 的代际提升是否真实？**  
来自 novaknown.com 的独立分析文章指出，Qwen3.6 的部分 benchmark 数据尚未经过第三方验证，BenchLM.ai 上该模型在 verified leaderboard 仅排第 13/13。社区有声音呼吁等待更多独立复现，而非完全依赖官方数字。

**3. 本地部署的实际速度体验**  
用户在 r/LocalLLaMA 发布帖中分享了 llama.cpp 配置：使用 IQ4_XS 量化、131K 上下文、flash attention 开启时，在消费级硬件上即可运行。不过，262K 原生上下文长度在量化后的实际可用性仍存疑——多数用户报告超过 32K 上下文后速度显著下降。

**4. Simon Willison 的"鹈鹕测试"引发热议**  
知名开发者 Simon Willison 在博客中展示 Qwen3.6-35B-A3B 在 SVG 生成任务上优于 Claude Opus 4.7 的案例，虽然他本人也承认这更像轶事而非严格评测，但该文章在社区引发了关于「小模型能否在特定任务上超越闭源旗舰」的广泛讨论。

## 四、行业影响与未来展望

Qwen3.6-35B-A3B 的出现标志着**开源 MoE 模型进入实用化部署阶段**。35B 总参数 / 3B 激活参数的设计，配合 Q4_K_M 等量化方案，让单张消费级显卡即可运行一个在编码、推理和多模态理解上接近商业 API 水平的模型。

更深远的影响在于：

- **推理成本重新定义**：MoE + 量化的组合使得"参数效率"成为比"参数规模"更有意义的指标
- **本地 Agent 场景加速落地**：Terminal-Bench 2.0 和 SWE-bench 的高分意味着该模型可直接用于代码自动化 Agent
- **Thinking Preservation 机制**：支持跨轮次保留推理链，对多步 Agent 工作流意义重大
- **生态加速**：bartowski、Unsloth 等社区贡献者在模型发布数小时内即提供多种量化版本，开源推理栈（llama.cpp、vLLM、SGLang、KTransformers）的兼容性进一步降低了部署门槛

在 Qwen3.6 系列后续更大规模模型（如传闻中的 Qwen3.6-235B-A22B）发布前，35B-A3B 的 Q4_K_M 量化版将是本地 LLM 用户最值得关注的"性价比之王"候选。

## 五、参考链接

- Reddit 原帖：https://www.reddit.com/r/LocalLLaMA/comments/1sotj4n/qwen_36_35b_a3b_q4_k_m_quant_evaluation/
- Qwen 官方博客：https://qwen.ai/blog?id=qwen3.6-35b-a3b
- HuggingFace 模型卡：https://huggingface.co/Qwen/Qwen3.6-35B-A3B
- bartowski GGUF 量化：https://huggingface.co/bartowski/Qwen_Qwen3.6-35B-A3B-GGUF
- MarkTechPost 报道：https://www.marktechpost.com/2026/04/16/qwen-team-open-sources-qwen3-6-35b-a3b-a-sparse-moe-vision-language-model-with-3b-active-parameters-and-agentic-coding-capabilities/
- Simon Willison 鹈鹕测试：https://simonwillison.net/2026/Apr/16/qwen-beats-opus/
- BenchLM.ai 评分：https://benchlm.ai/models/qwen3-6-35b-a3b
- 技术论文：https://arxiv.org/pdf/2604.06425
