---
title: "Show HN: Quake ported to safe Rust, playable in browser"
date: "2026-10-11"
generated: "2026-10-11 07:00"
source: "HN"
slug: "2026-10-11_07-show-hn-quake-ported-to-safe-rust-playable-in-brow"
summary: "Quake-SRP把一九九六年的WinQuake从GPL版C源码逐文件移植为Rust，并以网页直接交付共享版第一章。作者披露代码与文档由Claude Code生成，人负责规则、试玩和报错；四个月的协作式移植因此成为本轮讨论焦点。批次冻结热度为235分、178条评论；本次Algolia整树实际取得158个当前可见节点。"
---

# Show HN: Quake ported to safe Rust, playable in browser

## 事件背景
Quake-SRP把一九九六年的WinQuake从GPL版C源码逐文件移植为Rust，并以网页直接交付共享版第一章。作者披露代码与文档由Claude Code生成，人负责规则、试玩和报错；四个月的协作式移植因此成为本轮讨论焦点。批次冻结热度为235分、178条评论；本次Algolia整树实际取得158个当前可见节点。

## 核心观点 / 产品机制
源码核验显示，引擎与浏览器二进制的crate根均启用`forbid(unsafe_code)`，两个Cargo清单除本地引擎外没有第三方依赖，本轮原生release检查也通过。浏览器端并非纯Rust：WASI程序在Web Worker运行，JS宿主把键鼠事件经共享环送入标准输入；八位软件渲染帧及调色板由WebGL2呈现，二维画布兜底；PCM交给AudioWorklet，存档写入IndexedDB。Classic预设用原版C“oracle”做像素、状态和混音比对，但像素一致只覆盖已测试视角与SSE2浮点构建，并非全程序形式证明。

## 社区热议与争议点
aroman称赞逐帧视觉差分让移植结果可复验，flowerthoughts则确认手机浏览器也能顺畅运行。反方中，dwroberts指出“没有unsafe”不等于代码惯用或没有逻辑风险；flohofwoe认为C直接编译Wasm在浏览器里同样安全，Rust重写的现实价值主要是检验大模型移植能力。争论由成品效果延伸到“安全”口径与人类贡献。

## 行业影响与未来展望
项目展示了“大模型翻译、旧实现作oracle、自动回归”复活遗产软件的可行路径，但边界明确：当前无多人模式，线程版依赖共享内存、Worker、Wasm SIMD与跨源隔离；Safari及苹果移动设备尚未测试，完整版和任务包须用户自备数据。其价值更像可审计迁移样板，而非Rust或AI自动保证正确性的结论。

## 附带链接
- 项目演示：https://quake-srp.pages.dev/
- 源码与说明：https://github.com/terrapapagalli1516/quake-srp
- 浏览器架构：https://github.com/terrapapagalli1516/quake-srp/blob/main/web/PLATFORM.md
- 差异审计：https://github.com/terrapapagalli1516/quake-srp/blob/main/AUDIT.md
- HN讨论：https://news.ycombinator.com/item?id=50016312
