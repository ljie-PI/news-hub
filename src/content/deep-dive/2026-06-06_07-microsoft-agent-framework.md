---
title: "microsoft/agent-framework"
date: "2026-06-06"
generated: "2026-06-06 07:00"
source: "GitHub"
slug: "2026-06-06_07-microsoft-agent-framework"
summary: "Microsoft Agent Framework（简称 MAF）是微软推出的多语言、生产级 AI Agent 与多 Agent 工作流框架，同时官方支持 Python 与 .NET。它瞄准的痛点是：开源圈 LangGrap"
---

---
title: "microsoft/agent-framework 深度调研"
date: "2026-06-06"
source: "GitHub"
slug: "microsoft-agent-framework"
---

# microsoft/agent-framework

## 一、定位与痛点剖析
Microsoft Agent Framework（简称 MAF）是微软推出的多语言、生产级 AI Agent 与多 Agent 工作流框架，同时官方支持 Python 与 .NET。它瞄准的痛点是：开源圈 LangGraph、CrewAI、AutoGen 大多停留在原型阶段，企业要把 Agent 从 demo 推向生产时会遇到持久化、可恢复、可观测、治理与 human-in-the-loop 的硬需求，而这些恰好是 .NET/Azure 系传统企业最在意的。MAF 把 AutoGen 的 group chat 与 Semantic Kernel 的工程化能力合并到一个统一抽象，目标用户是「需要把 Agent 上 production」的团队：希望模型供应商可替换（Microsoft Foundry、Azure OpenAI、OpenAI、GitHub Copilot SDK），希望编排能力超越单 prompt 或无状态 chat loop，并希望未来架构演进时不必整体重写。

## 二、核心架构与技术细节
仓库语言占比 Python 50.5% / C# 46.2% / TypeScript 2.8%，最新版本 `python-1.8.0`（2026-06-04），157 位贡献者、92 个 release，MIT 协议。核心能力包括：基于 graph 的编排模式（sequential、concurrent、handoff、group collaboration），内建 checkpointing、streaming、human-in-the-loop 与 time-travel 回滚；Middleware 体系负责请求/响应处理、异常与自定义 pipeline；Observability 通过 OpenTelemetry 原生接入分布式追踪；声明式 Agent 用 YAML 定义便于版本化；Agent Skills 可从文件、代码、库构建领域知识库；Foundry Hosted Agents 仅新增 2 行代码即可部署到 Foundry 托管基础设施；AF Labs 装载基准、强化学习、CodeAct 等实验包；附带 DevUI 做交互式开发与调试。Python 安装为 `pip install agent-framework`，.NET 走 `Microsoft.Agents.AI` 及 `Microsoft.Agents.AI.Foundry` 包。

## 三、竞品对比与生态站位
对比 LangGraph 只覆盖 Python、AutoGen 偏研究、CrewAI 偏轻量，MAF 的差异化在于「.NET 第一公民 + Azure Foundry 一键托管 + OpenTelemetry 原生 + 时间旅行」，是目前唯一在企业 .NET 栈里能与 Python 生态打平的多 Agent 框架，定位类似「Semantic Kernel 2.0 + AutoGen production」。

## 四、开发者反馈与局限性
11k stars、今日 +29 增速稳健，1.8k forks 与 157 贡献者说明早期已被微软内部及合作伙伴大量使用。局限：默认范例与 Foundry/Azure 紧耦合，非 Azure 用户需要自行接 OpenAI/Anthropic provider；graph workflow 抽象学习曲线高于 LangGraph；92 个 release 节奏快，API 仍在演进，长期稳定 API 需等 2.x。

## 五、相关链接
- GitHub: https://github.com/microsoft/agent-framework
- 官方入口: https://aka.ms/agent-framework
- 学习文档: https://learn.microsoft.com（Agent Framework 章节）
- Python 包: `agent-framework`；.NET 包: `Microsoft.Agents.AI`
