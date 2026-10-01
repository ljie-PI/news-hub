---
title: "tile-ai/tilelang"
date: "2026-10-02"
generated: "2026-10-02 07:00"
source: "GitHub"
slug: "2026-10-02_07-tile-ai-tilelang"
summary: "TileLang 是建立在 TVM 上的 Python 风格领域专用语言，面向编写高性能 GPU、CPU 与 NPU 算子的开发者。它把 CUDA、HIP 中线程索引、存储层级、同步和代码生成收束为瓦片、复制、流水线与矩阵乘原语，并保留硬件感知调优。入选冻结快照为当日新增 157、总计 8086 星；查询 GitHub API 时已为 8088 星、813 个分叉，差异是快照后的增长，并非回写榜单。"
---

# tile-ai/tilelang

## 定位与痛点剖析
TileLang 是建立在 TVM 上的 Python 风格领域专用语言，面向编写高性能 GPU、CPU 与 NPU 算子的开发者。它把 CUDA、HIP 中线程索引、存储层级、同步和代码生成收束为瓦片、复制、流水线与矩阵乘原语，并保留硬件感知调优。入选冻结快照为当日新增 157、总计 8086 星；查询 GitHub API 时已为 8088 星、813 个分叉，差异是快照后的增长，并非回写榜单。

## 核心架构与技术细节
前端把 Python 内嵌语言转为中间表示并检查语义；后端上下文确定目标与执行适配器，再运行专属降级管线，拆分主机与设备代码，交给 TVM FFI、NVRTC、Cython 或框架适配器构建和启动。可显式分配共享内存与寄存器片段，`T.Pipelined` 推导多阶段搬运，布局推导负责线程到片段的映射。项目支持 CUDA、ROCm、Metal、Ascend、实验性 LLVM 与 WebGPU 后端。README 的性能图及“约 1.9 倍”提升均属项目自报口径，不是独立基准。

## 竞品对比与生态站位
Triton 同样用 Python 编写深度学习算子，强调由编译器处理底层并行；NVIDIA CUDA Tile 也让程序员操作整块数据，但官方实现绑定 NVIDIA。TileLang 的差异是显式暴露存储放置、线程原语和流水线，并以统一前端覆盖多厂商后端，适合追求可移植又需细调的内核团队；代价是抽象更复杂，后端能力与成熟度不齐，生态规模也难与 Triton 和 CUDA 相比。

## 开发者反馈与局限性
近期 issue #3292 的复现评论确认：当前主分支在 Apple M4 上，Metal 的 BF16 默认 `T.copy` 有 512 个元素中 384 个错误，设置 `coalesced_width=1` 可绕过，修复 PR #3194 仍未合并。issue #3301 自报收集 49 个可复现正确性问题，后续评论又撤回或修正部分判断，并提交多项修复，说明维护响应快，也说明错误代码生成、边界校验和跨后端测试仍是生产采用前必须自行验证的风险。

## 附带链接
- [GitHub 仓库](https://github.com/tile-ai/tilelang)
- [官方文档](https://tilelang.com/)
- [最新稳定版 v0.1.15](https://github.com/tile-ai/tilelang/releases/tag/v0.1.15)
- [Metal BF16 问题 #3292](https://github.com/tile-ai/tilelang/issues/3292)
- [批量正确性报告 #3301](https://github.com/tile-ai/tilelang/issues/3301)
- [Triton 官方文档](https://triton-lang.org/main/index.html)
- [CUDA Tile 官方指南](https://docs.nvidia.com/cuda/cuda-programming-guide/02-basics/writing-tile-kernels.html)
