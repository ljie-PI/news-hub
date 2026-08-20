---
title: "If you are wondering why Ornith 1.5 35B A3B with MTP is so slow, this is why"
date: "2026-08-21"
generated: "2026-08-21 07:00"
source: "Reddit"
slug: "2026-08-21_07-if-you-are-wondering-why-ornith-1-5-35b-a3b-with-m"
summary: "Reddit 帖子把 Ornith-1.5 的异常速度指向 Hugging Face 讨论。官方模型卡称它是约 350 亿参数、每词元激活约 30 亿参数的混合专家模型；当前配置启用一层 MTP�"
---

# If you are wondering why Ornith 1.5 35B A3B with MTP is so slow, this is why

## 事件背景

Reddit 帖子把 Ornith-1.5 的异常速度指向 Hugging Face 讨论。官方模型卡称它是约 350 亿参数、每词元激活约 30 亿参数的混合专家模型；当前配置启用一层 MTP，权重索引确有 785 个 `mtp.*` 张量。讨论发起者据张量统计判断这些权重仍是随机初始化，但截至取证时未见 Ornith 维护者确认。

## 核心观点 / 产品机制

MTP 头先预测多个后续词元，主模型再批量验证；命中率高才可用更少轮次完成解码。发起者发现各投影标准差均为 0.0200，恰与配置的初始化范围相同，归一化权重也约为 0.02。他在 RTX 3090、llama.cpp 与指定量化组合上的自测显示：原头仅接受约 13% 草稿；移植 Qwen3.6 训练头后接受率升至 55%—75%，速度由 131 增至 169 词元每秒。若草稿频繁被拒，额外计算反会拖慢生成；这些数字仍属单机自报，并非独立基准。

## 社区热议与争议点

本次 Reddit RSS 取得 9 条真实评论子集，并非完整评论区。Iory1998 称启用 MTP 为 95 词元每秒，关闭后反达 124；Prize-Cut-9651 则称某个修正版与 1.0 速度相同。hainesk 质疑 MTP 对混合专家模型本就增益有限，Apart_Boat9666 回称通常只有 5%—10%。Hugging Face 讨论中 zxbc2023 报告 dflash 草稿头更快，Tariel 随即提醒该替代方案似乎会破坏多模态能力，说明速度修补并非无代价。

## 行业影响与未来展望

事件暴露出开放权重发布不能只校验主干精度：推测解码头也应附训练来源、接受率和兼容性测试。短期可默认关闭低接受率 MTP，或换用经验证的草稿头；长期应由发布方替换或删除占位权重，并分别复测代码、对话与多模态。运行时若能监控接受率并自动回退，可避免“开启加速反而变慢”。

## 附带链接

- [Reddit 原帖](https://www.reddit.com/r/LocalLLaMA/comments/1vtu555/if_you_are_wondering_why_ornith_15_35b_a3b_with/)
- [Hugging Face 问题讨论](https://huggingface.co/ornith-ai/Ornith-1.5-35B-A3B/discussions/10)
- [官方模型卡与仓库](https://huggingface.co/ornith-ai/Ornith-1.5-35B-A3B)
- [移植 MTP 头的实验发布](https://huggingface.co/EryriLabs/Ornith-1.5-35B-A3B-BigBang-MTP)
