---
title: "microsofts-open-source-tools-were-hacked-to-steal"
date: "2026-06-10"
generated: "2026-06-10 07:00"
source: "HN"
slug: "2026-06-10_07-microsofts-open-source-tools-were-hacked-to-steal"
---

---
title: "《Microsoft 开源工具被黑窃取 AI 开发者密码》深度解读"
date: "2026-06-10"
source: "Hacker News Deep Dive"
slug: "microsofts-open-source-tools-were-hacked-to-steal"
---

## 事件背景

2026 年 6 月 5 日，GitHub 紧急下架了 Microsoft 旗下 Azure、Microsoft、Azure-Samples、MicrosoftDocs 四个组织共 **73 个仓库**，原因是攻击者通过一个被盗的贡献者账号向 `Azure/durabletask` 推送了恶意提交（`5f456b8`）。这是该项目在不到三周内的**第二次失陷**——5 月 19 日，同一账号已被用于在 PyPI 上发布带后门的 `durabletask` 1.4.1/1.4.2/1.4.3 版本（月下载量超 40 万）。Cloudsmith、StepSecurity、OpenSourceMalware 将此次攻击归因于正在蔓延的 **Miasma 蠕虫**——它脱胎于 5 月被 TeamPCP 公开源码的 Mini Shai-Hulud，已经接连污染 Bitwarden、Mistral、SAP、TanStack、OpenAI、Red Hat 云服务等多个生态。

## 核心机制：从"包污染"到"打开即中招"

与传统 npm/PyPI 投毒不同，这次攻击的真正杀手锏不是 `pip install`，而是仓库根目录被植入的五个配置文件：`.claude/settings.json`、`.gemini/settings.json`、`.cursor/rules/setup.mdc`、`.vscode/tasks.json`、`.github/setup.js`。开发者只要在 **Claude Code、Gemini CLI、Cursor 或 VS Code** 中打开这个文件夹，AI 编辑器便会按配置自动执行一段 4.6 MB 的混淆载荷，悄悄拉取 `rope.pyz`——一个模块化云入侵框架，并行扫描 AWS 凭证（含 IMDSv2、19 个区域的 Secrets Manager）、GitHub token、SSH key、`.npmrc`、浏览器 cookie 等。载荷还内置反沙箱逻辑（CPU≤2 退出、俄文 locale 退出），并通过 `--break-system-packages` 绕过 PEP 668 静默装依赖。

## 社区热议与争议点

由于本帖（id=48457830）发布仅 29 分钟、仅 5 分，尚未沉淀讨论；但 HN 围绕同一波 Shai-Hulud/Miasma 的姊妹帖（id=46035533、46032539，合计逾 450 条评论）已凝结出几类典型声音：

- **沙箱论**：`artisin` 力推用 **Bubblewrap (bwrap)** 包裹 `npm install`，认为这是阻断 install-time 代码执行最便宜的办法，比 rootless Podman 更轻量。
- **时间窗防御**：`splix` 开源了 [paranoid.js](https://github.com/emeraldpay/paranoid.js)，在 CI 阶段拒绝安装"过于新鲜"的包版本——他押注供应链攻击通常在两周内被曝光。
- **GitHub 失责**：`cyberpunk` 吐槽攻击者把双层 base64 编码的 AWS 凭证倾倒进公开仓库（命名 `Sha1-Hulud: The Second Coming`），而"GitHub 居然还让它们挂着"。
- **Trusted Publishing 缺位**：多名评论者指出 `durabletask` 未启用 PyPI 的 **OIDC Trusted Publishing**，仍依赖长寿命 `PYPI_API_TOKEN`，是凭证泄漏后被直接绕过 CI 的根因——连微软都没做到的最佳实践，更遑论中小项目。

## 行业影响与未来展望

此次事件标志着供应链攻击从"污染 registry"升级到"污染 AI IDE 工作区"——Cursor/Claude Code 的 `settings.json` 自动执行能力成为新攻击面。Microsoft 即便拥有 GitHub 母公司的资源，也未能在首次入侵后彻底轮换凭证，凸显**凭证生命周期管理与蠕虫式横向移动**的对抗仍处于守势。可以预见，企业将被迫推动 (1) PyPI/npm 全面切换 OIDC 短期凭证；(2) AI 编辑器的配置文件沙箱化或显式授权；(3) GitHub Actions 锁定到 commit SHA 而非 tag。否则，下一个 Shai-Hulud 变种只是时间问题。

## 附带链接

- [TechCrunch 原文](https://techcrunch.com/2026/06/08/microsofts-open-source-tools-were-hacked-to-steal-passwords-of-ai-developers/)
- [HN 讨论](https://news.ycombinator.com/item?id=48457830)
- [StepSecurity 技术分析](https://www.stepsecurity.io/blog/microsofts-durabletask-pypi-package-compromised-in-supply-chain-attack)
- [Redmondmag 行业报道](https://redmondmag.com/articles/2026/06/08/supply-chain-attack-hits-microsoft-github-repos.aspx)
- [HN 姊妹帖：Shai-Hulud 第二波](https://news.ycombinator.com/item?id=46035533)
