---
title: "I ported Mac OS X to the Nintendo Wii"
date: "2026-04-15"
source: "HN"
slug: "2026-04-15_09-2_porting_mac_os_x_nintendo_wii"
summary: "**得分：1921 | 评论：328 | 作者：blkhp19**"
---

# I ported Mac OS X to the Nintendo Wii

**得分：1921 | 评论：328 | 作者：blkhp19**

---

## 事件背景

2026 年 4 月 8 日，软件工程师 Bryan Keller 发布博文，记录了他成功将 Mac OS X 10.0 Cheetah（2001 年的第一版 macOS）移植到任天堂 Wii 游戏机上的全过程。自 2007 年 Wii 发布以来，已有 Linux、NetBSD 和 Windows NT 被移植到该平台，而 Mac OS X 的移植此前曾被 Reddit 用户评为"有零几率实现的事"。这次成功引爆了 HN 社区，获得近 2000 分和 328 条评论。

---

## 核心观点 / 产品机制

**硬件可行性**：Wii 使用 PowerPC 750CL 处理器，是早期 G3 iBook 所用 750CXe 的演进版本——CPU 架构天然兼容。内存方面，Wii 拥有 88MB（24MB 高速 1T-SRAM + 64MB GDDR3），低于 Cheetah 官方要求的 128MB，但作者先通过 QEMU 验证 64MB 配置可启动。

**软件架构**：Mac OS X 有开源核心（Darwin/XNU 内核 + IOKit 驱动框架）和闭源上层（Finder、Dock 等）。关键洞察：一旦 XNU 内核运行，闭源组件无需额外修补就能跑起来。

**自定义 Bootloader（wiiMac）**：作者放弃移植 Open Firmware 或 BootX，选择从头编写自己的 bootloader，基于 Wii 低层示例代码 ppcskel。Bootloader 需完成：
- 硬件初始化
- 从 SD 卡加载 Mach-O 格式的 XNU 内核到内存
- 构建设备树和启动参数
- 将控制权交给内核

**内核加载**：实现了完整的 Mach-O 解码器，按照加载命令将内核各 segment 放置到正确的内存地址，然后跳转到内核入口点。随后重心转向内核补丁和驱动编写——包括串行调试输出、SD 卡、帧缓冲视频输出、USB 接口（用于鼠标和键盘）。

---

## 社区热议与争议点

**正方（纯粹的黑客精神崇拜）**：
- **lanyard-textile**："Absolutely atrocious. Congratulations! That's the hacker spirit."——这种矛盾表达完美诠释了黑客社区对"荒诞但可行"项目的崇拜。
- **monkpit**："I would have said the same. Great work!"——多位顶评肯定了这项工作突破了预期。

**技术细节讨论**：
- 有评论者提到 Windows NT 此前已被移植到 Wii（github.com/Wack0/entii-for-workcubes），引发了"哪个 OS 更难移植"的讨论。
- 关于闭源驱动行为的讨论：**blkhp19（作者本人）** 解释了 Wii 平台存在未文档化的行为和 bug，必须研究和绕过，不能完全依赖官方文档。
- **crazysim** 补充："有时东西没有文档，有时文档是错的。"

**争议**：极少数人质疑这类项目的实际意义，但绝大多数评论者认为这是纯粹的技术探索，意义不需要辩护。

---

## 行业影响与未来展望

这个项目的技术价值在于展示了 PowerPC 架构移植的可行路径，并为低内存环境下的 OS 启动提供了参考实现。wiiMac bootloader 已开源（github.com/bryankeller/wiiMac），可作为自定义 bootloader 开发的学习材料。

更深远的启发在于：随着 RISC-V 和 ARM 设备多样化，定制化 OS 移植和 bootloader 开发技能的价值正在提升。嵌入式系统、物联网设备和老旧硬件复活将持续受益于这类探索性工程实践。

---

## 附带链接

- 原文：https://bryankeller.github.io/2026/04/08/porting-mac-os-x-nintendo-wii.html
- wiiMac Bootloader：https://github.com/bryankeller/wiiMac
- HN 讨论：https://news.ycombinator.com/item?id=47691730
