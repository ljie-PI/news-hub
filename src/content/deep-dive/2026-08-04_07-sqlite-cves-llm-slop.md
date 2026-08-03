---
title: "SQLite Critical CVEs or LLM Slop?"
date: "2026-08-04"
generated: "2026-08-04 07:00"
source: "HN"
slug: "2026-08-04_07-sqlite-cves-llm-slop"
summary: "近日，一个新创建的 GitHub 仓库（programmervuln/cveadvisory-）批量发布了一组针对 SQLite 的漏洞公告。NVD 迅速将其中多条标记为\"严重\"（Critical），CISA 的 ADP �"
---

---
title: "SQLite Critical CVEs or LLM Slop?"
date: 2026-08-04
source: hackernews
slug: sqlite-cves-llm-slop
---
# SQLite Critical CVEs or LLM Slop?

## 事件背景

近日，一个新创建的 GitHub 仓库（programmervuln/cveadvisory-）批量发布了一组针对 SQLite 的漏洞公告。NVD 迅速将其中多条标记为"严重"（Critical），CISA 的 ADP 也表示认同。然而当 JFrog 安全研究团队深入核实后，这些声称的漏洞纷纷崩塌。研究员 Afek Berger 认为，这批 50 多条 CVE 极可能是"LLM slop"——即由大语言模型生成、看似专业实则虚假的漏洞报告。

## 核心观点

JFrog 通过隔离环境验证了这些公告：克隆官方 SQLite 仓库、在 Docker 中编译对应版本、并用 AddressSanitizer 逐条执行 PoC。结果发现四大破绽：一是被引用的代码在目标版本中根本不存在，例如 `exprComputeOperands()` 直到 2025 年才加入；二是 PoC 载荷无法触发任何崩溃；三是这些 CVE 均未出现在 SQLite 官方公告页面；四是用 GPTZero 检测时，所有公告都被判定为 AI 生成内容。对 55 条公告的审计显示，54 条完全捏造，仅 1 条包含真实缺陷但被套上未经验证的元数据。

## 社区热议与争议点

支持方指出，问题根源在于 CVE 提交流程缺乏身份验证——任何人都能通过 MITRE 表单提交漏洞描述并自拟 CVSS 分数。而 NIST 自 2024 年 2 月起因报告激增暂停了深度分析，原有的人工审核"安全网"失效，导致虚假公告可畅通无阻地流入 GHSA、下游数据库和企业扫描器。反对与担忧方则强调，这类 slop 会让组织浪费大量时间去修补根本不存在的漏洞，污染漏洞数据库；在自动化优先处理 Critical 漏洞的环境中更会形成真实负担。

## 行业影响与未来展望

最令人警惕的是 AI 驱动的漏洞分诊场景：一个 AI 智能体遇到捏造 CVE 时，可能尝试定位并不存在的函数、生成补丁或建议修改，反而把安全团队引向完全错误的方向。JFrog 给出识别 slop 的红旗信号：缺乏厂商官方佐证、无 commit 或 PR 链接、元数据矛盾、引用不存在的代码或超出文件末尾的行号。团队建议不要盲信来源不明的新 CVE，应主动核实评分、确认环境是否真受影响，并在安全环境中复现 PoC。JFrog 已将结果正式上报 GHSA、Red Hat 和 NVD。

## 附带链接

- 原文：https://research.jfrog.com/post/sqlite-critical-cves-or-llm-slops/
- SQLite 官方漏洞页：https://sqlite.org/cves.html
- NVD 项目转型公告：https://nvd.nist.gov/general/news/nvd-program-transition-announcement
