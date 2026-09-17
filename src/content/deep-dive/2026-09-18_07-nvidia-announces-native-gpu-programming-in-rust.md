---
title: "Nvidia announces native GPU programming in Rust"
date: "2026-09-18"
generated: "2026-09-18 07:00"
source: "HN"
slug: "2026-09-18_07-nvidia-announces-native-gpu-programming-in-rust"
summary: "英伟达九月八日宣布推进原生CUDA Rust，目标是让内核本身直接以Rust编写并编译为PTX，而非只由Rust调用其他语言内核。官方称其驱动、推理基础设施已采用Rust，GPU内核是待补缺口；两个项目仍属早期，均未达到生产就绪。"
---

# Nvidia announces native GPU programming in Rust

## 事件背景

英伟达九月八日宣布推进原生CUDA Rust，目标是让内核本身直接以Rust编写并编译为PTX，而非只由Rust调用其他语言内核。官方称其驱动、推理基础设施已采用Rust，GPU内核是待补缺口；两个项目仍属早期，均未达到生产就绪。

## 核心观点 / 产品机制

官方给出两条路径。SIMT方向cuda-oxide是自定义rustc后端，将内核经MIR、Pliron、LLVM降至PTX；`DisjointSlice`把可变输出拆成线程独占片段，类型化索引与启动契约检查越界和配置，但共享内存目前仍需`unsafe`，且依赖Linux、固定nightly和工具链。Tile方向cutile-rs在稳定版Rust上以张量分块描述计算，宏保存语法树，首次运行经CUDA Tile IR即时编译；分区同时确定独占写入范围与启动网格，由编译器映射真实线程。官方建议优先Tile，需要精细控制时再用SIMT，并称未来会做跨语言互操作。

## 社区热议与争议点

批次冻结为九百二十分、三百七十九评；本次脚本完整取得当前可见树三百五十个节点，未触及上限。以下均为社区判断或自述：the__alchemist赞成主机与设备共享结构体，却担心换成尚未稳定的新方言及仅支持Linux；embedding-shape认为两条路径更顺手、构建折腾更少，但现有cudarc与CUDA一一映射，更容易复用资料；jacobgorm质疑简单内核从Rust获益有限，主张高层需求用Triton；cmrdporcupine则自述已把一批C++内核迁至cuda-oxide并调到相当性能，但这不是独立基准。

## 行业影响与未来展望

若所有权与启动契约能在真实复杂内核中成立，Rust可把部分并发、别名错误提前到编译期，也能减少Rust系统层与GPU内核之间的语言断层。短期限制同样明确：平台单一、SIMT工具链不稳、共享内存安全化未完成，且两套新抽象会增加诊断层级；生态影响取决于性能复现、接口稳定和互操作承诺能否兑现。

## 附带链接

- [英伟达官方原文](https://developer.nvidia.com/blog/introducing-cuda-rust-two-tracks-for-writing-gpu-kernels/)
- [Hacker News 讨论](https://news.ycombinator.com/item?id=49724881)
