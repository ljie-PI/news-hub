---
title: "Survival of the Fitted: Qwen3.6-27B’s Jacobian lens reads and steers Qwen3.8-27B with zero refitting [R]"
date: "2026-08-16"
generated: "2026-08-16 07:00"
source: "Reddit"
slug: "2026-08-16_07-survival-of-the-fitted-qwen3-6-27b-s-jacobian-lens"
summary: "帖子追问：为单一检查点拟合的解释工具，升级后是否必须重训。作者称将公开的Qwen3.6-27B Jacobian lens原样套到Qwen3.8-27B。官方模型卡确认两者均为270亿�"
---

# Survival of the Fitted: Qwen3.6-27B’s Jacobian lens reads and steers Qwen3.8-27B with zero refitting [R]

## 事件背景

帖子追问：为单一检查点拟合的解释工具，升级后是否必须重训。作者称将公开的Qwen3.6-27B Jacobian lens原样套到Qwen3.8-27B。官方模型卡确认两者均为270亿参数稠密模型，隐藏维度5120、64层、词表大小248320且层布局相同；“相隔113天”及“完全同一分词器”仍属作者口径，官方资料仅能部分支持。

## 核心观点 / 产品机制

原论文的镜头对每层估计“该层残差到末层残差”的语料平均雅可比，再用模型自身反嵌入把中间状态译成词元排名，也可沿对应方向消融。配图中，正常运行读出并生成“paradox”；作者称在3.8中减去3.6镜头的该概念方向后，第40层概念质量由0.49降至0，输出转向“structure”，此前文本逐词一致。这是因果个案，不是跨版本普适性证明。

## 社区热议与争议点

本轮Reddit实时评论被封，未逐字取得评论；以下为页面数据与公开资料支持的争点，并非网友引语。支持点：一是官方配置显示关键维度和层序对齐，具备直接加载前提；二是读出与干预同时改变目标概念和生成词，强于热图相关性。质疑点：一是仅见单提示配图，缺少大样本、随机种子、误差条及重拟合对照；二是形状兼容不等于表征坐标稳定，词表同尺寸也不能证明分词器文件和概念几何不变。

## 行业影响与未来展望

若可重复，解释性资产可随小版本复用，降低审计成本并成为升级回归探针。但仍需以多任务、多概念、多层和多版本验证，报告读出一致率、干预成功率、副作用，并以本版本重拟合镜头作上限；否则“零重拟合”只是待验证的迁移假说。

## 附带链接

- [Reddit 原帖](https://www.reddit.com/r/MachineLearning/comments/1vpa5cv/survival_of_the_fitted_qwen3627bs_jacobian_lens/)
- [实验配图](https://i.redd.it/49qcp6szzkjh1.jpeg)
- [Anthropic 原论文](https://transformer-circuits.pub/2026/workspace/index.html)
- [Qwen3.6-27B 官方模型卡](https://huggingface.co/Qwen/Qwen3.6-27B)
- [Qwen3.8-27B 官方模型卡](https://huggingface.co/Qwen/Qwen3.8-27B)
- [Neuronpedia 预拟合镜头](https://www.neuronpedia.org/qwen3.6-27b/jlens)
