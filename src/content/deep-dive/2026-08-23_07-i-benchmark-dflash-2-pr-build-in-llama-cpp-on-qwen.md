---
title: "I benchmark DFlash 2 (PR build) in llama.cpp on Qwen 3.8 27B against all speculative methods for 3 days. 2.26x on 100 real coding prompts, 4.68x with one n-gram drafter on top. Up to 8x on specific cases."
date: "2026-08-23"
generated: "2026-08-23 07:00"
source: "Reddit"
slug: "2026-08-23_07-i-benchmark-dflash-2-pr-build-in-llama-cpp-on-qwen"
summary: "帖子作者以单张九十六吉显卡、单并发测试三天，对比普通解码、多词元预测、词组查找与两代DFlash。批次原始正文冻结身份后，Atom返回同题完整正文。Qwen官方模型卡确认目标为二百七十亿参数、六十四层，原生上下文二十六万余词元。"
---

# I benchmark DFlash 2 (PR build) in llama.cpp on Qwen 3.8 27B against all speculative methods for 3 days. 2.26x on 100 real coding prompts, 4.68x with one n-gram drafter on top. Up to 8x on specific cases.

## 事件背景

帖子作者以单张九十六吉显卡、单并发测试三天，对比普通解码、多词元预测、词组查找与两代DFlash。批次原始正文冻结身份后，Atom返回同题完整正文。Qwen官方模型卡确认目标为二百七十亿参数、六十四层，原生上下文二十六万余词元。

## 核心观点 / 产品机制

DFlash二代不是独立模型：它并行草拟候选块，以轻量选择器连成路径，再交目标模型统一验证；动态卷积抑制块尾衰减。作者自测一百个真实编码提示时，吞吐由每秒六十七点九七升至一百五十三点九一词元，墙钟由五十九点四降至二十五分钟，即二点二六倍；提示长度并非统一值。十八轮会话仅取前九轮构建阶段，单个词组表把每秒六十五点一四推至三百零四点九二，作者称四点六八倍。强制三万六千余词元输入输出所得约八倍，被作者判为重复循环污染，不可外推。

## 社区热议与争议点

Atom取得三条真实评论，但只是当时公开子集。kosnarf意外于第二个词组表反而拖慢；buttplugs4life4me追问多词元预测的草拟长度与设置；Hankdabits建议比较另一套推理引擎优化实现。争点是参数是否公平、引擎差异及跨硬件复现。

## 行业影响与未来展望

官方模型卡在单张高端加速卡、单并发任务上自报二点六七至三点四三倍，不能替代该作者的llama.cpp结果。拉取请求尚未合并、状态受阻且有失败检查。作者承认本轮无准确率复测、除一组外均为单样本；结论更像工作负载相关机会，不能直接移植到消费卡。

## 附带链接

- [Reddit 原帖](https://www.reddit.com/r/LocalLLaMA/comments/1vvncyh/i_benchmark_dflash_2_pr_build_in_llamacpp_on_qwen/)
- [作者复现仓库](https://github.com/lukaLLM/DFlash2_Qwen3.8_3.6_27B_LlamaCPP)
- [llama.cpp 拉取请求](https://github.com/ggml-org/llama.cpp/pull/27342)
- [DFlash 官方仓库](https://github.com/z-lab/dflash)
- [DFlash 2 模型卡](https://huggingface.co/incoai/Qwen3.8-27B-DFlash2)
- [Qwen3.8-27B 官方模型卡](https://huggingface.co/Qwen/Qwen3.8-27B)
