---
title: "DayuanJiang/next-ai-draw-io"
date: "2026-07-12"
generated: "2026-07-12 07:00"
source: "GitHub"
slug: "2026-07-12_07-next-ai-draw-io"
summary: "draw.io 是最流行的开源图表工具，但手动拖拽节点、对齐连线极为耗时，架构图、流程图的迭代成本尤其高。next-ai-draw-io 把大语言模型接入 draw.io，让用"
---

---
title: "next-ai-draw-io：用自然语言驱动 draw.io 的 AI 绘图工具"
date: 2026-07-12
source: github
slug: next-ai-draw-io
---
# DayuanJiang/next-ai-draw-io

## 一、定位与痛点剖析
draw.io 是最流行的开源图表工具，但手动拖拽节点、对齐连线极为耗时，架构图、流程图的迭代成本尤其高。next-ai-draw-io 把大语言模型接入 draw.io，让用户用一句自然语言即可生成、修改与增强图表，直击"画图慢、改图烦"的核心痛点。它同时支持上传已有图片/PDF 让 AI 复刻，把非结构化文档转成可编辑图表，覆盖工程师、产品与咨询等高频画图场景。

## 二、核心架构与技术细节
项目基于 Next.js 16 与 React 19，用 TypeScript 编写。核心思路是把图表表示为 draw.io 可渲染的 XML：AI 解析指令后生成或修改这段 XML，再经 react-drawio 实时渲染。多模型能力由 Vercel AI SDK（ai + @ai-sdk/*）提供流式响应与 provider 抽象。它内置版本历史（可回滚 AI 编辑前的图）、AI 推理过程展示，并提供 MCP Server，可在 Claude Desktop、Cursor、VS Code 中直接调用绘图，浏览器内实时出图。

## 三、竞品对比与生态站位
相较 Mermaid + LLM 的纯文本方案，本项目直接操纵 draw.io XML，天然支持复杂样式、云架构 logo（AWS/GCP/Azure）与动画连接线，可视化表达力更强。它以 Apache-2.0 开源，支持十余家 provider（Bedrock、OpenAI、Anthropic、Doubao、DeepSeek、Ollama 等），并可一键部署到 Vercel、EdgeOne、Cloudflare Workers，还提供桌面端。开放的自托管与 BYO-Key 策略是其对闭源 SaaS 绘图产品的差异化站位。

## 四、开发者反馈与局限性
项目自报口径 star 约 3.3 万、fork 约 3600（自报口径），并登上 TrendShift，社区热度较高。当前 open issues 约 169，反映活跃使用与待解问题并存。局限在于效果强依赖模型能力——README 明确推荐 Claude Sonnet 4.5、GPT-5.1、Gemini 3 Pro 等强模型，弱模型难以稳定输出符合 XML 约束的长文本；云架构图偏向 Claude 系列，跨模型一致性仍有差距。

## 五、附带链接
- 仓库：https://github.com/DayuanJiang/next-ai-draw-io
- 在线 Demo：https://next-ai-drawio.jiang.jp/
