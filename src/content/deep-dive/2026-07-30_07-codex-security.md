---
title: "Codex Security：OpenAI 把 AI 代码审计做成了 CLI"
date: "2026-07-30"
generated: "2026-07-30 07:00"
source: "HN"
slug: "2026-07-30_07-codex-security"
summary: "OpenAI 开源了 `@openai/codex-security`，一个用于发现、验证并修复代码安全漏洞的命令行工具与 TypeScript SDK。它要求 Node.js 22 与 Python 3.10 以上，安装后通过 `"
---

# Codex Security：OpenAI 把 AI 代码审计做成了 CLI

## 事件背景

OpenAI 开源了 `@openai/codex-security`，一个用于发现、验证并修复代码安全漏洞的命令行工具与 TypeScript SDK。它要求 Node.js 22 与 Python 3.10 以上，安装后通过 `npx @openai/codex-security scan .` 即可对仓库发起扫描，底层调用的是 `gpt-5.6-terra` 等模型，并可指定审查深度（effort）。官方建议账号通过 Trusted Access（Cyber 计划，TAC1/Daybreak）认证以获得最佳效果。发布当天遭遇了认证故障，团队随后在 0.1.1 版本合并修复。

## 核心观点 / 产品机制

它本质上是一个围绕 OpenAI 现有模型构建的安全审计"外壳"（harness）：把扫描、漏洞验证、生成修复补丁封装成 CI 友好的流程，扫描历史保存在本地工作台状态目录。凭证方面支持 ChatGPT 登录或 `OPENAI_API_KEY`/`CODEX_API_KEY`，两者并存时交互式扫描会提示选择。SDK 侧提供 `CodexSecurity` 类，一行 `security.run(".")` 即可拿到报告路径，方便嵌入自动化管线。

## 社区热议与争议点

争议集中在"价值"与"成本"两端。开发者 dangelosaurus（官方成员）坦承模型 guardrails 过于保守，导致大量"不允许"的拒绝，而私有代码扫描失败仍会烧掉 token——minraws 抱怨一次失败竟消耗了公司 100 多美元额度却"颗粒无收"。另一方向，game_the0ry 猜测此类工具会否让 Snyk 这类公司出局；krater23 更尖锐地质疑 Snyk 模式本身："谁愿意把自己的代码上传给专门找漏洞的公司？怎么保证他们展示全部发现而非把最好的卖给三字母机构？"也有人（paxys）为其辩护：整个 Codex 都是模型外壳，但专用 harness 依然有价值。还有人拿它对标 45k star 的 usestrix/strix 与阿里刚开源的 open-code-review。

## 行业影响与未来展望

这标志着大厂正把 AI 安全审计从"聊天问答"推向"可集成 CI 工具"的形态，直接冲击传统 SAST/依赖扫描厂商。但拒绝率高、token 成本不可控、私有代码信任边界等问题若不解决，专业安全团队短期内难以完全替代。正如 binsquare 所言，它更可能是"抬高了门槛"，逼迫真正的持久专业能力随之上升，而非一夜取代人类专家。

## 附带链接

- HN 讨论：https://news.ycombinator.com/item?id=49089755
- 原始仓库：https://github.com/openai/codex-security