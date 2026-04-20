---
title: "Anthropic 悄然下调 Claude Code 缓存 TTL——一场静默的成本转嫁"
date: "2026-04-13"
generated: "2026-04-13 00:00"
source: "HN"
slug: "2026-04-13_00-anthropic_cache_ttl_downgrade"
summary: "2026 年 3 月 6 日，多位 Claude Code 用户发现自己的 prompt cache TTL（生存时间）从长期以来稳定的 1 小时被大幅下调到 5 分钟。最初用户以为这是 regression 或"
---

# Anthropic 悄然下调 Claude Code 缓存 TTL——一场静默的成本转嫁

## 事件背景

2026 年 3 月 6 日，多位 Claude Code 用户发现自己的 prompt cache TTL（生存时间）从长期以来稳定的 1 小时被大幅下调到 5 分钟。最初用户以为这是 regression 或基础设施故障，但随后 Anthropic 维护者 Jarred Sumner 在 GitHub issue（anthropics/claude-code#46829）中确认：**这是一次有意为之的优化变更。** 此举在开发者社区引发轩然大波，许多人认为 Anthropic 在“悄悄涨价”——因为 5 分钟 TTL 意味着任何超过 5 分钟的休息都会触发昂贵的 cache creation 重写，而非廉价的 cache read 复用。

## 核心观点/产品机制

### 变更的精确时间线

该用户通过分析自己 119,866 次 API 调用的 JSONL 日志，还原出了完整的变更曲线：

| 日期阶段 | TTL 行为 |
|---------|---------|
| 1 月 11 日 – 1 月 31 日 | 5m  only |
| **2 月 1 日 – 3 月 5 日** | **1h ONLY（连续 33 天以上几乎纯 1h）** |
| 3 月 6 日 – 7 日 | 混合过渡 |
| **3 月 8 日起** | **5m 成为主导（83%）** |

### 经济影响（来自用户实测）

用户计算了自己两台机器上的真实账单：

- **Claude Sonnet 4.6**：2026 年 3 月比“假设全 1h”多付了 25.9%（约合 $719）。
- **Claude Opus 4.6**：同一时期多付了 25.9%（约合 $1,198）。

核心经济逻辑：cache creation 写入成本约为 $3.75–6.25/MTok，而 cache read 复用成本仅约 $0.30–0.50/MTok。写入成本是读取成本的 **12.5 倍**。

### Anthropic 的回应

维护者 Jarred Sumner 表示：

- **这不是 regression**：1h-only 的阶段“从来就不是稳态设计”，只是 prompt cache 优化过程中的一部分。
- **TTL 由客户端按请求动态选择**：不存在全局默认值，系统会根据预期的 cache 复用模式为每次请求选择 5m 或 1h。
- **全用 1h 反而会更贵**：1h cache write 的费率约是 2× base input，而 5m write 仅 1.25×。对一次性调用（无后续复用），1h 是严格更贵的。
- **已修复一个客户端 bug**：在 v2.1.90 中修复了订阅配额耗尽切换到透支模式后，会话错误地停留在 5m TTL 的 bug。

Anthropic 拒绝了用户恢复 1h 默认或提供配置开关的请求。

## 社区热议与争议点

**批评方： Anthropic 正在系统性“阉割”服务以削减成本**

- **andai**："Everything points towards 'desperately trying to cut costs'" — 他列举了推理强度降低、使用量下降、禁止第三方 harness 等多重变化。
- **matheusmoreira**："I certainly noticed a significant drop in reasoning power at some point after I subscribed to Claude." 他采取了禁用 adaptive thinking、修改 system prompt 等自救手段。
- **stavros**：语气最为激烈："Changing the limits mid-subscription is just theft."
- **estimator7292**：指出普通 9-5 的 Claude CLI 用户正在“用相同的价格买到更差的模型”。

**辩护/理性派：这不是故意坑人，而是供需失衡的结构性调整**

- **stingraycharles**：认为 Anthropic 处理得还可以，用户仍然可以用折扣价获得 openclaw 的积分，而且 Anthropic 还送了一个月积分。
- **felixgallo**：援引 isitnerfed.org 的数据称“看起来没有什么被真正 nerfed，但情绪确实变负面了”。
- **simianwords**："Running a frontier lab comes with tradeoffs between training, inference and other areas... it's not in Anthropic's interest to screw customers."
- **jeremyjh**：最简洁的总结："The hypothesis that makes the most sense is not that they are idiots, but that they have no choice. They cannot meet the new demand."

## 行业影响与未来展望

这场争论本质上揭示了 AI 基础设施行业的一个核心矛盾：当需求呈指数级增长时，即使是最顶尖的前沿实验室也可能面临推理产能不足。在此压力下，优化 prompt cache TTL 是一种相对于“直接涨价”更隐蔽、但同样有效的成本转嫁方式。然而，恰恰因为变更是静默的，用户通过自有数据发现了规律，社区信任反而受损更深。

长远来看，这可能加速两类趋势：一是开发者对本地推理（local LLM）的兴趣，因为本地运行不受云端缓存策略和配额波动的影响；二是市场对“黑盒式按 token 计费”的不满，推动更透明、可配置的服务契约。如果 Anthropic 不能在“成本控制”和“用户感知”之间找到更好的沟通方式，它的领先技术优势可能会被 rivals 的定价稳定性逐步侵蚀。

## 附带链接

- HN 讨论：https://news.ycombinator.com/item?id=47736476
- GitHub Issue：https://github.com/anthropics/claude-code/issues/46829
