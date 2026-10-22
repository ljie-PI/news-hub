---
title: "Built a 260M visual decision model. Good GUI accuracy, but confidence fails under distribution shift."
date: "2026-10-23"
generated: "2026-10-23 07:00"
source: "Reddit"
slug: "2026-10-23_07-260m-visual-decision-model-confidence-shift"
summary: "作者发布基于 NeoMME-260M 的视觉决策模型 MK-SH-V，用于判断截图任务状态与票据金额阈值。作者及仓库自测称，在 2,010 个留出 GUI 样本上准确率为百分之八十二点六，高于约四十亿参数零样本基线的百分之七十三点一；这些不是独立榜单结果。"
---

# Built a 260M visual decision model. Good GUI accuracy, but confidence fails under distribution shift.

## 事件背景
作者发布基于 NeoMME-260M 的视觉决策模型 MK-SH-V，用于判断截图任务状态与票据金额阈值。作者及仓库自测称，在 2,010 个留出 GUI 样本上准确率为百分之八十二点六，高于约四十亿参数零样本基线的百分之七十三点一；这些不是独立榜单结果。

## 核心观点 / 产品机制
模型以单塔同时读取图像与文本，用行内标记为各选项打分，再经温度缩放生成概率；最大概率低于阈值零点五五便拒答。仓库自测的 4,200 个留出合成样本覆盖率为百分之八十六点一，选择性风险百分之二点六五，置信上界百分之三点二三，满足百分之五预算。但真实 GUI 覆盖率仍达百分之九十八点三，错误风险却升至百分之十六点七至二十一点三；真实票据又几乎全被拒答，说明门限只在合成协议内有效。

## 社区热议与争议点
逐帖 RSS 已核对编号、标题与作者，但仅有主帖一个条目，没有任何评论条目，故未取得网友观点，也不虚构讨论。可核验争点来自仓库：评测脚本确实将温度拟合、门限选择和留出集分开，并采用 Clopper–Pearson 上界；但公开仓库零 issue，当前文件树也没有 README 所称的逐例 runs，完整复现还依赖私有 Kaggle 数据与检查点。

## 行业影响与未来展望
项目公开展示“准确但过度自信”的失效：合成校准不能直接外推到真实截图，更不能跨到票据。后续应按域重校准、引入分布外检测，并用新增真实域留出集重新冻结门限；在完成前，拒答应视为人工复核路由，而非安全保证。提交史共六十三次，先冻结 E41/E42 标准再提交脚本与模型卡，但仍属作者自测链路。

## 附带链接
- [Reddit 原帖](https://www.reddit.com/r/computervision/comments/1xcvryk/built_a_260m_visual_decision_model_good_gui/)
- [GitHub 仓库](https://github.com/Gjusev/mk-sh-v)
- [模型卡](https://huggingface.co/Gjusev/MK-SH-V)
