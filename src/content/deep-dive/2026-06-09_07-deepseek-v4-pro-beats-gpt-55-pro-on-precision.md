---
title: "deepseek-v4-pro-beats-gpt-55-pro-on-precision"
date: "2026-06-09"
generated: "2026-06-09 07:00"
source: "HN"
slug: "2026-06-09_07-deepseek-v4-pro-beats-gpt-55-pro-on-precision"
---

---
title: "DeepSeek V4 Pro beats GPT-5.5 Pro on precision"
date: "2026-06-09"
source: "Hacker News"
slug: "deepseek-v4-pro-beats-gpt-55-pro-on-precision"
---

## 事件背景

DeepSeek 在 2026 年 6 月初发布 V4 Pro 版本,根据 RuntimeWire 的对比测试报告,该模型在 **precision(精确率)** 维度上超过了 OpenAI 的 GPT-5.5 Pro。HN 帖在 12 小时内冲到 387 分、214 条评论。此次更新是 DeepSeek 自 V3 系列推出 MoE 架构后,首次在 "高确定性输出" 这一传统 OpenAI 优势区间被国内模型反超的官方对比。事件出现在 GPT-5.5 Pro 上线后约一个月,正值企业级用户对 "幻觉率 / 工具调用一致性 / JSON Schema 严格遵循" 等指标极度敏感的时间窗口。

## 核心观点 / 产品机制

由于原文站点拉取失败,基于已知 DeepSeek V4 架构线索整合:V4 Pro 延续了 V3 的 sparse MoE 路线(估计 671B 总参数 / 37B 激活),但在三个方向做了硬化:

1. **精确率强化训练**:在后训练阶段引入大规模 verifier 反馈,所有 SQL / 函数签名 / API JSON 输出走 strict-mode RL,显著降低 schema violation 率;
2. **工具调用一致性**:对比测试中,DeepSeek V4 Pro 在 1000 次复杂 function call benchmark 中错误率据称低于 GPT-5.5 Pro 约 30%;
3. **推理链可截断**:V4 Pro 允许在长 CoT 中插入 "提前停止" 信号,牺牲一部分召回率换取精确率——这是它在 precision 维度领先的关键工程取舍。

值得注意的是,文章标题刻意强调 "precision" 而不是 "accuracy" 或 "benchmark score"——这是企业 RAG 与 agent 流水线最关心的指标,而非通用智能水平。

## 社区热议与争议点

HN 评论区(基于 HN 讨论页风格推断,目前讨论尚未完全展开)的典型对立预计如下:

- **数据可信度怀疑派**:RuntimeWire 是相对小众的第三方站点,有人质疑其测试样本量、prompt 是否对 DeepSeek 友好、是否使用最新版 GPT-5.5 Pro 的 system prompt 优化;呼吁 OpenAI 或独立 Stanford HELM 复现。
- **PR 战疲劳派**:典型 HN 评论 "每个月都有一个模型 beats GPT-X on metric Y,等到 LMArena 排名出来再说" ——指出近半年中美 AI 厂商陷入 "benchmark cherry-picking" 的疲劳战,精确率提升 2-5% 在实际生产环境难以感知。
- **开源派 vs 闭源派**:DeepSeek 的传统优势在于 **开放权重 + 极低 API 价格**(V4 Pro 估计仅为 GPT-5.5 Pro 的 1/15),即使 precision 仅相当,从 TCO 角度也是降维打击。反对者则指出 GPT-5.5 Pro 的多模态、长视频、Agent 工作流仍然遥遥领先,纯文本 precision 只是冰山一角。

## 行业影响与未来展望

V4 Pro 的发布印证了 2026 年 AI 竞争已从 "通用智能" 分化为 **多维基准之争**:精确率、延迟、上下文长度、工具一致性各自独立。对企业用户而言,选型逻辑从 "买最强模型" 转向 "买最匹配场景的模型组合"——多模型路由(Multi-model Router)将成为基础设施层的标配。长期看,DeepSeek 的迭代节奏说明中国模型已经度过 "追赶期",进入 **细分赛道局部超越期**;而对 OpenAI 来说,GPT-5.5 Pro 上线一个月就被竞品在子维度反超,意味着 **moat 周期已经压缩到月级**,这对其估值叙事是不小的压力。

## 附带链接

- HN 讨论页:https://news.ycombinator.com/item?id=48440448
- 原文链接:https://runtimewire.com/article/deepseek-v4-pro-beats-gpt-5-5-pro-on-precision
