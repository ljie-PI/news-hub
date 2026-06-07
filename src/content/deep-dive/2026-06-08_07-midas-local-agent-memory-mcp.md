---
title: "midas-local-agent-memory-mcp"
date: "2026-06-08"
generated: "2026-06-08 07:00"
source: "Reddit"
slug: "2026-06-08_07-midas-local-agent-memory-mcp"
---

---
title: "深度解读：Midas 100% 本地 Agent 记忆方案（MCP + Python SDK）"
date: "2026-06-08"
generated: "2026-06-08 07:00"
source: "Reddit"
slug: "midas-local-agent-memory-mcp"
category: "deep_dive"
reddit_category: "AI Agent"
---

## 一、事件背景

r/AI_Agents 上 Archic 团队发布了 Midas：一个号称 100% 本地、零 LLM 调用即可完成 agent 记忆 ingest 的方案，提供 MCP server（`midas-mcp`）与 Python SDK，可接入 Claude Code、Cursor、Codex、Windsurf 等编辑器/agent。其卖点是"不烧 token、零延迟、数据不出本机"，并给出可复现指标：LongMemEval-s 上 recall@k 达 0.95、在 $0 ingest 成本下与"LLM-ingest SOTA"打平。

## 二、核心观点

- 主流"agent memory"工具每轮都要调 LLM 做事实抽取，token 成本与隐私风险叠加；Midas 用规则+检索栈替换 ingest 端的 LLM。
- 通过向 agent 注入一份 memory policy，让 agent 自行决定保留什么，从而避免 ingest 阶段的额外推理。
- 重要性（importance）权重大于时间衰减（recency），实现"选择性遗忘"，避免上下文被噪声淹没。
- 评测优先（eval-first）的开发流程：每次改动都跑 LongMemEval-s 的"埋点证据"子集，确保 recall 不退化。

## 三、社区热议与争议点

1. **"无 LLM ingest"是否实质等价**：质疑者指出 importance 判定本身可能依赖 embedding 模型，仍属"小模型成本"；楼主回应称仅使用本地嵌入与启发式规则，不会发送任何外部请求。
2. **与已有方案对比**：有人列出 Local Context Memory MCP、mem0、Letta 等，争论谁的 recall/precision 更优；社区普遍呼吁统一基准。
3. **MCP 生态成熟度**：部分用户报告 midas-mcp 在 Windsurf 下偶发握手超时，对 MCP server 跨客户端兼容性提出疑问。
4. **隐私/合规视角**：法务向开发者点赞"nothing leaves the box"路线，认为这是 GDPR / 企业内网部署的关键卖点。

## 四、行业影响与未来展望

Midas 的出现是 agent memory 赛道从"调 LLM 抽事实"向"本地小栈 + 检索 + 规则"回归的重要信号。它把 ingest 成本压到接近零，意味着"记忆"不再是高频付费操作，而是可以默认开启的基础设施。可以预见三条演进路径：(1) MCP 生态出现更多"本地优先"组件（记忆、向量库、知识图谱）；(2) 评测层面 LongMemEval、MemBench 等将成为 agent 工具链准入指标；(3) 企业内部 IDE/Agent 部署会优先选择能审计、可断网运行的方案。Midas 用 $0 ingest 给出了一个具体而务实的样本。

## 五、附带链接

- 原帖：<https://www.reddit.com/r/AI_Agents/comments/1tzo8fl/midas_100_local_agent_memory_no_llm_at_ingest_0/>
- Midas 官网：<https://archic.es>
- MCP Python SDK：<https://github.com/modelcontextprotocol/python-sdk>
