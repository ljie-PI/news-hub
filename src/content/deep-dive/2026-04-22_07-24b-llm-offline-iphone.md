---
title: "英国独立软件公司实现突破：240 亿参数大模型在 iPhone 上完全离线运行"
date: "2026-04-22"
generated: "2026-04-22 07:00"
source: "Reddit"
slug: "2026-04-22_07-24b-llm-offline-iphone"
summary: "---"
---

# 英国独立软件公司实现突破：240 亿参数大模型在 iPhone 上完全离线运行

> 来源：r/LLM · 2026-04-21  
> 原帖：[British Software House Achieves Milestone…](https://www.reddit.com/r/LLM/comments/1ss0fzq/british_software_house_achieves_milestone_making/)

---

## 1. 事件背景

2026 年 4 月 21 日，英国贝德福德郡的独立小型软件公司 **5N6 LTD** 宣布其 iOS 应用 **LiberaGPT** 完成重大更新，成功在未经改装的 iPhone 16 Pro 和 iPhone 17 Pro 上完全离线运行一个 240 亿（24B）参数的大语言模型。这一消息随即被发布到 Reddit 的 r/LLM 子版块，引起社区广泛关注。

在此之前，在智能手机上本地运行如此规模的模型普遍被认为超出了当代旗舰手机的硬件能力。作为参照，2019 年 OpenAI 发布的 GPT-2 仅有 15 亿参数，且依赖云端基础设施。短短几年间，模型压缩、量化技术和移动端 GPU 性能的飞速进步，使这一"不可能"变为现实。

## 2. 核心观点与产品机制

LiberaGPT 的核心卖点可以归纳为三个词：**离线、隐私、免费**。

- **完全离线运行**：所有推理在设备本地 GPU 上完成，无需网络连接，不依赖云端数据中心。用户的 prompt 和回复数据始终留在手机上。
- **多模型"试听"模式（Audition Mode）**：用户可将同一条 prompt 同时发送给设备上安装的所有模型（发布时已支持 7 个），进行并排对比，方便选择最适合特定任务的模型。
- **实时性能仪表盘**：显示 token 生成速率、设备热状态和内存占用等关键指标。
- **灵活的模型矩阵**：除 24B 旗舰模型外，还提供多个较小模型供用户在速度与能力之间自行取舍。

开发者将 LiberaGPT 比喻为"AI 模型的卡带播放器"——应用本身是播放器，各种优化后的 LLM 则是"卡带"，用户可按需加载。这种设计思路拥抱了当前开源社区不断涌现的轻量化、专精化小模型趋势。

## 3. 社区热议与争议点

尽管 Reddit 原帖评论因平台限制未能完整抓取，综合 r/LLM 与 r/LocalLLaMA 相关讨论，社区反应呈现以下焦点：

1. **量化精度质疑**：多位用户指出，在 iPhone 16 Pro 的 8GB 内存上运行 24B 模型，几乎必然采用了激进的量化方案（如 Q2/Q3 级别）。如此低位量化下模型的实际推理质量能否与云端全精度版本相提并论，社区持高度怀疑态度。有评论直言"参数数量是虚荣指标，量化后的实际表现才是关键"。

2. **推理速度与可用性**：即便模型能跑起来，token 生成速度是否达到实用水平也是热议话题。r/LocalLLaMA 中有用户反映，在 iPhone 上运行较大模型时速度仅为个位数 tok/s，体验远不如云端流畅。

3. **PR 色彩浓厚**：部分社区成员对帖子的新闻稿性质提出批评，认为这更像是一次营销推广而非真正的技术突破。有人指出类似能力（通过 llama.cpp 或 MLC-Chat 运行量化模型）早已存在，LiberaGPT 主要是对现有开源技术的产品化包装。

4. **隐私叙事的认可**：相比技术指标的争论，社区对"完全离线、数据不出设备"的隐私理念表达了较高认同。在 r/LocalLLaMA 的 2026 年 iPhone 离线 LLM 推荐帖中，LiberaGPT 被多位用户推荐为"App Store 上能运行最大模型的免费应用"。

## 4. 行业影响与未来展望

这一事件折射出端侧 AI 推理领域几个重要趋势：

- **移动端 AI 能力的天花板正在快速抬升**：从 2024 年 iPhone 16 Pro 勉强跑 7B 模型，到 2026 年可运行 24B 模型，增长曲线陡峭。随着 Apple 持续加大神经引擎和 Metal 性能投入，这一趋势将延续。
- **隐私驱动的本地化需求正在形成真实市场**：LiberaGPT 发布一个月即获数千用户，说明"去云端化 AI"不再只是极客玩具，而是触及了普通用户对数据主权的真实焦虑。
- **小团队同样可以成为边缘 AI 的推动者**：5N6 是一家位于英国小镇的独立软件公司，其案例表明在开源模型和推理框架充分成熟的今天，产品化创新的门槛已大幅降低。
- **"够用即可"的端侧 AI 定位逐渐清晰**：开发者自己也承认，LiberaGPT 面向的是"日常简单任务"而非取代 ChatGPT 或 Claude 的复杂推理场景。端侧 AI 和云端 AI 将长期互补共存。

值得关注的是，随着 Apple Intelligence 的持续演进以及 Qualcomm/联发科在 Android 端的 NPU 竞赛，2026-2027 年端侧大模型的参数规模和实用性有望再上一个台阶。

## 5. 相关链接

- Reddit 原帖：https://www.reddit.com/r/LLM/comments/1ss0fzq/british_software_house_achieves_milestone_making/
- 新闻原文：https://news.indianaheadlines.com/story/610858/british-software-company-achieves-pioneering-breakthrough-making-it-possible-to-now-run-a-24-billion-parameter-ai-large-language-model-entirely-offline-on-the-iphone.html
- LiberaGPT App Store：https://apps.apple.com/app/liberagpt/id6761083160
- 开发商官网：https://www.5N6.co.uk
- LiberaGPT 官网：https://www.liberagpt.com
