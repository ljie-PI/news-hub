---
title: "agavra/tuicr"
date: "2026-07-31"
generated: "2026-07-31 07:00"
source: "GitHub"
slug: "2026-07-31_07-agavra-tuicr"
summary: "tuicr（读作\"tweaker\"）是一款运行在终端里的代码审查 TUI（文本用户界面）工具，带 vim 键位。它解决的痛点很具体：很多开发者和 AI 编码 agent 每天要审�"
---

---
title: "agavra/tuicr"
date: 2026-07-31
source: github
slug: agavra-tuicr
---

# agavra/tuicr

## 定位与痛点剖析
tuicr（读作"tweaker"）是一款运行在终端里的代码审查 TUI（文本用户界面）工具，带 vim 键位。它解决的痛点很具体：很多开发者和 AI 编码 agent 每天要审查大量 diff，但在浏览器里点开 GitHub/GitLab 网页做 review 既慢又打断心流，而命令行里 `git diff` 又缺乏结构化的评论与追踪能力。tuicr 面向重度终端用户、习惯 vim 的工程师，以及需要在本地快速过一遍未提交改动或任意 PR 的人，让整个审查过程留在终端内完成。

## 核心架构与技术细节
项目用 Rust 编写（当前约 1830 stars、157 forks），提供 GitHub 风格的连续 diff 流，可在一个界面里滚动浏览所有改动文件。它支持行级、范围级、文件级和 review 级的 PR 式评论，审查进度以文件或 hunk 粒度持久化、跨会话保留。三种导出目标是其亮点：直接把 review 推到 GitHub 或 GitLab、复制结构化 markdown 到剪贴板、或 pipe 到 stdout。工具同时兼容 git、jj（Jujutsu）和 mercurial 三种版本控制系统，可审查未提交改动、commit 范围或任意 GitHub PR / GitLab MR。安装方式覆盖 curl 脚本、Homebrew、cargo、mise、nix，并内置带 SHA-256 校验的 `tuicr update` 自更新。

## 竞品对比与生态站位
同类工具包括 GitHub 官方的 `gh pr` CLI、`delta`/`difftastic` 这类 diff 美化器，以及 lazygit、gitui 等 Git TUI。tuicr 的差异化在于它专注"审查"这一环节并把评论、追踪、多平台导出打通，而非通用 Git 客户端。对 jj/mercurial 的原生支持在同类中也较少见，站位是"终端原生的轻量 code review 层"。

## 开发者反馈与局限性
仓库 open issues 约 90 个，说明活跃迭代同时也暴露不少待打磨处；作为较新的 Rust 项目，稳定性和边缘场景（大型 PR、二进制 diff、冲突态）仍需时间验证。README 中的功能描述为项目自报口径，多平台导出在企业私有部署 GitLab 上的兼容性需实测。整体是一个方向清晰、适合终端工作流的新兴工具。

## 附带链接
- GitHub Repo: https://github.com/agavra/tuicr
- 官网: https://tuicr.dev
