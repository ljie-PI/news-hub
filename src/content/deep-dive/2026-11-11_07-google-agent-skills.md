---
title: "google/skills"
date: "2026-11-11"
generated: "2026-11-11 07:00"
source: "GitHub"
slug: "2026-11-11_07-google-agent-skills"
summary: "这是 Google 面向编码智能体发布的产品知识与操作技能库，把云平台、身份、数据、广告等易过时且高风险的配置经验变成可按需加载的指令。它主要解决模型靠旧知识猜命令、一次塞入全量文档造成上下文膨胀的问题。README 口径支持用 skills.sh 安装，并可选择具体技能、目标智能体及项目或全局范围；本批榜单冻结口径为本周新增 1999 星。"
---

# google/skills

## 定位与痛点剖析

这是 Google 面向编码智能体发布的产品知识与操作技能库，把云平台、身份、数据、广告等易过时且高风险的配置经验变成可按需加载的指令。它主要解决模型靠旧知识猜命令、一次塞入全量文档造成上下文膨胀的问题。README 口径支持用 skills.sh 安装，并可选择具体技能、目标智能体及项目或全局范围；本批榜单冻结口径为本周新增 1999 星。

## 核心架构与技术细节

默认分支为 main。按默认分支目录与生成清单核验，index.json 收录 189 个入口；每项以名称、路由描述和原始 SKILL.md 地址组成。轻量的 Google Skill Finder 先下载清单、校验 JSON，再最多筛出三个匹配项并延迟加载，避免常驻全部知识。skills 下是带元数据的 Markdown、参考资料与脚本；plugins 又以 Claude Code、Codex、Antigravity 清单和 MCP 配置封装技能，数据云插件则通过固定版本分支的 Git 子模块聚合。现有自动化主要是每周链接检查并回写 issue。

## 竞品对比与生态站位

替代方案 anthropics/skills 同样采用自包含 SKILL.md，但更偏通用创意、办公文档和技能模板，还包含规范目录。google/skills 的优势是 Google 产品覆盖与官方来源，且同库适配多种智能体；短板是厂商边界明显，跨云或通用生产力仍需组合其他库。

## 开发者反馈与局限性

开放 issue #251 报告多项 GKE 指令缺陷，包括无效 PromQL、无法解码的清单和把访问令牌打印到终端；目前无维护者评论，因此只能视为可复查报告，不能写成已确认根因。issue #239 还报告基础设施技能会在未明确披露下授予整组组织管理角色，查询时仍开放。治理上，CONTRIBUTING 明确暂不接受外部 PR，只让社区报错或提需求；这有利于内部审查，却让外部修复依赖 Google 的处理节奏。

## 附带链接

- 仓库：https://github.com/google/skills
- README：https://github.com/google/skills/blob/main/README.md
- 默认分支清单：https://github.com/google/skills/blob/main/index.json
- 反馈：https://github.com/google/skills/issues/251
- 权限问题：https://github.com/google/skills/issues/239
- 治理：https://github.com/google/skills/blob/main/CONTRIBUTING.md
- 替代方案：https://github.com/anthropics/skills
