---
title: "how-llms-actually-work"
date: "2026-06-07"
generated: "2026-06-07 07:00"
source: "HN"
slug: "2026-06-07_07-how-llms-actually-work"
---

---
title: "How LLMs Actually Work"
date: "2026-06-07"
source: "Hacker News"
slug: "how-llms-actually-work"
url: "https://www.0xkato.xyz/how-llms-actually-work/"
---

## 事件背景

博主 0xkato 发表的长文《How LLMs Actually Work》登上 HN 热门。在 AI 应用爆炸但底层认知极度匮乏的今天，这类"零黑话、不画饼"的解剖文吸引了大量工程师——既包括想给团队科普的资深架构师，也包括被"vibe coding"裹挟着上车却不知道自己在用什么的新人。文章定位是：用 9 个环节把现代 LLM 从 token 到下一个 token 的完整路径讲清楚，避开过度拟人化和过度数学化两个坑。

## 核心观点 / 产品机制

作者把 Transformer 拆成九步流水线：**Tokenization → Embeddings → Positional Encoding → Attention → Multi-head Attention → FFN → Residual + LayerNorm → Next-token Prediction → 架构 vs 权重的区分**。几个关键洞见：

- **Tokenization 是底层 bug 之源**：模型读的是整数 ID 而非字符，所以才会数不清 "strawberry" 里有几个 r。GPT 系用 BPE，LLaMA 系用 SentencePiece，选择直接影响多语言效率。
- **Embedding 是几何空间**：相似 token 几何上靠近，king − man + woman ≈ queen 的经典等式正是空间结构的副产品。
- **位置编码从 Sinusoidal 进化到 RoPE**：RoPE 通过"旋转"向量编码相对位置，不增加参数，对长上下文泛化更好，已被 LLaMA、Mistral、Gemma、Qwen 全面采用。
- **Attention 的 Q/K/V 直觉**：Query 是"我在找什么"、Key 是"我能匹配什么"、Value 是"匹配成功就复制什么"，softmax 把分数变权重。
- **Induction Heads** 是 in-context learning 的机制源头——它会发现 "A B … A" 的模式并预测下一个 B。
- **"Lost in the middle"** 解释了为什么把关键信息放在 prompt 头尾比放中间有效。

## 社区热议与争议点

类似题材在 HN 上历来吵得很热，常见分歧：

- **"够不够深"派**：部分人欢迎此类中间层科普，认为它精准填补了 3Blue1Brown 视频（直觉）与 Karpathy nanoGPT（代码）之间的缝隙。
- **"危险的简化"派**：有人指出把 Attention 比作"查表"会让初学者忽略训练动力学和梯度信号，导致"以为自己懂了"的 Dunning–Kruger 风险。
- **关于 RoPE 与长上下文**：评论区常引用 Liu et al. 2023 的"lost in the middle"实证，质疑 RoPE 是否真解决了相对位置问题，还是只是把问题推后了。
- **架构 vs 数据派**：很多评论强调"Transformer 只是骨架，差异 90% 来自数据 + 后训练（RLHF/DPO/RLVR）"，认为只讲架构会误导读者高估架构创新的边际收益。

## 行业影响与未来展望

这类高质量科普文的流行折射出一个分水岭：随着 LLM 进入企业核心系统，"懂 API"已经不够，工程师必须理解 token 化失败、上下文窗口排布、attention 二次复杂度等底层约束，才能写出可控的 prompt 与 agent。文章中提到的 FlashAttention、稀疏 attention、线性 attention 等方向，正是未来一年决定推理成本曲线的关键技术。当行业从"大就是好"转向"高效推理"，这类基础认知会成为甄别真正能落地工程师的硬通货。

## 附带链接

- 原文：https://www.0xkato.xyz/how-llms-actually-work/
- 参考论文 Vaswani et al. 2017 (Attention Is All You Need): https://arxiv.org/abs/1706.03762
- RoPE (Su et al. 2021): https://arxiv.org/abs/2104.09864
- Lost in the Middle (Liu et al. 2023): https://arxiv.org/abs/2307.03172
