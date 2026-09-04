---
title: "~22% less weight VRAM, lossless: base-3 packing for ternary GGUFs"
date: "2026-09-05"
generated: "2026-09-05 07:00"
source: "Reddit"
slug: "2026-09-05_07-22-less-weight-vram-lossless-base-3-packing-for-te"
summary: "9月4日，pmttyji 发布用于压缩原生三值模型权重的 B3S/Q2_B3。raw 与 Atom 的编号、标题、作者、时间一致。标题“约降22%”是块大小理论口径：对比上游 Q2_0 的每64权重18字节，即2.25位/权重；B3S 为1.75位，减少22.2%，不是整机显存实测。KV缓存、激活和运行时工作区并未缩小。"
---

# ~22% less weight VRAM, lossless: base-3 packing for ternary GGUFs

## 事件背景

9月4日，pmttyji 发布用于压缩原生三值模型权重的 B3S/Q2_B3。raw 与 Atom 的编号、标题、作者、时间一致。标题“约降22%”是块大小理论口径：对比上游 Q2_0 的每64权重18字节，即2.25位/权重；B3S 为1.75位，减少22.2%，不是整机显存实测。KV缓存、激活和运行时工作区并未缩小。

## 核心观点 / 产品机制

每128个权重共用一个半精度浮点缩放因子；128个三进制位装入26字节，加2字节缩放，共28字节。每字节容纳五个三进制位（三的五次方为243）。运行时还原为负一、零、正一后，与八位激活累加。“无损”仅限符合三态和单块缩放的模型；普通浮点模型仍会被重新量化。旧版30字节重打包器仅在两段缩放相等或上半段全零时删除第二缩放，否则中止；本轮其11项合成测试通过。作者称7900 XTX上预填充与解码无明显损失，但未给可复现速度或困惑度表，仍属作者自测。

## 社区热议与争议点

Atom 共5个条目，即主帖加4条可见评论子集；主帖正文被服务端截断，机制另以仓库校正。Storterald 询问能否上游合并，Good-Seaweed92 赞成提交后续补丁。实现作者 llopresto87 回应尚不确定，并披露代码由人工智能生成、自己测试两个月，这是作者口径而非独立验证。fragment_me 则质疑省空间是否只是删缩放；仓库的逐块校验回答了条件，但没有真实大模型测试替代社区疑虑。

## 行业影响与未来展望

方案能让三值模型减少权重带宽和装载空间，却不是通用量化突破。上游已有更密的1.6875位 TQ1_0，也已有 Q2_0 的中央处理器、Metal与CUDA支持；当前主线没有自定义类型43，B3S 文件必须使用该分叉，兼容性是主要成本。能否落地主流工具，取决于上游评审、多硬件正确性、真实模型质量与端到端性能复现。

## 附带链接

- [Reddit 原帖](https://www.reddit.com/r/LocalLLaMA/comments/1w7dlo5/22_less_weight_vram_lossless_base3_packing_for/)
- [B3S llama.cpp 分叉](https://github.com/llopresto87/llama-cpp-ternary-b3s)
- [30→28 字节重打包器](https://github.com/llopresto87/ternary-q2_0-repacker)
- [上游 Q2_0 CPU 合并记录](https://github.com/ggml-org/llama.cpp/pull/24448)
