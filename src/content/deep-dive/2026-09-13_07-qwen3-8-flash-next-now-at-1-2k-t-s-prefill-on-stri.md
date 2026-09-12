---
title: "Qwen3.8 Flash Next now at 1.2k t/s prefill on Strix Halo"
date: "2026-09-13"
generated: "2026-09-13 07:00"
source: "Reddit"
slug: "2026-09-13_07-qwen3-8-flash-next-now-at-1-2k-t-s-prefill-on-stri"
summary: "9月12日，ilintar 在 Reddit 公布面向 Radeon 8060S 的 Qwen3.8-Next-Flash 优化。该模型约1770亿参数，IQ4_NL 权重约93GiB，另有27.5GB逐层嵌入表；作者希望让开源 llama.cpp 追上专用 Halogen 的长提示预填充速度。标题中的“1.2k”来自128GB统一内存主机上的特定实验，不是通用设备结论。"
---

# Qwen3.8 Flash Next now at 1.2k t/s prefill on Strix Halo

## 事件背景
9月12日，ilintar 在 Reddit 公布面向 Radeon 8060S 的 Qwen3.8-Next-Flash 优化。该模型约1770亿参数，IQ4_NL 权重约93GiB，另有27.5GB逐层嵌入表；作者希望让开源 llama.cpp 追上专用 Halogen 的长提示预填充速度。标题中的“1.2k”来自128GB统一内存主机上的特定实验，不是通用设备结论。

## 核心观点 / 产品机制
实现位于 pwilkin/llama.cpp 的 strix-halo 分支：用直接读取避免海量缺页，以bf16 WMMA处理反量化矩阵乘，融合超连接与归一化，并把门控DeltaNet递归改成分块内核。公开逐提交测试从191.25提升至1160.02词元每秒；成品以16384批宽测得浅层1204.31、四万深度1086.29，解码则为26.28和16.63。网页还坦承稀疏注意力整体近乎持平，最大增益实际来自分块DeltaNet；这些均为作者单机复测。

## 社区热议与争议点
Reddit Atom源取得13个条目：主帖加12条可见评论子集。uti24惊叹长上下文提升，并期待合入主线；Kooky-Mode3047认为Flash Next质量胜过27B，却只能忍受15至25词元每秒解码；rpvelloso称四卡配合exllamav3可达1200预填充、70以上生成，说明跨硬件绝对值不可直比；Look_0ver_There追问1200是单流还是多流，但本次RSS中未见回答。评论真实可核验，却不代表完整评论区。

## 行业影响与未来展望
这组结果表明，统一内存平台仍可借模型专用内核和加载策略显著降低长上下文首词等待；部分稀疏注意力优化也可能迁移到相近架构。不过分支尚未进入主线，强依赖gfx1151、ROCm 10、超大批次和特定量化，且预填充吞吐不能替代端到端延迟、质量与并发评测。

## 附带链接
- [Reddit 原帖](https://www.reddit.com/r/LocalLLaMA/comments/1weobt6/qwen38_flash_next_now_at_12k_ts_prefill_on_strix/)
- [实时基准与复现说明](https://pwilkin.github.io/strix-halo/)
- [逐提交优化记录](https://pwilkin.github.io/strix-halo/journey.html)
- [llama.cpp 实现分支](https://github.com/pwilkin/llama.cpp/tree/strix-halo)
- [Strix Halo 安装仓库](https://github.com/pwilkin/strix-halo)
