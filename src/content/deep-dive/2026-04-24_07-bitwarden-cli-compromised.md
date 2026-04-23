---
title: "Bitwarden CLI 遭供应链攻击：Checkmarx 行动波及密码管理巨头"
date: "2026-04-24"
generated: "2026-04-24 07:00"
source: "HN"
slug: "2026-04-24_07-bitwarden-cli-compromised"
summary: "2026 年 4 月 22 日，安全研究公司 Socket 发现开源密码管理器 Bitwarden 的 CLI 工具（`@bitwarden/cli@2026.4.0`）在 npm 上被植入恶意代码，成为持续进行的\"Checkmarx "
---

# Bitwarden CLI 遭供应链攻击：Checkmarx 行动波及密码管理巨头

## 1. 事件背景

2026 年 4 月 22 日，安全研究公司 Socket 发现开源密码管理器 Bitwarden 的 CLI 工具（`@bitwarden/cli@2026.4.0`）在 npm 上被植入恶意代码，成为持续进行的"Checkmarx 供应链攻击行动"的最新受害者。Bitwarden 拥有超过 1000 万用户和 5 万家企业客户，是全球最受信赖的密码管理器之一。

攻击者利用 Bitwarden CI/CD 管线中一个被入侵的 GitHub Action，在 npm 包中注入名为 `bw1.js` 的恶意文件。据 Bitwarden 官方声明，恶意包仅在美东时间 4 月 22 日 17:57 至 19:30 之间的约 93 分钟内被分发，且仅影响通过 npm 安装 CLI 的用户——Chrome 扩展、桌面客户端等其他分发渠道未受影响。

## 2. 核心观点

**技术层面**：恶意载荷与此前 Checkmarx 事件共享同一 C2 端点（`audit.checkmarx.cx/v1/telemetry`），采用相同的 gzip+base64 混淆结构。其功能极为全面：

- **凭据窃取**：GitHub token（通过 Runner.Worker 内存抓取）、AWS/Azure/GCP 云凭据、npm 配置、SSH 密钥、Claude/MCP 配置文件
- **供应链传播**：利用窃取的 npm token 识别可写包并重新发布带后门版本；注入恶意 GitHub Actions 工作流以获取仓库 secrets
- **持久化**：向 `~/.bashrc` 和 `~/.zshrc` 注入载荷
- **俄语区域免疫**：检测到俄语系统 locale 后静默退出

值得注意的是，恶意代码中嵌入了大量《沙丘》系列意识形态标签——仓库描述 "Shai-Hulud: The Third Coming"、调试字符串 "Would be executing butlerian jihad!"、提交信息中的 "LongLiveTheResistanceAgainstMachines"——暗示攻击者可能与此前声称负责的 TeamPCP 组织存在分歧或伪装关系。

## 3. 社区热议与争议点

### 争议一：GitHub Actions 是否已成为系统性风险？

HN 用户 nozzlegear 直言"又一天，又一个涉及 GitHub Actions 的供应链攻击"，righthand 则将其比作"新的 npm"——暗指 GitHub Actions 正在成为安全事件的温床。反方观点认为 GitHub Actions 本身只是工具，问题在于项目方对第三方 Action 的审查不足和 pin 策略缺失。

### 争议二：实际影响范围到底多大？

sigmonsays 等用户第一时间追问"这是否意味着用户的密码库被泄露"，引发大量讨论。HN 用户 jeroenhd 指出 Socket 的文章"冗长且充斥通用建议"，而 Bitwarden 自身声明表明受影响窗口极短，仅通过 npm 安装的用户才会中招——绝大多数终端用户并未受影响。kbolino 也引用 Bitwarden 官方声明佐证。但 bhouston 警告不应低估影响，因为"这可能显著扩大此次攻击的爆炸半径"。

### 争议三：安全报告的质量问题

hgoel 批评 Socket 原文"读起来像 AI 生成的一团糟"，valicord 也质疑文章是否真正回答了关键问题。这反映出安全社区对"披露驱动营销"模式的不满——安全公司在发现漏洞后急于发布报告以获取关注，但报告质量和信息密度往往不尽如人意。

## 4. 行业影响与未来展望

此事件再次敲响警钟：**npm 生态与 GitHub Actions 的深度耦合正在成为供应链攻击的高效传播通道**。一个被入侵的 CI Action 即可将恶意代码注入拥有数百万用户的合法包中，形成"一次入侵、多级传播"的连锁效应。

短期来看，所有曾在窗口期通过 npm 安装 Bitwarden CLI 的用户应立即轮换所有机器上的凭据和密钥。中长期而言，行业需要：

1. **推动 GitHub Actions 的确定性构建**：强制使用 commit SHA 而非标签引用第三方 Action
2. **增强包注册中心的发布验证**：如 npm 的 provenance 签名和 Sigstore 集成
3. **建立 CI/CD 管线的零信任模型**：构建环境与发布环境的严格隔离

恶意代码中的俄语免疫机制和《沙丘》意识形态标签也为归因分析增添了复杂性——这究竟是同一组织的不同分支，还是刻意的虚假旗帜？这场"反机器圣战"远未结束。

## 5. 参考链接

- [Socket 原文：Bitwarden CLI Compromised in Ongoing Checkmarx Supply Chain Campaign](https://socket.dev/blog/bitwarden-cli-compromised)
- [Bitwarden 官方声明](https://community.bitwarden.com/t/bitwarden-statement-on-checkmarx-supply-chain-incident/96127)
- [Hacker News 讨论（581 分，270+ 评论）](https://news.ycombinator.com/item?id=47876043)
- [The Hacker News 报道](https://thehackernews.com/2026/04/bitwarden-cli-compromised-in-ongoing.html)
