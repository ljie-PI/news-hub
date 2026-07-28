---
title: "virgiliojr94/book-to-skill"
date: "2026-07-29"
generated: "2026-07-29 07:00"
source: "GitHub"
slug: "2026-07-29_07-book-to-skill"
summary: "技术书买来往往只读一遍，三个月后连第七章讲过什么都记不起来。常见的三种补救都不奏效：搜 PDF 只得到一堆页码而非答案；直接问 agent 要么幻觉�"
---

# virgiliojr94/book-to-skill

## 1. 定位与痛点剖析
技术书买来往往只读一遍，三个月后连第七章讲过什么都记不起来。常见的三种补救都不奏效：搜 PDF 只得到一堆页码而非答案；直接问 agent 要么幻觉要么说没有内容；自己做笔记又变成再也不打开的两百行文档。book-to-skill 把任意技术书、文档目录或资料集蒸馏成"按需加载"的 agent skill，让 Copilot CLI、Amp、Claude Code 在工作时随用随查，官方称回答单个问题比整本塞入上下文省 24–51 倍 token，让书真正融入工作流。

## 2. 核心架构与技术细节
三步走：把它指向文件、文件夹或 glob；它将书蒸馏成结构化 skill——提炼框架、决策规则、反模式与逐章文件，是结构而非摘要；你的 agent 按需读取对应章节，从真实内容作答杜绝幻觉。产物包含 SKILL.md（核心心智模型加章节索引，约 4000 token）、逐章 chapters/*.md（每章约 1000 token）、glossary 术语表、patterns 模式库与 cheatsheet 决策表。章节文件在被查询前不占用 skill 预算，实现真正的惰性加载。

## 3. 竞品对比与生态站位
基于开放的 Agent Skills 标准，跨 host 共用同一 SKILL.md 格式。相较传统 RAG 向量检索，它输出的是结构化知识而非碎片式摘要；且不止于书本，内部文档、架构决策记录、品牌规范、论文集都能折叠成单一可更新的 skill。

## 4. 开发者反馈与局限性
11261 星、Trendshift 单日 Python 榜第 10、总榜第 25，热度可观。局限在于强依赖 skill 生态与 host 支持，蒸馏质量高度取决于源文档的结构化程度，对非 prose 类内容效果有限。

## 5. 附带链接
- 仓库：https://github.com/virgiliojr94/book-to-skill
- Agent Skills 标准：https://github.com/agentskills/agentskills
