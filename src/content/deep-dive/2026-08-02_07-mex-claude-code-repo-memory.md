---
title: "mex：为 Claude Code 打造持久化仓库记忆，终结重复读代码"
date: "2026-08-02"
generated: "2026-08-02 07:00"
source: "Reddit"
slug: "2026-08-02_07-mex-claude-code-repo-memory"
summary: "一位开发者在 Reddit r/AI_Agents 发帖，讲述自己使用 Claude Code 时的痛点：每开启一个新会话，Agent 都会把同一个仓库从头到尾重新读一遍，既慢又烧 token�"
---

---
title: "mex：为 Claude Code 打造持久化仓库记忆，终结重复读代码"
date: 2026-08-02
source: reddit
slug: mex-claude-code-repo-memory
category: AI Agent
---

# mex：为 Claude Code 打造持久化仓库记忆，终结重复读代码

## 一、事件背景

一位开发者在 Reddit r/AI_Agents 发帖，讲述自己使用 Claude Code 时的痛点：每开启一个新会话，Agent 都会把同一个仓库从头到尾重新读一遍，既慢又烧 token。为解决这一问题，他开源了工具 **mex**（发帖时为 v0.7.0），并自报（自报口径）已获约 1,200 GitHub stars、帖子累计约 100 万浏览。此贴迅速在开发者社区引发共鸣。（社区讨论为议题层面归纳，非逐字引用。）

## 二、核心观点 / 产品机制

mex 的定位是「为 AI 编码 Agent 提供持久化项目记忆」。它用 Tree-sitter 将仓库解析为 AST，构建函数、类、导入等节点与调用、继承关系的代码图谱，并在硬性 token 预算下只返回评分后的「相关符号邻域」——包含紧凑签名、关系、节点 ID 与选择理由，而非大段源码转储。作者称（自报口径）相比 grep 可减少约 90% token，同时仍能命中每一个预期符号。它支持 CLAUDE.md、AGENTS.md、.cursorrules 等多种锚点，并可作为 MCP server 接入。

## 三、社区热议与争议点

支持者认为「结构化检索优于暴力 grep」切中要害，Claude Code 官方仅用字符串匹配而非 RAG 的做法长期被诟病。质疑声则集中在：90% 节省属自报口径缺乏独立验证；同类项目（如 Semble 自称减 98% token、Claude Context 超万星）竞争激烈，差异化存疑；此外有第三方扫描平台标记 mex 存在高危安全项，提醒用户接入前审阅。

## 四、行业影响与未来展望

mex 折射出 2026 年 AI 编码的核心矛盾：上下文窗口与 token 成本成为新瓶颈。围绕「让 Agent 只读该读的」正涌现一批工具，语义检索、代码图谱、增量记忆正逐步成为编码 Agent 的标配能力。未来官方 Agent 或将内建此类机制，第三方工具需在准确率与安全性上持续拿出可复现的基准。

## 五、附带链接

- Reddit 原帖：https://www.reddit.com/r/AI_Agents/comments/1vcrkn1/my_claude_code_kept_rereading_the_same_repo/
- mex GitHub：https://github.com/mex-memory/mex
