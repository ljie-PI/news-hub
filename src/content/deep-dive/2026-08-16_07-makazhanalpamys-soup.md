---
title: "MakazhanAlpamys/Soup"
date: "2026-08-16"
generated: "2026-08-16 07:00"
source: "GitHub"
slug: "2026-08-16_07-makazhanalpamys-soup"
summary: "Soup 是面向个人开发者与小团队的 Apache-2.0 Python 命令行工具，把数据准备、微调、评测、导出和服务收进一份 `soup.yaml` 与统一命令，减少手写训练参数�"
---

# MakazhanAlpamys/Soup

## 定位与痛点剖析
Soup 是面向个人开发者与小团队的 Apache-2.0 Python 命令行工具，把数据准备、微调、评测、导出和服务收进一份 `soup.yaml` 与统一命令，减少手写训练参数、依赖安装和远程 GPU 运维。轻量安装不带 PyTorch，训练栈按 extra 选装；目标并非只封装一次 LoRA，而是覆盖模型迭代全流程。

## 核心架构与技术细节
配置由 Pydantic schema 统一校验，训练层对接 Transformers、PEFT、TRL、bitsandbytes，也可选 Unsloth、MLX、DeepSpeed/FSDP。特色 Layer Streaming 将冻结基座置于主存或 NVMe，每次把一层送入预分配显存缓冲，LoRA、梯度及优化器常驻 GPU；双缓冲借专用 CUDA stream 重叠传输与计算，前向及反向重算会各读一遍权重，NF4 则压缩主存占用；首次运行还会切分逐层分片，并按检查点指纹建立缓存。README 自报 RTX 3050 Laptop 上 8B 模型峰值 3.32 GB、119.6 tok/s，并明确这是 BETA、吞吐尚未按正确性修复后重测。

## 竞品对比与生态站位
相较 LLaMA-Factory、Axolotl 的配置驱动训练，Soup 强调 `init/train/ship` 一体化、自动硬件预检及回归门禁，并提供迁移入口；相较主打加速内核的 Unsloth，它覆盖的数据治理、评测、GGUF/ONNX/TensorRT 导出更宽，同时反过来把 Unsloth作为可选后端。优势是低门槛与低显存实验，代价是功能面很大、依赖兼容矩阵复杂。

## 开发者反馈与局限性
近期 issue 暴露了仍在快速打磨的边界：#372 指出 `--no-reexec` 建议命令会漏掉 FSDP 参数，可能无声改变训练；#405 质疑工具调用评测满分后缺少回归分辨率；#403 说明 noise floor 尚不能覆盖 judge 模式。PR #411 又修正云虚机 virtio 磁盘被误判为 HDD、导致磁盘流式层被拒的问题。项目仅支持 Python 3.10–3.12；流式层限定文本、部分架构与任务，长上下文显存预测可能低估，GRPO/PPO 明确不支持。

## 附带链接
- [GitHub Repo](https://github.com/MakazhanAlpamys/Soup)
- [官网与文档](https://trysoup.dev)
- [Layer Streaming 文档](https://github.com/MakazhanAlpamys/Soup/blob/main/docs/performance-and-quantization.md#layer-streaming-beta-v0720-nf4-v0722-disk--wider-archs-v0723-preference-losses-v0724)
