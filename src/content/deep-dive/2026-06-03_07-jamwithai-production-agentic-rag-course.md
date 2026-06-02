---
title: "jamwithai-production-agentic-rag-course"
date: "2026-06-03"
generated: "2026-06-03 07:00"
source: "GitHub"
slug: "2026-06-03_07-jamwithai-production-agentic-rag-course"
---

---
title: "Production Agentic RAG Course：从关键词检索走到 LangGraph Agent 的 8 周实战课"
date: "2026-06-03"
source: "GitHub"
slug: "jamwithai-production-agentic-rag-course"
---

## 定位与痛点

`jamwithai/production-agentic-rag-course` 是一门免费、动手实操的 RAG 工程课程，主题为 **"The Mother of AI Project — Phase 1: arXiv Paper Curator"**。它瞄准的是当下 RAG 教程的两个典型痛点：其一，大量教程"AI-first"地直接堆 LLM + 向量数据库，忽视了搜索基础设施本身的成熟度，导致系统在生产中遇到长尾召回与延迟问题；其二，市面上的教程往往止步于 demo，缺少监控、缓存、Agent、外部交互（如 IM Bot）这种真实生产链路。作者明确强调："**我们以成功公司构建 RAG 的方式来构建——扎实的搜索基础先行，再用 AI 增强**"，并以学习者为中心铺设了 8 周渐进路径。

## 核心架构与技术细节

技术栈聚焦工程化：**Python 3.12+、FastAPI 0.115+、OpenSearch 2.19、Docker Compose**，配合 Airflow 做数据流水线编排、Langfuse 做 LLM trace 监控、Gradio 提供前端。课程章节循序渐进：

- **Week 1**：基础设施搭建（容器、服务编排）；
- **Week 2**：数据摄取流水线（arXiv 论文采集）；
- **Week 3**：OpenSearch 索引 + **BM25 关键词检索**——刻意先从传统检索打底；
- **Week 4**：**Chunking 策略与 Hybrid Search**（BM25 + 向量混合）；
- **Week 5**：接入 LLM，完成端到端 RAG；
- **Week 6**：**生产化**——监控（Langfuse）与缓存；
- **Week 7**：**Agentic RAG**——基于 LangGraph 的决策节点、文档打分（document grading）、自适应检索，并通过 **Telegram Bot** 暴露交互入口。

代码组织清晰：`src/services/agents/nodes/`、`agentic_rag.py`、`src/services/telegram/`、`src/routers/agentic_ask.py`，本地服务通过 `localhost:8000/docs`（FastAPI）、`:7861`（Gradio）、`:3000`（Langfuse）、`:8080`（Airflow）、`:5601`（OpenSearch Dashboards）分别暴露，便于学习者逐步观察每一层。

## 竞品对比与生态站位

与 LangChain 官方教程、LlamaIndex 文档、DeepLearning.AI 短课对比，本课程的差异点在于：(1) 不抽象掉基础设施，而是要求学生跑起 OpenSearch、Airflow、Langfuse 等真实生产组件；(2) 以 BM25 起步而非向量起步，体现工业界 hybrid 检索的实际偏好；(3) 配套 Substack 博客（`jamwithai.substack.com`）与 release tag（`week1.0` ~ `week7.0`），可按周回放代码状态。它的定位类似一门"RAG 版的 Full Stack Deep Learning"。

## 开发者反馈与局限

仓库目前 39 commits、处于 Week 7 Advanced Features 阶段，更新节奏紧凑。优势是每周都有配套博客与可复现代码 tag，对初学者友好。局限在于：(1) 主题绑定 arXiv 论文这一垂直域，迁移到企业私域知识需要二次改造；(2) 多服务编排门槛较高，机器资源紧张的学习者可能跑不动 OpenSearch + Airflow + Langfuse 全家桶；(3) Agent 部分仅基于 LangGraph 一种范式，未横向对比 CrewAI、AutoGen 等。整体而言，对于想从"会调 LangChain"进阶到"能交付生产 RAG 系统"的工程师，是当前 GitHub 上少见的高质量公开课。

## 附带链接

- GitHub：https://github.com/jamwithai/production-agentic-rag-course
- 配套博客：https://jamwithai.substack.com/
- Week 7 文章：https://jamwithai.substack.com/p/agentic-rag-with-langgraph-and-telegram
