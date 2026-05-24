---
title: "Vivado 2026.1 在免费版砍掉 Linux 支持，引发 FPGA 社区强烈反弹"
date: "2026-05-25"
generated: "2026-05-25 07:00"
source: "HN"
slug: "2026-05-25_07-vivado-2026-1-dropping-linux-free-tier"
summary: "2026 年 5 月 18 日，AMD Adaptive 支持论坛出现一则用户提问：自 Vivado 2026.1 起，**免费 BASIC 等级将不再支持 Linux**，Linux 仅保留在其上四个付费等级中，而 W"
---

---
title: Vivado 2026.1 在免费版砍掉 Linux 支持，引发 FPGA 社区强烈反弹
date: 2026-05-25
source: Hacker News
slug: vivado-2026-1-dropping-linux-free-tier
score: 286
comments: 170
---

# Vivado 2026.1 在免费版砍掉 Linux 支持，引发 FPGA 社区强烈反弹

## 事件背景
2026 年 5 月 18 日，AMD Adaptive 支持论坛出现一则用户提问：自 Vivado 2026.1 起，**免费 BASIC 等级将不再支持 Linux**，Linux 仅保留在其上四个付费等级中，而 Windows 仍可在 BASIC 等级使用。该改动直接影响业余玩家、独立开发者、高校用户以及大量长期使用 Vivado ML Standard / WebPACK 的 FPGA 群体——他们多数运行 Linux 工作流，且依赖免费版做评估、教学与开源板卡开发。

## 核心观点
- 用户 **mkru**：这是"既贪婪又不尊重人的决定，Linux 既然已经支持四个高等级，BASIC 多支持一份成本几乎为零"。
- 用户 **filisavi**：是"圈钱"行为，针对被绑定的开发者池，迫使专业用户掏 ~1200 美元升级到付费 Core 版。
- AMD 论坛版主 **Anatoli Curran** 的官方回应避重就轻：①警告用户不得"使用粗俗或攻击性语言"；②声称 BASIC 仅供"入门简单需求"，生产用途请购买付费 license；③用户仍可永久免费使用任何 2026.1 之前的版本（如 Vivado ML Standard 2025.2）；④为学生提供 60 天全功能 Enterprise 试用；⑤大学可申请 AMD 捐赠。
- AMD 的官方理由："近 70% 客户仍在 Windows，AMD 不会放弃 Windows 全面支持"——但 mkru 反复追问的"为何把 Linux 排除在 BASIC 之外"始终被官方回避。

## 社区热议
HN 帖子（id=48254309，286 分 170 评）的主流情绪：① "Xilinx 被 AMD 收购后又一次商业化收紧"，许多老用户列出此前砍掉的免费 IP、关闭的论坛账户和取消的本地化等历史污点；② 高校教师与开源硬件项目作者（LiteX、RISC-V 板卡、retro-computing 团队）担心这将导致下一代学生无法在 Linux 下入门 FPGA，长期削弱 Xilinx 生态的人才储备；③ 大量评论建议迁移到开源工具链（Yosys、nextpnr、F4PGA）或转向 Lattice、Efinix 等竞品，把这一事件当作"开源 EDA 工具的助推器"；④ 也有务实派指出可暂时停留在 Vivado 2025.2 永久免费，等待 AMD 在反弹下让步。

## 行业影响
1. **对 AMD/Xilinx**：短期收入提升存疑（论坛用户 tomorrow56 直言"只会阻碍试用，不会带来收入"），但品牌口碑在硬件开发者圈进一步受损。
2. **对开源 FPGA 工具链**：Yosys + nextpnr + F4PGA 等项目可能因此获得更多关注和贡献者，加速覆盖更多 Xilinx 系列。
3. **对教育生态**：高校 FPGA 教学普遍使用 Linux 实验环境，新政将迫使院校申请捐赠或切换课程到 Lattice/Intel Quartus。
4. **对竞品**：Lattice、Efinix、Microchip 等可借机扩大份额，尤其是在开源工具友好度上。

## 链接
- 原帖：https://adaptivesupport.amd.com/s/question/0D5Pd00001YQLdMKAX/why-is-vivado-20261-dropping-linux-support-for-free-tier-?language=en_US
- HN 讨论：https://news.ycombinator.com/item?id=48254309
