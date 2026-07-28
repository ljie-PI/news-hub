---
title: "Kimi-K3 on HuggingFace"
date: "2026-07-28"
generated: "2026-07-28 07:00"
source: "HN"
slug: "2026-07-28_07-kimi-k3-on-huggingface"
summary: "Moonshot AI（月之暗面）在 HuggingFace 上开源发布了 Kimi-K3，帖子登上 Hacker News 前列，收获 1292 分与 506 条评论。这是继 K2 之后月之暗面最强的模型，被官�"
---

---
title: Kimi-K3 on HuggingFace
date: 2026-07-28
source: hackernews
slug: kimi-k3-on-huggingface
---
# Kimi-K3 on HuggingFace

## 事件背景

Moonshot AI（月之暗面）在 HuggingFace 上开源发布了 Kimi-K3，帖子登上 Hacker News 前列，收获 1292 分与 506 条评论。这是继 K2 之后月之暗面最强的模型，被官方称为"全球首个开放的 3T 级模型"，同时附有完整的技术报告 PDF，引发社区对开源前沿模型走向的广泛讨论。

## 核心观点/产品机制

Kimi-K3 是一款原生多模态、面向 Agent 的开源权重模型，采用 MoE 架构：总参数 2.8T、激活参数仅 104B，从 896 个专家中选取 16 个。它构建于全新的 Kimi Delta Attention（KDA）与 Attention Residuals（AttnRes）之上，配合 Stable LatentMoE 框架，声称相较 K2 有约 2.5 倍的扩展效率提升。模型支持文本、图像、视频的原生理解，具备 100 万 token 上下文窗口，并采用 MXFP4 权重的量化感知训练。评测显示其在编码、Agent、视觉等基准上与 Claude、GPT-5.6 等闭源顶尖模型正面竞争。

## 社区热议与争议点

评论聚焦于成本与部署。用户 NitpickLawyer 指出，由于 mxfp4 原生，托管该 3T 模型约需 1.5TB 显存，"恰好卡在 8×B200 的极限"，并认为第三方定价将揭示服务大模型的真实成本。npn 举例称即便 DeepSeek 以极低价格，也能在 10 个月内回本；但 likium 反驳，模型 10 个月后是否仍具竞争力存疑，指出 OpenRouter 上模型 80 天即被消耗一半 token 份额。woctordho 则从微调角度建议以 GGUF 取代 bnb 作为 4-bit 基座格式，认为 bnb 对 MoE 量化精度不足。争论也延伸到 API 定价是否被补贴，energy123 强调毛利率是最关键指标。

## 行业影响与未来展望

Kimi-K3 进一步压缩了开源与闭源前沿模型的差距，为"服务成本 vs 训练成本"之争提供了新的独立数据点。其原生多模态与超长上下文，指向长周期编码、深度研究等 Agent 场景。若第三方托管价格落地，将成为衡量大模型经济性的重要参照。

## 附带链接

- HN 讨论：https://news.ycombinator.com/item?id=49065752
- HuggingFace：https://huggingface.co/moonshotai/Kimi-K3
