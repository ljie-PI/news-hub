---
title: "I'm making LLMs work on small and old devices"
date: "2026-11-13"
generated: "2026-11-13 07:00"
source: "HN"
slug: "2026-11-13_07-i-m-making-llms-work-on-small-and-old-devices"
summary: "smolmaxxing把闲置电视盒与旧平板变成本地推理实验台。该批次冻结为251分、86条评论；项目称在约1GB可用内存的安卓电视盒和初代iPad Air上跑到16B混合专家模型，但速度、质量与增益均是作者设备自测，并非独立跑分。"
---

# I'm making LLMs work on small and old devices

## 事件背景

smolmaxxing把闲置电视盒与旧平板变成本地推理实验台。该批次冻结为251分、86条评论；项目称在约1GB可用内存的安卓电视盒和初代iPad Air上跑到16B混合专家模型，但速度、质量与增益均是作者设备自测，并非独立跑分。

## 核心观点 / 产品机制

仓库实质是两套llama.cpp补丁。已核对的处理链是：`rebuild-models.sh`取得公开GGUF与量化资料，`gguf_build.py`裁剪低频词表输出头；iPad模型再由`gguf_experts_last.py`把专家权重移至文件尾，`gguf_q2lut.py`改排布局。运行时用定制NEON内核，常用专家留在内存，其余按路由从闪存读取并预取；稠密模型则流式装载权重。官方自报电视盒上2B为7.7词元每秒、16B为5.1，iPad上16B为2.6至4.5；成品权重未入库，需用户另行下载或重建。

## 社区热议与争议点

冻结互动数不等于可读评论：本轮Algolia实际取得78个可见节点，未触及100上限。dava96赞赏“复活旧硬件”；vector_spaces认为受监管机构可用小模型清洗本地自由文本。反方中，yjftsjthsd-h追问实用任务，sebazzz直指小模型连工具调用和简单食谱都不可靠。作者也承认当前多为趣味实验，实用性主要寄望领域微调。

## 行业影响与未来展望

价值不在“16B”标签，而在把端侧瓶颈拆成内核、地址空间、词表、闪存命中率与预取策略。局限同样明显：模型需专用补丁，iPad须越狱，强路由偏置或减少专家会损伤质量，长回答曾循环，设备也发生过内核崩溃。下一步应由第三方复现能耗、首词延迟、长上下文质量及同硬件基线，才能判断其是可部署方案还是极限演示。

## 附带链接

- [项目仓库](https://github.com/hyperionaidev/smolmaxxing/)
- [实现说明](https://github.com/hyperionaidev/smolmaxxing/blob/main/docs/how-it-works.md)
- [Hacker News讨论](https://news.ycombinator.com/item?id=50468888)
