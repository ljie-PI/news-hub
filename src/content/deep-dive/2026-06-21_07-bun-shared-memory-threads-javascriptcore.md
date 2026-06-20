---
title: "Bun has an open PR adding shared-memory threads to JavaScriptCore"
date: "2026-06-21"
generated: "2026-06-21 07:00"
source: "HN"
slug: "2026-06-21_07-bun-shared-memory-threads-javascriptcore"
summary: "这条 Hacker News 讨论指向 Bun 团队维护的 WebKit/JavaScriptCore fork 中一个异常庞大的开放 PR：**Shared-memory threads for JavaScriptCore (experimental, not working yet)**。截至"
---

# Bun has an open PR adding shared-memory threads to JavaScriptCore

## 1. 事件背景

这条 Hacker News 讨论指向 Bun 团队维护的 WebKit/JavaScriptCore fork 中一个异常庞大的开放 PR：**Shared-memory threads for JavaScriptCore (experimental, not working yet)**。截至抓取时，GitHub API 显示该 PR 由 Jarred Sumner 创建于 2026-06-06，最近更新到 2026-06-20，状态仍为 open，包含 **151 个提交、1826 个文件变更、约 +279,276/-4,272 行**，并已有 13 条 issue 评论和 674 条 review 评论。HN 侧元数据显示该帖约 99 分、164 条评论（页面实时数字可能波动）。

值得强调的是，这不是主线 WebKit 的合并请求，而是 Bun 自己的 WebKit/JSC fork 上的 PR。PR 描述也反复声明它是实验性工作，“may never merge”，目标首先是让设计和代码公开接受审阅，而不是宣布一个可立即依赖的稳定能力。

## 2. 核心观点/产品机制

PR 的核心主张是：给 JavaScriptCore 增加真正的“共享堆线程”。拟议 API 类似：

```js
const t = new Thread(fn, ...args);
t.join();
await t.asyncJoin();
Thread.current;
```

与 Web Worker 不同，`new Thread(fn)` 不是把数据 structured clone 到另一个隔离 heap，也不是围绕 `postMessage` 建协议；它让函数作为真实闭包在另一个原生线程运行，并共享同一个 heap、realm/global object 和 module graph。PR 中的口号是：**“You share an object by sharing the object.”** 因而闭包、imports、class、异常对象、普通 JS 对象图都可直接跨线程可见。

为降低“共享一切”带来的风险，设计引入了 `Lock`、`Condition`、`ThreadLocal`、`Thread.restrict(obj)` 以及把 `Atomics.*` 扩展到普通对象自有数据属性等同步/限制机制。底层实现则涉及 TID-tagged butterflies、segmented butterflies、per-object cell locks、JIT watchpoints、共享 heap server 与 per-thread VM 视图等。PR 描述称，在 `--useJSThreads` 开关下，平行 JS 已能通过四个 JIT tier 运行且线程测试集通过；但同时列出 TSAN 清理、fuzzing、Windows、test262-in-thread、长期 soak、benchmark gate 等未完成项。

性能叙事也很谨慎：未共享代码的目标是接近零开销，PR 描述给出的 phase-1 serial regression 最坏约 0.45%；共享对象的首次写入和结构转换会更贵，transition-heavy 工作负载会感到明显成本。后续的“Scalability, measured”部分用文档索引/查询程序对比 JS、Go、Java：在 `flat` 变体中 16/32 线程 JS 结果优于 Java，但在更“JS 风格”的 strings + `Map<string>` + BigInt 版本中，差距主要来自 JS 对象模型/字符串/BigInt 成本，而非线程机制本身。

## 3. 社区热议与争议点

HN 讨论明显分成三条线：技术可行性、工程可信度、以及 AI 参与大型 runtime 改造的边界。

1. **“可行”与“应该做吗”是两回事。** JSC/WebKit 资深工程师 Filip Pizlo（HN 用户 `pizlonator`）在评论中贴出自己 2017 年文章《Concurrent JavaScript: It Can Work!》，并说“I knew it was possible :-)”。另一位用户承认设计“good”，但担心共享内存并发会把 mutex 的诱惑带入 JS 大众生态，称其像“在玩具店卖核炮弹”：高手可以用，但普通开发者容易写出数据竞争和难以复现的 bug。

2. **Worker/SharedArrayBuffer 是否已经足够。** 有评论指出 JavaScript 多年来已有 Worker、SharedArrayBuffer 和 Atomics；反方则强调两者层级差异巨大：SAB 共享的是字节缓冲区，几乎要求把对象图重写成 typed-array 数据结构；而该 PR 共享的是原生 JS 对象、数组、Map 与闭包上下文。支持者据此认为，若要用 TypeScript/Bun 写数据库、bundler、索引器等 CPU-bound 系统，shared-heap threads 可能显著降低工程复杂度。

3. **可信度焦虑集中在“超大 PR + LLM 痕迹”。** 一条高赞评论说，软件不只是代码，还包括稳定性和信任；“1800 files change PRs created by Anthropic overseen by one person”削弱了其对 Bun 的信任。另有评论直问“是否有 human-authored description”“为什么不会到处都是 race condition”。也有人把它视为 LLM 让底层软件实验更可塑的“existence proof”：即使最终不合并，也证明类似 Filip 设想的原型现在能被快速探索。

4. **PR 评论本身也显示仍需大量审查。** GitHub issue 评论里既有“lgtm”“lfg”等简短支持，也有质疑“one 9/11 PR after another”的强烈反对。CodeRabbit review comments 中出现了不少具体问题：例如某些 Bun-specific JSThreads 路径缺少 `USE(BUN_JSC_ADDITIONS)` 编译期 guard、测试中使用普通共享读写导致潜在 data race、部分测试可能未真正覆盖并发窗口、甚至 call-link 路径在无 GIL 下可能存在 publish/swap race。这些不等同于最终结论，但说明“测试通过”之外仍有大量机制级审阅工作。

## 4. 行业影响与未来展望

如果这条路线成熟，Bun 可能在服务器端 JS 竞争中获得一个极具差异化的定位：不是只把 Node API 做快，而是让 JS/TS 获得接近 Java/Go/C# 的共享堆并行模型。对 CPU-bound 后端、构建工具、编译器、搜索/索引、缓存密集服务而言，它可能减少 worker serialization、重复 module startup 和 SharedArrayBuffer 手搓数据结构的负担。

但风险同样基础性：JavaScript 生态长期依赖“同一事件循环内不会有别的线程改我对象”的心智模型。shared-heap threads 会把数据竞争、锁顺序、可见性、GC/JIT safepoint、对象形状变更等问题暴露给 runtime 和用户两端。对语言 runtime 来说，这类改动触及对象模型、GC、四级 JIT、VM lifecycle 和平台移植，维护成本可能比初始实现更关键。短期看，它更像 Bun fork 中的研究型试验；中期若要成为产品，需要清晰的 feature flag、强测试/TSAN/fuzzing 证据、人工设计说明、标准化讨论，以及对“何时推荐使用、何时继续用 Worker/actor 模型”的开发者教育。

## 5. 附带链接

- GitHub PR：<https://github.com/oven-sh/WebKit/pull/249>
- Hacker News 讨论：<https://news.ycombinator.com/item?id=48610841>
- Filip Pizlo 2017 文章《Concurrent JavaScript: It Can Work!》：<https://webkit.org/blog/7846/concurrent-javascript-it-can-work/>
- HN Algolia/API 入口：<https://hn.algolia.com/?query=Bun%20has%20an%20open%20PR%20adding%20shared-memory%20threads%20to%20JavaScriptCore&type=story>
