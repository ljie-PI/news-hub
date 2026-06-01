---
title: "ai-research-data-leakage"
date: "2026-06-02"
generated: "2026-06-02 07:00"
source: "Reddit"
slug: "2026-06-02_07-ai-research-data-leakage"
---

---
title: "How much published AI research is wrong because of data leakage?"
date: "2026-06-02"
generated: "2026-06-02 07:00"
source: "Reddit"
slug: "ai-research-data-leakage"
---

## 1. 帖子背景

r/artificial 用户 kamilc86 援引普林斯顿 Kapoor 与 Narayanan 的研究指出：该团队在医学、经济学等 17 个领域、近 300 篇论文中发现"数据泄漏"（data leakage）问题——模型在训练阶段获得了真实预测时本不该拥有的信息，使其在测试集上表现亮眼，但部署到现实世界时崩溃。发帖人以"内战预测"为例：曾被宣传为碾压传统 logistic 回归的复杂模型，在修复泄漏后并不优于经典基线。

## 2. 核心讨论点

讨论围绕几个层面展开：1) 数据泄漏的形式众多——时间穿越（用未来数据预测过去）、重复样本跨越 train/test、特征工程中混入标签信息、预训练语料覆盖了下游评测集；2) 这种问题不仅限于学术圈，工业界 A/B 测试与生产模型同样普遍；3) LLM 时代尤其严重——主流基准（MMLU、HumanEval、GSM8K 等）几乎确定地存在污染，而厂商榜单仍照常宣发。发帖人追问：如果近 300 篇高引论文都有问题，整个 ML 文献的可复现性危机到底有多深？

## 3. 社区反应 / 争议

评论区一边倒地共鸣，认为这是"机器学习版的心理学复现危机"。技术派指出 nested cross-validation、time-based split、对抗式去重等手段早有定论，问题在于审稿激励——SOTA 才能中稿，没人愿意发"我们没打破 baseline"。也有人为研究者辩护：医学/经济数据稀缺，严格防泄漏几乎做不出像样的论文。少数声音质疑 Kapoor & Narayanan 是否扩大了"泄漏"的定义。

## 4. 行业影响

这一帖与近期对 LLM 基准污染（OpenAI、DeepSeek、Qwen 评测分数注水）的讨论形成呼应，对 AI 行业有两层冲击：一是评测体系信任度——需要更多 contamination-resistant、holdout、动态生成的基准；二是监管与高风险落地——医疗、金融、司法 AI 若建立在"虚高"指标上，部署风险被严重低估，反过来呼应了正在推进的 EU AI Act 风险分级要求。

## 5. 链接

- Permalink: https://www.reddit.com/r/artificial/comments/1tu0ri0/how_much_published_ai_research_is_wrong_because/
- URL: (self post)
