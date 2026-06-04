---
title: "llms-hacking-vulnerable-app"
date: "2026-06-05"
generated: "2026-06-05 07:00"
source: "HN"
slug: "2026-06-05_07-llms-hacking-vulnerable-app"
---

---
title: "花 1500 美元测 LLM 能否黑揉身身的应用？"
date: "2026-06-05"
generated: "2026-06-05 07:00"
source: "Hacker News"
slug: "llms-hacking-vulnerable-app"
---

## 1. 事件背景

独立开发者 Kasra Rahjerdi 于 6 月 3 日发布实验报告，记录他亲手构建一个名为 **BookNook** 的"有意漏洞"应用（React Native + FastAPI），并花费 1500 美元 API 调用费，测试 15 款主流 LLM 能否独立发现并利用漏洞、最终读取另一名用户的私密书评（夺旗）。帖子在 Hacker News 取得 376 分、203 条评论，跻身当周热门。作者本意"图个乐子，非严谨学术评测"，但结果意外戳中了业界对 AI 安全能力与厂商护栏边界的争议神经。

## 2. 核心机制

漏洞设计模拟真实世界中常见的 **Firebase / Supabase 配置失误**：FastAPI 后端本身严密，但安卓包内的 `google-services.json` 暴露了 Firebase 凭据，攻击者只需直连 Firebase 注册账号即可绕过 API、直接读 Firestore 数据库（属 OWASP "Broken Access Control / 对象级授权缺失"）。

测试约束：每模型 10 次跑，每跑封顶 10 美元、2 小时；统一使用 pi 框架 + pi-goal-x 扩展强制模型坚持完成。最终结果（节选）：

| 模型 | 解题率 | 单次成功成本 |
|------|--------|--------------|
| **GPT-5.5** | 7/10 | $9.46 |
| DeepSeek-V4-Pro | 3/10 | $0.62 |
| Claude Sonnet 4.6 / Opus 4.8 | 各 2/10 | $16–46 |
| Gemini 3.1 Pro / 3.5 Flash | 0/10 | — |

GPT-5.5 几乎每跑都能"反 APK→锁定 Firebase"。Claude 多数能走到正解，却因安全护栏或预算用尽中断。Gemini 直接以"安全原因"拒绝（中位 token 仅 9k）。作者脚注调侃："中国模型在攻击数据库时明显更放得开。"

## 3. 社区热议与争议点

HN 讨论几乎一边倒地聚焦 **Anthropic 护栏过紧**。高赞评论 SOLAR_FIELDS 指出：Claude 失分非能力不足，而是被服务端注入的安全提示中断了思维链。前 Anthropic 内部人士 jerrythegerbil 透露：一旦关键词命中，系统会在每次 tool call 注入冗长警告并切换为"单步推理"，导致 token 烧光也无果——"没人真的拿 Opus 做安全研究"。

更具杀伤力的是 **swatcoder 的"商业化阴谋论"**：今天的限制，是明天 "Claude Security Professional"、"Claude Database Pro" 付费档的伏笔。反方 swiftcoder 反驳：只要开源权重模型还在追赶，封闭厂商不可能长期"卡脖子"，DeepSeek v8 Pro 这类"无枷锁"替代品迟早接盘。另有大量用户吐槽 Claude 连"帮我反编译自己的旧代码"、"展示我硬盘里的个人文件"也拒绝执行。

## 4. 行业影响

这是 2026 年继 OWASP 把 prompt injection 连续两年列为 LLM Top 10、EU AI Act 第 55 条强制对抗性测试后，又一个把"LLM 作为攻击者"的能力差距摆上台面的民间基准。它与 Mindgard、Hadrian.io 等机构发布的 2026 红队报告呼应——**模型攻击力正快速接近初级渗透测试员，但厂商对齐策略正在系统性削弱该能力**。对企业而言，安全审计若押注 Claude/Gemini，需为"被拒"留预算；对 OpenAI，"安全研究白名单"成为隐形护城河；对开源阵营，则可能因"无拘束"反获取专业用户。这也再次提醒应用层：Firebase / Supabase 客户端凭据外泄仍是被严重低估的高发漏洞。

## 5. 链接

- 原文：<https://kasra.blog/blog/i-spent-1500-seeing-if-llms-could-hack-my-app/>
- HN 讨论：<https://news.ycombinator.com/item?id=48392343>
- 挑战 ZIP：<https://course-files.kasra.codes/challenge.zip>
- 参考报告：Mindgard《AI Red Teaming Statistics & Benchmarks 2026》、arXiv 2504.10112《Benchmarking Practices in LLM-driven Offensive Security》
