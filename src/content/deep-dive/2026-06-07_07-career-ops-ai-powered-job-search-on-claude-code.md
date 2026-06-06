---
title: "career-ops-ai-powered-job-search-on-claude-code"
date: "2026-06-07"
generated: "2026-06-07 07:00"
source: "GitHub"
slug: "2026-06-07_07-career-ops-ai-powered-job-search-on-claude-code"
---

---
title: "santifer/career-ops"
date: "2026-06-07"
source: "GitHub"
slug: "career-ops-ai-powered-job-search-on-claude-code"
repo: "santifer/career-ops"
url: "https://github.com/santifer/career-ops"
---

## 定位与痛点剖析

Career-Ops 是开发者 Santiago Fernández 把"找工作"这件事系统化、agentic 化的开源工具,定位为**构建在 Claude Code 之上的 AI 求职作战指挥中心**。痛点非常直接:企业普遍用 AI 过滤候选人,而候选人却仍在用 Excel 手动追踪 JD、改简历、写求职信——非对称。作者用这套系统**评估了 740+ 职位、生成 100+ 份个性化 CV、申请 66 个、获得 12 次面试,最终拿到 Head of Applied AI 职位**,把"系统本身就是作品集"做到了闭环。区别于 LinkedIn EasyApply 一类的"广撒网"工具,Career-Ops 明确反对 spray-and-pray,其定位是**过滤器**——评分低于 4.0/5 的岗位不建议投递。

## 核心架构与技术细节

系统采用多 agent 架构,以 **14 个 skill 模式**(`/career-ops scan/pdf/batch/tracker/apply/pipeline/contacto/deep/training/project` 等)对应不同任务。核心 pipeline 是:**Archetype Detection**(LLMOps / Agentic / PM / SA / FDE / Transformation 6 类原型分类)→ **A-F 六块结构化评估**(角色摘要、CV 匹配、级别策略、薪酬调研、个性化、STAR+R 面试准备)→ **报告 .md + ATS 优化 PDF + .tsv tracker** 三件套输出。技术栈方面,**Playwright** 负责实际抓取 Ashby / Greenhouse / Lever / Wellfound / Workable 等 ATS 招聘平台(预配置 45+ 家公司,涵盖 Anthropic、OpenAI、ElevenLabs、Sierra 等);**Go 写的 Bubble Tea TUI 仪表盘**用于浏览、筛选、排序整个 pipeline;PDF 用 Space Grotesk + DM Sans 字体生成并注入 JD 关键词。批处理通过 `claude -p` 多 worker 并行,自带去重、状态归一化与健康检查。

## 竞品对比与生态站位

商业产品如 **Teal、Huntr、Simplify、Jobscan、Final Round AI** 大多是 SaaS,功能集中在简历优化或自动填表;而 Career-Ops 走的是**"自带 CLI + 本地数据 + 多 AI 后端"**路线——支持 Claude Code、OpenCode、Gemini CLI(原生 `.gemini/commands/*.toml`)、即将支持 Codex,本质上是把任何 AI Coding CLI 改造为求职 Agent。这与同样在 GitHub 兴起的 `auto-apply` 类爬虫工具有本质区别:Career-Ops 强调 **Human-in-the-Loop——AI 评估并推荐,人来决策,系统从不替你提交申请**,这在伦理与法律灰区里是更可持续的姿态。

## 开发者反馈与局限性

ProductHunt 与 LinkedIn 上的讨论(daily.dev 转载 5.1K 浏览)对其"多 agent 找多 agent 岗位"的元命题评价积极,认为这本身就是最直接的能力证明。局限性也很明显:(1) **强依赖 Claude Code 等付费 CLI**,Gemini CLI 免费档每天仅 1M token,密集扫描容易触顶;(2) **冷启动质量差**——作者自己在 README 中强调"前几次评估不会很好",必须先喂入 CV、职业故事、proof point 等上下文;(3) Playwright 抓取受反爬机制影响,`--verify` 模式偶有失败;(4) 主要面向资深 AI 岗位调优,初级岗位 archetype 覆盖不足。

## 参考链接

- GitHub:https://github.com/santifer/career-ops
- 官网:https://career-ops.org
- 作者文章:https://santifer.io/career-ops-system
- ProductHunt:https://www.producthunt.com/products/santifer-io
