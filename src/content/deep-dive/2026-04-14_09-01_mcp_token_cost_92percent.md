---
title: "We cut MCP token costs by 92%"
date: "2026-04-14"
source: "Reddit"
slug: "2026-04-14_09-01_mcp_token_cost_92percent"
summary: "**来源**: r/AI_Agents  "
---

# We cut MCP token costs by 92%

**来源**: r/AI_Agents  
**日期**: 2026-04-14  
**链接**: https://www.reddit.com/r/AI_Agents/

---

## 1. 事件背景

MCP（Model Context Protocol）作为 Anthropic 推出的 AI 工具调用标准协议，已成为 AI Agent 生态的重要基础设施。然而，随着开发者在实际项目中大规模使用 MCP，一个严重的经济问题浮出水面：**MCP 服务器在每次工具调用时会向模型传递大量元数据（工具描述、schema、示例等），这些内容会快速消耗 token 配额，导致 API 成本远超预期**。

一篇在 r/AI_Agents 引发广泛讨论的帖子分享了团队将 MCP 工具调用的 token 成本削减 **92%** 的方法论，迅速成为社区最受关注的工程实践帖之一。

---

## 2. 核心观点 / 产品机制

**MCP 的 token 成本问题根源**：
- 标准 MCP 服务器在每次上下文刷新时都会重传所有工具的完整描述（包括参数 schema、示例、说明文字），对于拥有 20+ 工具的服务器，这部分 overhead 可高达 3,000-8,000 tokens/次
- 长对话中，工具描述会被重复计算数十次，导致实际业务内容只占总 token 消耗的 10% 以下

**核心优化策略**（帖主分享的方法）：

1. **工具描述压缩（Schema Pruning）**：将详细的参数说明精简为最小化的机器可读格式，去除所有为"人类可读性"而存在的说明文字，token 数量减少约 60%

2. **动态工具注册（Lazy Loading）**：不在初始化时注册所有工具，而是根据对话上下文按需加载相关工具，平均每次调用只传递 3-5 个相关工具而非全部 20+

3. **工具缓存前缀（Prompt Caching）**：利用 Anthropic API 的 prompt caching 功能，将稳定的工具描述标记为可缓存内容，缓存命中时仅收取 10% 的 token 费用

4. **工具调用结果压缩**：对工具返回的 JSON 结果进行摘要处理，只将关键信息传回模型，而非原始完整响应

**综合效果**：原本每次完整 MCP 会话消耗约 15,000 tokens，优化后约 1,200 tokens，降低 92%。

---

## 3. 社区热议与争议点

**工程实践的热烈讨论**：
- "工具描述压缩这个我们也在做，但激进压缩后模型对工具的理解准确率下降了约 15%，需要在成本和质量之间找平衡点，不是简单的越短越好。"
- 多位用户分享了不同的压缩率 vs 准确率 tradeoff 测试结果，形成了一个非正式的"最佳实践"数据集。

**批评与质疑**：
- "92% 这个数字的前提是你原来的工具描述写得特别冗长。如果你一开始就遵循了精简原则，实际改进空间可能只有 40-60%。"
- 有人指出动态工具加载增加了系统复杂度，"为了省钱引入了一套工具路由系统，维护成本可能比省下来的 API 费用还高"。
- 关于 prompt caching 的有效性：部分用户反映在工具描述频繁更新的场景下（如 CI/CD 中动态生成的工具），缓存命中率极低，效果大打折扣。

**MCP 协议本身的讨论**：
- 有开发者提出，这些优化本质上是在弥补 MCP 协议设计的不足，"Anthropic 应该在协议层面就内置工具描述缓存和懒加载机制，而不是让每个开发者自己实现"。
- 也有人指出，MCP 的 token overhead 问题让一些团队重新考虑使用更轻量的 function calling 方案，MCP 的优势在多 server 协同上，单一场景未必合适。

---

## 4. 行业影响与未来展望

MCP token 成本优化正在成为 AI Agent 工程领域的重要课题：

1. **经济性是规模化的关键**：当 AI Agent 从 demo 走向 production，token 成本直接影响产品的可盈利性，这类优化实践将越来越重要
2. **工具生态的标准化压力**：社区的优化实践反过来会推动 MCP 协议本身的迭代，Anthropic 可能会在未来版本中内置更多成本优化机制
3. **竞争格局**：Google 的 A2A（Agent-to-Agent）协议和 OpenAI 的 function calling 在 token 效率上与 MCP 的比较将成为开发者选型的重要维度
4. **工具压缩技术的专业化**：可能出现专门的 MCP schema 压缩工具/服务，就像 CSS/JS 压缩在 Web 开发中已经成为标配

---

## 5. 附带链接

- MCP 官方文档: https://modelcontextprotocol.io/
- Anthropic prompt caching 文档: https://docs.anthropic.com/en/docs/build-with-claude/prompt-caching
- r/AI_Agents: https://www.reddit.com/r/AI_Agents/
