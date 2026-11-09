---
title: "KetchUp – Open-source SketchUp alternative built with Rust and WebGPU"
date: "2026-11-10"
generated: "2026-11-10 07:00"
source: "HN"
slug: "2026-11-10_07-ketchup-open-source-sketchup-alternative"
summary: "KetchUp以“开源SketchUp替代品”登上HN；本批冻结为726 points、223 comments。调研时官方已把品牌改为BenchUp，旧仓库会重定向到同一仓库ID的`BenchUp3D/editor`，并保留旧`.ketchup`项目兼容。官方现将产品定位收窄为木工、家具与DIY的免费三维建模器，而非全能CAD。"
---

# KetchUp – Open-source SketchUp alternative built with Rust and WebGPU

## 事件背景

KetchUp以“开源SketchUp替代品”登上HN；本批冻结为726 points、223 comments。调研时官方已把品牌改为BenchUp，旧仓库会重定向到同一仓库ID的`BenchUp3D/editor`，并保留旧`.ketchup`项目兼容。官方现将产品定位收窄为木工、家具与DIY的免费三维建模器，而非全能CAD。

## 核心观点 / 产品机制

实现并非网页套壳：仓库把几何核心与应用拆成两个Rust crate，以eframe/egui和wgpu渲染；同一编辑器编译为Windows、macOS、Linux原生程序及WASM网页端，浏览器优先WebGPU、回退WebGL2。官方指南列出线框、矩形、推拉、偏移、布尔运算、尺寸、组件与吸附；数据本地自动保存，可导出`.bup`及OBJ。SKP导入在网页端交给Worker，但纹理、场景、标注和关联组件定义仍不支持，以上能力均属官方及源码口径。

## 社区热议与争议点

Algolia本轮实际取得100个可见节点，已触及`--limit 100`，不能等同于冻结评论总数。正面看，elxr称赞Rust界面和文字渲染在浏览器里的手感；4ff618认为它契合只需盒体、电子外壳等简单模型的爱好者。反面看，yboris批评每画矩形都要求命名；LinguaBrowse指出当时默认吸附、Push/Pull步骤和菜单交互均不够直觉。当前指南已写明几何与轴吸附默认开启，说明评论反映发布时体验，也提示版本仍快速变化。

## 行业影响与未来展望

它展示了Rust、WASM与GPU抽象层支撑“同代码、跨桌面与浏览器”的可行路径，也以本地保存、免账号和MIT许可证切入轻量木工设计。但真正替代SketchUp的门槛不在功能清单，而在操作一致性、几何边界与文件互通的长期打磨；移动端、云存储和完整SKP语义仍在当前版本范围之外。品牌迁移与评论中的交互落差表明，项目更像快速成长的垂直工具，而非成熟替代品。

## 附带链接

- [Hacker News讨论](https://news.ycombinator.com/item?id=50418176)
- [官方主页](https://benchup3d.github.io/editor/)
- [浏览器演示](https://benchup3d.github.io/editor/play/)
- [Canonical GitHub仓库](https://github.com/BenchUp3D/editor)
- [用户指南](https://github.com/BenchUp3D/editor/tree/main/docs)
