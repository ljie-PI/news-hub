---
title: "Graphify-Labs/graphify"
date: "2026-10-19"
generated: "2026-10-19 07:00"
source: "GitHub"
slug: "2026-10-19_07-graphify-labs-graphify"
summary: "Graphify 是给编码智能体用的本地代码知识图谱工具，把代码、文档和媒体变成可查询的节点与关系，针对反复全文检索、跨文件依赖难追踪和上下文耗费。批次冻结快照为128389星、12376次派生，本日新增592星；查询时REST为128391星，二者口径分开。"
---

# Graphify-Labs/graphify

## 定位与痛点剖析
Graphify 是给编码智能体用的本地代码知识图谱工具，把代码、文档和媒体变成可查询的节点与关系，针对反复全文检索、跨文件依赖难追踪和上下文耗费。批次冻结快照为128389星、12376次派生，本日新增592星；查询时REST为128391星，二者口径分开。

## 核心架构与技术细节
默认分支实为受保护的`v8`，清单版本0.9.92。源码树显示流水线由检测、抽取、建图、聚类、分析、报告和导出组成，以Tree-sitter解析代码、NetworkX保存图，并用Leiden聚类。代码抽取不调用模型，具确定性；文档、图片等语义抽取仍可调用模型，故“完全确定”只适用于代码路径。边保存关系类型、来源及`EXTRACTED`、`INFERRED`、`AMBIGUOUS`证据标签，所谓解释并非逐边自然语言论证。依赖清单与查询源码未见向量库，默认查询采用文本评分和图遍历。README自报约四十种语言、0.497召回率及云端节省80%令牌，均非独立测量。

## 竞品对比与生态站位
GitNexus官方README同样定位为代码知识图谱与MCP上下文引擎，也用Tree-sitter，但以LadybugDB持久化，并提供可选本地嵌入和混合搜索。Graphify更强调无向量的可审计图、文档媒体并图及多智能体技能安装；前者则突出影响分析和预计算执行流。

## 开发者反馈与局限性
近期开放issue显示覆盖边界仍在快速修补：#4559报告带扫描目录前缀的Obsidian链接会静默丢边；#4553报告Kotlin类型别名生成无来源枢纽，相应PR #4557仍未合并。#4547还指出语义抽取无法区分“文件无实体”与“模型漏读”，会触发缩图保护；这些均是报告或开放修复，不能写成已发布结论。

## 附带链接
- [仓库](https://github.com/Graphify-Labs/graphify)
- [默认分支源码](https://github.com/Graphify-Labs/graphify/tree/v8)
- [官方文档](https://docs.graphify.com)
- [近期问题 #4559](https://github.com/Graphify-Labs/graphify/issues/4559)
- [竞品 GitNexus](https://github.com/abhigyanpatwari/GitNexus)
