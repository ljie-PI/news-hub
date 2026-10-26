---
title: "alchaincyf/huashu-design"
date: "2026-10-27"
generated: "2026-10-27 07:00"
source: "GitHub"
slug: "2026-10-27_07-alchaincyf-huashu-design"
summary: "Huashu Design 3.0 是供 Claude Code、Codex、Cursor、Hermes 等编码代理安装的 MIT 设计技能，并非独立图形应用。它把模糊需求转成网页、应用原型、幻灯片、动画或信息图，以“先看方向、再扩展成品”缓解代理设计模板化、品牌失真和难交付。冻结榜单为 26707 星、2960 复刻、当日新增 409 星；当前 REST API 为 26710 星、2960 复刻，两者语义不可互换。"
---

# alchaincyf/huashu-design

## 定位与痛点剖析

Huashu Design 3.0 是供 Claude Code、Codex、Cursor、Hermes 等编码代理安装的 MIT 设计技能，并非独立图形应用。它把模糊需求转成网页、应用原型、幻灯片、动画或信息图，以“先看方向、再扩展成品”缓解代理设计模板化、品牌失真和难交付。冻结榜单为 26707 星、2960 复刻、当日新增 409 星；当前 REST API 为 26710 星、2960 复刻，两者语义不可互换。

## 核心架构与技术细节

默认分支为 `master`，目录树含 389 个文件。`SKILL.md` 负责编排流程，`references/` 分媒介给规则，`assets/` 放组件和样张，`scripts/` 承担检查与导出。README 自报 84 种风格；树中确有网页、演示、信息图各 20 种，应用与东亚各 12 份 HTML 样张。流程以三套逻辑各产两个候选，六张缩略图筛三版；`design_lint.py` 查可读性、撞版并维护本地外观账本，`learn.py` 保存本机偏好。可编辑演示文稿由 HTML 转换，清单依赖 Playwright、PptxGenJS、Sharp 与 pdf-lib。

## 竞品对比与生态站位

Anthropic 官方文档显示 Claude Design 把对话与画布结合，支持直接编辑、设计系统及导出 PPTX、PDF、HTML。它的画布协作更完整；Huashu 的优势是 MIT、跨代理、本地文件和脚本化多媒介流水线，代价是没有同等画布操作，效果及导出可靠性更依赖宿主模型与工具链。

## 开发者反馈与局限性

证据分层看，issue #41 只是用户报告成品不及演示；维护者随后说明演示用高档模型且从多轮中挑选，模型、生成方差和上下文都会影响质量。开放 PR #59、#60 指出的“缺页时文字校验漏报”和“页面打不开仍可能比较通过”，可在当前 `master` 的 `zip` 截断与过滤 `fatal` 源码中定位；但两项尚未合并、没有维护者评审，应视为代码可复核的待修报告，而非已发布修复。

## 附带链接

- [GitHub 仓库](https://github.com/alchaincyf/huashu-design)
- [默认分支 README](https://github.com/alchaincyf/huashu-design/blob/master/README.md)
- [版本 3.0.0](https://github.com/alchaincyf/huashu-design/releases/tag/v3.0.0)
- [用户反馈与维护者评论](https://github.com/alchaincyf/huashu-design/issues/41)
- [开放 PR #59](https://github.com/alchaincyf/huashu-design/pull/59)
- [开放 PR #60](https://github.com/alchaincyf/huashu-design/pull/60)
- [Claude Design 官方文档](https://support.claude.com/en/articles/14604416-get-started-with-claude-design)
