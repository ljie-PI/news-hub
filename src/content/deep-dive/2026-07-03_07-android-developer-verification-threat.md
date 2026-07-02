---
title: "Android Developer Verification: Threat masquerading as protection"
date: "2026-07-03"
generated: "2026-07-03 07:00"
source: "HN"
slug: "2026-07-03_07-android-developer-verification-threat"
summary: "2026 年 7 月，F-Droid 发文猛烈抨击 Google 的 Android Developer Verification（ADV）开发者验证计划，帖子在 HN 拿下逾一千五百分。Google 自 2025 年 8 月起要求所有 A"
---

# Android Developer Verification: Threat masquerading as protection

## 事件背景
2026 年 7 月，F-Droid 发文猛烈抨击 Google 的 Android Developer Verification（ADV）开发者验证计划，帖子在 HN 拿下逾一千五百分。Google 自 2025 年 8 月起要求所有 Android 开发者中央注册，声称为打击恶意软件，而 F-Droid 认为这是把持续十八年的开放生态彻底改写的借口，遂以近乎檄文的方式发声。

## 核心观点
文章用极具挑衅的修辞，把 ADV 比作"木马"与"病毒"：它伪装成 Android Developer Verifier 系统服务，据称已影响约四十亿设备、几乎半数人类，且无法屏蔽、禁用或卸载，而 Play Protect 本身正是传播渠道。其唯一目的是阻止用户运行未经 Google 中央批准的开发者的软件。要成为"已验证"开发者，须付费、上交政府证件与个人信息、登记签名密钥。文章直指服务条款第 6.5 条从未定义何为恶意软件，等于"我们说是就是"，广告拦截类应用恐首当其冲。

## 社区热议
争论焦点是这是否属于"滑坡谬误"。ranger_danger 认为作者在犯经典滑坡谬误，恐惧的"谷底"往往不会到来；但 aerzen、int_19h 等人反驳，指 Chrome Manifest V3 封杀广告拦截就是同一套"以安全之名夺权"的先例。anilgulecha 批评"病毒木马"式措辞太幼稚，会给 Google 口实；econ 则辩护称作者确有实据。还有人从法律切入：jb282 对比 Apple 是购机时即定规则，Google 却擅改你已拥有的设备；pimeys 称已就此向欧盟 DMA 部门投诉。

## 行业影响
无论修辞是否过火，ADV 都触及移动生态的根本权力结构：平台方一旦握有"定义恶意软件"的单方权力，便能借安全之名决定谁能分发软件。这与 Apple 长期封闭模式殊途同归，也让 sideloading、第三方商店与 DMA 合规之争持续升温。对 F-Droid 这类开源仓库而言，这可能是生存威胁。

## 附带链接
- [HN 讨论](https://news.ycombinator.com/item?id=48755965)
- [F-Droid 原文](https://f-droid.org/2026/07/01/adv-malware.html)
