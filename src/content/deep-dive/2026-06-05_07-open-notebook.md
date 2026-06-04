---
title: "open-notebook"
date: "2026-06-05"
generated: "2026-06-05 07:00"
source: "GitHub"
slug: "2026-06-05_07-open-notebook"
---

---
title: "lfnovo/open-notebook - 开源 NotebookLM 替代方案"
date: "2026-06-05"
generated: "2026-06-05 07:00"
source: "GitHub"
slug: "open-notebook"
---

## 项目定位与痛点剖析

lfnovo/open-notebook 由巴西开发者 Luis Novo 主导，定位为 Google NotebookLM 的私有化、自托管开源替代品。其核心痛点直指 NotebookLM 的三大限制：数据全部上传 Google 云端、仅能使用 Gemini 系列模型、播客只能固定双人对话。该项目主打"100% 本地可运行、18+ AI 厂商任选、播客 1-4 人自定义"的差异化卖点。仓库目前累计 24,949 颗 Star，今日新增 482 颗、本周新增 560 颗，热度持续攀升，已成为隐私敏感型研究人员与企业知识库场景的优先选项。

## 核心架构与技术细节

技术栈采用前后端分离架构：后端 Python + FastAPI 提供完整 REST API，前端则从早期的 Streamlit 迁移至 Next.js + React（这也解释了仓库主语言为 TypeScript）。数据层使用对图、文档、向量混合查询友好的 SurrealDB，AI 编排层基于 LangChain，多厂商抽象则交由作者自研的 Esperanto 库统一封装。LLM/嵌入/语音支持矩阵覆盖 OpenAI、Anthropic、Ollama、LM Studio、Groq、Vertex AI、Mistral、DeepSeek、xAI、OpenRouter、DashScope (Qwen)、MiniMax 等 18 家供应商，语音侧额外接入 ElevenLabs 与 Deepgram。部署方面提供 docker-compose 一键启动、单容器变体及拆分式生产配置，启动后默认监听 `http://localhost:8502`。

## 竞品对比与生态站位

CNET 评测以"I Love NotebookLM, but This Open-Source Version Could Tempt Me to Switch"为题，认可其隐私优势与跨笔记本共享源的灵活性——这是 NotebookLM 至今无法实现的。相对而言，NotebookLM 在引用追溯、UI 打磨、播客自然度上仍占上风。在开源阵营中，open-notebook 与 Hugging Face 上的 Open NotebookLM 形成差异化：后者偏向云端在线 Demo，前者强调本地全栈可控，更接近 SurfSense、Quivr 这类自托管 RAG 平台的形态，但播客生成是其独到护城河。

## 开发者反馈与局限性

Issue 区暴露若干现实痛点：#299 讨论指出代码内硬编码的"每本笔记最多 50 个源"限制，1.2.4 仅部分修复；#639 反映播客生成因 `_resolve_model_config()` 未透传 `max_tokens` 导致长稿失败；#353 提示 RAG 未自动激活时上下文易超限；#345 显示 Qwen3-32B 等本地模型在多源对话中频繁报 "Failed to send messages"；#139 则记录 Ollama 503 报错。引用功能官方亦自承"basic, will improve"。整体而言，项目工程化速度快但稳定性与企业级精修仍需打磨。

## 附带链接

- 仓库：<https://github.com/lfnovo/open-notebook>
- 官网：<https://www.open-notebook.ai>
- Esperanto 多厂商抽象库：<https://github.com/lfnovo/esperanto>
- CNET 评测：<https://www.cnet.com/tech/services-and-software/i-love-notebooklm-but-this-open-source-version-could-tempt-me-to-switch>
- 部署实操教程：<https://mydeveloperplanet.com/2026/01/19/open-notebook-a-secure-alternative-to-google-notebook-lm>
