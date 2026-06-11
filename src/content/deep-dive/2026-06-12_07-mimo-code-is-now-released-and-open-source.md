---
title: "mimo-code-is-now-released-and-open-source"
date: "2026-06-12"
generated: "2026-06-12 07:00"
source: "HN"
slug: "2026-06-12_07-mimo-code-is-now-released-and-open-source"
---

---
title: "MiMo Code is now released and open-source 深度调研"
date: "2026-06-12"
generated: "2026-06-12 07:00"
source: "Hacker News"
slug: "mimo-code-is-now-released-and-open-source"
---

## 1. 事件背景

2026 年 6 月 10 日，小米 MiMo 团队正式开源 **MiMoCode v0.1.0**——一个"终端原生"的 AI 编码代理（agent harness），代码托管于 [XiaomiMiMo/MiMo-Code](https://github.com/XiaomiMiMo/MiMo-Code)，采用 **MIT 协议 + Use Restrictions** 双重条款。该项目延续小米 MiMo 系列的命名脉络：此前 MiMo 团队已陆续发布 MiMo-V2-Flash（309B 总参 / 15B 激活的 MoE 推理模型）与 MiMo V2.5 Pro 闭源 API；本次开源的是**外壳层（harness）**而非新权重，默认捆绑的模型为 MiMo V2.5（百万 token 上下文），并以"MiMo Auto"匿名通道提供限时免费额度。HN 帖子 6 月 11 日发布即冲到 394 分、217 条评论，登上当周首页。

## 2. 核心机制与产品特性

MiMoCode **fork 自 OpenCode**，保留多 provider、TUI、LSP、MCP、插件等基底，主要增量在四块：(1) **持久化记忆** —— 基于 SQLite FTS5，跨会话维护 `MEMORY.md`、`checkpoint.md`、`notes.md` 与 `tasks/*/progress.md`；(2) **智能上下文管理** —— 自动 checkpoint、按预算重建上下文；(3) **多 Agent 编排** —— `build` / `plan` / `compose` 三种主代理 + 可并行子代理 + `/goal` 由独立 judge 模型判定终止条件；(4) **自进化** —— `/dream` 提炼会话经验，`/distill` 把重复手工流程打包成技能。还有 **Max Mode**（best-of-5 并行采样 + judge 选优）、TenVAD + MiMo ASR 语音输入。基座模型 MiMo-V2-Flash 自报 SWE-Bench Verified **73.4%**、SWE-Bench Multilingual 71.7%，超过 DeepSeek V3.2，逼近 Sonnet 4.5。

## 3. 社区热议与争议

HN 评论呈两极。**赞**：`sdesol` 写道"MiMo v2.5 Pro 是第一个让我觉得'为何还要用 Claude Sonnet'的中国模型"，`tietjens` 称"蒙眼测试很难分清 Opus 和 MiMo"；`miroljub` 认为 DeepSeek、Kimi、MiMo 三家协作推进，让"OpenAI/Anthropic 在质量+价格上已无法竞争"。**疑**：`thot_experiment` 直斥小米是"开源吸血鬼——fork OpenCode、不回馈上游、还附加可能与许可证冲突的使用限制"；`pmdlt` 同问"为什么不直接给 OpenCode 提 PR"；`WhereIsTheTruth` 嘲讽用 TypeScript npm slop 写 harness 是"benchmaxxing"的信号；`emulio` 警告 `curl … | bash` 安装方式对桌面用户不安全；多人吐槽页面默认中文、iframe 套娃破坏浏览器翻译。

## 4. 行业影响与未来展望

MiMoCode 的发布把"开源代码 agent harness"赛道再次拉到聚光灯下——在 Claude Code 闭源、Gemini CLI 被 Antigravity 取代的背景下，`tdesilva` 评论"harness 本就该开源、LLM 应被视为商品，降低消费者切换成本"获得高赞。对中文区开源 LLM 生态而言，小米的入局意味着 DeepSeek（模型）+ Kimi（长上下文）+ MiMo（端到端 agent + 终端硬件渠道）形成更完整的协同矩阵，而小米手机/汽车/IoT 的分发能力可能成为它独有的护城河。短期看争议会聚焦在 license 合规与上游回馈；中长期，若 MiMo V2.5 Pro 的 Sonnet 级体验+低价被验证，将持续压缩西方闭源厂商的溢价空间。

## 5. 附带链接

- HN 讨论：<https://news.ycombinator.com/item?id=48490826>
- 发布页：<https://mimo.xiaomi.com/mimocode>
- 长程编码博客：<https://mimo.xiaomi.com/blog/mimo-code-long-horizon>
- GitHub：<https://github.com/XiaomiMiMo/MiMo-Code>
- 配套模型 MiMo-V2-Flash：<https://github.com/XiaomiMiMo/MiMo-V2-Flash> / HuggingFace `XiaomiMiMo/MiMo-V2-Flash`
