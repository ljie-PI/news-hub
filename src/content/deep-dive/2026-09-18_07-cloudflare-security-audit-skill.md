---
title: "cloudflare/security-audit-skill"
date: "2026-09-18"
generated: "2026-09-18 07:00"
source: "GitHub"
slug: "2026-09-18_07-cloudflare-security-audit-skill"
summary: "这是面向编码代理的源码优先安全审计 Skill，服务于代码所有者与安全工程师。它针对单代理容易受上下文、单一路径和误报影响的问题，把侦察、漏洞搜寻、反证与报告拆开；只有建立真实信任边界、源码链路及可观察结果，才确认漏洞，纯加固建议不升级为发现。"
---

# cloudflare/security-audit-skill

## 定位与痛点剖析

这是面向编码代理的源码优先安全审计 Skill，服务于代码所有者与安全工程师。它针对单代理容易受上下文、单一路径和误报影响的问题，把侦察、漏洞搜寻、反证与报告拆开；只有建立真实信任边界、源码链路及可观察结果，才确认漏洞，纯加固建议不升级为发现。

## 核心架构与技术细节

流程共六阶段：先生成 `architecture.md` 与确定性 `coverage-ledger.json`，再把覆盖单元交给隔离 hunter，并由 coverage critic 查漏；每个候选交给未参与发现的新 verifier 反证。最终 `findings.json` 区分 `confirmed`、`needs_validation`、`rejected`，两个零依赖 Node.js 校验器约束发现和覆盖账本，报告再由已验证记录派生。目标代码只能在断网、限资源、只写 scratch 的操作系统沙箱运行；重复审计会复用旧账本补缺。README 称其测试中单轮约找到多轮总发现的一半，属于自报口径。

## 竞品对比与生态站位

Semgrep 依赖规则执行 SAST、SCA 与密钥扫描，CodeQL 把代码建库后用查询找漏洞，二者更适合可重复的持续集成。该项目更像 Agent Skills 生态中的审计编排层：优势是可追踪业务逻辑、跨文件信任边界并强制独立复核；代价是结果受模型、代理平台与预算影响，且仍需 Node.js、并行子代理和强沙箱，因此不能替代确定性扫描器。

## 开发者反馈与局限性

issue #20 的小样本盲测自报中位精确率九成，但明确指出离线设计无法核对新 CVE、领域正确性可能落在攻击分类之外，结论只能视作有限信号。issue #21 报告覆盖校验器可接受不存在的本地证据；修复 PR #34 尚未合并，不能算已修复。issue #5 反馈自动触发会被其他 Skill 抢占，issue #11 则报告 Antigravity 会终止并行子代理，说明可移植性高度依赖宿主实现。

## 附带链接

- GitHub Repo：https://github.com/cloudflare/security-audit-skill
- README：https://raw.githubusercontent.com/cloudflare/security-audit-skill/main/README.md
- 对比测试 issue：https://github.com/cloudflare/security-audit-skill/issues/20
- 证据校验 issue：https://github.com/cloudflare/security-audit-skill/issues/21
- 修复 PR：https://github.com/cloudflare/security-audit-skill/pull/34
- Cloudflare 技术文章：https://blog.cloudflare.com/build-your-own-vulnerability-harness/
- Semgrep 文档：https://semgrep.dev/docs/
- CodeQL 文档：https://codeql.github.com/docs/
