---
title: "permissionlesstech/bitchat-android"
date: "2026-07-27"
generated: "2026-07-27 07:00"
source: "GitHub"
slug: "2026-07-27_07-bitchat-android"
summary: "bitchat-android 是知名 iOS 应用 bitchat 的官方 Android 移植版，定位为「无服务器、无手机号、无互联网」的去中心化点对点加密聊天工具。它直击的痛点是�"
---

# permissionlesstech/bitchat-android

## 定位与痛点剖析
bitchat-android 是知名 iOS 应用 bitchat 的官方 Android 移植版，定位为「无服务器、无手机号、无互联网」的去中心化点对点加密聊天工具。它直击的痛点是：在断网、灾害、抗议集会或网络管制环境下，传统 IM 依赖中心化服务器和蜂窝网络而彻底失效。bitchat 通过蓝牙 Mesh 网络让手机在纯离线状态下互相中继消息，同时保留 geohash 频道（需联网）连接同地理区域用户。README 自述已获 6674 stars（当日 +444），并明确警告尚未通过外部安全审计，不建议用于敏感场景。

## 核心架构与技术细节
技术栈为 Kotlin + Jetpack Compose（Material Design 3），最低 API 26。网络层基于 Bluetooth LE，每台设备同时充当 client 与 peripheral，实现自动发现与多跳中继转发，并支持 Store & Forward 离线缓存。加密上：私信采用 X25519 密钥交换 + AES-256-GCM，频道消息用 Argon2id 密码派生 + AES-256-GCM，消息签名用 Ed25519。并发依托 Kotlin 协程保证线程安全，设置存储用 EncryptedSharedPreferences。消息默认仅存于内存、阅后即焚，并按电量分性能/均衡/省电三档调节扫描强度。

## 竞品对比与生态站位
与 Signal、Matrix 等依赖服务器/联网的加密 IM 不同，bitchat 走的是 Briar、Meshtastic 一路的离线 Mesh 路线；但相比需专用 LoRa 硬件的 Meshtastic，bitchat 仅用手机蓝牙，零门槛。其最大生态优势是与 iOS 原版保持 100% 协议兼容，跨平台组网，形成双端网络效应。

## 开发者反馈与局限性
Issues 达 288 个，社区活跃但功能仍在快速迭代：大量 open issue 聚焦 mesh bridging、私有群组、扩展 store-and-forward、mesh 诊断（/ping、/trace）及媒体加密分片等，说明核心能力尚不完整。最大局限是官方声明未经安全审计、蓝牙多跳的实际吞吐与距离受限，且 README 的 star 数据为自述。许可证 GPL-3.0。

## 附带链接
- 仓库：https://github.com/permissionlesstech/bitchat-android
- iOS 原版：https://github.com/jackjackbits/bitchat
- Releases：https://github.com/permissionlesstech/bitchat-android/releases
