---
title: "what-stack-are-people-using-to-keep-openclaw-costs"
date: "2026-06-10"
generated: "2026-06-10 07:00"
source: "Reddit"
slug: "2026-06-10_07-what-stack-are-people-using-to-keep-openclaw-costs"
---

---
title: "《OpenClaw 成本优化栈大争论》深度解读"
date: "2026-06-10"
source: "Reddit Deep Dive"
slug: "what-stack-are-people-using-to-keep-openclaw-costs"
---

## 事件背景

r/openclaw 上一篇帖子《What stack are people using to keep OpenClaw costs down?》在两天内登上分区热榜。楼主公布了自己的四段栈：Ollama 跑本地琐事、DeepSeek Chat 跑常规 Agent 循环、Claude Sonnet 留给硬推理与最终检查、Badgr Auto 负责 token 清理与路由。他直言"目标就是不要把每一步都送给最贵的模型"。

这个话题之所以爆，离不开最近的 **Fable 5 涨价冲击**——主流前沿模型的输出价区段普遍抬到 $15–$25 / 1M token，而 OpenClaw 这种重度多轮 Agent 框架每个 task 动辄消耗 50–200 个 LLM call。社区里近期已有人晒账单："20 天从 $420 降到 $168"、"重度商用 24/7 跑 Opus 一个月 $800–$1500"。Stack-Junkie、Learn OpenClaw 等博客同步指出：**Opus 单 token 价格是 Haiku 的约 25 倍**，模型选型才是最大杠杆。Fable 5 把这个比例进一步拉大，让"只用一个旗舰模型"几乎成了奢侈消费，多模型分层路由才被推上必修课。

## 核心观点

帖中获赞最高的几条回复给出的共识是：

1. **分层路由 (Cascading Routing)**：按"任务复杂度"分发到不同价位模型。简单分类、文件读写、字符串处理交给本地 Ollama (Llama 4 Maverick / Qwen 3 8B)；中等推理、代码生成走 DeepSeek V4 或 Kimi K2；只有需要长链推理、最终决策时才升级 Sonnet/Opus。
2. **选型原则**：一是 *cost-per-correct-token*（同样答对一次的总成本），不是单价；二是 *fallback 必备*（一家挂了能切第二家）；三是 *本地兜底*（隐私 prompt 不出本机）。Tyler Folkman 的实测被反复引用：8 路路由把 2415 turn 压到 $76.77，比全用 GPT 5.5 便宜 94%，且 82% 流量都让 Kimi K2.6 吃掉了。

## 社区热议与争议点

**Ollama+DeepSeek+Claude 三段栈 vs 全 Claude 一锅煮** 是最大分歧。

- 支持分层派列出账单：每月省 60–80%；
- 反对派则反问："你省下来的 API 费用，够不够付你调试路由错误、修复上下文丢失、对账 token 计数的工时？" 有人贴出真实案例：一个 Ollama → DeepSeek 转交节点错误地把 system prompt 截断，导致 Claude 阶段拿到错误前文，最终 debug 花了 6 小时——按工程师时薪算，已经吃掉两个月的差价。
- 中间派给出折衷：**只做"本地小工 + 一个云端主力"两段**，避免引入第三、第四个 provider 带来的状态对齐成本。
- 还有人强调 **caching 与 pruning 比路由更划算**：开启 prompt cache 命中率 70% 以上时，Sonnet 的实际有效价能再砍 60%，比换模型更安全。

## 行业影响

这场讨论也把 **路由器生态** 推到聚光灯下。Manifest（开源 LLM Router）号称支持 600+ 模型、4 档（Simple / Standard / Complex / Reasoning）+ Coding/Vision 专用层，可优先消费 Claude Max 与 ChatGPT Plus 订阅额度，超额后再 fallback 到按量付费，官方实测节省 70%。Badgr Auto 走"token 清理 + 路由二合一"路线，被楼主作为默认入口。OpenRouter、LiteLLM 则继续做"统一 API 网关 + provider sort=price"的底座方案。Hermes Agent 等框架也已经内置 provider routing 配置，允许 sort/only/ignore/order 四维控制。可以预见，未来一年 OpenClaw / Hermes / Codex 这类 Agent 工具的"原生路由层"会变成标配，Anthropic、DeepSeek、Moonshot 之间的价格博弈也会被路由器实时套利。

## 附带链接

- 原帖：https://www.reddit.com/r/openclaw/comments/1u1kjhc/what_stack_are_people_using_to_keep_openclaw_costs/
- Manifest 路由器评测：https://andrew.ooo/posts/manifest-smart-llm-router-personal-ai-agents
- Tyler Folkman 的 2415-turn 实测：https://tylerfolkman.substack.com/p/i-tested-6-ai-models-across-3-providers
- OpenClaw 成本控制指南：https://www.stack-junkie.com/blog/openclaw-cost-control-manage-api-spending-without-killing-your-agent
- Hermes Agent Provider Routing 文档：https://hermes-agent.nousresearch.com/docs/user-guide/features/provider-routing
