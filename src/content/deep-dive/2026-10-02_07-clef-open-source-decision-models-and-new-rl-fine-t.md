---
title: "Clef: Open-source decision models, and new RL fine-tuning platform"
date: "2026-10-02"
generated: "2026-10-02 07:00"
source: "HN"
slug: "2026-10-02_07-clef-open-source-decision-models-and-new-rl-fine-t"
summary: "Cloudflare 于十月一日发布 Clef 与 Clef-flash 权重及推理代码，并上线 Workers AI。它不是把近十四天已报道的 Ollaya/Jev 风格模型换个来源再讲：模型发布只是入口，本次新增事件是面向企业数据的强化学习微调服务。批次冻结热度为三百七十四分、一百五十一条评论。"
---

# Clef: Open-source decision models, and new RL fine-tuning platform

## 事件背景

Cloudflare 于十月一日发布 Clef 与 Clef-flash 权重及推理代码，并上线 Workers AI。它不是把近十四天已报道的 Ollaya/Jev 风格模型换个来源再讲：模型发布只是入口，本次新增事件是面向企业数据的强化学习微调服务。批次冻结热度为三百七十四分、一百五十一条评论。

## 核心观点 / 产品机制

Clef 接收文本、图像或结构化状态，对真假、单选、评分三类问题一次前向计算全部候选概率，不生成自由文本。两版分别冻结 Qwen3.8-27B 与 Qwen3.5-9B，联合训练路由头和秩二百五十六适配器，以交叉熵、布里尔损失及校准决策强化学习改善概率。更关键的是新平台闭环：AI Gateway 收集请求与响应，Workers AI 生成轨迹，Containers 评分和回放，Trainer 更新权重，再以自带模型部署；目前仅由前线工程团队协作，自动化自助平台仍在规划。

## 社区热议与争议点

冻结评论数与调研取数分账：Algolia 本次实际取得一百个可见节点并触及上限。正面上，petercooper 认为底层分类并不新，真正价值是 Jev 验证了独立产品需求；damsta 则欢迎可立即试用的开放权重竞争。反面上，ssiddharth 指出 Clef 单价约为 Jev 六倍，只有 flash 更接近；buildbuildbuild 质疑“开源”措辞，因为训练数据和完整训练管线未公开，现状更准确是 Apache 许可权重加推理实现。

## 行业影响与未来展望

这次变化不在又多一个分类模型，而在把在线流量、沙箱评奖、权重更新和边缘部署接成企业闭环，可能降低专用路由器与安全判定器的迭代门槛。但基准为厂商自测，自助 Trainer 尚未交付；数据留存、奖励设计、回滚及跨平台导出也未见完整文档。能否把历史标签转成稳定收益，比榜单领先更关键。

## 附带链接

- [Cloudflare 原文](https://blog.cloudflare.com/clef-decision-models/)
- [Workers AI 模型文档](https://developers.cloudflare.com/workers-ai/models/clef/)
- [Clef 模型仓库](https://huggingface.co/Cloudflare/clef)
- [Cloudflare 更新日志](https://developers.cloudflare.com/changelog/post/2026-10-01-clef-workers-ai)
- [Hacker News 讨论](https://news.ycombinator.com/item?id=49923692)
