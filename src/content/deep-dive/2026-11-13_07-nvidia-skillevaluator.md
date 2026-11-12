---
title: "NVIDIA/SkillEvaluator"
date: "2026-11-13"
generated: "2026-11-13 07:00"
source: "GitHub"
slug: "2026-11-13_07-nvidia-skillevaluator"
summary: "SkillEvaluator 是面向 Agent Skills 作者的 Apache-2.0 Python 命令行工具。它针对“文档合规却未必安全、精炼或真正提升代理表现”的断层，把静态检查、语义去重和真实运行评测纳入持续集成。批次快照显示今日新增 83 stars，但热度不等于效果证明。"
---

# NVIDIA/SkillEvaluator

## 定位与痛点剖析

SkillEvaluator 是面向 Agent Skills 作者的 Apache-2.0 Python 命令行工具。它针对“文档合规却未必安全、精炼或真正提升代理表现”的断层，把静态检查、语义去重和真实运行评测纳入持续集成。批次快照显示今日新增 83 stars，但热度不等于效果证明。

## 核心架构与技术细节

默认分支清单标示 0.8.0，支持 Python 3.12—3.14。第一层检查结构、质量、许可证、隐私与代码风险，并接入 SkillSpector、Gitleaks 等扫描器；第二层用嵌入余弦相似度、并查集聚类和大模型复核发现技能内重复及目录间重叠；第三层借 Harbor 在沙箱中对同一任务做有技能、无技能配对运行，以五维评分和 Skill Lift 衡量增益。各层可独立执行，证据缺失会标为未完成而非静默通过。README 所称示例质量分 84.5/100 属项目自报口径，不是独立基准。

## 竞品对比与生态站位

SkillsBench 以 87 个专家编写任务和公开榜单横向比较多种模型、代理框架及技能组合，适合回答“谁更强”；SkillEvaluator 更像可嵌入 GitHub、GitLab 的逐技能质量门，覆盖安全、重复、数据集生成和私有技能验证，治理链更完整，但跨项目可比性取决于用户自建任务与评分器。二者分别占据公共基准与仓库内发布门禁位置。

## 开发者反馈与局限性

开放 issue #61 质疑分数是否经过人类标注、评审一致性与校准验证，两位外部评论者至今未获维护者公开回应。更具体地，协作者的开放 PR #456 指出生成数据曾要求无技能基线读取 SKILL.md 或运行技能脚本，可能人为放大增益；修补方案改为只评任务结果，但尚未合并，自动评论也显示第三层结果未完成。项目仍标为实验性、无服务承诺，完整评测还依赖模型凭证、Docker 和付费推理。

## 附带链接

- [代码仓库](https://github.com/NVIDIA/SkillEvaluator)
- [官方文档](https://docs.nvidia.com/skills/skillevaluator/)
- [指标质疑 issue](https://github.com/NVIDIA/SkillEvaluator/issues/61)
- [基线公平性 PR](https://github.com/NVIDIA/SkillEvaluator/pull/456)
- [SkillsBench](https://skillsbench.ai/)
