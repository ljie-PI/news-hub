---
title: "我用 $20/月的技术栈跑多家 $10K MRR 公司"
date: "2026-04-13"
source: "HN"
slug: "2026-04-13_09-20-month-tech-stack"
summary: "**日期**: 2026-04-13 | **来源**: Hacker News | **票数**: 774 | **评论**: 448"
---

# 我用 $20/月的技术栈跑多家 $10K MRR 公司

**日期**: 2026-04-13 | **来源**: Hacker News | **票数**: 774 | **评论**: 448

---

## 事件背景

作者 Steve Hanov 是一位连续创业者，运营多款独立产品，包括知名的 websequencediagrams.com 以及 eh-trade.ca（AI 驱动的股票研究工具）。他在文章中宣称，自己不依赖风险投资、不使用复杂云服务，依靠每月 $20 左右的技术栈实现多家公司各超 $10K MRR（月经常性收入）。这篇文章在 HN 获得 774 票，引发近 450 条讨论，核心争议在于：这套方法是否真的可复制，还是只适合特定技术背景与产品类型？

---

## 核心观点/产品机制

Steve 的"极简技术栈"主要由以下几层构成：

### 1. 单台 VPS（$5-$10/月）
放弃 AWS/EKS/RDS 这套企业级"账单陷阱"，选择 Linode 或 DigitalOcean，一台 1GB RAM 的 VPS 足够。他认为"1GB 让现代 Web 开发者感到恐惧，但如果你知道自己在做什么，完全够用"。配上 swapfile 作为缓冲。

### 2. Go 作为后端语言
相较 Python/Ruby，Go 内存占用极低，性能卓越，并且——关键优势——可以编译成单一静态二进制文件直接 scp 到服务器运行，零依赖，零虚拟环境，零 pip 地狱。文章中给出了一个只有十余行的完整生产级 HTTP 服务示例。

### 3. 本地 AI 代替 API 调用
对于 eh-trade.ca 的批量股票研究任务，他使用了 Facebook Marketplace 上买来的 RTX 3090（$900）配合 VLLM 跑本地大模型（如 Qwen3:32b），完全规避了 OpenAI API 的费用与 bug 重跑成本。升级路径：Ollama（快速迭代）→ VLLM（高并发生产）→ Transformer Lab（微调）。

### 4. OpenRouter 替代多厂商 API 管理
对于用户侧低延迟对话场景，他用 OpenRouter 统一接入 Claude / GPT-4o 等，并实现自动 fallback，"Anthropic 周二下线了，自动切 OpenAI，用户无感"。

### 5. GitHub Copilot 替代昂贵 IDE 订阅
他声称 Microsoft 对 Copilot 按请求（而非按 Token）计费，即使 Agent 跑了 30 分钟改了几百个文件，一次请求只需约 $0.04。策略是写超详细的 Prompt，"让 Satya Nadella 来补贴你的算力"。

### 6. SQLite 替代 PostgreSQL
文章（截断处）提到用 SQLite 处理数据库需求，配合 Cloudflare D1/Durable Objects 可实现 edge-local 数据库。

---

## 社区热议与争议点

**1. 关于 swapfile 的争议**（实用派 vs 工程派）

> **hackingonempty**: "你应该始终使用 swapfile/partition，即使你不想发生 swap。因为总有冷页面（cold pages），如果没有 swap 空间，这些内存就被浪费了，无法用于应用或缓冲。"

> **berkes** 回复: "有时候我反而希望服务器在 OOM 时立刻崩溃——在 Kubernetes-alike 系统中，崩溃后立刻重启比在降级状态下苟延残喘更好。但在 OP 这种共享 VPS 场景下，我更倾向于让 Linux 来处理恢复，而不是依赖监控系统。"

**2. GitHub Copilot 按请求计费是否真实？**（质疑派）

> **komat**: "文章缺少对 Claude Code 或 Coding Agent 的讨论，这一块感觉被跳过了。"

> **PhilippGille** 回复: "他明确提到用 GitHub Copilot 是因为 Microsoft 按请求而非按 Token 计费。"

这一点在社区引发广泛讨论——许多用户认为"per request 计费"在高强度使用中其实并非一直如此便宜，且 Copilot 的 Agent 模式能力和 Claude Code 仍有差距。

**3. Cloudflare D1 与本地 SQLite 的区别**（技术深度讨论）

> **sgarland**: "除非你的 Cloudflare Worker 和数据库在同一台物理服务器上，否则它们之间并不'本地'。"

> **kentonv**（Cloudflare Workers 首席工程师，亲自下场）: "Cloudflare 的 Durable Objects 确实将 Worker 和 SQLite DB 放在同一台物理服务器上，并支持在全球数百万个这样的对儿上轻松扩展。D1 是 DO 的简化封装，但 D1 **不**保证将 DB 放在同一台机器上，需要直接使用 DO 才能获得本地 DB。"

这是整个 HN 讨论中最具技术含量的子线程之一，由 Cloudflare 内部工程师亲自澄清了产品差异。

**4. 对"$10K MRR"定性的质疑**

多个评论者指出，文章展示的是技术手段而非商业模式，真正的门槛不是基础设施成本，而是**找到 PMF（产品市场契合）**。"运营成本低 ≠ 收入高，这两件事是正交的。"也有人指出 websequencediagrams.com 本身已有相当时间的积累和用户基础。

---

## 行业影响与未来展望

这篇文章的流行反映了 2026 年独立开发者（indie hacker）群体对"精简技术栈"的强烈共鸣——在 AI 工具泛滥、云成本飞涨的背景下，重新审视最小可行架构（Minimal Viable Architecture）的价值。

几个趋势值得关注：
- **本地 AI 作为基础设施**将变得更主流：RTX 3090 跑 32B 参数模型已经是可行的生产方案，随着边缘 AI 硬件价格持续下降，这条路会越来越宽。
- **GitHub Copilot 的定价博弈**：微软"按请求计费"的策略如果持续，将成为 AI 编程助手市场的结构性武器，直接削弱 Cursor 等高定价竞品的商业模式。
- **SQLite 复兴**：D1/Turso/Litestream 等让 SQLite 在分布式场景下重新可用，"一个文件搞定数据库"的简洁性正在被重新评估。
- **VC 与 Bootstrapper 的分野将加剧**：文章开篇被 pitch night 拒绝，但自己已有 MRR——这种"被资本看不上但活得很好"的独立创业者形象将越来越常见。

---

## 附带链接

- 原文: https://stevehanov.ca/blog/how-i-run-multiple-10k-mrr-companies-on-a-20month-tech-stack
- HN 讨论: https://news.ycombinator.com/item?id=47736555
