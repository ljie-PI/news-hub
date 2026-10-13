---
title: "MiniCPM-V 4.7 runs a 35B-A3B vision model on phones by streaming experts from storage"
date: "2026-10-14"
generated: "2026-10-14 07:00"
source: "Reddit"
slug: "2026-10-14_07-minicpm-v-4-7-runs-a-35b-a3b-vision-model-on-phone"
summary: "OpenBMB发布MiniCPM-V 4.7后，原帖聚焦35B级多模态MoE在手机离线读图、文档问答。官方权重元数据为352.13亿BF16参数；移动端文档明确口径是35B总参数、每个词元约3B激活，并非把全部权重常驻内存。iPhone 17 Pro Max上13+词元每秒、3GB推理内存均为厂商自报，尚非独立复测。"
---

# MiniCPM-V 4.7 runs a 35B-A3B vision model on phones by streaming experts from storage

## 事件背景
OpenBMB发布MiniCPM-V 4.7后，原帖聚焦35B级多模态MoE在手机离线读图、文档问答。官方权重元数据为352.13亿BF16参数；移动端文档明确口径是35B总参数、每个词元约3B激活，并非把全部权重常驻内存。iPhone 17 Pro Max上13+词元每秒、3GB推理内存均为厂商自报，尚非独立复测。

## 核心观点 / 产品机制
手机专用包约16.6GB：主GGUF、40层专家分片及视觉投影共同落盘，建议至少12GB内存。LES跨层预测下一层专家并从闪存预取，把命中专家计算与漏预测专家加载重叠；预测只改预取顺序，实际路由仍照常执行。逐层细粒度量化压缩专家与带宽，DSpark另用已发布草稿模型做投机解码；配置还显示256名专家、每词元选8名。

## 社区热议与争议点
Atom RSS共3个entry：主帖、1条普通评论、1条作者回复，无机器人。作者认为约17GB存储换离线图文能力合理，这是发帖者立场；普通用户则担心耗电与占储存。作者随后只回GIF，未给出功耗数据或技术反驳，因此该可见子集没有形成充分正反样本。另有GitHub issue #1149复现Ollama 0.40.3不识别`minicpmv4_7`投影器，说明“支持Ollama”仍受版本配套约束。

## 行业影响与未来展望
这一路线把边缘MoE的瓶颈从“能否装进内存”转成闪存带宽、预测命中率与调度问题，利于隐私敏感的离线视觉助手。支持点是完整路由未被裁剪、公开了代码与分片权重；质疑点是近17GB占盘、快速内存与闪存门槛，以及电量、长上下文速度和跨运行时兼容性仍缺独立数据。

## 附带链接
- [Reddit原帖](https://www.reddit.com/r/LocalLLM/comments/1x53n5r/minicpmv_47_runs_a_35ba3b_vision_model_on_phones/)
- [官方模型卡与权重](https://huggingface.co/openbmb/MiniCPM-V-4.7-35B-A3B)
- [4.7官方文档](https://github.com/OpenBMB/MiniCPM-o/blob/main/docs/minicpm_v4dot7_en.md)
- [移动端应用与LES包说明](https://github.com/OpenBMB/MiniCPM-V-Apps)
- [LES运行时](https://github.com/OpenBMB/llama.cpp-omni)
- [兼容性issue #1149](https://github.com/OpenBMB/MiniCPM-V/issues/1149)
