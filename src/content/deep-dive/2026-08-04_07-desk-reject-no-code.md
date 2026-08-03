---
title: "It's time to desk reject papers that don't include code that can reproduce the results [D]"
date: "2026-08-04"
generated: "2026-08-04 07:00"
source: "Reddit"
slug: "2026-08-04_07-desk-reject-no-code"
summary: "近年来，机器学习领域的论文数量爆炸式增长，但\"可复现性危机\"也随之愈演愈烈。大量在顶会（NeurIPS、ICML、CVPR）发表的论文，其宣称的 SOTA 结果往往"
---

---
title: "Desk reject papers without reproducible code [D]"
date: 2026-08-04
source: reddit
slug: desk-reject-no-code
category: "ML / CV / NLP"
---
# It's time to desk reject papers that don't include code that can reproduce the results [D]

## 事件背景

近年来，机器学习领域的论文数量爆炸式增长，但"可复现性危机"也随之愈演愈烈。大量在顶会（NeurIPS、ICML、CVPR）发表的论文，其宣称的 SOTA 结果往往难以被独立研究者重现——要么代码缺失，要么关键超参、数据处理细节被刻意隐去。r/MachineLearning 上一篇题为《是时候把不附带可复现代码的论文直接桌拒了》的帖子引发热烈讨论，配合另一篇《糟糕但典型的 NeurIPS 经历》，共同折射出社区对当前评审机制的深度不满。

## 核心观点

发帖者的核心主张直截了当：投稿时若不提供能够复现主要结果的代码，评审阶段就应直接桌拒（desk reject），无需进入正式评审。理由在于，无法复现的结果本质上是"未经验证的声明"，浪费评审人和后续跟进者的时间，甚至助长了灌水与选择性报告（cherry-picking）。将可复现代码作为硬性门槛，能从源头提升论文质量，把学术信誉与工程可验证性绑定在一起。

## 社区热议与争议点

（注：以下为议题层面的正反观点归纳，未逐字引用原帖评论。）

- **支持方**：强制交代码能提升问责性与可复现性，遏制夸大结果；同时降低后来者的复现成本，加速真正有效方法的传播。
- **反对方**：一是**专有数据**问题，工业界与医疗、金融等领域论文常涉及无法公开的数据集；二是**算力成本**，超大模型训练动辄数百万美元，"能复现"对多数评审并不现实；三是**工业实验室**顾虑商业机密与合规，硬门槛可能把高质量成果挡在门外，反而削弱会议影响力。

争论焦点因此从"要不要交代码"转向"如何分级要求"——例如区分理论论文、纯实证论文与依赖私有资源的论文。

## 行业影响与未来展望

这场讨论正推动顶会走向更精细的复现政策：从鼓励性的 Reproducibility Checklist，向部分赛道的强制代码提交、甚至独立复现徽章（badge）演进。未来可能出现"复现即服务"的第三方验证机构，以及对私有数据论文的替代性核验方案（如脱敏子集、可控 API）。核心趋势是：可复现性正从"加分项"转变为学术诚信的"基础设施"。

## 附带链接

- r/MachineLearning 讨论帖：https://www.reddit.com/r/MachineLearning/
