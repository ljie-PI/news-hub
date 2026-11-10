---
title: "Kinetic: a new open-source LLM engine in Rust. Runs your GGUFs on Windows and Linux, replaces llama-server with the same flags"
date: "2026-11-11"
generated: "2026-11-11 07:00"
source: "Reddit"
slug: "2026-11-11_07-kinetic-rust-gguf-inference-engine"
summary: "Kinetic 0.1.0 于帖子当天以 Apache-2.0 开源，目标是在 Windows、Linux 单一二进制中替代本地推理服务。帖子 Atom 共取得四十五个条目：首条为完整正文，其余四十四条是当时可见评论子集，并非完整评论区。"
---

# Kinetic: a new open-source LLM engine in Rust. Runs your GGUFs on Windows and Linux, replaces llama-server with the same flags

## 事件背景
Kinetic 0.1.0 于帖子当天以 Apache-2.0 开源，目标是在 Windows、Linux 单一二进制中替代本地推理服务。帖子 Atom 共取得四十五个条目：首条为完整正文，其余四十四条是当时可见评论子集，并非完整评论区。

## 核心观点
代码是十四个 crate 的 Rust 工作区：GGUF 解析器以 mmap 读取并校验头、维度和张量边界，模型层再将架构映射到共享注意力、Mamba、MoE 等模块，服务层抽象 CPU、CUDA、Vulkan 后端。它无需转换 GGUF，但绝非“任意 GGUF”：支持受模型家族、分词器、量化类型限制，分片文件也须先合并；Vulkan 目前只覆盖五类架构，不支持 MoE、层切分，多卡尚未实现。单端口确有 OpenAI、llama-server、Ollama 路由，但 llama 参数和响应字段仍有差异，也不替代 libllama。

## 社区热议
四个实际例子界定了宣传边界：kosiarska 认为项目有潜力，却追问大型代码库效果，作者承认尚无此基准；Objective_Pepper 在 RTX 4060 上发现 Qwen3.5“精确输出”失败，且新进程编辑加速仅约一至一点四倍，作者认可原四点五倍受同进程重放放大；TerryNachtmerrie 发现 Gemma 4 26B MoE 不能加载，促使作者收窄“现有 GGUF 都能跑”的表述；LippyBumblebutt 在 RX 9070 上遇到缺失 Vulkan 内核及设备丢失。

## 行业影响
其价值是以类型安全语言、模块化内核和三套协议降低迁移成本，并把精确推测解码、提示复用置于默认路径；但性能表来自项目方一台 RTX 3060 笔记本，短提示还可能慢于 llama.cpp，视觉也不在逐位一致承诺内。本轮仅独立跑过 GGUF 解析器十项单测，全部通过，未复现模型吞吐；因此它更像值得实测的早期替代项，而非已证实的通用替换。

## 附带链接
- 原帖：https://www.reddit.com/r/LocalLLM/comments/1xsqc6m/kinetic_a_new_opensource_llm_engine_in_rust_runs/
- 仓库：https://github.com/Veloresearch/kinetic
- 文档：https://veloresearch.github.io/kinetic/
- 技术报告：https://veloresearch.com/research/kinetic
