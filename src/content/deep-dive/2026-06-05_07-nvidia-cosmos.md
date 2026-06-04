---
title: "nvidia-cosmos"
date: "2026-06-05"
generated: "2026-06-05 07:00"
source: "GitHub"
slug: "2026-06-05_07-nvidia-cosmos"
---

---
title: "NVIDIA/cosmos - Physical AI 世界模型开源平台"
date: "2026-06-05"
generated: "2026-06-05 07:00"
source: "GitHub"
slug: "nvidia-cosmos"
---

## 项目定位与痛点剖析

NVIDIA/cosmos 定位为面向 **Physical AI**（具身智能、自动驾驶、智能基础设施、工业视觉）的开源世界基础模型（World Foundation Models, WFMs）平台。它瞄准的痛点非常具体：主流大模型擅长文本与像素，但机器人和自动驾驶系统必须理解物理因果——物体会下落、摩擦会衰减动量、动作有连贯后果。Cosmos 把"世界理解、世界生成、动作策略"塞进同一个开放栈，让开发者无需从零搭建仿真器，也能批量产出合成传感器数据、训练策略并做闭环评估。当日新增 244 颗 Star、累计 8968 Star 的增速，反映了机器人与自驾社区对该方向的强烈需求。

## 核心架构与技术细节

最新发布的 **Cosmos 3** 提出"omnimodal world model"概念，统一处理文本、图像、视频、音频与动作序列。核心是 **Mixture-of-Transformers (MoT)** 架构：自回归 Transformer 负责因果推理（next-token prediction），扩散 Transformer 负责多模态生成（全注意力去噪），共享 backbone 并采用 **3D mRoPE** 编码时空结构。模型族包括 Cosmos3-Nano（16B）、Cosmos3-Super（64B）以及 Text2Image、Image2Video、Policy-DROID 等专精变体。两套运行界面 **Reasoner**（文本/视觉→文本）与 **Generator**（文本/视觉/声音/动作→视觉/声音/动作）分别覆盖任务规划、具身推理、视频合成、前向动力学和动作策略。动作条件维度细分到相机运动（9D）、AV（9D）、单臂机器人（10D，兼容 DROID/UR/Bridge/UMI）、双臂（20D）、人形（29D，AgiBot），输出最高 720p、24 FPS、189 帧的带声视频。

## 竞品对比与生态站位

在世界模型赛道，Cosmos 与 Google DeepMind 的 **Genie 3**（实时交互式 3D 环境生成）、OpenAI 的 **Sora**（影视级视频生成）、Meta 的 **V-JEPA 2**（隐空间世界预测）、Wayve 的 **GAIA-2**（驾驶专精）形成差异化：Genie 强调可交互探索、Sora 强调视觉美学、V-JEPA 强调表征学习，而 Cosmos 押注"全模态 + 动作 + 物理 grounded + 开源 + NVIDIA 硬件生态"。配套的 **Cosmos Curator**（数据筛选）、**Cosmos Evaluator**（生成打分）、**Cosmos Cookbook** 与 NIM 微服务，构成完整的数据—训练—部署闭环，并直接对接 Isaac Sim、Metropolis Blueprint 和 Blackwell GB200 算力。

## 开发者反馈与局限性

社区反馈呈两极。正面看，Hugging Face 上的开放权重、cookbook 中仓库管理、手术数字孪生、盲人导航等社区项目活跃。负面方面，**显存门槛极高**：14B Video2World 推理需 ~56 GB VRAM，14B Text2Image 需 ~49 GB，全量加载需 74–80 GB 卡，主流 24/32 GB 消费卡基本无缘本地运行。cosmos-transfer2.5 仓库的 Issue 列表反映出依赖版本冲突（`cosmos-oss==0.1.0` 与 workspace 1.5.0 不匹配）、edge/distilled 模型被未文档化环境变量门控、CARLA 输入下生成质量偏低、模块缺失（`VelocityPassthroughWrapper`）等工程瑕疵。Starlog 一篇评论亦曾吐槽主仓库早期更像跳转页，对想直接上手的开发者不够友好。

## 附带链接

- 仓库：<https://github.com/NVIDIA/cosmos>
- 官网：<https://www.nvidia.com/en-us/ai/cosmos/>
- 文档：<https://docs.nvidia.com/cosmos/latest/introduction.html>
- 技术报告：<https://research.nvidia.com/labs/cosmos-lab/cosmos3/technical-report.pdf>
- Hugging Face 模型集合：<https://huggingface.co/collections/nvidia/cosmos3>
- Cookbook：<https://nvidia-cosmos.github.io/cosmos-cookbook/>
