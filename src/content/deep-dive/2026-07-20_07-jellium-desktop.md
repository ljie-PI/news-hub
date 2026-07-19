---
title: "andrewrabert/jellium-desktop"
date: "2026-07-20"
generated: "2026-07-20 07:00"
source: "GitHub"
slug: "2026-07-20_07-jellium-desktop"
summary: "Jellium Desktop 是一款非官方的 Jellyfin 桌面客户端。Jellyfin 作为开源自建媒体服务器，官方桌面端长期依赖 Electron 内嵌 Web 播放器，在硬件解码、字幕渲染"
---

# andrewrabert/jellium-desktop

## 定位与痛点剖析

Jellium Desktop 是一款非官方的 Jellyfin 桌面客户端。Jellyfin 作为开源自建媒体服务器，官方桌面端长期依赖 Electron 内嵌 Web 播放器，在硬件解码、字幕渲染、高码率/HDR 播放上体验欠佳。Jellium 的痛点切入点正是「更好的本地播放体验」：用原生播放器替代浏览器内置解码。仓库自报口径约 1.2k stars、101 forks，主体语言 Rust（87.7%），采用 GPL-2.0 许可。

## 核心架构与技术细节

项目最核心的技术选择是把 **CEF（Chromium Embedded Framework）** 与 **mpv** 结合：用 CEF 承载 Jellyfin 的 Web UI 保证界面一致性与功能完整，用久经考验的 mpv 引擎接管实际视频解码与播放，从而获得优秀的硬件加速、字幕与格式兼容能力。工程用 Rust 编写、以 `just` 作为命令运行器，提供 AppImage、Flatpak、AUR、macOS（Intel/Apple Silicon）、Windows（x64/arm64）全平台构建，通过 nightly.link 分发 CI 产物。

## 竞品对比与生态站位

对比官方 Jellyfin Media Player（同样基于 mpv + Web，但为 C++/Qt）和 Findroid、Streamyfin 等移动端方案，Jellium 的差异在于 Rust 技术栈带来的内存安全与现代工程实践，定位为官方桌面端的社区替代品，服务追求播放质量的自建媒体用户。对于已经拥有 Plex、Emby 迁移到 Jellyfin 的用户，一个能媲美原生播放器体验的桌面端往往是留存关键，Jellium 恰好补足了这块短板，也顺应了开源媒体生态「去 Electron 化、拥抱 Rust」的趋势。

## 开发者反馈与局限性

1071 次提交显示迭代活跃，仓库含 CLAUDE.md 表明借助 AI 辅助开发。局限明显：尚无正式 release，仅提供 nightly 构建，稳定性待验证；作为非官方项目，功能覆盖与长期维护存在不确定性；macOS 需手动去除 quarantine 属性。

## 附带链接

- 仓库：https://github.com/andrewrabert/jellium-desktop
