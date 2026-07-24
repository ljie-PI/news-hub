---
title: "Are AI labs pelicanmaxxing?"
date: "2026-07-25"
generated: "2026-07-25 07:00"
source: "HN"
slug: "2026-07-25_07-are-ai-labs-pelicanmaxxing"
summary: "Dylan Castillo 用 1008 张 SVG 验证：AI 实验室并没有针对「鹈鹕骑自行车」作弊。"
---

# Are AI labs pelicanmaxxing?

Dylan Castillo 用 1008 张 SVG 验证：AI 实验室并没有针对「鹈鹕骑自行车」作弊。

## 事件背景

多年来 Simon Willison 用同一句提示词「画一张鹈鹕骑自行车的 SVG」测试每个新模型，这个玩笑式基准已成 HN 上最著名的非正式评测。随之而来的质疑是：当数十亿甚至上万亿美元押在模型排名上，实验室会不会偷偷「pelicanmaxx」——专门优化这道题？Dylan Castillo 决定用实验回答。

## 核心观点 / 产品机制

作者构建 8 种动物 × 6 种载具 = 48 个提示词的网格，鹈鹕骑自行车只是其中一格。他在 7 个前沿模型上各生成 3 个样本，共 1008 张 SVG，用 GPT-5.6 Luna 作评委打分，再用固定效应回归剥离每种组合固有难度。假设是：若某实验室训练了这道题，鹈鹕行、自行车列或鹈鹕-自行车单元格的得分应异常偏高。结果五项证据一致：鹈鹕在 8 种动物里排第 6，自行车倒数第二，鹈鹕-自行车组合排第 42；调整难度后无一实验室效应显著。结论：几乎无证据表明实验室在 pelicanmaxxing，更可能是整体「SVGmaxxing」。

## 社区热议与争议点

Simon Willison 本人现身称赞方法论「比我自己想做的稳健得多」，坦言最大梦想就是抓到某家专门对鹈鹕作弊的实验室。但质疑并未平息：dllu 反驳「每个学生都得 A 时考试就失效了」的说法，指出图中自行车车架其实全都画错，说明并非过拟合。lukev 追问「就算不是 pelicanmaxxing，会不会是 SVGmaxxing」，Dylan16807 则替作者辩护，说文中已用篇幅回应。ponyous 从可信度角度开炮：单一 LLM 评委、未做一致性校验，他此前评 3D 模型时发现 LLM 打分「毫无相关性」。

## 行业影响与未来展望

这场辩论的真正议题是 Goodhart 定律——一旦公开基准被训练，其与真实能力的相关性就会瓦解。ErrantX 点出关键：公开测试可被污染，Simon 手握的私密提示词才是好基准的保障。未来评测或将转向配对比较、ELO 排名与持续更新的私有题库，以对抗「应试式」优化。

## 附带链接

- 原文：https://dylancastillo.co/posts/pelicanmaxxing.html
- HN 讨论：https://news.ycombinator.com/item?id=49010129
