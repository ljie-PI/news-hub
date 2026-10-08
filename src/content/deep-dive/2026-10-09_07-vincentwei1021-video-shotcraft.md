---
title: "Vincentwei1021/video-shotcraft"
date: "2026-10-09"
generated: "2026-10-09 07:00"
source: "GitHub"
slug: "2026-10-09_07-vincentwei1021-video-shotcraft"
summary: "它不是文生视频模型，而是面向 Claude Code、Codex 的代理技能：把产品宣传片的分镜、页面采集、Remotion 编排、音效与终检固化成流程。GitHub REST 查询显示默认分支为 main、采用 Apache-2.0，批次快照为 10878 星、968 次复刻。README 顶部现自报 157 张镜头配方与 214 个预览，和仓库描述的 152/209 已有口径漂移。其用户是愿以代码换取可复现成片、但缺少动效方法的产品团队。"
---

# Vincentwei1021/video-shotcraft

## 定位与痛点剖析

它不是文生视频模型，而是面向 Claude Code、Codex 的代理技能：把产品宣传片的分镜、页面采集、Remotion 编排、音效与终检固化成流程。GitHub REST 查询显示默认分支为 main、采用 Apache-2.0，批次快照为 10878 星、968 次复刻。README 顶部现自报 157 张镜头配方与 214 个预览，和仓库描述的 152/209 已有口径漂移。其用户是愿以代码换取可复现成片、但缺少动效方法的产品团队。

## 核心架构与技术细节

根清单仅承担 Vitest；模板锁定 Remotion 4.0.484、React 19.2.7，工作台另用 Vite、Player、Zod、Zustand 与 Three。SKILL.md 驱动代理选配方，确定性 TSX 组件进入模板；`template/src/workbench.ts` 从 Main 直接导入镜头、字幕、转场和音效时间表，避免维护第二份时序，再由清单拆成多轨。属性 schema 只开放文案、颜色、字号等语境参数，缓动与相机键保持常量；浏览器预览修改后仍由 Remotion 导出。

## 竞品对比与生态站位

官方 `remotion-dev/skills` 覆盖创建、标记、渲染、字幕和交互等通用实践；官方 `template-prompt-to-video` 则调用 OpenAI 与 ElevenLabs 生成面向短视频平台的故事、图片和旁白。Shotcraft 不提供模型生成能力，却以产品页面实拍、成套镜头语言、音效库和交付后工作台形成更窄、更完整的产品宣传片流水线。

## 开发者反馈与局限性

已关闭 issue #47 肯定效果卡，同时报告录屏嵌入后文字交织、十秒修改耗时半小时；开放 issue #49 说明小修仍需整片重渲染，局部帧补丁尚在征集实现。合并 PR #43 增加 57 个演示的首帧冒烟测试，但 PR #50 随后证明它抓不到中段时序与层级错误。文档还承认非 30 帧工程的弹簧节奏可能漂移，常量式演示不能逐属性编辑。

## 附带链接

- [GitHub 仓库](https://github.com/Vincentwei1021/video-shotcraft)
- [README](https://github.com/Vincentwei1021/video-shotcraft/blob/main/README.md)
- [局部重渲染 issue #49](https://github.com/Vincentwei1021/video-shotcraft/issues/49)
- [首帧冒烟 PR #43](https://github.com/Vincentwei1021/video-shotcraft/pull/43)
- [Remotion 官方 Skills](https://github.com/remotion-dev/skills)
- [Remotion 官方 AI Video Template](https://github.com/remotion-dev/template-prompt-to-video)
