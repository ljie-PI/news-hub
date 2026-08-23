---
title: "28 TPS on Qwen2.5-7B across two separate cloud regions over public WAN using speculative decoding + CUDA Graphs [P]"
date: "2026-08-24"
generated: "2026-08-24 07:00"
source: "Reddit"
slug: "2026-08-24_07-28-tps-on-qwen2-5-7b-across-two-separate-cloud-reg"
summary: "作者发布ShardFlow：两台Kaggle实例位于谷歌云爱荷华与俄勒冈，经亚马逊俄亥俄中继。仓库把七十六亿参数、二十八层的Qwen2.5-7B-Instruct各十四层切到两端；节点零还独占另一块T4运行零点五亿草稿模型，故至少使用三块T4，并非“双卡”。"
---

# 28 TPS on Qwen2.5-7B across two separate cloud regions over public WAN using speculative decoding + CUDA Graphs [P]

## 事件背景
作者发布ShardFlow：两台Kaggle实例位于谷歌云爱荷华与俄勒冈，经亚马逊俄亥俄中继。仓库把七十六亿参数、二十八层的Qwen2.5-7B-Instruct各十四层切到两端；节点零还独占另一块T4运行零点五亿草稿模型，故至少使用三块T4，并非“双卡”。

## 核心观点 / 产品机制
草稿模型每轮提议八词元，远端目标切片批量验证并回滚缓存，把广域网等待从逐词元摊到逐轮；静态缓存配合CUDA Graph一次重放固定形状前向。作者自测基线四点九二词元每秒，峰值二十八点一、三提示平均二十点三一，每轮提交四点零七词元；标称往返约八十六毫秒，但结果表列网络往返一百七十四点五六毫秒，口径待解释。

## 社区热议与争议点
本轮Reddit实时评论被封，未逐字取得评论；以下为页面数据与公开资料支持的争点，并非网友引语。支持一：论文表明小模型提议、目标模型并行校验可减少串行解码，适合摊薄网络往返。支持二：仓库有图捕获和缓存位置原地更新代码，可减少Python逐核启动。质疑一：二十八点一只是量子纠缠提示的作者自测峰值；仅三条短提示顺序执行，并发为一，未公布提示词元数、重复次数或误差。质疑二：代码以零温度和最大六十输出词元或结束符停止，表中生成六十至六十三词元；接受率、长提示、并发负载及普通单卡环境的迁移表现仍未知。

## 行业影响与未来展望
它提示闲置异地显卡可被算法换取可交互速度，但尚不能替代同机互联基准。下一步应公开原始日志，统一往返口径，并对提示长度、并发、草稿接受率、成本和同区域基线做受控复现。

## 附带链接
- [Reddit原帖](https://www.reddit.com/r/MachineLearning/comments/1vw5ysj/28_tps_on_qwen257b_across_two_separate_cloud/)
- [ShardFlow仓库](https://github.com/rautaditya2606/Shardflow)
- [Qwen2.5-7B模型卡](https://huggingface.co/Qwen/Qwen2.5-7B)
- [推测解码论文](https://proceedings.mlr.press/v202/leviathan23a.html)
