---
title: "WorldTUI: I trained a 360M model to pretend to be a terminal"
date: "2026-10-23"
generated: "2026-10-23 07:00"
source: "HN"
slug: "2026-10-23_07-worldtui-360m-terminal-world-model"
summary: "作者把“世界模型”缩到字符终端：底层没有 shell 或文件系统，每次按键后由模型预测屏幕增量。批次冻结热度为488分、156条评论；调研时 Firebase 为489分、156条，Algolia脚本实际取得100个可见节点并触及上限，三种口径不混用。"
---

# WorldTUI: I trained a 360M model to pretend to be a terminal

## 事件背景
作者把“世界模型”缩到字符终端：底层没有 shell 或文件系统，每次按键后由模型预测屏幕增量。批次冻结热度为488分、156条评论；调研时 Firebase 为489分、156条，Algolia脚本实际取得100个可见节点并触及上限，三种口径不混用。

## 核心观点 / 产品机制
WorldTUI以Qwen2.5-Coder-0.5B为底座，用Docker内真实程序生成的33.6万段终端会话、约20亿token微调。它把屏幕编码成行级增量，以COPY压缩滚屏；先并行起草各行，再由同一模型顺序验证。作者自测大画面延迟从6.7秒降至0.87秒。裁掉大词表后约3.6亿参数，int4权重208MB，经WebGPU在浏览器本地运行。作者还报告ShellBench为80/106、短间隔文件回读9/13；目前未公开WorldTUI仓库、专属模型卡或评测脚本，线上清单和JS客户端只能核对模型结构与推理实现，不能独立复现训练和跑分。

## 社区热议与争议点
在实际读取的100个节点中，mehmetoguzderin认为它可把昂贵的Bash轨迹压进环境模型；skohan反驳，用GPU和显存驱动非确定过程，不该替代毫秒级CPU程序；donperignon则实测目录状态自相矛盾，拼错命令似乎成功却没有文件。支持者看重受控世界模型实验，质疑者聚焦用途、成本与一致性。

## 行业影响与未来展望
实验说明字符网格、动作条件和可生成真值的数据，能把世界模型研究压缩到个人硬件；行并行加验证也为交互式生成界面提供工程思路。但它更像可观察的研究玩具而非终端替代品：记忆会漂移，复杂Python会幻觉，Firefox还慢约二十倍。下一步关键不是更逼真的表象，而是公开权重、数据生成与评测代码，并检验对未见应用规则的泛化。

## 附带链接
- [原文](https://simedw.com/2026/10/21/world-model-terminal/)
- [HN讨论](https://news.ycombinator.com/item?id=50190363)
- [浏览器演示](https://simedw.com/projects/worldtui/)
- [模型清单](https://models.simedw.com/worldtui/574cef5dfef8044a/chunks-v1/manifest.json)
- [Qwen2.5-Coder-0.5B模型卡](https://huggingface.co/Qwen/Qwen2.5-Coder-0.5B)
