---
title: "When you turn off telemetry, Anthropic also disable experiment gates"
date: "2026-04-14"
generated: "2026-04-14 09:00"
source: "Reddit"
slug: "2026-04-14_09-03_telemetry_experiment_gates"
summary: "**来源**: r/ClaudeAI / GitHub anthropics/claude-code  "
---

# When you turn off telemetry, Anthropic also disable experiment gates

**来源**: r/ClaudeAI / GitHub anthropics/claude-code  
**日期**: 2026-04-14  
**链接**: https://github.com/anthropics/claude-code/issues/34178

---

## 1. 事件背景

2026 年 3 月，Claude Code 用户在 GitHub 上发现一个关键 bug（Issue #34178）：当用户通过设置 `DISABLE_TELEMETRY=true` 来关闭 Anthropic 的内部遥测数据收集时，**他们同时也被悄悄关闭了所有功能特性开关（Feature Flags）的更新**，从而无法获得新功能——包括 Opus 4.6 的 1M token 上下文窗口、Channels 功能等付费功能。

这一问题迅速蔓延到 Reddit，成为隐私权与产品功能捆绑争议的热点话题。

---

## 2. 核心观点 / 产品机制

**技术根源**：Claude Code 的代码中，遥测上报系统（基于 Anthropic 内部工具 Statsig）和功能特性分发系统共用了同一个开关函数 `fW()`。当 `DISABLE_TELEMETRY` 被设置时，该函数同时切断了向 Anthropic GrowthBook 实例的通信，导致客户端无法接收功能旗标（Feature Flag）的更新。

**受影响的用户群体**：
- 企业安全团队强制禁用遥测的 Team/Enterprise 订阅用户
- 注重隐私的个人用户（尤其是在医疗、法律等敏感领域工作的用户）
- 使用 air-gapped 环境的开发者

**Anthropic 的官方回应**：确认了 bug 的存在，表示遥测控制和功能特性分发"不应该被耦合在一起"，承诺在后续版本中解耦。但截至报告发布时，修复进度未公开。

---

## 3. 社区热议与争议点

**隐私权角度的强烈反弹**：
- "所以如果你不让 Anthropic 监视你的使用行为，你就不能用你已经付费的功能？这是用产品功能来胁迫用户接受数据收集。" 这条评论获得了大量点赞。
- 另一位用户列举了 GDPR 条款，认为在欧洲这种设计可能构成违规：功能性数据处理和分析性遥测必须分开征得用户同意。

**开发者视角的技术批评**：
- "这是非常糟糕的架构设计。Feature flags 应该走独立的配置分发渠道，而不是绑定在遥测系统上。这让我对 Anthropic 的工程质量产生了怀疑。"
- Issue #38450 进一步记录了 Channels 功能同样受到影响，有用户付费了 Max 计划却因关闭遥测而看不到 Channels 入口，完全不知道原因。

**Anthropic 内部人员的回应**：
- 在 GitHub 上，一位 Anthropic 工程师承认这是"不应该发生的耦合"，但回应语气被部分用户认为"太轻描淡写了"。
- 有用户反讽："感谢 Anthropic 用技术手段诚实地表达了他们的立场：隐私 vs 功能，你只能选一个。"

---

## 4. 行业影响与未来展望

这一事件触碰了 AI 工具商业模式中最敏感的神经：**数据获取与产品价值的隐性捆绑**。类似的设计模式在 SaaS 行业并不罕见（如 Google Analytics 免费模式），但在标榜"安全第一"的 AI 公司身上出现，格外刺眼。

未来趋势：
1. 监管压力将迫使 AI 工具商明确区分"功能性数据传输"和"分析性遥测"
2. 企业采购 AI 工具时，遥测控制能力将成为安全评估的标配项
3. 开源替代品（如本地部署的 Claude Code 类工具）可能借此机会获得更多企业用户

这一事件提醒所有 AI 工具用户：**"免费功能"背后的代价，往往是数据。**

---

## 5. 附带链接

- GitHub Issue #34178: https://github.com/anthropics/claude-code/issues/34178
- GitHub Issue #38450: https://github.com/anthropics/claude-code/issues/38450
- GitHub Issue #25141: https://github.com/anthropics/claude-code/issues/25141
