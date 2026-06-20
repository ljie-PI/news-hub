---
title: "LLMs Are Complicated Now"
date: "2026-06-21"
generated: "2026-06-21 07:00"
source: "HN"
slug: "2026-06-21_07-llms-are-complicated-now"
summary: "Ian Barber 在博客《LLMs Are Complicated Now》中回顾了大模型工程栈的一个变化：2022—2023 年 Meta 内部的 LLM 路线曾显得相对“干净”——重复堆叠 Transformer 模"
---

# LLMs Are Complicated Now

## 1. 事件背景

Ian Barber 在博客《LLMs Are Complicated Now》中回顾了大模型工程栈的一个变化：2022—2023 年 Meta 内部的 LLM 路线曾显得相对“干净”——重复堆叠 Transformer 模块，和推荐系统里复杂、异构、难以维护的图结构形成鲜明对比。但几年后，LLM 也开始走向同样的复杂化。该文登上 Hacker News 后获得约 159 分、56 条评论，讨论焦点集中在：这种复杂化是技术成熟后的必然工程化，还是模型路线偏离了早期“简单扩展即可奏效”的范式。

## 2. 核心观点/产品机制

文章的核心并不是说 Transformer 失效了，而是说“现代 LLM 已经不再只是朴素 Transformer 堆叠”。作者引用 Sebastian Raschka 的 LLM Architecture Gallery，对比 Llama 3 与更新一代开放模型架构后指出：注意力机制出现了 query grouping、compressed attention、sparse/linear attention、sliding-window attention 等多种变体；MoE（Mixture-of-Experts）把路由引入前馈层，并进一步扩展到注意力块、残差流等位置；视觉、音频编码器也从外挂组件变成更深度混合的多模态结构。与此同时，大模型推理跨多 GPU 运行，引入通信算子和新的边界条件，使模型定义、训练、推理优化更加紧耦合。

作者用推荐系统作类比：推荐系统早期也有相对清晰的 two-tower sparse neural net 基础形态，但随着能力提升与推理效率之间的张力加剧，复杂性逐渐成为“负重结构”。当性能从“优化项”变成“必要条件”，研究人员很难先写一个纯净模型再慢慢优化；新 attention 变体如果比旧 fused kernel 慢一个数量级，就连是否值得研究都难以判断。因此，未来关键不是单纯依赖智能体自动生成 kernel，而是从一开始就设计可组合、可验证、性能接近可用的抽象。PyTorch 的 FlexAttention 被作者视为正面例子：它以 Triton 模板生成一类 attention kernel，让探索不同注意力形式时只付出较小性能代价。

## 3. 社区热议与争议点

HN 讨论中有几条具体分歧很有代表性：

1. 有评论把这看成“苦涩教训到特征工程”的生命周期：新技术早期靠更大数据、更多算力、直接套用方法就能取得巨大收益；当收益进入曲线较平缓区域后，企业不得不为每一点增量投入越来越多工程复杂度。
2. 另一位评论者认为文章更像是在谈“既有方案优势”：已经被高度优化的 known-good 架构会提高新技术证明自身价值的门槛，类似燃油车生态积累百年优化后给电动车带来的竞争阻力。不过软件比硬件更灵活，缩放定律也允许先在小规模上试验。
3. 对架构对比也有争议。有人质疑作者为什么不拿 Llama 3 与更“标准 attention-based”的 GLM 5.2 比较，认为跨模型家族对比得出“不同”并不意外；支持者则回应，作者要说明的正是当下模型家族之间已经明显分化，选择差异更大的模型反而能体现趋势。
4. 还有评论从 llama.cpp 等推理项目的实现经验支持作者：早期模型通常能较完整地被实现，而近期模型常出现只支持基础运行、先进特性缺失或尚未完整实现的情况，这说明模型复杂度已经直接传导到开源推理生态。

## 4. 行业影响与未来展望

这篇文章提示，LLM 竞争正在从“谁能训练更大的 Transformer”转向“谁能管理复杂架构与硬件效率之间的共同演化”。对模型公司来说，MoE、稀疏注意力、多模态混合、跨 GPU 推理都可能带来能力或成本优势，但每一种机制都会增加验证、调试、部署和复现难度。对开源生态来说，模型格式、kernel 抽象、推理运行时和测试基线会变得更加重要；如果每个新模型都需要大量手写特化实现，社区跟进速度会下降。

更长期看，智能体辅助研究与自动 kernel 生成确实可能降低门槛，但前提是系统本身具备可靠基线、组合式接口和可验证的性能/正确性测试。也就是说，下一阶段的“简单性”不会来自忽视复杂度，而会来自把复杂度封装在正确的抽象层里。LLM 也许会像推荐系统一样，从论文图上看越来越复杂，但真正形成壁垒的是能否把这种复杂性转化为稳定、可迭代、硬件友好的工程平台。

## 5. 附带链接

- 原文：<https://ianbarber.blog/2026/06/19/llms-are-complicated-now/>
- Hacker News 讨论：<https://news.ycombinator.com/item?id=48605355>
- Sebastian Raschka 的 LLM Architecture Gallery：<https://sebastianraschka.com/llm-architecture-gallery/>
- PyTorch FlexAttention：<https://pytorch.org/blog/flexattention/>
- HazyResearch Megakernels：<https://github.com/HazyResearch/Megakernels>
