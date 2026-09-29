---
title: "Two open-weights releases: Victoria (Qwen3.8-Flash-Next with 44% of experts cut, 70% Terminal-Bench 2.1, GGUF included) and Maple (a Canada-first fine-tune)"
date: "2026-09-30"
generated: "2026-09-30 07:00"
source: "Reddit"
slug: "2026-09-30_07-two-open-weights-releases-victoria-qwen3-8-flash-n"
summary: "发帖者于九月二十九日发布两个开放权重衍生模型：面向编码代理的 Victoria，以及默认采用加拿大语境的 Maple。前者压缩稀疏模型，后者纠正税务、福利问题常被按美国制度回答的偏差。两张模型卡与订阅源能核对身份，但效果数字主要来自发布方。"
---

# Two open-weights releases: Victoria (Qwen3.8-Flash-Next with 44% of experts cut, 70% Terminal-Bench 2.1, GGUF included) and Maple (a Canada-first fine-tune)

## 事件背景

发帖者于九月二十九日发布两个开放权重衍生模型：面向编码代理的 Victoria，以及默认采用加拿大语境的 Maple。前者压缩稀疏模型，后者纠正税务、福利问题常被按美国制度回答的偏差。两张模型卡与订阅源能核对身份，但效果数字主要来自发布方。

## 核心观点 / 产品机制

Qwen 官方配置每层五百一十二个专家、每词元路由十个并另有共享专家；Victoria 用 REAP 按路由权重和激活范数评分删至二百八十八个，活动专家仍为十，再以 NVFP4 训练。配置证实专家数和量化格式；模型卡自报权重四十八 GiB，另有九十五点四 GiB 短语表。七成 Terminal-Bench 是固定八小时上限的三次自测均值；官方提交要求每任务至少五次，不能视作独立榜单。Maple 在六百道留出题中联网完整通过率自报由百分之六点六升至二十一点八，但仅由两个模型裁判评分，未做人审，也未附数据和评测脚本。

## 社区热议与争议点

Atom 返回八条：主帖一条、普通用户四条、作者回复三条，只是可见子集。realitaetsnaher 赞叹裁剪后高分并追问通用任务；作者以 MMLU 自报回应。starkruzr 追问总参数与活动参数；配置仅证实十个活动专家，不能支持作者“总参数少百分之五十六”的说法。CoffeeToCode99 肯定量化后训练但要求独立测试，随后追问提升来自裁剪还是已到第六版的数据与管线，指出归因混杂。

## 行业影响与未来展望

REAP 论文和代码证明它是可复现通用准则，却未独立验证 Victoria 跑分。发布显示开放权重可组合专家裁剪、量化训练和地域适配；价值仍取决于标准时限复测、跨域退化、人审及普通硬件的完整内存与吞吐账。

## 附带链接

- [Reddit 原帖](https://www.reddit.com/r/LocalLLM/comments/1wtlbhp/two_openweights_releases_victoria_qwen38flashnext/)
- [Victoria 模型卡](https://huggingface.co/rmonsurate/Victoria)
- [Maple 模型卡](https://huggingface.co/rmonsurate/Maple)
- [Qwen3.8-Flash-Next 官方模型卡](https://huggingface.co/Qwen/Qwen3.8-Flash-Next)
- [REAP 论文](https://arxiv.org/abs/2510.13999)
- [REAP 仓库](https://github.com/CerebrasResearch/reap)
- [Terminal-Bench 2.1 仓库](https://github.com/harbor-framework/terminal-bench-2-1)
