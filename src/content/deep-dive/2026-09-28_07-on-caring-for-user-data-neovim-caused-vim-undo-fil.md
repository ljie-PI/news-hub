---
title: "On caring for user data: NeoVim caused Vim undo files to be deleted"
date: "2026-09-28"
generated: "2026-09-28 07:00"
source: "HN"
slug: "2026-09-28_07-on-caring-for-user-data-neovim-caused-vim-undo-fil"
summary: "原文转述计算机科学家 David Chisnall 的经历：他把 Vim 持久撤销当作跨重启、跨月找回编辑历史的保障；初试 Neovim 后，却发现共用目录中的旧撤销历史在两边都取不回，因而质疑项目对用户数据的照护。本批次冻结热度为 336 points、303 comments；调研时 Algolia 实取 286 个可见节点，未触及 500 上限。"
---

# On caring for user data: NeoVim caused Vim undo files to be deleted

## 事件背景
原文转述计算机科学家 David Chisnall 的经历：他把 Vim 持久撤销当作跨重启、跨月找回编辑历史的保障；初试 Neovim 后，却发现共用目录中的旧撤销历史在两边都取不回，因而质疑项目对用户数据的照护。本批次冻结热度为 336 points、303 comments；调研时 Algolia 实取 286 个可见节点，未触及 500 上限。

## 核心观点 / 产品机制
可核实的技术源头是 2021 年合并的 [PR #13973](https://github.com/neovim/neovim/pull/13973)：它把撤销格式版本从 2 升至 3，并写入 extmark 的字节级变更，以保证 Tree-sitter 和监听缓冲区事件的插件在恢复后正确工作。旧文件会报 E824；0.4 可用于恢复。关键边界是：写入代码只核对共同 magic、未核对版本便删除同名旧撤销文件。因此风险成立于用户让 Vim 与 Neovim 共用 `undodir`；默认目录本来分离，不能概括成所有安装都会删 Vim 数据。

## 社区热议与争议点
以下均为评论观点：`tmp_throwaway_q` 支持破坏兼容，强调格式有版本号、字节事件确有必要；`em-bee` 指出冲突依赖用户主动共用路径。反方 `cdmckay` 认为即使忽略旧数据也应警告，静默覆盖不可接受；`crote` 则反驳持久撤销默认关闭且不是备份，重要历史应交给版本控制。争论实质不是改格式能否成立，而是谁承担迁移与防误删成本。

## 行业影响与未来展望
这是一则兼容性工程教训：格式升级应采用命名空间隔离、版本感知写入、只读导入或显式确认，而不是让可恢复状态暴露于覆盖路径。当前 master 仍是版本 3；[PR #36262](https://github.com/neovim/neovim/pull/36262) 尝试在外部改文件后重同步撤销历史，但截至调研仍开放，且解决的是哈希失配，不是 Vim/Neovim 格式互通。

## 附带链接
- [原文](https://unsung.aresluna.org/they-had-no-concept-of-a-duty-of-care-to-their-users/)
- [Hacker News 讨论](https://news.ycombinator.com/item?id=49867067)
- [Mastodon 原帖](https://infosec.exchange/@david_chisnall/117171776562702259)
- [格式变更 PR #13973](https://github.com/neovim/neovim/pull/13973)
- [当前 undo.c](https://github.com/neovim/neovim/blob/master/src/nvim/undo.c)
