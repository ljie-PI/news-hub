---
title: "七种编程\"元语言\"：一个被反复热议的编程语言分类框架"
date: "2026-04-20"
source: "HN"
slug: "2026-04-20_07-seven-programming-ur-languages"
summary: "---"
---

# 七种编程"元语言"：一个被反复热议的编程语言分类框架

> 原文：[The seven programming ur-languages](https://madhadron.com/programming/seven_ur_languages.html) | HN 讨论：[2026 最新帖](https://news.ycombinator.com/item?id=47822486) / [2023 帖](https://news.ycombinator.com/item?id=35813496) / [2021 帖](https://news.ycombinator.com/item?id=28704495)

---

## 1. 事件背景

madhadron（Fred Ross）在 2021 年发表的这篇文章已经在 Hacker News 上至少被提交过三次（2021、2023、2026），每次都引发大量讨论，说明这个话题对程序员有持久吸引力。所谓"ur-language"（元语言），借用了古生物学"模式标本"（type specimen）的概念——不是说世上只有七种语言，而是说所有编程语言在**思维模式**层面可以追溯到七个原型家族。

## 2. 核心观点

作者将所有编程语言归类为七个"元语言"家族，每个家族代表一套独特的**编程思维模式和神经通路**：

| 元语言 | 模式标本 | 核心特征 | 代表语言 |
|--------|---------|---------|---------|
| **ALGOL** | ALGOL 60 | 赋值、条件、循环、函数 | C, Java, Python, JS, C++ |
| **Lisp** | Common Lisp | S-表达式、宏系统、代码即数据 | Scheme, Clojure, Emacs Lisp |
| **ML** | Standard ML | 一等函数、Hindley-Milner 类型系统、模式匹配 | Haskell, OCaml, F# |
| **Self** | Self | 对象间消息传递、活环境 | Smalltalk, (部分)JavaScript |
| **Forth** | Forth | 栈操作、逆波兰表示法、解析器可替换 | PostScript, Factor |
| **APL** | APL | 数组操作、符号密集、隐式循环 | J, K, BQN |
| **Prolog** | Prolog | 逻辑声明、统一化、回溯搜索 | Datalog, miniKanren |

核心论点：**在同一家族内切换语言很容易**（如 Java→C#），但**跨家族学习需要重建思维模式**（如从 Python 到 Haskell）。这解释了为什么"该学 Java 还是 Python？"是一个错误的问题——它们本质上是同一种思维。

作者还指出现代语言不断从其他家族"借用"特性：ALGOL 系在 80 年代嫁接了 Self 的类系统，2010 年后又大量引入 ML 的函数式特性（lambda、模式匹配、代数类型）。

## 3. 社区热议与争议点

这篇文章在 HN、Reddit、Lobsters 上引发了持续多年的争论，主要集中在以下几点：

### 争议一：Self/OOP 的分类是否合理？

Lobsters 用户质疑将面向对象完全归入 Self 家族："I think it's a mistake to group objective orientation completely under Self"。OOP 在不同语言中差异巨大——Smalltalk 的纯消息传递、Java 的类层次结构、JavaScript 的原型链、CLOS 的多分派，差异之大足以构成不同家族。

### 争议二：遗漏了哪些"元语言"？

HN 2023 讨论中，多人提出应加入**数据流/电子表格语言**（Excel、LabVIEW）、**shell/管道语言**、以及 **Strachey 的 GPM 和 Mooers 的 TRAC** 等早期宏处理语言。有评论者认为字符串重写/模式替换（如 sed、awk）构成独立家族。

### 争议三：分类标准是语法还是语义？

Reddit r/programming 的讨论中有人尖锐指出，作者混淆了语法层面（如 S-表达式）和语义层面（如宏系统）的分类标准。Lisp 的核心是宏和代码即数据，不是括号；很多 Lisp 程序日常写法和 ALGOL 系并无本质区别。

### 争议四：历史事实纠错

HN 2021 帖中有人指出作者把 ML 的起源写成剑桥（Cambridge）是错误的——ML 由 Robin Milner 在**爱丁堡大学**开发，后来 Milner 才搬去剑桥。这种事实性错误削弱了文章的权威性。

## 4. 行业影响与未来展望

尽管分类细节有争议，这篇文章提供了一个**实用的思维框架**：它帮助程序员理解为什么学某些语言感觉"换皮"，而另一些语言让人脑子打结。这个框架在编程教育中尤其有价值——与其学十种 ALGOL 变体，不如从每个家族各学一种。

文章的影响力已经溢出到其他领域：Hillel Wayne 在 2024 年写了对应的 [The seven specification ur-languages](https://buttondown.com/hillelwayne/archive/the-seven-specification-ur-languages/)，将同样的分类思路应用于形式化方法领域。Lobsters 上关于 Verona 语言的讨论则展示了 Self/Smalltalk 思想如何在 21 世纪被重新诠释——追求 Smalltalk 的灵活性，同时适配现代多核异构硬件。

随着 AI 辅助编程的兴起，一个有趣的问题浮现：**当 LLM 可以在任意范式间翻译代码时，"元语言"的边界是否还重要？** 答案可能是：对机器不重要，但对**人类理解和设计**仍然至关重要。思维模式不会因为工具变强就消失。

## 5. 链接

- 📄 原文：https://madhadron.com/programming/seven_ur_languages.html
- 💬 HN 2026 讨论：https://news.ycombinator.com/item?id=47822486
- 💬 HN 2023 讨论：https://news.ycombinator.com/item?id=35813496
- 💬 HN 2021 讨论：https://news.ycombinator.com/item?id=28704495
- 💬 Reddit 讨论：https://www.reddit.com/r/programming/comments/pygey3/the_seven_programming_urlanguages/
- 💬 Lobsters 讨论：https://lobste.rs/s/kwpyt8/seven_programming_ur_languages
- 📄 延伸阅读 - 形式化方法版：https://buttondown.com/hillelwayne/archive/the-seven-specification-ur-languages/
