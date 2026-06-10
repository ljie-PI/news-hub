---
title: "按\"任务可验证性\"路由 LLM：一个 120 例小实验印证 Karpathy 框架"
date: "2026-06-11"
generated: "2026-06-11 07:00"
source: "Reddit"
slug: "2026-06-11_07-routing-llms-by-task-verifiability-a-sma"
summary: "r/MachineLearning 上 u/DragonfruitAlone4497 发布了一篇标 [D] 的讨论帖，复现并验证了 **Karpathy 提出的\"任务可验证性（task verifiability）\"框架**在 LLM 路由场景下的"
---

---
title: "Routing LLMs by task verifiability: a small experiment (n=120, 3 models) inspired by Karpathy's framework [D]"
date: "2026-06-11"
source: "Reddit"
category: "ML / CV / NLP"
slug: "routing-llms-by-task-verifiability-a-sma"
---

# 按"任务可验证性"路由 LLM：一个 120 例小实验印证 Karpathy 框架

## 事件背景

r/MachineLearning 上 u/DragonfruitAlone4497 发布了一篇标 [D] 的讨论帖，复现并验证了 **Karpathy 提出的"任务可验证性（task verifiability）"框架**在 LLM 路由场景下的有效性。作者明确声明"directional, not a paper. n=120 tasks, one internal evaluator, not peer reviewed"，并强调自己虽然就职于一家 LLM infra 公司，但实验是个人时间完成、不代表公司立场。

Karpathy 的核心主张是：能被机器自动校验的任务（如代码编译通过、JSON 提取符合 schema）属于**高 verifiability**，使用 LLM 更安全，因为 verifier 可以兜底；而创意写作这类**低 verifiability**任务则没有自动校验手段，风险更大。作者把这个理论落到一个实操问题上：**对于高 verifiability 任务，弱模型 + verifier 能否逼近前沿模型？**

## 核心观点

实验配置：120 个任务分四类（**code unit tests、structured extraction、multi-hop reasoning、creative summarization**），三个模型横评：**Claude Sonnet 4.6 / GPT 5.5 / Mistral 3 8B（本地 vLLM 0.6.3）**。结果显著符合 Karpathy 框架预期：

| 任务类型 | Sonnet 4.6 | GPT 5.5 | Mistral 3 8B（首次 / 重试一次） |
|---|---|---|---|
| Code unit tests | 94% | 91% | 87% / **95%** |
| Structured extraction | 97% (修 schema 后 98%) | 94% | 89% / 96% |
| Multi-hop reasoning | 78% | 71% | **51%（重试无效）** |
| Creative summarization（1-5 评分） | 4.2 | 3.9 | 3.1 |

两个关键洞察非常硬核：

1. **高 verifiability 任务上，弱模型加一次 retry 就能逼平甚至超越前沿模型**——Mistral 3 8B 的 code unit tests 通过率 95%，已经超过 Sonnet 4.6 的初版 94%。在结构化抽取任务上，作者还发现一个 schema bug：Sonnet 4.6 一开始 96% 反而比 GPT 5.5 低，调查后发现是 nested array 设计有歧义。作者由此得出名言：**"Your verifier is only as good as your schema."**
2. **多跳推理是真实能力鸿沟、重试也救不了**。Mistral 3 8B 51% 的得分配上"重试时模型一致性地幻觉出相同错误推理路径"——这意味着推理失败不是 stochastic 的，retry 不能洗。这一条直接划出了"哪些任务必须用前沿模型"的清晰边界。

## 社区热议与争议点

评论区最高赞的 u/ArtSelect137 给 Karpathy 框架打了个重要补丁：**Karpathy 说了 what to route，没说 when to escalate**。他在自家系统里部署了一个 **Qwen2.5-1.5B 跑在 CPU 上（约 200ms / check）的小 verifier**，对每次 output 打 confidence 分，**< 0.7 就自动升级路由给大模型**。这种做法专门用于抓"plausible-but-wrong"——看起来对、其实假的答案——而且 CPU 部署不抢 GPU，使 latency / cost 几乎免费。这个补丁迅速被讨论区认可为"实操级方法论"，多位评论者称已在自家 pipeline 复制。

另一条争论围绕**样本量**。多位 ML 研究者指出 n=120 远不足以支持"弱模型 + verifier ≈ 前沿模型"的强结论，至少需要 1000+ 例并按任务难度分层；OP 在回复中承认这一点，并强调标题已明确"directional"。也有人提出一个反向假设：**实验里 Mistral 3 8B 排除了所有 prompt > 8k 的任务**（因为它在长上下文边缘会退化），这种采样选择本身偏向了"小模型友好"任务，结论会有 selection bias。

第三条争议涉及 **constrained decoding 是否会颠覆整个 calculus**——如果在 inference 阶段直接用 grammar-constrained sampling（XGrammar、SGLang 之类）把 JSON 输出锁在 schema 内，那么"weak model + verifier"的优势更明显，甚至可能让 verifier 完全退化为编译/正则检查。OP 也承认这是一个未控制的变量，未来需要单独实验。

## 行业影响与未来展望

这份小实验在 ML 圈被快速转发是因为它给一个高度抽象的理论提供了**第一手的数字桥梁**。对 LLM infra 团队来说，结论可以直接转译成**采购与路由策略**：

- 把 code generation、structured extraction、API call 等高 verifiability 任务降级到 8B 级开源模型 + 1–2 次 retry，可大幅节省 token 成本（粗略估算 5–10×）；
- 多跳推理、Agent planning、医疗法律分析等任务仍必须走前沿模型，重试无效；
- 在 router 层加 **CPU 小 verifier**（如 Qwen2.5-1.5B）做 confidence escalation，是 Karpathy 框架的"工程版补丁"，几乎零额外硬件开销。

更宏观地，这预示着 **LLM serving 架构正从"单模型推理"演化为"模型 + verifier + router"的三件套**。能跑通这个组合的团队，在同等用户体验下成本能压到前沿单模型方案的零头。Karpathy 框架未来很可能成为 LLM gateway / router 类产品的默认抽象层——TrueFoundry、Portkey、LiteLLM、OpenRouter 这类网关都可能内置"verifiability-aware routing"作为下一代标配。

## 附带链接

- 原帖：https://www.reddit.com/r/MachineLearning/comments/1u2c04u/routing_llms_by_task_verifiability_a_small/
- Karpathy 公开演讲提到 verifiability 框架的 X 帖（背景参考）：https://x.com/karpathy
- 相关 LLM 路由网关：https://www.truefoundry.com/fr/blog/claude-fable-5-vs-opus-4-8-benchmarks-pricing-when-to-use-each
