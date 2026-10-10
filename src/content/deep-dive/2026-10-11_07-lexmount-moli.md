---
title: "lexmount/moli"
date: "2026-10-11"
generated: "2026-10-11 07:00"
source: "GitHub"
slug: "2026-10-11_07-lexmount-moli"
summary: "Moli 是面向 AI agent、抓取与评测场景的 Rust 无头浏览器内核，并非 Chromium 包装层；它以 CLI、CDP、WebDriver Classic、WebDriver BiDi 暴露同一运行时。其判断是多数代理先需要 DOM、脚本与结构化内容，而非持续维护像素，因此把昂贵视觉计算改为显式启用。批次快照记录其周榜新增 10105 stars，但热度不等于兼容性成熟。"
---

# lexmount/moli

## 定位与痛点剖析

Moli 是面向 AI agent、抓取与评测场景的 Rust 无头浏览器内核，并非 Chromium 包装层；它以 CLI、CDP、WebDriver Classic、WebDriver BiDi 暴露同一运行时。其判断是多数代理先需要 DOM、脚本与结构化内容，而非持续维护像素，因此把昂贵视觉计算改为显式启用。批次快照记录其周榜新增 10105 stars，但热度不等于兼容性成熟。

## 核心架构与技术细节

代码与 Cargo workspace 证实网络、解析、脚本、样式、布局、渲染分别采用 libcurl、html5ever、V8、Servo/Stylo、Taffy/Parley、Vello。原生 DOM 是单一事实源；默认 `LayoutPolicy::Mock`，启用 `--layout` 后按需计算，并把几何冻结为与 DOM 解耦的 `FrozenLayoutTree`，随后丢弃工作树、缓存和绘制状态。这压低常驻资源，却保留视觉保真边界。

## 竞品对比与生态站位

相较 Chrome Headless，Moli 选择独立内核来压低资源；其自建 Lexbench 自报 Moli 任务成功率 81.88%、Chrome 99.85%，中位峰值内存 92 MiB 对 697 MiB，数字并非独立测评。Lightpanda 同为替代内核但以 Zig、AGPL 开发；Moli 则双许可 MIT/Apache-2.0，并覆盖三种标准自动化协议。它处于浏览器执行层，不是 browser-use 那类代理编排库。

## 开发者反馈与局限性

真实反馈呈现“可用但仍在补齐网页边角”：issue #1389 报告 Windows 上日文多字节 cookie 触发 panic，维护者仅确认正在调查；#1291 报告超长整页截图预算上限、移动设备模拟与 End 键缺口；#1288、#1289 分别暴露容器查询布局异常和 Playwright 可见性差异。另一方面，PR #1305 已合并交互后再导出的能力，显示迭代迅速。README 也明确不追求像素级 Chrome 一致性，缺少 GPU 合成器及高保真 Canvas/WebGL/媒体播放。

## 附带链接

- [GitHub Repo](https://github.com/lexmount/moli)
- [README 与自报基准](https://github.com/lexmount/moli#benchmark)
- [issue #1389](https://github.com/lexmount/moli/issues/1389)
- [issue #1291](https://github.com/lexmount/moli/issues/1291)
- [PR #1305](https://github.com/lexmount/moli/pull/1305)
- [Lightpanda](https://github.com/lightpanda-io/browser)
