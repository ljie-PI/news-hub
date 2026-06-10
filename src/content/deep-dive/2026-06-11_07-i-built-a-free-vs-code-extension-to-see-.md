---
title: "i-built-a-free-vs-code-extension-to-see-"
date: "2026-06-11"
generated: "2026-06-11 07:00"
source: "Reddit"
slug: "2026-06-11_07-i-built-a-free-vs-code-extension-to-see-"
---

---
title: "I built a free VS Code extension to see exactly what your Copilot sessions are costing - with cache break analysis and tool call impact"
date: "2026-06-11"
source: "Reddit"
category: "Vibe Coding"
slug: "i-built-a-free-vs-code-extension-to-see-"
---

## 一、事件背景

在 r/GithubCopilot 子板块，开发者 MilkAffectionate6113 发布了一款自研的免费 VS Code 扩展，目标是让开发者一眼看清自己 GitHub Copilot agent 模式下每一次会话到底花了多少钱、token 都流向了哪里。作者坦言起因纯粹是"用 Copilot agent mode 用上瘾后，开始好奇 token 到底跑去哪了"——这个困惑实际上代表了 2026 年大批 vibe coding 用户的共同焦虑：自从 Copilot、Cursor、Claude Code 推出 agent 模式后，单次"让 AI 自己写完一个 feature"的对话动辄消耗几十万乃至上百万 token，账单端却只给出一个汇总数字，缺乏可解释的归因。这款扩展正是为了填补这一巨大的"成本黑箱"。

## 二、核心观点

作者列出了几项硬核功能：**1）按会话维度展示美元成本**，覆盖所有 workspace；**2）每次 LLM 调用的详细拆解**——输入 token、缓存 token、输出 token、延迟时间一目了然；**3）智能识别 prompt cache 失效原因**，包括 context compaction（上下文压缩）、model switch（模型切换）、tools changed（工具集变化）、retry（重试）、provider eviction（服务方主动驱逐）等多种触发场景；**4）Tool call leaderboard**，告诉你哪个工具调用消耗了最多 token——这对调试自定义 MCP server 或排查"为什么 grep 一下要烧两万 token"的场景特别有用；**5）SQLite 持久化存储**，便于做历史趋势分析。整体设计哲学非常清晰：Copilot 自己会在 `~/.copilot/session-state/<uuid>/events.jsonl` 写下结构化事件流（包括 `assistant.message` 的 outputTokens 和 `session.shutdown` 的完整 modelMetrics），这个扩展只是把官方但隐藏的数据"翻译"成开发者能消化的可视化面板。

## 三、社区热议与争议点

评论区呈现典型的"叫好+追问"两极氛围。一派开发者直呼"终于有人做了"，分享自己每月 Copilot 账单从 39 美元飙到上百美元却找不到原因的真实痛点——Facebook 的 vibecodinglife 群组里就有人抱怨"今天 token 消耗简直疯了"。许多人立刻问：能不能扩展到 Claude Code、Codex、Cursor？显然 cross-vendor 的统一成本观测已经成为刚需。另一派则关心准确性：由于 GitHub Copilot 不公开自家的内部 token 定价，扩展只能用对等的 API rate 估算（gpt-4o 2.5/10 美元、Claude Opus 15/75 美元等），实际账单可能有偏差。还有讨论聚焦在 cache break 分类的工程价值——一旦能精准定位"是哪一次工具变更导致 KV cache 失效"，开发者就能在 Agent prompt 设计阶段主动减少 cache miss，从而把成本砍掉 30% 以上。少量质疑声则担心隐私：把会话元数据写入本地 SQLite 是否会被组织安全策略拦截，企业版用户希望看到可配置的数据留存策略。

## 四、行业影响与未来展望

这款扩展的走红揭示了 2026 年 vibe coding 生态的一个重要拐点：**可观测性（observability）正在成为 AI 编程工具的下一个战场**。当 agent mode 成为主流，单次会话的不确定成本让开发者从"按月订阅"心态被迫转向"按 token 成本意识"，类似云计算从包年包月走向 FinOps 的演进路径正在 AI 工具链上重演。可以预期接下来会涌现一批"AI Coding FinOps"工具：跨平台（Copilot / Cursor / Claude Code / Codex）的统一仪表盘、团队级别的 token 预算和告警、prompt 与工具调用层面的 A/B 成本对比、cache hit rate 优化建议等等。Anthropic、OpenAI、GitHub 本身也大概率会把这类能力下沉到 SDK 与 IDE。对独立开发者而言，这款免费扩展提供了立竿见影的价值；对厂商而言，这条赛道既是营销机会也是责任——透明化的成本归因终将成为 AI 编程工具的基础设施级特性。

## 五、附带链接

- 原帖：[I built a free VS Code extension to see exactly what your Copilot sessions are costing](https://www.reddit.com/r/GithubCopilot/comments/1u2folk/i_built_a_free_vs_code_extension_to_see_exactly/)
- 同类参考工具：[Eating Token - Copilot Token Tracker (VS Code Marketplace)](https://marketplace.visualstudio.com/items?itemName=manishsatwani.eatingtoken)
- 背景阅读：[GitHub Copilot Token Usage Explained with Practical Cost Control (Medium)](https://medium.com/simform-engineering/github-copilot-token-usage-explained-with-practical-cost-control-03062b15ecb0)
- 子版块：[r/GithubCopilot](https://www.reddit.com/r/GithubCopilot/)
- 关键技术点：`~/.copilot/session-state/<uuid>/events.jsonl`、prompt cache invalidation、tool call token attribution
