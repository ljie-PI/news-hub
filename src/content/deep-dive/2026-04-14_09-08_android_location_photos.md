---
title: "Android 现在阻止你在照片中分享位置信息"
date: "2026-04-14"
source: "HN"
slug: "2026-04-14_09-08_android_location_photos"
summary: "**来源**: shkspr.mobi | 295分 263评论 | 2026-04-14"
---

# Android 现在阻止你在照片中分享位置信息

**来源**: shkspr.mobi | 295分 263评论 | 2026-04-14

---

## 事件背景

Terence Eden 和妻子共同运营 OpenBenches.org——一个让用户分享纪念长椅照片及其地理位置的小众网站。照片的 EXIF 元数据中包含 GPS 坐标，他们的网站依赖这些信息在地图上标注位置。

然而，Google 的 Android 系统经过多次更新后，**系统性地剥除了通过 Web 浏览器上传照片时的地理位置元数据**，让 OpenBenches 这类合理依赖位置信息的场景彻底失效。作者详细记录了 Google 一步步"堵死"所有可行方案的过程，并对 Google 以"隐私"名义的做法表达了强烈不满。

## 核心观点/产品机制

**被堵死的路径（逐步升级的限制）**：
1. `<input type="file" accept="image/jpeg">` — 早已无法传递 EXIF
2. `<input type="file">` — 通用文件选择器，曾可传递元数据，后被 Google 修复（即堵死）
3. PWA（渐进式 Web 应用）方式上传 — 同样无法获取 EXIF
4. 通过蓝牙/QuickShare 传输 — 也会剥除位置信息
5. 通过邮件直接分享 — 位置同样被剥除

**目前唯一可行路径**：用 USB 线将手机连到电脑，手动复制照片，再通过桌面浏览器上传。

**Google 的官方立场**：保护用户隐私。大量用户不知道拍照时位置信息被嵌入照片，随意上传可能导致精确住址、工作地点等泄露给网站方，有被跟踪、骚扰的风险。大多数社交平台（Facebook、Mastodon、WhatsApp）默认会自动剥除 EXIF 位置。

## 社区热议与争议点

**支持 Google 的立场（sixhobbits）**：用户 `sixhobbits` 直接支持 Google 的做法："这是一个悲伤的故事，但我认为 Google 100% 做了正确的事。大多数人不知道照片元数据包含多少信息，而剥除它与人们对世界运作方式的预期是一致的。"

**同情作者、倡导细粒度控制（ieie3366）**：用户认为，对于99.9%的普通用户，这种防护是合理的，但应该为合法的位置分享场景提供**明确的 opt-in 机制**——比如新增一个 HTML input 属性 `includeLocation`，触发一个明确的位置共享确认弹窗，而不是完全堵死。

**核心争议**："隐私保护"与"功能性"之间的边界由谁来定？Google 作为移动操作系统垄断者，单方面决定"所有网站都不应该获得 EXIF 位置"，是否越界？作者直接用了"反竞争垄断"这个词——Google Maps 是 Android 默认地图服务，剥除第三方网站获取位置的能力是否有利于 Google 自身的位置服务？

**技术角度**：有评论指出，EXIF 剥除是在系统级文件选择器层面实现的，理论上应由用户决定是否剥除，而非 OS 强制执行，这侵蚀了用户的数据自主权。

## 行业影响与未来展望

1. **隐私强化趋势的副作用**：iOS/Android 的系统级隐私强化在保护大多数用户的同时，正在伤害依赖精细元数据的小众合法应用场景（地理信息、建筑记录、新闻摄影工作流）。
2. **Web 标准讨论**：是否应该在 W3C 或 WHATWG 层面定义 `<input type="file" location-consent="required">` 之类的机制？本事件或成为推动 Web 标准讨论的典型案例。
3. **移动应用 vs Web 的不平等**：原生 App 通过 Android 权限模型仍可访问完整 EXIF，但 Web 应用被彻底封锁，这加剧了 Web 平台相对于原生 App 的功能劣势。
4. **监管层面**：欧盟 DMA（数字市场法案）对 Android 的约束是否应延伸到这类 API 访问控制决策，是一个值得关注的监管边界问题。

## 附带链接

- 原帖（HN）: https://news.ycombinator.com/item?id=47750669
- 原文: https://shkspr.mobi/blog/2026/04/android-now-stops-you-sharing-your-location-in-photos/
