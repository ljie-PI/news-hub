---
title: "Show HN: Needle2: 14MB agentic LLM for phones, wearables, smart home and robots"
date: "2026-08-12"
generated: "2026-08-12 07:00"
source: "HN"
slug: "2026-08-12_07-show-hn-needle2-14mb-agentic-llm-for-phones-wearab"
summary: "Cactus 发布 Needle 2，目标不是聊天或储存广泛知识，而是在廉价手机、穿戴设备、智能家居与机器人上把自然语言映射为函数调用。官方称模型仅四千五�"
---

# Show HN: Needle2: 14MB agentic LLM for phones, wearables, smart home and robots

## 事件背景

Cactus 发布 Needle 2，目标不是聊天或储存广泛知识，而是在廉价手机、穿戴设备、智能家居与机器人上把自然语言映射为函数调用。官方称模型仅四千五百万参数，单文件十四兆字节，完整会话约需二十八兆字节内存，并以 Apache 二点零开放权重和代码。

## 核心观点 / 产品机制

模型采用面向量化训练的二比特权重、激活与缓存，配合固定长度滑动窗口控制内存；字节级语法根据工具模式约束输出，减少非法结构并跳过部分词表计算。它用置信度决定本地执行、追问或上云，强调窄工具范围而非通用推理。官方自测称树莓派五代解码可达每秒五百词元，但基准比较存在专用模型对通用模型、二比特对半精度的不对称。

## 社区热议与争议点

silentbob7 用德语测试三个工具后称调用精确，认为它适合与语音识别、语音合成等微模型组合。Tiberium 输入“HＮ”却得到锁前门调用，虽置信度为零，暴露错误动作风险；evmaki 因此要求发布大样本误报率和置信度校准结果，而不只展示单次分数。作者 HenryNdubuaku 回应实验中约六成阈值可用，但集成者仍须按自身负载测试。

## 行业影响与未来展望

若窄任务可靠性成立，小模型可让设备控制默认离线，降低延迟、云成本与隐私暴露，并形成端侧处理、低信心上云的分层架构。短板是工具描述稍变就可能失败，置信度失准还会把语言误解变成现实动作；量产前必须加入拒答、权限确认、领域微调及独立安全评测。

## 附带链接

- [Needle 2 原文](https://cactuscompute.com/needle)
- [Hacker News 讨论](https://news.ycombinator.com/item?id=49246804)
