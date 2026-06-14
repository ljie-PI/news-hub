---
title: "minimax-m3-is-out-now"
date: "2026-06-15"
generated: "2026-06-15 07:00"
source: "Reddit"
slug: "2026-06-15_07-minimax-m3-is-out-now"
---

---
title: "MiniMax M3 发布深度解读"
date: "2026-06-15"
generated: "2026-06-15 07:00"
source: "Reddit Deep Dive"
slug: "minimax-m3-is-out-now"
batch: "2026-06-15_07"
category: "Local LLM"
---

## 一、背景

MiniMax（稀宇科技）是总部位于上海的 AI 独角兽，最知名的产品是视频生成平台 **Hailuo（海螺）** 与早期的 abab/MoE 文本系列。**M3** 是其继 M2 之后的旗舰开源权重模型，于 2026 年 6 月 1 日发布（API 5 月 31 日上线），定位为**前沿编码 + 长上下文 + 多模态智能体**的综合型推理大模型，直接对标 GPT-5.5、Claude Opus 4.7 与同期国产 DeepSeek V4-Pro / Kimi K2.6 / GLM-5.1。

## 二、核心机制

架构上 M3 是一次"回归"：M2 曾移除稀疏注意力改用全注意，M3 重新引入自研 **MSA（MiniMax Sparse Attention）**——通过 KV-block 选择机制把 1M token 上下文的预填速度提升约 9×、解码 15×、单 token 算力降至约 1/10，是 Sparse MoE 框架下少有的"长上下文真能用得起"的实现。规格层面：1M 上下文（保底 512K）、512K 最大输出、文本/图像/视频原生多模态输入、超 100T token 预训练。基准上 **SWE-Bench Pro 59.0%** 微超 GPT-5.5（58.6%）、Terminal-Bench 2.1 66.0%、BrowseComp 83.5（高于 Opus 4.7 的 79.3）、OSWorld-Verified 70.0%；据报道可连续运行 24 小时、调用近 2000 次工具复现 ICLR 论文实验。开源权重已承诺释出，但**许可证含商用条件**（非纯 MIT），价格 \$0.30/\$1.20（促销）约为 Opus 的 5%。

## 三、社区讨论

r/unsloth 帖子配图为 MiniMax 官方榜单截图，评论焦点集中三处：①**性能定位**——多名用户引用 Artificial Analysis 数据称"M3 已经是开源第一，领先 Kimi-K2.6 / GLM-5.1 / DeepSeek-V4-Pro"，但也有人提醒分数来自 MiniMax 自测，需等 Vals.ai 独立复测；②**本地可行性**——MSA 需 vLLM/SGLang 适配，权重虽承诺开放但发布当日尚未真正放出，且 1M 上下文显存压力远超 K2.6，社区呼吁 Unsloth 团队出 GGUF + 动态量化方案；③**商业化限制**——许可证条款被反复对比 DeepSeek 的 MIT，部分开发者表示"为多模态愿意接受条件许可，但企业部署仍会优先 V4-Pro"。

## 四、行业影响

M3 与上半年 DeepSeek V4-Pro、Kimi K2.6、GLM-5.1 形成中国开源推理模型的**集团式反扑**：前沿编码 59% 一线 + 1M 长上下文 + 原生视频输入这一组合，过去只在闭源 Opus / GPT-5.5 出现。叠加近期 **Anthropic 对中国客户和第三方转售的合规收紧**，社区普遍判断 2026H2 将出现"被挡在 Claude 外的开发者大规模迁移到 M3/V4-Pro"的趋势，开源权重 + OpenRouter 多供应商 + 5% 价格构成实际护城河。Unsloth 等微调生态被视为关键放大器。

## 五、链接

- Reddit：<https://www.reddit.com/r/unsloth/comments/1u43tzm/minimax_m3_is_out_now/>
- 官方平台：<https://platform.minimax.io/>
- Lushbinary 开发者指南：<https://lushbinary.com/blog/minimax-m3-developer-guide-benchmarks-pricing-msa-architecture>
- CodingFleet M3 vs DeepSeek V4-Pro 对比：<https://codingfleet.com/blog/minimax-m3-vs-deepseek-v4-pro-the-open-weight-chinese-ai-showdown>
- Kilo Code 开源编码模型榜：<https://kilo.ai/open-source-models>
