---
title: "Kolibri: A Sovereign Open-Weight Model"
date: "2026-10-04"
generated: "2026-10-04 07:00"
source: "HN"
slug: "2026-10-04_07-kolibri-a-sovereign-open-weight-model"
summary: "Aleph Alpha于德国统一日发布英德双语模型Kolibri，面向本地部署、政企文档与工具调用，并开放其权重。批次冻结热度为470分、281条评论；调研时Algolia脚本实取100个可见节点且触及上限，两种口径不互相替代。"
---

# Kolibri: A Sovereign Open-Weight Model

## 事件背景
Aleph Alpha于德国统一日发布英德双语模型Kolibri，面向本地部署、政企文档与工具调用，并开放其权重。批次冻结热度为470分、281条评论；调研时Algolia脚本实取100个可见节点且触及上限，两种口径不互相替代。

## 核心观点 / 产品机制
Kolibri是总参数781亿、每词元激活34.6亿的稀疏专家模型：每层从384个路由专家中选6个，另启用1个共享专家；50层中40层采用512词元滑窗、10层全注意力。模型原生训练至26.2万词元，官方称验证到104万，但模型卡仍建议复杂任务控制在26.2万以内。权重与配置采用Apache 2.0，推理需专用vLLM插件，约78GB模型内存；其英德成绩、成本优势均为厂商自报，未视作独立复现。

## 社区热议与争议点
mhitza看重模型学会“我不知道”，但坦言无硬件测试；martianvoid称在RTX Pro 6000上测得FP8约170词元每秒，同时抱怨推理过度。cyanydeez质疑官方只推荐高端硬件、未提供4位或8位量化。sbinnee怀疑德语只是翻译语料，团队成员ivo-42回应称专门搭建德语Common Crawl处理管线。这些实例同时显示本地语言与拒答设计受认可，显存门槛、推理开销和可复现性仍受质疑。

## 行业影响与未来展望
Kolibri把“主权模型”从托管地域推进到可下载权重、双语数据与自建训练链，可能成为欧洲机构内网RAG和文档代理的可选底座。不过开放权重不等于开放数据及完整训练代码；若后续缺少量化版本、第三方基准与真实长上下文验证，其成本优势仍难扩展到普通团队。

## 附带链接
- [官方原文](https://aleph-alpha.com/en/blog/kolibri-has-landed-a-sovereign-open-weight-model/)
- [官方模型卡](https://huggingface.co/Aleph-Alpha/Kolibri-1)
- [技术报告](https://aleph-alpha.com/downloads/tech-report.pdf)
- [HN讨论](https://news.ycombinator.com/item?id=49942706)
