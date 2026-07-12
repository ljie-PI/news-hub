---
title: "What xAI's Grok build CLI sends to xAI: A wire-level analysis"
date: "2026-07-13"
generated: "2026-07-13 07:00"
source: "HN"
slug: "2026-07-13_07-grok-build-cli-wire-analysis"
summary: "研究者用 mitmproxy 对 xAI 官方编码工具 Grok Build CLI（grok 0.2.93）做了线级抓包，所有测试均在自有机器、使用伪造 canary 密钥完成，并附 SHA-256 证据链。"
---

---
title: "What xAI's Grok build CLI sends to xAI: A wire-level analysis"
date: 2026-07-13
source: hackernews
slug: grok-build-cli-wire-analysis
---
# What xAI's Grok build CLI sends to xAI: A wire-level analysis

## 1. 事件背景
研究者用 mitmproxy 对 xAI 官方编码工具 Grok Build CLI（grok 0.2.93）做了线级抓包，所有测试均在自有机器、使用伪造 canary 密钥完成，并附 SHA-256 证据链。

## 2. 核心观点/产品机制
分析证实三点：一是 Grok 读取文件（含 `.env`）时会将内容原样明文上传至 `/v1/responses` 与 `/v1/storage`；二是即使提示"不要读任何文件"，它仍把**整个仓库打包成 git bundle**连同 git 历史上传，克隆回来能还原从未被读取的 canary 文件；三是数据落入 GCS 桶 `grok-code-session-traces`，且关闭"改进模型"开关也无法阻止（`trace_upload_enabled` 仍为 true）。12GB 仓库实测上传 5.10GiB。

## 3. 社区热议与争议点
freakynit 直言"这正是我放弃 Grok 的原因，尽管 grok-4.5 够好、定价有竞争力"，认为窃取整库极其可怕。讨论延伸到"OpenAI/微软是否也能访问私有 repo"，GitHub Copilot 工程师 taywrobel 现身反驳：即便微软员工访问 GitHub 资源也需独立入职与分级审计，极少数人能看私有库且会通知库主。但 lstodd 从 infosec 角度追问"能否绝对保证无第三方外泄"，taywrobel 坦承"无人能给绝对答案"，凸显信任边界之争。

## 4. 行业影响与未来展望
默认开启、无法关闭的全库上传触及企业代码保密红线，或将促使团队回避消费级 AI CLI、推动审计与合规工具兴起。传输已被证实，是否用于训练仍是政策悬念。

## 5. 附带链接
- 原文: https://gist.github.com/cereblab/dc9a40bc26120f4540e4e09b75ffb547
- HN 讨论: https://news.ycombinator.com/item?id=48877371
