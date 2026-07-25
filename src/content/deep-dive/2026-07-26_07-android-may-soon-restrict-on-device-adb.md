---
title: "Android May Soon Restrict On-Device ADB"
date: "2026-07-26"
generated: "2026-07-26 07:00"
source: "HN"
slug: "2026-07-26_07-android-may-soon-restrict-on-device-adb"
summary: "ADB（Android Debug Bridge）是 Google 为开发者提供的高权限调试协议，可通过 USB、TCP/IP 或 Android 11 引入的无线调试连接设备。近年出现一种\"设备内 ADB\"（On-De"
---

# Android May Soon Restrict On-Device ADB

## 1. 事件背景

ADB（Android Debug Bridge）是 Google 为开发者提供的高权限调试协议，可通过 USB、TCP/IP 或 Android 11 引入的无线调试连接设备。近年出现一种"设备内 ADB"（On-Device ADB）玩法：用户在 Termux 等终端里直接运行 ADB 客户端，通过环回地址 `127.0.0.1` 连接本机的 ADBD 守护进程，从而在没有第二台电脑的情况下获得高权限。这一非官方用法催生了 Shizuku、libadb-android、App Manager、Canta 等大量开源工具生态。近期一个针对 CVE-2026-0073（无线 ADB 认证可被完全绕过）的 Google IssueTracker 功能请求中，一位 ADB 核心维护者（Google 员工）提议将 ADBD 限制为仅绑定 `wlan0` 无线接口，引发轩然大波。

## 2. 核心观点/产品机制

原提案本意是好的：允许开发者选择 ADBD 监听哪个网络接口，以缩小暴露面。问题出在维护者的评论——他称环回连接曾被应用滥用来提权，建议"干脆只绑定 wlan0"。作者 Kitsumed（ShizuCallRecorder 开发者）指出，这会一举打断设备内 ADB、经 VPN 的 ADB、经以太网的 ADB 等诸多合法场景。他通过三个场景论证：恶意应用无法自行启动 ADBD，提权必须依赖人类手动开启 USB 调试、手动配对或手动点击授权提示。作者主张的折中方案是提供一个"重启后仍生效、且第三方应用无法读取"的持久开关，而非永久封禁环回连接。

## 3. 社区热议与争议点

评论区反响强烈，主要围绕"安全"与"控制"之争。用户 **3form** 抱怨 2010 年代以来软件的通病：发现方案 A 有问题就强推默认 B，却从不考虑给用户一个 A/B 配置开关——"这是我的设备，让我自己绑 localhost，行不行"（正方：用户自主权）。**Arbortheus** 讽刺"有毒的最高安全"，指出不是所有人都和大厂有相同威胁模型。**SXX** 举 iPhone 每 3 天闲置自动重启为例，说明有用功能若无设置开关就变得糟糕，并直言 Google"不在乎安全，只在乎控制"。反方以 **surajrmal** 为代表：Android 采用把应用和用户视为平等方的多方安全模型，这是正当设计，"用户敌对"不等于"没有安全"，不值得对每个小决定都吵。**jorvi** 则中立分析：attestation 对迪士尼等只想防盗版的厂商确实有效，安全"对它们的威胁模型"是成立的。

## 4. 行业影响与未来展望

若提案落地，Shizuku 等无 root 权限工具生态将遭重创，无障碍录音、卸载预装应用、隐私防护等长尾需求首当其冲。这也与 Google 近期收紧侧载的动向相呼应，令社区担忧 Android 开放性持续退坡。作者呼吁受影响的技术用户到 IssueTracker 理性、建设性地反馈（+1 而非灌水刷屏），以免维护者锁帖。最终结局取决于 Google 是选择"默认关闭+可持久开启"还是"永久封禁"。

## 5. 附带链接

- 原文：https://kitsumed.github.io/blog/posts/android-may-soon-restrict-on-device-adb/
- HN 讨论：https://news.ycombinator.com/item?id=49045159
