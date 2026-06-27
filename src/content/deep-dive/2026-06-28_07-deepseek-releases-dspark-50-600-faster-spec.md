---
title: "DeepSeek releases DSpark - 50%-600% faster spec decoding vs MTP"
date: "2026-06-28"
generated: "2026-06-28 07:00"
source: "Reddit"
slug: "2026-06-28_07-deepseek-releases-dspark-50-600-faster-spec"
summary: "这条来自 r/unsloth 的帖子由 danielhanchen 发布，核心信息是 DeepSeek 为 V4 Flash 与 V4 Pro 公开 DSpark：一种面向 LLM 推理的投机解码（speculative decoding）方案。帖"
---

---
title: "DeepSeek releases DSpark - 50%-600% faster spec decoding vs MTP"
date: "2026-06-28"
generated: "2026-06-28 07:00"
source: "Reddit Deep Dive"
slug: "deepseek-releases-dspark-50-600-faster-spec"
---

# DeepSeek releases DSpark - 50%-600% faster spec decoding vs MTP

## 事件背景

这条来自 r/unsloth 的帖子由 danielhanchen 发布，核心信息是 DeepSeek 为 V4 Flash 与 V4 Pro 公开 DSpark：一种面向 LLM 推理的投机解码（speculative decoding）方案。帖子称其相对单 MTP 基线可带来 51% 到 400% 级别的吞吐提升，并附上 DeepSpec GitHub 仓库、DSpark 论文和 Hugging Face 模型链接。原始 Reddit 页面和 JSON 评论接口本次均返回 403，外部网页提取也返回 432；因此本文主要依据可访问的 GitHub 仓库、PDF 论文、Hugging Face 元数据，以及同日 Hacker News 讨论线索分析，而非完整 Reddit 评论区。

## 核心观点 / 产品机制

DSpark 解决的是投机解码在真实服务系统中的两个痛点：草稿模型要一次提出足够长的 token 块，但不能因为位置间缺少依赖而让后缀接受率快速衰减；同时目标模型验证时也不能盲目验证所有候选 token，否则高并发下会浪费宝贵 batch 容量。论文给出的方案是“双组件”：一是半自回归生成，用并行 backbone 保持草稿生成速度，再用轻量顺序模块/Markov head 注入块内 token 依赖；二是 confidence-scheduled verification，用置信度头估计前缀存活概率，并结合硬件/引擎负载动态决定每个请求要验证多长的前缀。

DeepSpec 仓库本身不是简单模型卡，而是完整训练与评估代码库，包含数据准备、draft model 实现、训练脚本与评测脚本；README 明确支持 DSpark、DFlash、Eagle3 三类算法，评测集覆盖 GSM8K、MATH500、HumanEval、MBPP、LiveCodeBench、MT-Bench、Alpaca、Arena-Hard 等。论文在 Qwen3-4B/8B/14B 与 Gemma4-12B 上做离线评测，称 DSpark 相比 Eagle3 的宏平均 accepted length 提升约 26.7%–30.9%，相比 DFlash 提升约 16.3%–18.4%。

## 社区热议与争议点

虽然未能读取 Reddit 评论，帖子本身选择发在 r/unsloth 也很有信号意义：这个社区更关心开源模型微调、推理效率和本地部署，而不是单纯模型榜单。可访问的 HN 讨论显示，技术社区关注点集中在三类：第一，DSpark 是否已经解释了 DeepSeek 近期低价与高吞吐能力；第二，Hugging Face 上的 `DeepSeek-V4-Flash-DSpark` 与 `DeepSeek-V4-Pro-DSpark` 是否能被本地推理栈、量化生态和第三方服务快速接入；第三，DeepSeek 持续公开系统级优化论文，与欧美闭源实验室形成鲜明对比。

争议也同样明显。论文中的超高相对吞吐数字需要谨慎理解：在严格 SLA 下，MTP-1 基线会接近运行边界，因此 406% 或 661% 这类数字更多说明 DSpark 扩展了可行交互性边界，不应直接等同于所有场景都“六倍加速”。此外，DSpark 仍需额外草稿模型和训练/校准流程；DeepSpec README 也提示默认 Qwen3-4B 目标缓存可达约 38TB，这对普通本地玩家并不轻量。

## 行业影响与未来展望

DSpark 的价值不只是“又快了一点”，而是把推理优化从模型结构推进到服务调度层：同一模型在不同负载、不同任务熵、不同 SLA 下，最优验证长度并不相同。对 API 服务商来说，这意味着更低单位 token 成本和更稳定的交互速度；对本地 LLM 社区来说，短期更现实的路径可能不是人人训练 DSpark，而是等待推理引擎、量化仓库和模型分发平台把 draft 模块打包成可用组件。

如果 DeepSpec 后续能被 vLLM、llama.cpp、SGLang 或专门的 DeepSeek V4 推理栈吸收，投机解码会从“可选优化”变成大模型服务的默认工程层。反过来，评估也会从单机 tok/s 转向吞吐—延迟 Pareto 曲线：在多用户并发下，谁能少验证低价值 token，谁就能在同等硬件上服务更多请求。

## 附带链接

- Reddit 讨论：https://www.reddit.com/r/unsloth/comments/1ugv32u/deepseek_releases_dspark_50600_faster_spec/
- Reddit 图片：https://i.redd.it/ggootkfnpr9h1.png
- DeepSpec GitHub：https://github.com/deepseek-ai/DeepSpec
- DSpark 论文：https://github.com/deepseek-ai/DeepSpec/blob/main/DSpark_paper.pdf
- Hugging Face：`deepseek-ai/DeepSeek-V4-Flash-DSpark`、`deepseek-ai/DeepSeek-V4-Pro-DSpark`

> 抓取限制说明：已尝试访问 Reddit permalink、Reddit JSON、old.reddit、GitHub 仓库和论文 PDF；Reddit 评论区返回 403，外部提取服务对 Reddit/GitHub 返回 432。GitHub raw、PDF、仓库 clone、Hugging Face API 与 HN Algolia 讨论可访问。