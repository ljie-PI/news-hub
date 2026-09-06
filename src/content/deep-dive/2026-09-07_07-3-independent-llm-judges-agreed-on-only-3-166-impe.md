---
title: "3 independent LLM judges agreed on only 3/166 'impersonation' examples (98.2% disagreement). Here's what that told me"
date: "2026-09-07"
generated: "2026-09-07 07:00"
source: "Reddit"
slug: "2026-09-07_07-3-independent-llm-judges-agreed-on-only-3-166-impe"
summary: "帖主用 GPT-4o、Grok-4、Llama 3.3 70B 审核阿拉伯语安全数据集 SemGuard 的一百六十六条“冒充”候选，认为惨烈结果源于复合标签。目标帖 Atom 已核对编号与标题，但仅返回主帖一项，未暴露评论。"
---

# 3 independent LLM judges agreed on only 3/166 'impersonation' examples (98.2% disagreement). Here's what that told me

## 事件背景

帖主用 GPT-4o、Grok-4、Llama 3.3 70B 审核阿拉伯语安全数据集 SemGuard 的一百六十六条“冒充”候选，认为惨烈结果源于复合标签。目标帖 Atom 已核对编号与标题，但仅返回主帖一项，未暴露评论。

## 核心观点 / 产品机制

公开 CSV 确认原始候选一百六十六条、拒绝一百六十三条，故拒绝率确为 98.19%。但“3 个裁判在 3 条上同意”并不准确：入选明细中仅一条为三者全同意，另两条均是 GPT-4o 报错、其余两者同意的 `partial_fallback`。拒绝表又删掉逐裁判结果，代码仍标注“即将公开”，因此无法复算所谓分歧结构或接受阈值。三种模型来自不同家族，只能算分开调用，不能证明统计独立。

论文把标签拆为目标真实性、欺骗意图、同意/语境边界、下游可操作性四轴，以各轴四倍总体方差取最大值作为 IAI；二值结果再由轴分数和阈值派生。四十条试验中十条 IAI 超过 0.8，但六对轴有五对相关系数高于 0.6；四轴同次提问可能制造光环效应，隔离调用与顺序轮换尚未执行。

## 社区热议与争议点

目标帖 RSS 没有普通评论或作者回复。相同文本的跨帖中，普通用户 Vivid-Beyond-3378 认可“把分歧当信号”，同时怀疑高相关来自裁判抓取同一表面特征；另一普通用户 leon_bass 只斥为“AI slop”，未给方法反证。样本太少，不能称为社区共识。

## 行业影响与未来展望

真正可迁移的启示是：高风险审核不应强迫每条样本二选一，可保留弃权、轴级不确定度和人工复核路由。但部署前仍需人工金标、独立轴调用、提示顺序消融、完整裁判日志，并同时报告原始一致率与 κ；目前更像可检验框架和小样本试验，而非已验证网关。

## 附带链接

- [Reddit 原帖](https://www.reddit.com/r/LLM/comments/1w99z9e/3_independent_llm_judges_agreed_on_only_3166/)
- [Zenodo 预印本](https://doi.org/10.5281/zenodo.22302106)
- [SemGuard 数据集](https://huggingface.co/datasets/AG-31625874/SemGuard-Dataset)
- [PyRIT 数据集接入 PR](https://github.com/microsoft/PyRIT/pull/2468)
- [LLMDevs 跨帖](https://www.reddit.com/r/LLMDevs/comments/1w99yd5/3_independent_llm_judges_agreed_on_only_3166/)
- [ResearchML 跨帖](https://www.reddit.com/r/ResearchML/comments/1w76j8b/3_independent_llm_judges_agreed_on_only_3166/)
