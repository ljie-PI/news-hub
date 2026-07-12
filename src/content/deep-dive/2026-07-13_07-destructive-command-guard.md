---
title: "Dicklesworthstone/destructive_command_guard"
date: "2026-07-13"
generated: "2026-07-13 07:00"
source: "GitHub"
slug: "2026-07-13_07-destructive-command-guard"
summary: "AI 编码 agent（Claude Code、Codex、Gemini、Copilot 等）偶尔会执行 `git reset --hard`、`rm -rf ./src`、`DROP TABLE users` 等灾难性命令，秒杀数小时未提交的工作。dcg 作"
---

---
title: "Dicklesworthstone/destructive_command_guard"
date: 2026-07-13
source: github
slug: destructive-command-guard
---
# Dicklesworthstone/destructive_command_guard

## 1. 定位与痛点剖析
AI 编码 agent（Claude Code、Codex、Gemini、Copilot 等）偶尔会执行 `git reset --hard`、`rm -rf ./src`、`DROP TABLE users` 等灾难性命令，秒杀数小时未提交的工作。dcg 作为一个高性能 hook，在命令执行前拦截并阻断，同时给出解释与更安全的替代方案，专治「代理手滑毁项目」。

## 2. 核心架构与技术细节
Rust 编写，主打亚毫秒级延迟与 SIMD 加速过滤（据自述）。内置 50+ 安全包，覆盖数据库、Kubernetes、Docker、AWS/GCP/Azure、Terraform。支持 heredoc 与内联脚本扫描（如 `python -c "os.remove(...)"`），并做上下文识别：拦截 `rm -rf /` 但放行 `grep "rm -rf"`。采用 fail-open 设计，超时或解析失败不阻断工作流；机器可读输出走 stdout，富文本 UI 走 stderr。

## 3. 竞品对比与生态站位
定位为跨 agent 通用防护层，兼容 Claude Code、Codex、Gemini、Copilot、Cursor、Hermes Agent、Grok、OpenCode 等主流工具，并提供 CI 扫描模式接入 pre-commit。相比各家零散的内建限制，dcg 以统一 hook + TOML 配置 + 分 agent 信任档案取胜。

## 4. 开发者反馈与局限性
GitHub 2805 星、单日 +444，热度显著。局限：延迟与拦截率等指标均为项目自述，未见独立验证；Aider 仅支持 git hook、Continue 仅检测；fail-open 意味着极端情况下可能漏拦。

## 5. 附带链接
- 仓库：https://github.com/Dicklesworthstone/destructive_command_guard
