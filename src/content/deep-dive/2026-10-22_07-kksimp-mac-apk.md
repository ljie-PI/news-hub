---
title: "kksimp/Mac.apk"
date: "2026-10-22"
generated: "2026-10-22 07:00"
source: "GitHub"
slug: "2026-10-22_07-kksimp-mac-apk"
summary: "Mac.apk 是面向 Apple Silicon 的 Android 兼容层：不启动 Android 虚拟机或 Linux，而把应用变成普通 macOS 进程与窗口，解决模拟器桌面割裂、启动链路重的问题，适合想直接运行 APK 的 Mac 用户。批次快照为1986星；GitHub REST 查询时为1987星、65个复刻、41项开放问题（含拉取请求）。README/兼容表自报手测71款、58款可用，仅属项目方口径，不等同独立兼容率。"
---

# kksimp/Mac.apk

## 定位与痛点剖析
Mac.apk 是面向 Apple Silicon 的 Android 兼容层：不启动 Android 虚拟机或 Linux，而把应用变成普通 macOS 进程与窗口，解决模拟器桌面割裂、启动链路重的问题，适合想直接运行 APK 的 Mac 用户。批次快照为1986星；GitHub REST 查询时为1987星、65个复刻、41项开放问题（含拉取请求）。README/兼容表自报手测71款、58款可用，仅属项目方口径，不等同独立兼容率。

## 核心架构与技术细节
首启将 DEX 转成 JVM 字节码并缓存，由内置 OpenJDK 执行；自研框架复现 AOSP 行为，并把窗口、剪贴板、定位等接到 macOS。ARM64 原生库直接执行，ARM32 预重编译为 ARM64，Bionic 垫片承接库接口；OpenGL ES 经 ANGLE、Vulkan 经 MoltenVK 落到 Metal。构建文档还澄清画布主体仍是 Java2D，着色器或滤镜会同步读回，不能理解成全栈 GPU 化。每个 APK 最终包装为独立 Mac 应用。

## 竞品对比与生态站位
Android Studio Emulator 以 AVD 模拟完整设备，偏开发测试；Waydroid 在 GNU/Linux 容器中启动完整 Android；Mac.apk 更接近 Wine 的 API 兼容层思路。其优势是进程、窗口和 Dock 的原生整合，代价是必须自行追平庞大 Android API、厂商服务与应用怪癖，生态成熟度也远低于官方模拟器。

## 开发者反馈与局限性
项目仍标为 Alpha，只支持 macOS 26.4 以上的 Apple Silicon。它不是手机式沙箱：原生代码按当前 macOS 用户权限运行；Play Integrity、购买和部分 Google 登录也不支持。开放的 #47 报告小红书白屏与高 CPU，并把嵌套主 Looper 视为尚待确认的解释；#7 中用户确认新版能启动两款应用，却仍遇到布局、播放栏和音频失真，说明“能开”不等于完整可用。公开回归工具与测试 APK 集亦未全部开源。

## 附带链接
- [Repo](https://github.com/kksimp/Mac.apk)
- [架构文档](https://github.com/kksimp/Mac.apk/wiki/How-Mac.apk-Works)
- [设计与安全边界](https://github.com/kksimp/Mac.apk/wiki/Design-Decisions)
- [构建文档](https://github.com/kksimp/Mac.apk/blob/main/BUILDING.md)
- [关键 issue #47](https://github.com/kksimp/Mac.apk/issues/47)
- [反馈 issue #7](https://github.com/kksimp/Mac.apk/issues/7)
