---
title: "DeepInfer: High-performance inference framework for DeepSeek models"
date: "2026-10-21"
generated: "2026-10-21 07:00"
source: "HN"
slug: "2026-10-21_07-deepinfer-high-performance-inference-framework-for"
summary: "DeepSeek于10月20日开源支撑V4.1 Flash生产服务的DeepInfer；本批HN热度冻结为2074 points、811 comments。它并非完整云服务：README明确当前只发布离线推理及规模化服务的核心能力，在线封装、KV缓存系统、视觉编码/预填充/解码分离和数据并行负载均衡仍未包含。"
---

# DeepInfer: High-performance inference framework for DeepSeek models

## 事件背景

DeepSeek于10月20日开源支撑V4.1 Flash生产服务的DeepInfer；本批HN热度冻结为2074 points、811 comments。它并非完整云服务：README明确当前只发布离线推理及规模化服务的核心能力，在线封装、KV缓存系统、视觉编码/预填充/解码分离和数据并行负载均衡仍未包含。

## 核心观点 / 产品机制

代码源自vLLM并深改，现仅支持V4.1 Flash、NVIDIA SM100与昇腾950。其路径包括注意力数据并行、MoE专家并行与按历史负载复制热点专家，DSpark用置信度决定每步验证哪些草稿词元，SWA bounded replay只重算有限后缀，CPU调度与GPU执行异步重叠。官方图表是在4张SM100做预填充、64张做解码的单一scale-up域内测得；脚本使用随机词元、固定上下文和预热窗口，未给出vLLM/SGLang同条件基线。文档所称单集群每日155万亿词元、每卡时38美元收入均属项目方生产口径，且依赖未开源基础设施，不能视作独立复现或利润。

## 社区热议与争议点

本轮实际取得Algolia可见评论100个并触及上限。schneehertz把上述吞吐与收入称为“核弹”，abound认为硬数字反驳了推理必然亏损；mike_hearn反驳推理是无差异商品，竞争会把利润率压向传统低毛利行业；mrweasel进一步提醒“收入”不等于“利润”，更无法据此覆盖训练成本。讨论焦点因此从框架速度延伸到利用率、折旧和商业护城河。

## 行业影响与未来展望

DeepInfer的价值在于把生产级MoE调度、推测解码和重放策略公开成可审计代码，而非再做一层通用API包装。但硬件与模型范围极窄、关键服务组件缺席，使它目前更像DeepSeek技术底座和参考实现，而非可直接替换vLLM的服务器。后续可信度取决于补齐在线链路、扩展模型与芯片，并出现第三方同条件复测。

## 附带链接

- [GitHub仓库](https://github.com/deepseek-ai/DeepInfer)
- [部署Q&A](https://github.com/deepseek-ai/DeepInfer/blob/main/doc/inference_deployment_qa.md)
- [基准脚本](https://github.com/deepseek-ai/DeepInfer/blob/main/examples/sweep/run_sweep.sh)
- [HN讨论](https://news.ycombinator.com/item?id=50163277)
