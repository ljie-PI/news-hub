---
title: "jellyfin-jellyfin"
date: "2026-05-27"
generated: "2026-05-27 07:00"
source: "GitHub"
slug: "2026-05-27_07-jellyfin-jellyfin"
---

---
title: "jellyfin/jellyfin"
date: "2026-05-27"
source: "GitHub"
slug: "jellyfin-jellyfin"
---

## 1. 定位与痛点

Jellyfin 是一套完全自由软件（GPL-2.0）的家用媒体服务器，定位为 Plex、Emby 等闭源方案的开源替代。痛点是：商业媒体服务普遍存在订阅墙、远程播放绑定云账户、转码功能付费、随时变更政策等问题，而家庭/NAS 用户希望对自己的影视、音乐、照片库拥有完整控制权，无须把元数据上传到第三方。Jellyfin 提供「无 Premium、无锁定」的本地化体验，并通过 Web、iOS、Android、Roku、Kodi 等多端客户端覆盖播放。

## 2. 技术架构

服务端使用 C# 编写于 .NET 10 平台，需配套 jellyfin-ffmpeg 完成转码。核心工程拆分清晰：`Jellyfin.Api`（HTTP/REST + Swagger 文档）、`Jellyfin.Server` 与 `Jellyfin.Server.Implementations`（主进程、调度、插件宿主）、`MediaBrowser.Controller / Model / Providers`（业务领域、元数据抓取）、`MediaBrowser.MediaEncoding`（FFmpeg 封装、硬件加速）以及继承自 Emby 3.5.2 的 `Emby.*` 兼容层。前端 `jellyfin-web` 单独仓库，服务器默认托管其静态产物。仓库支持 GitHub Codespaces、devcontainer 与 Unraid Docker 模板，默认端口 8096。

## 3. 竞品对比

- Plex：UI 抛光、远程播放好用，但近年强推订阅、登录依赖云端；
- Emby：本是 Jellyfin 的祖代，3.5.2 之后转闭源；
- Kodi：偏播放器，缺少服务化与多端账户同步；
- Navidrome/Audiobookshelf：专精音乐/有声书。

Jellyfin 的差异点在于「全开源 + 全媒体类型 + 多端 + 插件生态 + 硬件转码全部免费」，并保持中性治理与翻译社区（translate.jellyfin.org）。

## 4. 局限性

- .NET + FFmpeg 体积偏大，低端 ARM 设备转码压力明显；
- 元数据刮削器质量参差，中文影视库匹配仍需手工修正；
- 官方暂不支持 FreeBSD；
- iOS 官方客户端历史上滞后，依赖第三方（Swiftfin 等）；
- 插件市场相比 Plex 仍较小。

## 5. 附带链接

- 仓库：<https://github.com/jellyfin/jellyfin>
- 官网与下载：<https://jellyfin.org/downloads>
- 文档：<https://jellyfin.org/docs/>
- Web 客户端：<https://github.com/jellyfin/jellyfin-web>
- FFmpeg 分支：<https://github.com/jellyfin/jellyfin-ffmpeg>
