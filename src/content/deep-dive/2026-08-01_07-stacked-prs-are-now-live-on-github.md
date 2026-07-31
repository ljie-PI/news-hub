---
title: "Stacked PRs are now live on GitHub"
date: "2026-08-01"
generated: "2026-08-01 07:00"
source: "HN"
slug: "2026-08-01_07-stacked-prs-are-now-live-on-github"
summary: "2026 年 7 月 30 日，GitHub 在其 Changelog 中宣布\"堆叠式拉取请求\"（Stacked Pull Requests）进入公开预览。该功能允许开发者将一个大型改动拆分成一串相互依赖"
---

# Stacked PRs are now live on GitHub

## 1. 事件背景

2026 年 7 月 30 日，GitHub 在其 Changelog 中宣布"堆叠式拉取请求"（Stacked Pull Requests）进入公开预览。该功能允许开发者将一个大型改动拆分成一串相互依赖、按顺序堆叠的小型 PR，每个 PR 基于前一个构建，从而让代码审查以"小块"方式进行。GitHub 同时提供了 `gh stack` CLI、公开的 REST API 以及一键合并整个堆栈的能力。这一直是社区自 2020 年起就在 cli/cli 仓库中反复请求的老需求，如今终于原生落地。

## 2. 核心观点与产品机制

堆叠式 PR 的核心价值在于把"巨型 PR"拆解为逻辑清晰、可独立审查的组件单元，不同审查者可各司其职。GitHub 官方在讨论区亲自答疑：为支持堆栈合并，团队引入了名为 CPRMC 的内部系统来评估每个 PR 是否"可合并"，并将合并 API 改为异步方式，以应对多 PR 堆栈耗时较长的问题。官方强调提供了完整的堆栈操作公共 API，方便第三方（如 Trunk 的 Merge Queue）自建集成。

## 3. 社区热议与争议点

HN 讨论热烈且分歧明显。支持派 efromvt 称"堆叠是分离特性差异的更优 UX"；不少人认为这与 AI 相关——techscruggs 指出 AI 让 PR 体积暴增，堆叠正是应对之策，smoll 更表示要让 agent 大量使用以便分块审查。但 amethyst 反驳称 Phabricator 十年前就有此能力，与 AI 无关。质疑派 PennRobotics 认为该功能徒增复杂度，如同"已有多窗口还硬造标签组"。此外 matharmin 实测发现 squash 合并整个堆栈"很多情况下完全失效"，需逐个重新审批，削弱了核心收益。也有人推荐 git-spice、jujutsu 等既有替代工具。

## 4. 行业影响与未来展望

GitLab 近期也推出了堆叠 MR，显示两大托管平台在同一方向竞争。随着 AI 生成代码使 PR 规模膨胀，可审查性成为刚需，堆叠工作流有望从小众走向主流。GitHub 官方在评论区积极收集反馈并承诺修复 squash 合并等缺陷，未来跨仓库堆叠、webhook 支持与外部合并工具生态将是关键看点。

## 5. 附带链接

- 原文：https://github.blog/changelog/2026-07-30-stacked-pull-requests-are-now-in-public-preview/
- HN 讨论：https://news.ycombinator.com/item?id=49112232
- 堆栈 REST API 文档：https://docs.github.com/en/rest/pulls/stacks
