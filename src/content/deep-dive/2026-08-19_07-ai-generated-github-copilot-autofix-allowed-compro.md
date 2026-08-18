---
title: "AI-Generated GitHub Copilot “Autofix” Allowed Compromise of Snowflake's Jira"
date: "2026-08-19"
generated: "2026-08-19 07:00"
source: "HN"
slug: "2026-08-19_07-ai-generated-github-copilot-autofix-allowed-compro"
summary: "Wiz 的自主安全工具 Red Agent 在 Snowflake 公共仓库发现一处 GitHub Actions 命令注入。漏洞随六月十八日合并的 PR 上线，五天后被发现；攻击者只需提交特制 "
---

# AI-Generated GitHub Copilot “Autofix” Allowed Compromise of Snowflake's Jira

## 事件背景

Wiz 的自主安全工具 Red Agent 在 Snowflake 公共仓库发现一处 GitHub Actions 命令注入。漏洞随六月十八日合并的 PR 上线，五天后被发现；攻击者只需提交特制 issue 标题，即可窃取 Jira 凭证并读取工程、安全合规及漏洞赏金项目。Snowflake 接报当天修复，轮换令牌，并称审计未发现 Wiz 之外的访问。

## 核心观点 / 产品机制

工作流把不可信的 `${{ github.event.issue.title }}` 直接展开进单引号包裹的 shell；模板展开早于 `sed` 转义，单引号可逃逸并执行命令。所谓安全条件在 issue 事件里读取恒为空的 `pull_request`，实际只排除一个机器人。Red Agent 首次载荷因注释吞掉右括号而失败，随后自主改写闭合语法并完成外带。更关键的限定是：Copilot Autofix 的已知贡献在同一 PR 的另一文件；它参与检查并判定无问题，但漏洞代码是否由 AI 生成并不明确，标题容易过度归因。

## 社区热议与争议点

评论形成四组具体分歧。fn-mote 认为改动不显眼，larsonian 与 joombaga 则称这是明显的引号注入，后者会审查所有 `run` 块插值。forestry 强调同行评审，Twirrim 反驳人也未必能识别语义风险。eithed 指出 actionlint 的注入检查可捕获，thejosh 推荐 zizmor，说明专用规则可能比泛化“高级安全扫描”更有效。mjr00 认为 AI 让过去无暇处理的技术债变得可做；fg137 与 jacquesm 则追问半年后的维护成本，并警告小团队放任代理、缺少质保会走向失控。

## 行业影响与未来展望

事件不是“AI 写错、人类必胜”的简单故事，而是生成、评审与扫描同时漏检的供应链失效。企业应禁止事件数据直接进入 shell，以环境变量和 `jq --arg` 隔离数据与代码，并把 actionlint、zizmor 等规则设为合并门槛。随着攻防代理把发现窗口压到数小时，短期凭证、最小权限、可追溯审计和快速轮换将比单一 AI 审核更关键。

## 附带链接

- [Wiz 原文](https://www.wiz.io/blog/red-agent-snowflake-copilot-cicd-bug)
- [Hacker News 讨论](https://news.ycombinator.com/item?id=49331423)
