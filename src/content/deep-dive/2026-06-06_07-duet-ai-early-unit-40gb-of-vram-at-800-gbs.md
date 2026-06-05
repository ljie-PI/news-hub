---
title: "Duet AI early unit 40GB of VRAM at 800+ GB/s"
date: "2026-06-06"
generated: "2026-06-06 07:00"
source: "Reddit"
slug: "2026-06-06_07-duet-ai-early-unit-40gb-of-vram-at-800-gbs"
summary: "2026 年 6 月 5 日，Reddit 用户 **u/FicklePangolin3547** 在 r/unsloth 同步发帖（同日也在 r/LocalLLM 出现 14 条评论的同名讨论），晒出自己刚到手的一台被称为 **\"Du"
---

---
title: "Duet AI early unit 40GB of VRAM at 800+ GB/s 深度调研"
date: "2026-06-06"
source: "Reddit"
category: "Local LLM"
slug: "duet-ai-early-unit-40gb-of-vram-at-800-gbs"
---

# Duet AI early unit 40GB of VRAM at 800+ GB/s

## 一、事件背景

2026 年 6 月 5 日，Reddit 用户 **u/FicklePangolin3547** 在 r/unsloth 同步发帖（同日也在 r/LocalLLM 出现 14 条评论的同名讨论），晒出自己刚到手的一台被称为 **"Duet AI"** 的早期型号本地推理一体机。原帖一句话点题：「I'm pleasantly surprised by this device. I bought it somewhat by chance, and honestly, the **40GB of VRAM at 800+ GB/s** does an outstanding job.」OP 在跟帖中给出了在该机器上跑 **Qwen3.6-27B Q4_K_M** 的实测：单次推理速度约 **27.3 tok/s**——对于一台 40GB 显存级别的紧凑设备而言，这是一个相当令人意外的成绩。

需要先澄清的是：此处的 "Duet AI" 并不是 Google 旧时 Workspace 中的 Duet AI（那个软件后续已并入 Gemini），而是 2026 年新一代主打 **"unified memory + 大带宽"** 路线的小型本地推理盒——属性更接近 Minisforum MS-S1 Max、AMD Ryzen AI Max+ 395 一体机、Dell Pro Max GB10、以及 NVIDIA DGX Spark 这一波 "桌面级 AI 工作站" 浪潮中的新成员。

## 二、核心观点 / 产品机制

帖子的核心信号有三个：

1. **40GB 可用显存**：略高于一张 RTX 5090（32GB）但低于双 3090（48GB），刚好能塞下 27B–32B 级别 Q4 量化模型完整 KV-cache，对应当下最热的 Qwen3.6-27B、Gemma 4 31B 等模型。
2. **800+ GB/s 带宽**：明显高于 LPDDR5X 256-bit 方案（~270 GB/s），更接近 Mac Studio M2/M3 Ultra（~800 GB/s）和 DGX Spark（~825 GB/s）一档，说明 Duet AI 采用了宽位宽统一内存或 HBM 类设计。
3. **27.3 tok/s @ Qwen3.6-27B Q4_K_M**：略低于 M1 Ultra 128GB 的 ~18 tok/s（对比帖中数据）的 1.5 倍水平，但功耗与体积估计远小于双 3090 工作站，属于 "本地推理 / 性能 / 功耗" 三角的新平衡点。

简言之：Duet AI 是 2026 年面向 **个人 AI 开发者** 与 **小团队私有部署** 的 "桌面 LLM 主机" 流派的代表产品之一。

## 三、社区热议与争议点

由于 r/unsloth 母帖评论较少（2 票），主要讨论集中在跨贴的 r/LocalLLM 14 条评论里，常见讨论点包括：

- **价格与性价比**：与 Mac Studio M4 Max 128GB（~$4,200）相比，40GB 版本若定价在 $2,000–$2,500 区间，将是 27B 级模型推理最便宜的入场券之一。
- **是否支持多卡 / 模型分片**：社区担心 800 GB/s 带宽在跑 35B-A3B MoE 时是否会被瓶颈拖住。
- **驱动 & 软件栈**：是否兼容 llama.cpp / Unsloth / MLX？OP 提到走的是 llama.cpp 路线，与 Unsloth 团队近期推出的 **Qwen3.6 MTP（160 tok/s on RTX 6000）** 形成对比。
- **稳定性**："early unit" 暗示这是工程样品或首批小批量，质保、固件升级、散热表现都尚待验证。

## 四、行业影响与未来展望

这条帖子折射出 2026 年本地 LLM 硬件正在快速 "去 GPU 中心化"：

1. **统一内存 + 宽带宽** 已成为 27B–70B 模型本地推理的主流答案，正在挤压传统 SO-DIMM + 独显方案；
2. **AMD Ryzen AI Max+ 395、Apple M-Ultra、NVIDIA GB10 Grace Blackwell** 三大阵营的 "桌面 AI 工作站" 价格带正在下探到 $2k–$5k；
3. 开发者社区（unsloth、llama.cpp、MLX）正反向适配这些新硬件，推动小模型在本地达到 "可用 agent" 门槛。Duet AI 若能稳定量产，将进一步压低 "私人 GPT 服务器" 的硬件门槛。

未来 6–12 个月，预计会有更多类似形态的 40–128GB 桌面盒涌现，并与 OpenAI / Anthropic 的云端订阅形成消费者层面的真正分流。

## 五、相关链接

- 原帖: https://www.reddit.com/r/unsloth/comments/1txze6b/duet_ai_early_unit_40gb_of_vram_at_800_gbs/
- r/LocalLLM 镜像讨论: https://www.reddit.com/r/LocalLLM/new
- Unsloth Qwen3.6 文档（对照基准）: https://unsloth.ai/docs/models/qwen3.6
- NVIDIA DGX Spark（同类对照）: https://www.nvidia.com/en-us/products/workstations/dgx-spark
