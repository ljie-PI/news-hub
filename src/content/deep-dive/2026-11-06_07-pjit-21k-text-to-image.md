---
title: "Show HN: A decent text-to-image model trained for ~$20K (Apache 2.0 Weights)"
date: "2026-11-06"
generated: "2026-11-06 07:00"
source: "HN"
slug: "2026-11-06_07-pjit-21k-text-to-image"
summary: "Linum 两人团队把为视频模型验证架构的图像检查点 PJIT-21K 开放出来。本批冻结时为 116 points、13 comments。GitHub 代码与 Hugging Face 的 8.7GB、2.18B 参数权重确已公开，许可证标为 Apache-2.0；但“约两万美元训练出像样模型”是项目方结论，不是独立复现实验。"
---

# Show HN: A decent text-to-image model trained for ~$20K (Apache 2.0 Weights)

## 事件背景
Linum 两人团队把为视频模型验证架构的图像检查点 PJIT-21K 开放出来。本批冻结时为 116 points、13 comments。GitHub 代码与 Hugging Face 的 8.7GB、2.18B 参数权重确已公开，许可证标为 Apache-2.0；但“约两万美元训练出像样模型”是项目方结论，不是独立复现实验。

## 核心观点 / 产品机制
Pyramid-JiT 抛弃 VAE，直接在像素空间把图像切成 32×32 patch；图像与冻结的 Qwen3.5-4B 文本表示先各过两个 refiner，再进入 22 层单流 DiT。训练时在第 10、16 层预测低分辨率图像，以增强早层梯度，推理只保留最终头。团队自报先看 6.10 亿个 512px 样本、再看 4997 万个 1024px 样本，并以每 H100 小时 2.5 美元计得 21038 美元；该成本、收敛速度及样本效果尚无第三方复现。

## 社区热议与争议点
Algolia 调研时取得 13 个可见评论节点。tensor 肯定小团队研究效率；gunalx 则指出过度平滑、塑料光泽和肢体畸形仍像常见文生图缺陷。robotswantdata 追问开放数据集及来源，现有发布材料未披露训练集清单。gigel82 设想量化并更换小型文本编码器后可在 WebGPU 运行，但这只是估算，仓库当前仍要求 CUDA，且模型、文本编码器与激活需约 24GB 显存。

## 行业影响与未来展望
价值不在取代成熟闭源模型，而在公开一种“更强压缩、训练期多尺度监督”的低预算路线及可运行权重。若后续有人复现质量—成本曲线、量化部署，并补齐数据来源与评测，像素空间方案才可能真正降低图像乃至视频模型门槛；当前文字、全身、多实体、多人互动和世界知识仍是明确短板。

## 附带链接
- [Linum 原文](https://www.linum.ai/field-notes/pjit-21k)
- [Hacker News 讨论](https://news.ycombinator.com/item?id=50368208)
- [GitHub 代码](https://github.com/Linum-AI/pjit-21k)
- [Hugging Face 权重](https://huggingface.co/Linum-AI/pjit-21k)
