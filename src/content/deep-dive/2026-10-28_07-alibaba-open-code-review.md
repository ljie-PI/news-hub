---
title: "alibaba/open-code-review"
date: "2026-10-28"
generated: "2026-10-28 07:00"
source: "GitHub"
slug: "2026-10-28_07-alibaba-open-code-review"
summary: "OpenCodeReview 是面向开发者与团队的 Go 语言代码审查 CLI，可审 Git 工作区、提交区间，也可整库扫描。它针对通用代理在大改动中漏文件、评论行号漂移、提示词敏感等问题，用工程约束稳定流程。批次快照为 48,606 stars、今日新增 119；查询时 REST 总数一致。README 自报其前身服务阿里数万开发者、发现数百万缺陷，属于项目方口径。"
---

# alibaba/open-code-review

## 定位与痛点剖析

OpenCodeReview 是面向开发者与团队的 Go 语言代码审查 CLI，可审 Git 工作区、提交区间，也可整库扫描。它针对通用代理在大改动中漏文件、评论行号漂移、提示词敏感等问题，用工程约束稳定流程。批次快照为 48,606 stars、今日新增 119；查询时 REST 总数一致。README 自报其前身服务阿里数万开发者、发现数百万缺陷，属于项目方口径。

## 核心架构与技术细节

默认分支树显示核心采用 Go 1.26.9，npm 包负责跨平台启动。流水线先选差异文件、按特征匹配内置规则，再将相关文件分为隔离子任务；源码限制每组最多十个文件，超出令牌预算则退回逐文件审查。代理按需读文件、搜索仓库并生成行级评论，且支持 MCP、OpenAI 和 Anthropic。README 的 AACR-Bench 数字均属自报：50 个仓库、200 个 PR、1,505 个标注问题，同模型令牌约为通用代理九分之一；项目也承认召回率更低，取舍是降低误报。

## 竞品对比与生态站位

PR-Agent 官方 README 将其定义为社区维护的传统开源项目，主打 PR 评论命令、GitHub Action、Webhook，并覆盖 GitHub、GitLab、Bitbucket 等平台。OpenCodeReview 更偏本地差异与整库扫描，以规则、分组、定位建立确定性；过程更可控，但边界代码更复杂。二者均可自托管：前者平台集成广，后者更像编码代理可调用的审查内核。

## 开发者反馈与局限性

公开 issue 暴露三类边界：#1824 报告已跟踪但命中 .gitignore 的文件被静默漏审，修复 PR #1837 尚未合并；#1827 报告压缩单行文件使 code_search 输出膨胀至数 MB，两个限长 PR 仍开放，稳定版 v1.13.3 未含修复；#1839 报告 Windows 的 ocr.cmd 与 Bun、Node 启动差异会让 HEAD^ 被拒绝、改写或启动失败，现为开放、零评论。它们是具体报告而非普遍结论，却说明大仓库、生成物与跨平台插件仍是风险区。

## 附带链接

- [GitHub 仓库](https://github.com/alibaba/open-code-review)
- [官方网站](https://open-codereview.ai/)
- [问题 #1824](https://github.com/alibaba/open-code-review/issues/1824)
- [问题 #1827](https://github.com/alibaba/open-code-review/issues/1827)
- [问题 #1839](https://github.com/alibaba/open-code-review/issues/1839)
- [竞品 PR-Agent](https://github.com/The-PR-Agent/pr-agent)
