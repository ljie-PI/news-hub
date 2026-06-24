---
title: "OpenAI unveils its first custom chip, built by Broadcom"
date: "2026-06-25"
generated: "2026-06-25 07:00"
source: "HN"
slug: "2026-06-25_07-openai-unveils-its-first-custom-chip-built-by-broadcom"
summary: "TechCrunch 报道称，OpenAI 发布了首款自研定制 AI 芯片 **Jalapeño**，由 Broadcom 共同设计与制造，定位不是训练芯片，而是面向大语言模型推理的“Intelligence "
---

# OpenAI unveils its first custom chip, built by Broadcom

## 事件背景

TechCrunch 报道称，OpenAI 发布了首款自研定制 AI 芯片 **Jalapeño**，由 Broadcom 共同设计与制造，定位不是训练芯片，而是面向大语言模型推理的“Intelligence Processor”。OpenAI 官方公告把它描述为多代计算平台的第一代产品，目标是服务 ChatGPT、Codex、API 与未来智能体产品，提升速度、可靠性、可用性并降低单位成本。芯片目前仍处于测试阶段，OpenAI 称工程样品已在实验室以目标频率和功耗运行，包括 GPT‑5.3‑Codex‑Spark 等机器学习负载；详细性能报告将在未来几个月发布。Reuters 补充了关键供应链信息：Jalapeño 由 TSMC 代工，Celestica 参与服务器系统构建，计划在 2026 年底开始部署，且主要供 OpenAI 内部使用。HN 该帖由 jamdesk 发布，抓取时约 429 分、280 条评论；任务给定快照为 421 分、278 条评论，说明讨论仍在增长。

## 核心观点 / 产品机制

Jalapeño 的战略意义在于 OpenAI 从“模型与产品公司”继续向全栈基础设施公司延伸。推理与训练的经济结构不同：训练是大额、阶段性投入；推理则随着用户每次提问、代码生成和智能体执行持续发生。因此，即便 Jalapeño 不能取代 Nvidia 在前沿训练中的地位，只要在推理的性能/瓦、成本/Token、机架密度或供货确定性上有明显改善，就可能显著影响 OpenAI 的毛利率和服务规模。

OpenAI 强调该芯片按自家工作负载优化：内核、内存搬运、网络、调度与 serving pattern 都围绕 LLM 推理设计。Broadcom 的价值不只是“帮忙画芯片”，还包括 ASIC IP、先进封装/互连、与 TSMC 和 HBM 供应链的产业关系。Yahoo Finance/GuruFocus 转述 Broadcom CEO Hock Tan 的说法，称相较典型 AI GPU 可实现约 50% 成本节省；但这仍需等待公开基准测试验证，尤其要看对比对象、批量、上下文长度、延迟约束与整体系统成本。

## 社区热议与争议点

HN 讨论的第一条主线是“OpenAI 到底设计了多少”。用户 sharkjacobs 质疑“由 OpenAI 模型加速九个月完成设计”可能只是营销话术，类似说 Office 或显示器提升了研发效率；zgao 以“芯片公司 CEO”身份回应，指出九个月要看起点：若从 RTL freeze 到 tape-out 并不惊人，若从概念架构到流片则非常厉害，OpenAI 应给出更清晰里程碑。

第二个争议是 Broadcom 与供应链。shellcromancer 指出 OpenAI 官方文没有明说代工厂，而外部报道显示是 TSMC；HarHarVeryFunny 进一步提到，大客户选择 Broadcom 可能不仅为设计能力，也因为其 TSMC 和内存配额关系。alephnerd 则强调 Broadcom 是 ASIC 设计领域巨头，Marvell 等竞争者规模小得多，HN 社区常低估这些“幕后基础设施公司”。

第三类讨论围绕推理专用化。maz1b 认为 Google 多代 TPU 显得很有先见之明，而 Jalapeño 首先押注推理而非训练很有意思；MangoCoffee 则把“廉价 token”视为中美 AI 竞争和企业采用的关键。也有 londons_explore 提出更激进设想：把模型权重烧进 ROM，理论上获得极高吞吐，但代价是芯片巨大且模型迭代太快，可能一年后就报废。

第四个声音偏怀疑商业时机。v5v3 看到“2026 年底初始部署”后质疑这是否会成为 IPO 前销售材料里的未来承诺；deweywsu 担心 AI 软件和模型压缩进展太快，硬件可能在收回投资前过时；chris_money202 提醒，流片只是第一步，真正困难还包括封装、散热、供电、机架、数据中心运维和大规模 fleet 管理。

## 行业影响与未来展望

这次发布不会立即终结 Nvidia 的优势。Nvidia 仍拥有 GPU、网络、CUDA 软件生态、训练集群经验和快速产品迭代；而 OpenAI 的芯片尚未公布架构细节、制程、HBM 配置、互连方案、延迟/吞吐基准或量产良率。但它明确显示，头部 AI 公司正在把“算力供应”视为战略资产，而不只是采购项。Google TPU、Amazon Trainium/Inferentia、Meta 自研芯片、Anthropic 潜在方案，以及 OpenAI-Broadcom 合作，都会把 AI 基础设施竞争从单芯片性能扩展到电力、网络、封装、软件栈和资本开支效率。

短期看，Jalapeño 最值得跟踪三件事：一是公开技术报告是否能证明性能/瓦和成本节省；二是 2026 年底能否真正进入数据中心并稳定服务真实流量；三是 OpenAI 是否能把自研硬件与模型路线同步迭代，避免“为上一代模型优化”的专用芯片被新架构绕开。若成功，OpenAI 将获得更便宜、更可控的推理能力；若失败，它也可能暴露出从软件公司扩张到半导体和数据中心全栈的巨大执行风险。

## 附带链接

- TechCrunch 原文：https://techcrunch.com/2026/06/24/openai-unveils-its-first-custom-chip-built-by-broadcom/
- HN 讨论：https://news.ycombinator.com/item?id=48663324
- OpenAI 官方公告：https://openai.com/index/openai-broadcom-jalapeno-inference-chip/
- Reuters 补充报道：https://www.reuters.com/world/asia-pacific/openai-unveils-custom-chip-it-designed-with-broadcom-boost-its-ai-infrastructure-2026-06-24
- Yahoo Finance / GuruFocus 成本节省报道：https://finance.yahoo.com/technology/ai/articles/openai-unveils-broadcom-ai-chip-174307466.html
