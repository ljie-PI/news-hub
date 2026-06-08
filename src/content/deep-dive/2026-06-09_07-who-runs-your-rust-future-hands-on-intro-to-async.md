---
title: "who-runs-your-rust-future-hands-on-intro-to-async"
date: "2026-06-09"
generated: "2026-06-09 07:00"
source: "Reddit"
slug: "2026-06-09_07-who-runs-your-rust-future-hands-on-intro-to-async"
---

---
title: "Who Runs Your Rust Future? Hands-On Intro to Async Rust"
date: "2026-06-09"
source: "Reddit"
subreddit: "rust"
category: "编程语言"
slug: "who-runs-your-rust-future-hands-on-intro-to-async"
---

## 一、事件背景

r/rust 是 Reddit 上最专业、最高质量的编程语言社区之一,常年聚集 Tokio、async-std、Bevy 等核心生态的维护者。Async Rust 自 2019 年稳定以来,长期被认为是 Rust 学习曲线中"最陡"的一段——`Future`、`Pin`、`Waker`、`Executor`、`Send/Sync` 之间纠缠的语义把很多写过 Go、JS、Python async 的开发者都拦在门外。OP 在 aibodh.com 上发布了一系列博客的第一章,定位非常聪明:**面向"写过 JS async/await + 懂 Rust 基础语法"的读者**,以"亲手构建一个 Future 和驱动它的 runner"为教学路径,把概念性内容转换为可运行的代码实验。这种"先造轮子,再用框架"的教学策略,在 Rust 社区是公认有效但极少有人愿意写的形式。

## 二、核心观点 / 主张

从 selftext 列出的章节大纲,OP 的核心教学主张包括:其一,**异步 Rust 不是被某个魔法运行时执行的,而是"你"——更精确地说,是某段你可以亲手实现的 runner ——在驱动每一次 `poll`**,这是新手最常误解的概念;其二,**`async fn` 的真实语义与 JS Promise 完全不同**——它不会启动任何执行,只是返回一个状态机;其三,**"running a future"的本质是循环调用 `Future::poll()` 直到返回 `Ready`**,而其中的 `Waker` 是连接 IO 事件源(epoll/io_uring)与执行器的关键桥梁。OP 选择从最底层的机制开始讲,目的是让学习者建立"我能在没有 Tokio 的情况下自己写一个最小执行器"的信心,从而真正理解 Tokio、smol、async-std 在做什么。

## 三、社区热议与争议点

r/rust 对教学内容的反馈一贯犀利且建设性,讨论大概率会聚焦三点:

1. **教学路径之争**:有资深用户会赞成"自顶向下:先 Tokio,再原理",理由是绝大多数 Rust 工程师不需要懂 Waker 也能写好业务;但 OP 的"自底向上"路线更适合系统编程背景的学习者,两派会在评论区辩论。
2. **`Pin` 的覆盖问题**:async Rust 学习的终极拦路虎是 `Pin<&mut Self>` 与自引用结构,新人会期待 OP 在后续章节如何处理这一难点;若处理不到位,评论区会迅速指出。
3. **与 JS 类比是否合适**:Rust 的 Future 是"惰性、零成本抽象、push 模型",而 JS Promise 是"急切、堆分配、microtask 队列",硬类比可能制造长期误解,有评论者会就此提醒读者注意边界。

## 四、行业影响与未来展望

Async Rust 是 Rust 持续渗透云原生、嵌入式、AI 推理基础设施的关键支柱:Cloudflare Workers、AWS Firecracker、Linkerd、Polars、Candle、Burn、Apache OpenDAL 等项目都重度依赖 async 生态。教学资源的质量直接决定了下一代 Rust 工程师的供给。过去几年,async Rust 因为概念门槛过高被诟病为 "Rust 增长的隐形天花板",社区也在持续推进 `async fn in traits`、`async closures`、async drop 等改进。OP 这类"hands-on intro"博客的出现,会让 async Rust 的入门门槛持续降低,也会让 "Rust 不适合写业务"这一刻板印象逐渐松动。可以预期 2026–2027 年,随着 async traits 等特性稳定、Edition 2027 临近,会出现一波"Rust async 教学复兴",aibodh 这类博客正是浪潮的早期信号。

## 五、附带链接

- Reddit 讨论页: <https://www.reddit.com/r/rust/comments/1u0mtky/who_runs_your_rust_future_handson_intro_to_async/>
- 原文博客: <https://aibodh.com/posts/async-rust-chapter-1-hands-on-intro-to-async-rust/>
