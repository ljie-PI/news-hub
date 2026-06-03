---
title: "how-are-you-handling-retrieval-across-hundreds-of-"
date: "2026-06-04"
generated: "2026-06-04 07:00"
source: "Reddit"
slug: "2026-06-04_07-how-are-you-handling-retrieval-across-hundreds-of-"
---

---
title: "How are you handling retrieval across hundreds of meeting transcripts?"
date: "2026-06-04"
generated: "2026-06-04 07:00"
source: "Reddit"
slug: "how-are-you-handling-retrieval-across-hundreds-of-"
---

## 事件背景

r/LLM 一位企业用户发问：公司每周有数百场 Zoom/Teams 会议被自动转写，几个月后已经积累了上千份长文本（每份动辄数万 token）。他尝试过简单的向量检索 + GPT-4 摘要管线，结果发现"召回了一堆相似度高但完全不相关的片段"，跨会议的事实串联也总是断片。帖子在 r/LLM 引发关于会议转录场景下 RAG 工程实践的密集讨论。

## 核心观点

提问者列出了几个具体痛点：(1) 转录中含大量口语化噪声和说错又改正的句子，破坏 chunk 语义完整性；(2) 不同会议讨论相同项目，但术语、缩写、参会人不一致，单纯余弦相似度无法把它们关联起来；(3) 需要时间维度——"上周的 OKR 评审说了什么"——这是普通向量库不擅长的；(4) 跨会议归纳（如"过去一个月里 Alice 反复提到的风险"）远超单文档摘要能力。

## 社区热议与争议点

热门回复给出多套方案：第一派主张"先结构化、再检索"，用 LLM 把每场会议预处理成结构化 JSON（决议、动作项、风险、提及人物、引用项目），把结构化字段做混合检索（BM25 + 向量 + 元数据过滤），效果远胜直接 chunk；第二派推 GraphRAG / Microsoft GraphRAG，构建实体—会议—主题图谱，跨会议召回准确率显著提升，但搭建成本高；第三派建议引入时间感知重排（time-decay re-ranking）和 speaker-aware chunking，把发言人作为元数据；第四派直接推荐商业产品，如 Granola、Fireflies、Glean、Notion AI Meetings。争议点在于：到底应该"重 pipeline 轻模型"还是"重模型轻 pipeline"——有人坚持 Gemini 2.5/Claude 4 的百万级长上下文已经能把全部会议塞进去，无需 RAG；反对者认为长上下文成本与延迟都不现实。

## 行业影响与未来展望

会议转录是企业 RAG 最痛、最普适也最难做好的场景之一。讨论显示，单纯"向量库 + LLM"已经不够，结构化抽取 + 图谱 + 混合检索 + 时间维度的多层组合正成为新共识。预计 LlamaIndex、LangChain、Haystack 等框架将推出更多"会议专用"模板，同时垂类 SaaS 会以"长期记忆"为卖点重新洗牌生产力工具市场。

## 附带链接

- 原帖: https://www.reddit.com/r/LLM/comments/1tw33pc/
