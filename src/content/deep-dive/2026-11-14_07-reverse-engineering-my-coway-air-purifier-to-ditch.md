---
title: "Reverse engineering my Coway air purifier to ditch the cloud"
date: "2026-11-14"
generated: "2026-11-14 07:00"
source: "HN"
slug: "2026-11-14_07-reverse-engineering-my-coway-air-purifier-to-ditch"
summary: "Scott 想让 Apple Home 的“晚安”场景同时把净化器调成白噪声档，但原有 Home Assistant 集成仍绕经 Coway 云端，曾因封禁、应用改版、网页结构变化和服务器离线反复失效。本批次冻结热度为 636 points、188 comments；调研时 Algolia 实取 100 个可见评论节点，已触及本次上限，二者不可混算。"
---

# Reverse engineering my Coway air purifier to ditch the cloud

## 事件背景

Scott 想让 Apple Home 的“晚安”场景同时把净化器调成白噪声档，但原有 Home Assistant 集成仍绕经 Coway 云端，曾因封禁、应用改版、网页结构变化和服务器离线反复失效。本批次冻结热度为 636 points、188 comments；调研时 Algolia 实取 100 个可见评论节点，已触及本次上限，二者不可混算。

## 核心观点 / 产品机制

作者先用树莓派、流量重定向和 mitmproxy 发现设备经明文 HTTP 下载根证书且直接信任，继而替换注册响应，把 MQTT 目标改成本地服务。再借助 Android 蓝牙日志、ADB 与反编译代码还原配网：设备在 FFA2 接收 P001 密钥，再以该密钥和 MAC 拼成 AES 密钥，将含 Wi-Fi、caUrl、certSvrUrl 的 Protobuf 配置封进 P002。既然服务器地址本就在蓝牙载荷里，最终无需中间人。当前 coway-local 0.5.2 用 Web Bluetooth 配网，在 Home Assistant 内运行本地 CA、HTTPS 注册和双向 TLS MQTT，并按设备限制主题。作者自报 AI 约二十分钟完成原本可能耗时数小时至数日的还原；这不是独立效率测试。仓库也明确只在一台 AP-1022K 上验证。

## 社区热议与争议点

正面看，Aurornis 认为 LLM 把繁琐逆向压缩到业余时间可完成；criley2 则提醒云端应用仍提供空气质量通知、历史图表和远程童锁等便利。反面看，skrtskrt 主张直接支持 Coway 的非联网型号，比购买后再破解更有效；sippingabonedry 还纠正说法：公开证书经 HTTP 传输并非原罪，真正漏洞是设备未经可信锚或签名验证便接受它。讨论因此并非单纯“去云必然更好”，而是在所有权、便利与验证设计间取舍。

## 行业影响与未来展望

案例说明 AI 能降低协议考古和本地化改造门槛，也暴露消费物联网把长期控制权绑在厂商服务上的脆弱性。但新设备可加强证书固定，现有实现又依赖固定局域网地址、特定固件与私有协议，尚不能视作通用方案。更可持续的方向是厂商提供本地 API，或采用默认离线可用、可审计的开放协议。

## 附带链接

- [原文](https://scottjg.com/posts/2026-11-11-reverse-engineering-my-coway-air-purifier-to-ditch-the-cloud/)
- [Hacker News 讨论](https://news.ycombinator.com/item?id=50474959)
- [coway-local 实现仓库](https://github.com/scottjg/coway-local)
