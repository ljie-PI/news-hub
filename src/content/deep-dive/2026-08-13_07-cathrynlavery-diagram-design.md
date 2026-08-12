---
title: "cathrynlavery/diagram-design"
date: "2026-08-13"
generated: "2026-08-13 07:00"
source: "GitHub"
slug: "2026-08-13_07-cathrynlavery-diagram-design"
summary: "这是面向 Claude Code、Codex 与 Pi 的制图技能，目标不是替代专业绘图软件，而是解决代理常产出同质化圆角框、配色脱离品牌、人工再进 Figma 调整耗时的"
---

# cathrynlavery/diagram-design

## 定位与痛点剖析

这是面向 Claude Code、Codex 与 Pi 的制图技能，目标不是替代专业绘图软件，而是解决代理常产出同质化圆角框、配色脱离品牌、人工再进 Figma 调整耗时的问题。它适合要把架构、流程或数据关系快速变成可发布视觉稿的技术作者与产品团队。

## 核心架构与技术细节

项目以渐进披露控制上下文：主技能只负责选型、设计原则和检查表，具体图型、导入与导出规范拆到独立参考文件，按需加载。产物是内嵌 CSS 与 SVG 的单文件 HTML，无构建步骤；PNG 由 Playwright 光栅化。语义色令牌统一品牌，强调色只给少数焦点；导入 draw.io 或 Mermaid 时保留组件关系，却重做坐标、字体与布局。README 关于图型数量及一分钟品牌适配均属项目方自报。

## 竞品对比与生态站位

Mermaid、Graphviz 强在文本可维护和自动布局，Figma、draw.io 强在自由编辑；本项目则以代理技能加固定编辑风格换取成稿速度。代价是它不追求原图像素级转换，也不适合高密度、需要持续手调的复杂拓扑。其价值更像跨多种编码代理共享的视觉设计系统。

## 开发者反馈与局限性

真实 issue 暴露了交付链细节：#37 指出导出 SVG 注入字体链接时，裸字符会破坏严格 XML，浏览器只显示解析错误；#33 曾报告图库链接打开的是源码页，后由 GitHub Pages 修复。托管安装还会覆盖本地风格表，需改用可编辑安装。项目目前依赖提示规范和静态检查维持一致性，效果仍受模型理解与输入复杂度影响。

## 附带链接

- GitHub：https://github.com/cathrynlavery/diagram-design
- 在线图库：https://cathrynlavery.github.io/diagram-design/
- 导出缺陷：https://github.com/cathrynlavery/diagram-design/issues/37
