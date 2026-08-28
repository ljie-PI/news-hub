---
title: "Show HN: We built open OpenRouter that turns usage into a better model"
date: "2026-08-29"
generated: "2026-08-29 07:00"
source: "HN"
slug: "2026-08-29_07-show-hn-we-built-open-openrouter-that-turns-usage"
summary: "Experiential 把自己定位为面向 Agent 工作流的开源模型网关：以 OpenAI-compatible API 统一 hosted、BYOK 与本地模型，并把生产调用转成路由和模型改进材料。该帖在批次中冻结为 207 points、46 comments；调研实际读取 Algolia 返回的 42 个可见评论节点，两种口径不混用。"
---

# Show HN: We built open OpenRouter that turns usage into a better model

## 事件背景

Experiential 把自己定位为面向 Agent 工作流的开源模型网关：以 OpenAI-compatible API 统一 hosted、BYOK 与本地模型，并把生产调用转成路由和模型改进材料。该帖在批次中冻结为 207 points、46 comments；调研实际读取 Algolia 返回的 42 个可见评论节点，两种口径不混用。

## 核心观点 / 产品机制

本地 `exp build` 导入 OTLP、Langfuse、Braintrust 等 trace，保留来源摘要与规范化问题，再从真实轨迹抽取任务、建立只读 RAG，以 world model 模拟候选模型执行，由用户校准 rubric 的 judge 打分。最终并非每次请求即时学习：源码实现的是离线、带 held-out 报告的保守 kNN policy；新请求按相似任务找邻居，只在配对证据和不确定性阈值允许时选择更便宜模型，否则退回质量基线。完成的路由交互还可封存为 SFT 数据，经 Tinker 训练 LoRA；失败或中断请求不会成为目标，且只监督最后一条 assistant action。

## 社区热议与争议点

ceroxylon 认可统一网关，并认为 Tinker 微调比不断堆 context file 更有价值。Areibman 则指出跨模型会丢失输入缓存优惠、放大成本；团队回应通常只在任务边界切换。sangwook 追问真实成功信号和 semantic caching，项目方称采用用户在 TUI 离线校准的 LLM judge，后者尚无计划。aHumbleUser 还纠正了“遥测默认关闭”的说法；README 与源码均显示匿名 PostHog 默认开启，虽字段有 allowlist、宣称不含 prompt/trace，并可手动关闭。

## 行业影响与未来展望

它把 LiteLLM 式连接层推进到“轨迹—评测—路由—SFT”闭环，但成本与隐私边界清晰存在：模拟、judge、embedding 和 Tinker 都可能产生外部调用，托管上传也会让 trace 离开本机。更关键的是 release 文档明确尚未跑真实 Tinker 训练，也没有 trained-versus-base 质量对比；当前证据证明流程可执行，不等于模型已持续变好。Issue #532 还表明 Windows 开发需走 WSL。

## 附带链接

- [Hacker News 讨论](https://news.ycombinator.com/item?id=49471407)
- [GitHub：experientiallabs/experiential](https://github.com/experientiallabs/experiential)
- [Router optimization contracts](https://github.com/experientiallabs/experiential/blob/main/docs/reference/router_optimization_config.md)
- [Release scope](https://github.com/experientiallabs/experiential/blob/main/docs/release-scope.md)
- [Issue #532](https://github.com/experientiallabs/experiential/issues/532)
