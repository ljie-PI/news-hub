---
title: "13k-lines-rust-edge-python-compiler"
date: "2026-05-28"
generated: "2026-05-28 07:00"
source: "Reddit"
slug: "2026-05-28_07-13k-lines-rust-edge-python-compiler"
---

---
title: "13K Lines of Rust Later: From Toy Compiler to Production Runtime in 90 Days"
date: "2026-05-28"
source: "Reddit"
slug: "13k-lines-rust-edge-python-compiler"
---

## 项目概览

作者在 r/rust 分享了自己历时 90 天、约 **13,000 行 `no_std` Rust** 写成的小型编译器 + 运行时项目——**Edge Python**。它是一个 **沙箱化的 Python 子集**，可编译为约 **170KB 的 WASM 模块**，能在任何支持 WebAssembly 的环境运行：浏览器、Cloudflare Workers、Wasmtime 等。作者强调自己一直喜欢 Python 的语法，希望把它**安全地搬到边缘运行时**，特别是 Web 与 Worker 场景。

## 为什么不是 Pyodide / RustPython？

主流的 Python-in-WASM 方案大致两类：
- **Pyodide**：把 CPython 整体编译成 WASM，体积约 20MB+，冷启动慢，不适合边缘 worker；
- **RustPython**：纯 Rust 解释器，体积更小，但仍是字节码解释，启动后仍需较多 RAM。

Edge Python 选择了第三条路——**真正的 AOT 编译器**：源码直接被翻译为 WASM 指令而非走解释器，最终产物只有 ~170KB，**冷启动可接近原生 WASM 模块**，特别契合 Cloudflare Workers 等\"每次请求都重新 spin up\"的边缘场景。

## 技术亮点

- **`no_std` Rust 实现**：编译器与运行时不依赖 std，意味着同样能跑在嵌入式与边缘环境，并方便审计；
- **沙箱化语义**：作者限定了一个 Python 子集，剔除了 `eval`/`exec`、文件系统、unbounded reflection 等不安全/重型特性，专注于纯计算 + 可控 IO；
- **小体积产物**：170KB 的输出对应 7000+ 行 Python，这意味着客户端可以拉取一个可观规模的脚本而几乎无感知；
- **90 天达到生产级**：作者透露已获得一位赞助方，对方计划在浏览器端运行超过 7,000 行 Python 业务逻辑，证明已具备真实使用价值。

## 适用场景

1. **Web 端可移植脚本**：前端用 Python 编写校验、规则、数据处理逻辑，无需再为 JS/Python 双份实现；
2. **Cloudflare Workers / Wasmtime 等边缘函数**：相比 Pyodide 启动快、内存占用小；
3. **嵌入式可扩展性**：游戏、IoT 设备需要安全脚本时，可嵌入这个 ~170KB 的 runtime；
4. **教育与教学环境**：浏览器内的 Python 沙箱，无服务端依赖。

## 评论区焦点

Rust 社区的反响普遍正面，被讨论的关键问题包括：
- **支持的 Python 子集到底有多大？** 是否覆盖 generator、async/await、上下文管理器等高级语法；
- **GC 实现**：在 WASM 内如何管理 Python 对象生命周期，是否引入循环引用回收；
- **数值类型与互操作**：是否能高效地与 JS Number / WASM linear memory 交互；
- **与 `wasm-bindgen`、`workerd`、`wasmtime` 等运行时的集成方式**。

## 工程与产品启示

这个项目的可借鉴之处不止于\"Rust 写编译器\"。它体现了三个趋势：

1. **WASM 正在成为新一代 \"polyglot delivery format\"**：把任何语言交付到任何地方；
2. **\"安全子集\" 是新型语言运行时的常见路线**：用确定性换可移植性；
3. **单人 90 天可以做出可商用的小语言基础设施**：现代 Rust 工具链 + LLM 辅助编码确实在改变\"个人能交付的复杂度上限\"。

## 总结

Edge Python 是一个把 Python 语法、Rust 安全、WASM 可移植性三者结合的有趣实验。**170KB 模块 + 13K 行 no_std Rust + 90 天周期**，是\"小而美的系统软件\"的范例。对希望在边缘运行 Python、或希望学习如何用 Rust 实现一门语言的开发者，这是一份高密度的参考样本。
