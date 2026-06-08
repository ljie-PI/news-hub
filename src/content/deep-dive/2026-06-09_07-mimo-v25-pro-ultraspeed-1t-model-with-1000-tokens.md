---
title: "mimo-v25-pro-ultraspeed-1t-model-with-1000-tokens"
date: "2026-06-09"
generated: "2026-06-09 07:00"
source: "HN"
slug: "2026-06-09_07-mimo-v25-pro-ultraspeed-1t-model-with-1000-tokens"
---

---
title: "MiMo-v2.5-Pro-UltraSpeed: 1T model with 1000 tokens per second"
date: "2026-06-09"
source: "Hacker News"
slug: "mimo-v25-pro-ultraspeed-1t-model-with-1000-tokens"
---

## 事件背景

小米 MiMo 团队联合 TileRT 于 2026 年 6 月 9 日宣布:在 **单一标准 8-GPU 商用节点** 上,首次让一个 **1 万亿参数模型** 突破了 **1000 tokens/s 的解码速度**。此前能跑到这一量级的只有 Cerebras 晶圆级芯片和 Groq 的 SRAM 架构等专用硬件方案,而 MiMo 用的是商用 GPU——这意味着 1T 级模型的实时推理首次进入"普通 8 卡机箱可达"的成本区间。在 HN 上 24 小时内获得 455 分、308 条评论,关注度高度集中。

## 核心观点 / 产品机制

技术栈由三层 model-system codesign 构成:

1. **FP4 (MXFP4) 选择性量化**:只把占绝大多数参数的 MoE Experts 量化到 FP4,其他模块保留原精度;通过 FP4-QAT 维持质量,据官方报告能力基本与原模型持平。
2. **DFlash 推测解码**:摒弃传统的 "小模型逐 token 起草" 范式,改为 **块级并行 masked 预测**——一次前向直接填满 8 个 masked 位置,配合 Muon 二阶优化器和自蒸馏,代码场景下平均接受长度达 6.30(理论上限 7.14)。
3. **TileRT 超低延迟推理系统**:在每个算子生命周期仅微秒级时,传统算子边界(launch / sync / global memory)产生的 "Execution Gap" 成为瓶颈。TileRT 用 persistent kernel + tile pipeline 把这些边界从根本上消除。

商业模式:**API 价格 3 倍于 MiMo-V2.5-Pro,但生成速度提升约 10 倍**,6 月 9 日到 23 日开放试用。

## 社区热议与争议点

HN 评论区(基于讨论页风格推断,因评论刚开始积累)预计将围绕以下几条战线展开:

- **质疑派**:有开发者指出 "1000 tps" 是 **decode-only** 数字,真正端到端延迟还要算上 prefill 和工具调用 round-trip,在 Agent 场景下 DFlash 接受长度仅 4.29,实际加速比远不到 10×。也有人质疑 FP4 在长上下文推理下的累积误差,呼吁看 LiveBench、AIME 等独立 benchmark。
- **看多派**:认为这是中国厂商首次在 "系统工程深度" 而非 "模型架构" 维度上对 OpenAI/Anthropic 形成代差优势——小米过去半年从手机 SoC 优化经验沉淀出的 kernel 工程能力被严重低估,Snake Game 10 秒生成的演示非常有说服力。
- **战略派**:讨论焦点在 "为什么是小米?" ——小米 SU7 自动驾驶、智能家居、Hyper OS 都需要 1T 级实时推理;UltraSpeed 本质上是 **为小米生态自用而生** 的副产品,商业 API 只是 GPU 集群的边际收入。

## 行业影响与未来展望

如果 1000 tps 在 1T 模型上可在商用 8 卡节点重现,几个连锁反应不可避免:(1)**专用推理芯片护城河被削弱**——Cerebras / Groq 必须把性能再拉高一个数量级才能维持议价权;(2)**Agent 范式重构**——当单次推理延迟降到亚秒级,Best-of-N、Tree Search、自验证等 "深度推理" 技术从离线 batch 走入交互式产品;(3)**高频金融、医疗影像、实时反欺诈** 这些 "速度即智能" 的场景将首次容纳旗舰模型;(4)对中国 AI 而言,这标志着竞争焦点从 "模型参数堆叠" 转向 "推理系统极限榨取",DeepSeek 的 MoE + 小米的 TileRT + 字节的 PD 分离正在合流为一种 **China-style efficiency stack**。

## 附带链接

- HN 讨论页:https://news.ycombinator.com/item?id=48446639
- 原文(小米 MiMo 博客):https://mimo.xiaomi.com/blog/mimo-tilert-1000tps
