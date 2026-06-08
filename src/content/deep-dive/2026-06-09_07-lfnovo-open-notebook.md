---
title: "lfnovo-open-notebook"
date: "2026-06-09"
generated: "2026-06-09 07:00"
source: "GitHub"
slug: "2026-06-09_07-lfnovo-open-notebook"
---

---
title: "lfnovo/open-notebook"
date: "2026-06-09"
source: "GitHub"
slug: "lfnovo-open-notebook"
---

## 定位与痛点剖析

`open-notebook` 是 Google **Notebook LM** 的开源、可自托管替代方案,定位非常明确:在 AI 主导的世界里,"思考与获取知识不应被单一供应商垄断"。它解决三个核心痛点——① 数据主权:Notebook LM 把素材上传到 Google 云,科研、法律、企业内部资料无法接受;② 模型锁定:Notebook LM 只能用 Google 自家模型,无法 A/B 不同 LLM;③ 工作流封闭:Notebook LM 不提供 API、不开放 podcast 主持人数定制。面向用户包括研究者、知识工作者、播客作者、企业知识库团队以及希望在本地跑 Ollama/LM Studio 的隐私敏感用户。仓库目前 27.9K stars,近 30 天涨 894 stars,Discord 与 issue 活跃度都不低。

## 核心架构与技术细节

技术栈横跨 Python + FastAPI 后端、Next.js + React 前端、SurrealDB 作存储、LangChain 编排,通过自研 `Esperanto` 库统一接入 18+ AI provider (OpenAI、Anthropic、Google GenAI、Vertex、Mistral、xAI、Qwen DashScope、MiniMax、Ollama、LM Studio、ElevenLabs、Deepgram 等)。功能模块:Source 摄取与转写、Notes、Citation、Content Transformations、**Podcast 生成 (1–4 位 speaker、自定义 profile)**、完整 REST API。部署方式:单容器 `Dockerfile.single` 或多容器 `docker-compose`,15-20 秒拉起 `http://localhost:8502` 即可用。它还附带 Ollama 全本地 compose 模板,实现"零外发"研究工作流。

## 竞品对比与生态站位

最直接对手是 Google Notebook LM (闭源、Google-only)、Perplexity Spaces (云端、付费)、SciSpace、Recall。同类开源项目还有 SurfSense、Khoj。`open-notebook` 优势在于:provider 矩阵最广、podcast speaker 数最灵活 (LM 仅 2 人)、完整 REST API 适合企业二次开发;劣势在于 citation 体系不如 Notebook LM 精细,UI 复杂度略高。生态层面,它已经成为 "self-hosted Notebook LM" 关键词下事实标准之一。

## 开发者反馈与局限性

社区反馈正面集中在隐私、Ollama 本地推理、多 provider 灵活性;Reddit 上常见赞美其 podcast 输出质量接近 Google。批评意见包括:首次配置 API key 与 encryption key 步骤稍多;SurrealDB 在某些 NAS/低资源环境上需要额外优化;TTS provider (尤其 ElevenLabs/Deepgram) 成本较高;citation 精度与 source-grounded answer 体验仍有提升空间,maintainer 已列入 roadmap。

## 附带链接

- GitHub: <https://github.com/lfnovo/open-notebook>
