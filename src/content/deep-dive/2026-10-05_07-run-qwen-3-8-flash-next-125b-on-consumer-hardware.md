---
title: "Run Qwen 3.8 Flash Next (125B) on consumer hardware (RTX 4090) at 100T/s"
date: "2026-10-05"
generated: "2026-10-05 07:00"
source: "HN"
slug: "2026-10-05_07-run-qwen-3-8-flash-next-125b-on-consumer-hardware"
summary: "该帖将 Strata 推上 HN：批次冻结为 541 points、269 条评论。卖点是把 125B MoE 模型放进单张消费卡环境，并以“100T/s”概括速度；这里应读作每秒约百个 token，而非每秒百兆次运算。"
---

# Run Qwen 3.8 Flash Next (125B) on consumer hardware (RTX 4090) at 100T/s

## 事件背景

该帖将 Strata 推上 HN：批次冻结为 541 points、269 条评论。卖点是把 125B MoE 模型放进单张消费卡环境，并以“100T/s”概括速度；这里应读作每秒约百个 token，而非每秒百兆次运算。

## 核心观点 / 产品机制

Strata 把常用专家缓存于显存，全量专家放在内存，由 CPU 与 GPU 并行计算未命中部分，SSD 保存查找表；再以模型内置 MTP 草拟、主模型校验，一次前向接收多个 token。项目支持 Q2_0、IQ2_XS、IQ3 等压缩权重，精度与吞吐不可混为一谈。发帖人自测披露 RTX 4090、128GB DDR5、Ryzen 7950X3D 和 124 tokens/s，却未给量化档、上下文、生成长度、热身、首词延迟或总墙钟。仓库自报基准使用另一台 RTX 5070、固定生成 256 token，按提示处理与解码分账，且加载时间不计入；故标题不是受控的 4090 端到端结论。

## 社区热议与争议点

冻结评论数仍是 269；本轮 Algolia 实取 100 个可见节点并触及上限。支持者 snehesht 报告上述 124 tokens/s，prettyblocks 称其 3090 上运行很快且能做代码安全审计。质疑者 jacquesm 追问是否与参考精度对测，认为低精度若增加返工会抵消速度；quietFalcon 则要求公布 16K 上下文的提示处理表现，指出 MoE 卸载只谈生成速度不完整。

## 行业影响与未来展望

其价值在于把 MoE 的稀疏路由、分层存储与推测解码组合成消费机可用路径；但下一步应公开同提交、同量化、同提示与输出长度的 4090 多次运行，并同时报告中位数、范围、首词延迟、总耗时和质量基准，才能把“能跑”升级为可比较的性能结论。

## 附带链接

- [Strata 原仓](https://github.com/Niko1221/Strata)
- [HN 讨论](https://news.ycombinator.com/item?id=49953495)
- [项目性能明细](https://github.com/Niko1221/Strata/blob/main/docs/DETAILS.md#speed-measured)
- [社区基准规范](https://github.com/Niko1221/Strata/blob/main/docs/COMMUNITY_BENCHMARKS.md)
