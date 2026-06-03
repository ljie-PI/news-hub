---
title: "jwasham-coding-interview-university"
date: "2026-06-04"
generated: "2026-06-04 07:00"
source: "GitHub"
slug: "2026-06-04_07-jwasham-coding-interview-university"
---

---
title: "jwasham/coding-interview-university"
date: "2026-06-04"
generated: "2026-06-04 07:00"
source: "GitHub"
slug: "jwasham-coding-interview-university"
---

## 定位与痛点剖析

Coding Interview University 是 John Washam 在准备 Google/Amazon 面试时整理的一份多月期、自学式 CS 学习计划。作者从零计算机基础（不知道 stack vs heap、不懂 Big-O、不会写排序）开始，每天学 8–12 小时坚持数月，最终入职 Amazon SDE，并把整套学习路径开源。痛点非常具体：面向"想转码进大厂、却苦于不知从何下手"的自学者，市面上算法书、在线课程、刷题平台各自割裂，缺少一份"按顺序勾选即可"的总入口。仓库以 CC-BY-SA-4.0 协议发布，长期占据 GitHub star 榜前列，是开源自学指南的标杆。

## 核心架构与技术细节

仓库本质是一份巨型 Markdown 清单。使用方式是 Fork → 新建分支 → 用 `[x]` 勾选进度，从上到下顺次推进。主题覆盖算法复杂度（Big-O、渐近分析）、核心数据结构（数组、链表、栈、队列、哈希表）、二分与位运算、树（BST、堆/优先队列、Trie）、各类排序（合并、快速、堆、冒泡/插入/选择）、图（表示与遍历）、递归、动态规划、设计模式、组合与概率、NP 完全、缓存、进程与线程、测试、字符串处理、浮点数、Unicode、字节序、网络等，相当于覆盖 CS 学位 75% 的核心面试相关内容。作者推荐用 C + Python 学，用 Anki 卡片做间隔复习，并强调"边学边刷题"——这是整份指南最重要的方法论。

## 竞品对比与生态站位

直接对比对象包括 roadmap.sh/computer-science（Kamran Ahmed 的 CS 路线图，更偏完整自学）、tech-interview-handbook、LeetCode 的 Crash Course、NeetCode 路线、《剑指 Offer》体系。Coding Interview University 的差异化在于：1) 更"重"，强调系统打基础而非纯刷题；2) 围绕大厂面试目标精选内容，明确告诉读者哪些可以不学；3) 资源以视频课程（Sedgewick、MIT 6.006、Skiena）为核心，适合英文听力可以的学习者。它不覆盖前端、全栈方向，那部分指引到 roadmap.sh。

## 开发者反馈与局限性

社区反馈极佳：被翻译成多种语言（含简中），无数自学者作为"路线总图"。但作者自己也警示了若干坑：内容过多容易学完就忘——必须主动复习；他自己的 Anki 卡片"过多、偏 trivia"，不推荐直接用；很多内容他事后承认"学多了、面试根本用不到"。其他局限：体量太大可能造成"准备永远学不完"焦虑；不针对具体公司题型；缺乏交互式判题与社区答疑（需配合 LeetCode 等使用）；系统设计与行为面试只有入门提示，深度不足。

## 附带链接

- 仓库：https://github.com/jwasham/coding-interview-university
- 作者博客：https://startupnextdoor.com
- CS 完整路线图：https://roadmap.sh/computer-science
- 间隔复习工具 Anki：http://ankisrs.net/
