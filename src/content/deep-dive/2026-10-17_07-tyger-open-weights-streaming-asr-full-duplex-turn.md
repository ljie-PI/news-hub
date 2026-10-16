---
title: "Tyger: open-weights streaming ASR + full-duplex turn-control in one model"
date: "2026-10-17"
generated: "2026-10-17 07:00"
source: "Reddit"
slug: "2026-10-17_07-tyger-open-weights-streaming-asr-full-duplex-turn"
summary: "NineNineSix 于十月十六日在 Reddit 发布 Tyger，试图把流式转写、端点检测、打断与附和统一到一个开放权重模型，减少语音代理依赖静音阈值和多个独立分类器造成的迟钝轮次切换。"
---

# Tyger: open-weights streaming ASR + full-duplex turn-control in one model

## 事件背景

NineNineSix 于十月十六日在 Reddit 发布 Tyger，试图把流式转写、端点检测、打断与附和统一到一个开放权重模型，减少语音代理依赖静音阈值和多个独立分类器造成的迟钝轮次切换。

## 核心观点 / 产品机制

Tyger 沿用 NVIDIA Nemotron 3.5 ASR Streaming 0.6B，以用户麦克风和代理回放两路音频的第十五层特征、能量及上一状态为输入，交给三层、宽度七百六十八的因果 GRU。模型每八十毫秒输出端点、让步打断和附和概率，无前视；公开运行时再以规则生成回答、停止或“嗯哼”事件。不过源码显示真实决策按三百二十毫秒 hop 落地。模型仓只含约二十六亿字节权重和配置，推理代码在 tyger-s2s；权重为 OpenMDW-1.1，运行代码才是 Apache-2.0。卡片中的速度与指标均为发布方离线结果，未覆盖 Nemotron 耗时或真实通话。

## 社区热议与争议点

Atom RSS 共六个 entry：主帖外有三条普通评论、两条作者回复。普通用户 Alumin-MC 称其很酷、像“TTS 的决策模型”；作者 ylankgz 纠正说决策基于音频输入。DeProgrammer99 指出此前已有同项目帖子；作者说明自己是维护者，该用户随后澄清只是分享链接。可见子集没有独立复现或实质反方，因而不足以证明社区已形成正反共识。

## 行业影响与未来展望

若双通道轮次头能稳定工作，语音代理可更自然地抢停、接话和附和。但仓库仍记录完整八秒窗口每跳重复编码两次、阈值未经现场调优，以及干净麦克风下短促附和易误触打断。完整代理还要求三十二GB以上 Blackwell、CUDA 13，当前仅英语且量化未验证；它更像可审计的研究基线，而非普适生产组件。

## 附带链接

- [Reddit 原帖](https://www.reddit.com/r/LocalLLaMA/comments/1x7msmj/tyger_openweights_streaming_asr_fullduplex/)
- [Tyger 模型卡](https://huggingface.co/nineninesix/tyger)
- [NVIDIA 基座说明](https://huggingface.co/nvidia/nemotron-3.5-asr-streaming-0.6b)
- [tyger-s2s 代码](https://github.com/nineninesix-ai/tyger-s2s)
- [评测协议](https://huggingface.co/nineninesix/tyger/blob/main/evaluation/README.md)
