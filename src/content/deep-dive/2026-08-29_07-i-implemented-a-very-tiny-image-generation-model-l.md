---
title: "I implemented a very tiny image generation model (latent flow transformer) on a RP2350 microcontroller - it can generate 128x128 images of faces [P]"
date: "2026-08-29"
generated: "2026-08-29 07:00"
source: "Reddit"
slug: "2026-08-29_07-i-implemented-a-very-tiny-image-generation-model-l"
summary: "作者 cpldcpu 于 8 月 28 日展示 Pico-Faces：在 Raspberry Pi Pico 2 所用 RP2350 上直接生成人脸。官方资料显示该芯片有双核 Cortex-M33、520KB SRAM；这次公开的不只是演示，还包括训练、量化、C 推理引擎、权重与可刷写 UF2。项目经历约两周消融和 RTX 5090 夜间训练，即训练成本并未消失，只把推理端压到 MCU。批次仅冻结为 Reddit top/day，RSS 不提供分数和评论总数。"
---

# I implemented a very tiny image generation model (latent flow transformer) on a RP2350 microcontroller - it can generate 128x128 images of faces [P]

## 事件背景
作者 cpldcpu 于 8 月 28 日展示 Pico-Faces：在 Raspberry Pi Pico 2 所用 RP2350 上直接生成人脸。官方资料显示该芯片有双核 Cortex-M33、520KB SRAM；这次公开的不只是演示，还包括训练、量化、C 推理引擎、权重与可刷写 UF2。项目经历约两周消融和 RTX 5090 夜间训练，即训练成本并未消失，只把推理端压到 MCU。批次仅冻结为 Reddit top/day，RSS 不提供分数和评论总数。

## 核心观点 / 产品机制
模型先把 128×128×3 图像压成 16×16×8 latent，再以 rectified-flow DiT 迭代去噪。高质量版含 12 层、约 237 万 DiT 参数与约 49 万参数 VAE decoder，int8 blob 为 4.02MB；快速版 blob 为 2.57MB。权重从 flash 经 DMA 双缓冲流入 SRAM，两核并行；ReLU² 稀疏性据作者自测提速约 15%。设备被超频到 300MHz，生成耗时随模型、步数和 CFG 从约 4.3 秒到 20 秒，CFG 会增加计算。仓库另附冻结校准、整数模拟器与 C 引擎逐字节一致性校验；设备端 Gen-FID 53.8 对比浮点 52.4，仍属作者同套评测。

## 社区热议与争议点
本轮 Atom RSS 实取 9 个 entry，即主帖加 8 条可见评论，不能代表完整评论区。一位用户称数百万参数“很惊人”；作者随即澄清 DiT 本体约 160万至240万，其余来自 VAE 与条件表。另一位只问图表用什么制作，尚无回答；其余可见用户多为简短赞叹。该子集没有独立复现或实质反方，社区证据明显偏薄。

## 行业影响与未来展望
它证明生成模型可被裁剪到 MCU，但边界也清楚：仅五类人脸条件、无文本提示，数据来自 FFHQ，速度和 FID 均是作者口径，且依赖超频。真正价值是可复现的量化、flash streaming 与整数引擎范式，可能迁移到离线传感、玩具和隐私敏感终端，而非替代通用图像模型。

## 附带链接
- [Reddit 原帖](https://www.reddit.com/r/MachineLearning/comments/1w10tax/i_implemented_a_very_tiny_image_generation_model/)
- [Pico-Faces 仓库](https://github.com/cpldcpu/pico-faces)
- [作者技术文章](https://cpldcpu.github.io/2026/08/28/ai-image-generation-on-a-rp-pico-2-microcontroller/)
- [RP2350 官方资料](https://www.raspberrypi.com/documentation/microcontrollers/microcontroller-chips.html#rp2350)
