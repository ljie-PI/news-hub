---
title: "Using Unsloth’s DiffusionGemma GGUF for local Jev-compatible decisions—now with image analysis"
date: "2026-09-24"
generated: "2026-09-24 07:00"
source: "Reddit"
slug: "2026-09-24_07-using-unsloth-s-diffusiongemma-gguf-for-local-jev"
summary: "帖主、TensorSharp 维护者称，项目现可用 Unsloth 的 DiffusionGemma 量化权重，在本机经同一 Jev 兼容接口对文本或图片返回布尔概率、分类和等级分，而非自由文本。其三十六组请求全成功、匹配请求延迟中位数快约三点三倍，均属作者的文本烟测自报，且两侧提示长度及成功样本不同，不是独立基准，更未测视觉准确率。"
---

# Using Unsloth’s DiffusionGemma GGUF for local Jev-compatible decisions—now with image analysis

## 事件背景
帖主、TensorSharp 维护者称，项目现可用 Unsloth 的 DiffusionGemma 量化权重，在本机经同一 Jev 兼容接口对文本或图片返回布尔概率、分类和等级分，而非自由文本。其三十六组请求全成功、匹配请求延迟中位数快约三点三倍，均属作者的文本烟测自报，且两侧提示长度及成功样本不同，不是独立基准，更未测视觉准确率。

## 核心观点 / 产品机制
仓库源码已核实 `/v1/systemone`：系统先预填提示，在带种子的答案画布上做一步读取，只投影指定标签的概率，不逐词生成概率 JSON；问题过多可分块。请求最多接收八张内联图片，拒绝远程网址与本地文件路径；缺少视觉塔时图片请求返回错误。HF 元数据确认 Q4_K_M 文件约十六点八 GB，来自 Unsloth 对 Google 原始模型的量化；视觉塔不在 GGUF 内，配置另取 Google 上游约二点八四 GB 的分片。源码与测试覆盖接口和绑定逻辑，但本轮环境缺少 dotnet，未实跑模型。

## 社区热议与争议点
该 RSS 仅取得主帖及三条真实回复，样本不足。其一，用户质疑决策几乎不生成输出词元，扩散并行的速度优势是否仍成立；其二，同一用户要求与统一多模态的 Gemma 4 12B 对照。作者只回贴 Google Cloud 教程，未补消融或图像基准。另一用户以“热狗还是非热狗”概括二分类场景，但未报告复现；因此没有独立正面验证。

## 行业影响与未来展望
若实测成立，这种本地、定型输出可用于票据检查、截图分类和文档路由，并减少格式解析失败；但概率校准、不同后端一致性、真实图像精度与端到端时延仍待公开数据。它是 Jev 兼容实现，并非托管 Jev 模型或预测等价承诺。

## 附带链接
- [Reddit 原帖](https://www.reddit.com/r/unsloth/comments/1woidho/using_unsloths_diffusiongemma_gguf_for_local/)
- [TensorSharp](https://github.com/zhongkaifu/TensorSharp)
- [Unsloth GGUF](https://huggingface.co/unsloth/diffusiongemma-26B-A4B-it-GGUF)
- [Google 模型卡](https://ai.google.dev/gemma/docs/diffusiongemma/model_card)
