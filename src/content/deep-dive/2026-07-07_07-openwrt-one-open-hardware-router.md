---
title: "OpenWrt One – Open Hardware Router"
date: "2026-07-07"
generated: "2026-07-07 07:00"
source: "HN"
slug: "2026-07-07_07-openwrt-one-open-hardware-router"
summary: "OpenWrt 项目推出了自家首款完全开放硬件的路由器 OpenWrt One，登上 HN 首页。它基于 MediaTek Filogic（MT7981BA）SoC，配备 WiFi 6、双频、1 个 2.5Gbit WAN、1 个 1Gbi"
---

# OpenWrt One – Open Hardware Router

## 事件背景
OpenWrt 项目推出了自家首款完全开放硬件的路由器 OpenWrt One，登上 HN 首页。它基于 MediaTek Filogic（MT7981BA）SoC，配备 WiFi 6、双频、1 个 2.5Gbit WAN、1 个 1Gbit LAN、1GB DDR4 内存、256 MiB NAND、M.2 SSD 插槽、USB-C 串口控制台，并支持 802.3af/at PoE 供电。官方售价含外壳与天线约 106 美元、不含约 84 美元，原理图与数据手册全部公开。它的出现，源于社区对"能长期买到、不被厂商锁死、可自由维修"路由参考平台的诉求。

## 核心观点 / 产品机制
关于这款设备到底为谁而造，评论区分成两派。stefan_ 认为其价值在于提供一个易于折腾的开发参考平台——商用硬件生命周期极短，很多型号还没等到 OpenWrt 移植就已停产，且常被厂商锁死。drnick1 进一步指出它意在彻底取代 ISP 派发的劣质网关，省钱之余还能关掉 TR-069 这个后门。txrx0000 则上升到供应链安全：既然监管方担忧廉价商用硬件被植入后门，社区就更需要透明、可复现的开源软硬件栈。

## 社区热议与争议点
反方由自称工程经理的 naturalmovement 打头，直言"这东西毫无实际用途"：只有两个网口没有交换机、PCB 布局臃肿、PoE 永远用不上，同价位现成硬件性能强四倍还能跑 OpenWrt。topspin 针锋相对，反问称职的工程经理恰恰应看出"过大"的 PoE 子板正是参考设计所需，方便实验室替换与集成，UI 与品牌化开发也必不可少。drdexebtjl 补刀道：几乎没有便宜、支持现代 WiFi 又能随时买到的商用路由能跑 OpenWrt，而开放硬件恰好解决了长期供货难题。真实用户 williadc 则现身说法，称从 Google WiFi 换过来后同样稳定、信号更好、家长控制更易配置。

## 行业影响与未来展望
OpenWrt One 的意义不在跑分，而在于把"开放硬件路由"从理念变成随时可下单的实物，并为多家厂商提供以 OpenWrt 为出厂平台的参考设计。在各国收紧路由器安全审查、TR-069 等后门屡受诟病的当下，透明可复现的软硬件栈价值愈发凸显。正如 txrx0000 展望，这类努力未来或将延伸到开源 ASIC 乃至芯片产线。

## 附带链接
- 原帖（HN 讨论链接）: https://news.ycombinator.com/item?id=48808482
- 原始产品链接（外部 URL）: https://openwrt.org/toh/openwrt/one
