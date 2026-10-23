---
title: "baidu/Unlimited-OCR"
date: "2026-10-24"
generated: "2026-10-24 07:00"
source: "GitHub"
slug: "2026-10-24_07-baidu-unlimited-ocr"
summary: "Unlimited-OCR是百度面向长文档解析的端到端视觉语言模型，目标是把多页图像或PDF转成带版面标记的文本。论文称传统大模型解码会随序列增长累积KV缓存；其主张R-SWA让缓存保持恒定，并可在三万二千长度内单次转录数十页，均属作者自报口径。批次快照为二万八千二百八十八星；本次REST实查为二万八千二百八十七星、九十一个开放问题，主分支于十月二十三日仍有推送。"
---

# baidu/Unlimited-OCR

## 定位与痛点剖析

Unlimited-OCR是百度面向长文档解析的端到端视觉语言模型，目标是把多页图像或PDF转成带版面标记的文本。论文称传统大模型解码会随序列增长累积KV缓存；其主张R-SWA让缓存保持恒定，并可在三万二千长度内单次转录数十页，均属作者自报口径。批次快照为二万八千二百八十八星；本次REST实查为二万八千二百八十七星、九十一个开放问题，主分支于十月二十三日仍有推送。

## 核心架构与技术细节

默认分支代码树仅十二条路径，主体是README、`infer.py`、论文、素材和预编译SGLang轮子，没有依赖清单或测试目录；核心远程代码与约六点六七GB权重在Hugging Face。机器配置显示十二层、十个注意力头、六十四个路由专家每次取六个，滑窗为一百二十八。README给出Transformers、vLLM与SGLang三路推理；后者提供OpenAI兼容流式接口及防重复处理。当前`infer.py`把PDF按三百DPI转图后逐页并发请求。

## 竞品对比与生态站位

DeepSeek-OCR是其论文基线，官方README同样提供Transformers与vLLM，重点是视觉文本压缩；Unlimited-OCR的差异点是长解码的恒定缓存。PaddleOCR官方README覆盖文本识别、PP-Structure与PaddleOCR-VL，并输出Markdown、JSON和细粒度坐标，产品面更宽；Unlimited-OCR更像模型研究与推理样例仓库。

## 开发者反馈与局限性

开放issue #55报告密集页面会进入短语循环，修复PR #73仍未合并，源码仍把三十五元组与窗口写成常量。PR #75指出PDF只支持base模式，但批处理脚本默认仍是gundam。近期issue #103的正文和评论指出全批失败仍返回零退出码，当前源码可复核；#107另报告多页边界标记不稳定。Apple Silicon补丁PR #56及其评论给出MPS静默空输出的复现与修正讨论，但仍属社区未合并方案，不能视为已支持。

## 附带链接

- [仓库与README](https://github.com/baidu/Unlimited-OCR)
- [论文](https://arxiv.org/abs/2606.23050)；[模型与远程代码](https://huggingface.co/baidu/Unlimited-OCR)
- [循环issue](https://github.com/baidu/Unlimited-OCR/issues/55)；[退出码issue](https://github.com/baidu/Unlimited-OCR/issues/103)；[MPS PR](https://github.com/baidu/Unlimited-OCR/pull/56)
- [DeepSeek-OCR](https://github.com/deepseek-ai/DeepSeek-OCR)；[PaddleOCR](https://github.com/PaddlePaddle/PaddleOCR)
