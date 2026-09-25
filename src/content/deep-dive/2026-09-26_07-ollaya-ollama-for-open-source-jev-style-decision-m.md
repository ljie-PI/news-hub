---
title: "Ollaya – Ollama for open-source, Jev-style decision models"
date: "2026-09-26"
generated: "2026-09-26 07:00"
source: "HN"
slug: "2026-09-26_07-ollaya-ollama-for-open-source-jev-style-decision-m"
summary: "Ollaya把Jev式“状态加类型化问题”的决策接口搬到本机开放模型，定位类似“面向决策模型的Ollama”。本批次冻结互动为263分、82条评论；调研时按指定脚本实际取得80个经长度过滤的可见节点，未触及100条上限。它们与Firebase当前显示的82个后代节点口径不同，不能互相替换。"
---

# Ollaya – Ollama for open-source, Jev-style decision models

## 事件背景
Ollaya把Jev式“状态加类型化问题”的决策接口搬到本机开放模型，定位类似“面向决策模型的Ollama”。本批次冻结互动为263分、82条评论；调研时按指定脚本实际取得80个经长度过滤的可见节点，未触及100条上限。它们与Firebase当前显示的82个后代节点口径不同，不能互相替换。

## 核心观点 / 产品机制
请求包含文本或JSON状态，以及选择、评分、是非问题；模型不逐词生成，而在一次前向传播中输出各选项概率。仓库显示其以Rust守护进程调度独立模型子进程，用租约、保活和最近最少使用策略回收内存；推理由ONNX Runtime执行，原作者权重按提交固定并校验哈希，温度缩放再校准原始分数。它兼容TypeSafe的`/v1/systemone`等接口。官网所称RTX 4090上五问约8至10毫秒属项目方测试，且与含网络的Jev数据环境不同；文档也承认基础Laya在特定零样本任务接近随机，多选项时明显弱于Jev。

## 社区热议与争议点
支持者nickstinemates称已在4GB显存的GTX 970上以Laya替换Jev，虽上下文很小但可直接迁移。反方george_max报告复杂查询更易错且信心不足，开发者cobanov承认小型Laya明显弱于Jev，接近后者的开放模型体积更大。datadrivenangel认为固定任务若已有评测集，训练专用分类器更合理，开发者也同意。emmettbt质疑Ollama随时可原生支持同类模型；开发者回应兼容Jev接口可减少实现绑定。

## 行业影响与未来展望
其价值在于把低延迟、结构化判断变成可替换的本地服务，适合工单路由、护栏和批量筛选，也迫使闭源服务在质量与便利性上持续证明差异。但“决策模型”并不免除数据集、阈值校准和漂移监控；固定场景仍可能由普通分类器胜出，开放方案能否兼顾小体积与复杂任务泛化才是关键。

## 附带链接
- [Hacker News 原帖](https://news.ycombinator.com/item?id=49848269)
- [Ollaya 官网与原文](https://ollaya.dev/)
- [GitHub 仓库](https://github.com/ollaya-dev/ollaya)
- [TypeSafe 兼容与质量边界](https://ollaya.dev/docs/typesafe-compatibility)
