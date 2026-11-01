---
title: "Memdoor: A team of 5 Qwen3.8-27B models beats Fable 5 on LiveCodeBench Hard"
date: "2026-11-02"
generated: "2026-11-02 07:00"
source: "HN"
slug: "2026-11-02_07-memdoor-qwen-team-livecodebench"
summary: "本批次冻结热度为418 points、202 comments；最终调研时，Algolia实际取得100个可见评论节点并触及本次上限，两者不是同一口径。Memdoor发布team-solve工作流，主张以多角色协作让开放权重模型在代码题上追平更强模型。"
---

# Memdoor: A team of 5 Qwen3.8-27B models beats Fable 5 on LiveCodeBench Hard

## 事件背景
本批次冻结热度为418 points、202 comments；最终调研时，Algolia实际取得100个可见评论节点并触及本次上限，两者不是同一口径。Memdoor发布team-solve工作流，主张以多角色协作让开放权重模型在代码题上追平更强模型。

## 核心观点 / 产品机制
仓库材料显示：任务仅为LiveCodeBench Hard清单前10题、每题五次；模型是Qwen3.8-27B。planner、两名ideator、solver、manager与repair worker均从新上下文启动，只以磁盘文件传递方案；模型只见公开样例，最终以修正后的grader跑全部隐藏测试判定成功。预算为单次回复上限128K、最多10轮；项目方报告50次中49次通过，均分9.8，对比其复用的原作者harness 9.6及Fable 5单次调用8.0，共耗1530万输出token、35.79美元，中位模型时间40分钟。Fable列来自原作者文件，并未在本harness重跑。

## 社区热议与争议点
roenxi认为这提示本地模型经巧妙编排可能接近闭源模型；SwellJoe反驳低比特量化质量损失不能靠harness假定抹平，必须实测。vikramkr则质疑题集陈旧、饱和且可能受训练污染，要求换更现代、真实的代理任务。作者guregodevo回应本轮实际走OpenRouter，并称流程可改YAML与温度，但这仍是项目方说明。

## 行业影响与未来展望
价值在于把规划、并行提案、修复和机械验收拆开，说明编排可用更多推理成本换取稳定性；但证据只是作者/项目自测，尚无独立复现。十道旧题、不同推理主机、非等成本对照及污染可能性，都使结果不能外推到通用编码能力或其他任务。

## 附带链接
- [HN讨论](https://news.ycombinator.com/item?id=50320995)
- [team-solve仓库与方法](https://github.com/guregodevo/memdoor/tree/main/examples/workflows/team-solve)
- [五轮结果与运行材料](https://github.com/guregodevo/memdoor/tree/main/examples/workflows/team-solve/bench/results/parity-5pass)
- [GVS5H原方法](https://github.com/slee-persis/GVS5H)
