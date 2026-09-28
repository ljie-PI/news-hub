---
title: "ashhart/TensorFold"
date: "2026-09-29"
generated: "2026-09-29 07:00"
source: "GitHub"
slug: "2026-09-29_07-ashhart-tensorfold"
summary: "TensorFold 面向苹果芯片与英伟达显卡，以 OpenAI 兼容接口提供本地推理。它聚焦推测解码的草稿验证、长上下文复用、内存预算与并发准入，让接受指定模型和量化格式的工作站用户获得可复现输出。批次选中时当日新增 160 星；当前接口为 554 星、57 个复刻，与冻结快照一致，不能混作长期增速。"
---

# ashhart/TensorFold

## 定位与痛点剖析

TensorFold 面向苹果芯片与英伟达显卡，以 OpenAI 兼容接口提供本地推理。它聚焦推测解码的草稿验证、长上下文复用、内存预算与并发准入，让接受指定模型和量化格式的工作站用户获得可复现输出。批次选中时当日新增 160 星；当前接口为 554 星、57 个复刻，与冻结快照一致，不能混作长期增速。

## 核心架构与技术细节

项目要求 Python 3.11，以 MLX 和 CUDA 为双后端；源码分为模型家族、内核、草稿器、引擎和服务层。各家族自带 Metal 或 CUDA 内核，并以多令牌预测头、DFlash2、上下文复制生成草稿。令牌仅在与同一引擎串行解码一致时被接受，各流有独立采样状态；不保证跨后端或量化格式一致。服务层处理内存估算、排队、前缀快照和磁盘溢出。README 性能表多处待测，速度宣传不能视为实测。

## 竞品对比与生态站位

MLX-LM 官方 README 强调数千种兼容模型、量化与微调，覆盖更广；TensorFold 只为少数家族写专用内核，换取精确草稿验证和更细的内存控制。vLLM 官方提供连续批处理、分块预填充、多硬件和两百余架构，生态更成熟。TensorFold 更像针对苹果统一内存与特定英伟达环境的实验型快路径，而非通用替代品。

## 开发者反馈与局限性

问题 #72 报告长预填充会暂停已有流，四个长提示下早期流降至每秒一至三个令牌；#71 报告六十四吉字节机器虽能接收约十四万令牌，却无法保留超长会话前缀，下一轮需重新预填充。两者仍开放，只能视为用户复现，而非已确认根因。#56 的多架构 CUDA 编译失败则由维护者确认并在 0.3.6.1 修复。项目仍标为 Alpha，模型范围窄，部分 CUDA 家族一次只服务一个请求。

## 附带链接

- [GitHub Repo](https://github.com/ashhart/TensorFold)
- [README](https://github.com/ashhart/TensorFold/blob/main/README.md)
- [Issues](https://github.com/ashhart/TensorFold/issues)
- [MLX-LM](https://github.com/ml-explore/mlx-lm)
- [vLLM](https://github.com/vllm-project/vllm)
