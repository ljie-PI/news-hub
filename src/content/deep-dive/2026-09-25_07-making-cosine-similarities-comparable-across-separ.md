---
title: "Making cosine similarities comparable across separately trained embedding spaces"
date: "2026-09-25"
generated: "2026-09-25 07:00"
source: "Reddit"
slug: "2026-09-25_07-making-cosine-similarities-comparable-across-separ"
summary: "作者为约二十五本古登堡经济学著作分别训练PPMI加SVD词向量。其方案取每书查询词七十五个近邻的平均余弦作基线，再平移到全书平均；跨书均值找“核心”关联，高方差且在至少两成书中较相似的词找“争议”关联。此法尚无标注集或复现实验。"
---

# Making cosine similarities comparable across separately trained embedding spaces

## 事件背景
作者为约二十五本古登堡经济学著作分别训练PPMI加SVD词向量。其方案取每书查询词七十五个近邻的平均余弦作基线，再平移到全书平均；跨书均值找“核心”关联，高方差且在至少两成书中较相似的词找“争议”关联。此法尚无标注集或复现实验。

## 核心观点 / 产品机制
帖中比较的是各书内部同一词对的余弦，即二阶关系；SVD坐标虽可任意旋转，正交旋转却不改变书内余弦。只有直接跨书求向量余弦，才需用共享词锚点做Procrustes对齐。原始CSLS在已映射空间中双向扣除查询端、候选端的近邻密度；帖中只是单边加性平移，不能沿用CSLS的有效性结论，也未校正方差、词表规模和不确定性。

## 社区热议与争议点
Atom源共四个条目：主帖、两名普通用户评论及一条作者回复，仅是可见子集。benjamin-crowell质疑独立空间基底不同；作者回应其比较二阶相似度，旨在削弱大书偏高。haaspaas2认为现象更像词表规模造成的密度差，认可书内同词对可比，但提醒领域、语料量与低频词会改变几何。三例构成质疑、辩护与条件性支持。

## 行业影响与未来展望
该思路适合数字人文探索，却不宜直接把高方差解释为思想争议。应统一词表、窗口、维度与最低频次，按相同词元预算下采样；再按句段自助重采样，报告相似度与排名置信区间，并比较百分位或标准分校准。研究跨书向量位移时增加共享锚点对齐；只研究词对关系时，优先检验排名稳定性。

## 附带链接
- [Reddit原帖](https://www.reddit.com/r/LanguageTechnology/comments/1wpcfsq/making_cosine_similarities_comparable_across/)
- [CSLS原论文](https://arxiv.org/abs/1710.04087)
- [历时嵌入对齐论文](https://aclanthology.org/P16-1141/)
- [小语料嵌入稳定性研究](https://aclanthology.org/Q18-1008/)
