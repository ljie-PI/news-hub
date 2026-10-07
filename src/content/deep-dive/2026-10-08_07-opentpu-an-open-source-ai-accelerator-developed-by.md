---
title: "OpenTPU – An open-source AI accelerator, developed by AI"
date: "2026-10-08"
generated: "2026-10-08 07:00"
source: "HN"
slug: "2026-10-08_07-opentpu-an-open-source-ai-accelerator-developed-by"
summary: "OpenTPU 把 SystemVerilog 硬件、指令集、位精确模拟器、内核编译器、性能分析器和主机工具放进同一仓库，目标是在退役数据中心的 Kintex-7 PCIe FPGA 卡上运行现代小模型。批次冻结热度为 334 点、391 条评论；调研时 Algolia 实际取得前 100 个可见节点，已触及本次上限，二者不能混算。"
---

# OpenTPU – An open-source AI accelerator, developed by AI

## 事件背景
OpenTPU 把 SystemVerilog 硬件、指令集、位精确模拟器、内核编译器、性能分析器和主机工具放进同一仓库，目标是在退役数据中心的 Kintex-7 PCIe FPGA 卡上运行现代小模型。批次冻结热度为 334 点、391 条评论；调研时 Algolia 实际取得前 100 个可见节点，已触及本次上限，二者不能混算。

## 核心观点 / 产品机制
其单发射序列器显式调度 DMA、整数矩阵单元、浮点向量单元与量化器，不设缓存或隐藏调度；Python 内核经编译器降为固定指令，模拟器充当规格，测试要求 RTL 与模拟结果逐位一致。仓库自报在指定卡、提示长度及量化配置下，四比特 LFM2.5-230M 墙钟解码约 82.1 词元每秒，但这不是独立复测或同商业 TPU 的对照。所谓“由 AI 开发”也应收窄：源码显示代理在组件锦标赛中提假设、改受限文件，自动门禁决定去留；提交归属仍为人类维护者，验证器、目标和板卡调试均有人类设计，不能解读为 AI 独立完成芯片。

## 社区热议与争议点
正方中，vatsachak 认为经验丰富者给模型指方向很有价值；skybrian 追问约三百美元硬件后，作者解释这是退役板卡，关键是榨取内存带宽。反方更关注比较口径：Retro_Dev 追问“八十多词元”相对现有 TPU 如何、所谓小模型多小；fhdkweig 质疑 FPGA 成本和速度，作者也只将其定位为投入 ASIC 前的架构验证。

## 行业影响与未来展望
价值首先是可读、可仿真的教学与研究栈，以及“代理生成候选、严格验证筛选”的硬件工程范式；开源加速器本身并非首创。当前成果仍是特定旧 FPGA 上的项目方测量，不等于流片、量产可制造性、功耗优势或新颖架构已获证明；后续应有第三方复现、统一基准及 ASIC 面积时序功耗数据。

## 附带链接
- [项目仓库](https://github.com/FeSens/openTPU)
- [设计说明](https://github.com/FeSens/openTPU/blob/main/docs/superpowers/specs/2026-09-23-opentpu-design.md)
- [代理锦标赛](https://github.com/FeSens/openTPU/blob/main/docs/tourney.md)
- [HN 讨论](https://news.ycombinator.com/item?id=49980715)
