---
title: "Automattic/harper"
date: "2026-07-25"
generated: "2026-07-25 07:00"
source: "GitHub"
slug: "2026-07-25_07-automattic-harper"
summary: "Harper 是由 Automattic 维护的离线、隐私优先语法检查器，用 Rust 编写，主打快与小。它直面现有方案的痛点：作者认为 LanguageTool 虽强，却需数 GB 内存并�"
---

# Automattic/harper

## 定位与痛点剖析
Harper 是由 Automattic 维护的离线、隐私优先语法检查器，用 Rust 编写，主打快与小。它直面现有方案的痛点：作者认为 LanguageTool 虽强，却需数 GB 内存并下载约 16GB 的 n-gram 数据集，且检查一份中等文档常要数秒；而云端语法服务则牺牲隐私、依赖联网。Harper 的答案是——毫秒级完成检查、内存占用不到 LanguageTool 的五十分之一（此为项目自报口径），且完全在本地运行、不上传任何文本，从而在速度、体积与隐私三者间取得平衡。

## 核心架构与技术细节
项目为 Rust 主导的大型 workspace，拆分为众多 crate：harper-core 是核心引擎，harper-brill 处理词性标注，harper-ls 提供符合 LSP 的语言服务器，harper-wasm 则将引擎编译为 WebAssembly，使其小到能在浏览器（writewithharper.com）里运行。围绕不同文本格式还有 harper-html、harper-tex、harper-typst、harper-asciidoc、harper-git-commit 等专用解析 crate，以及 Python 绑定与桌面端。这种模块化让同一核心可嵌入编辑器、CLI、浏览器扩展与 CI 等多种载体。许可为 Apache-2.0。

## 竞品对比与生态站位
Harper 的主要对标对象是 LanguageTool 与 Grammarly：相较前者，它以极小内存与毫秒延迟取胜；相较后者，它免费、开源且完全本地化，无隐私顾虑。凭借 harper-ls，它已接入 VS Code、Neovim、Helix、Emacs、Zed 及 Obsidian，生态位牢牢卡在"开发者与写作者的本地语法层"。

## 开发者反馈与局限性
项目已获约 12.2k star（近期增长约 1560），4460 次提交，背靠 Automattic 与活跃贡献者社区，成熟度高。最大局限是目前仅支持英语——核心虽可扩展至其它语言，但需社区贡献；此外作为基于规则与词性的检查器，它在复杂语义改写上不及大模型驱动的方案，团队则把长检查耗时明确视为 bug 来对待。

## 附带链接
- GitHub: https://github.com/Automattic/harper
- 官网: https://writewithharper.com
