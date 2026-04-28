---
title: "深度调研：Super Nintendo 卡带的秘密（2024）"
date: "2026-04-27"
generated: "2026-04-27 07:00"
source: "HN"
slug: "2026-04-27_07-super-nintendo-cartridges"
summary: "---"
---

# 深度调研：Super Nintendo 卡带的秘密（2024）

> 原文标题：Inside the Super Nintendo Cartridges  
> 作者：Fabien Sanglard  
> 发布时间：2024年4月21日  
> HN 热度：548 points，153 comments（主要讨论帖 ID: 40111274）

---

## 1) 事件背景

Super Nintendo（SNES）作为任天堂1990年代的经典主机，其游戏卡带（Cartridge）内部远比大多数人想象的复杂。2024年4月，软件工程师兼技术考古学家 Fabien Sanglard 发布了一篇深度技术长文，通过拆解 SNES 卡带的 PCB（印刷电路板），揭示了这些看似简单的塑料外壳中隐藏的惊人工程智慧。

Sanglard 此前以《quake reverse engineering》《10NES copy protection》等技术考古文章闻名。这次他亲自整理了 3,378 款 SNES 游戏（覆盖美/日/欧版）的 ROM 大小数据库，并系统性地梳理了卡带内部的各类芯片——从 CIC 防盗芯片、SRAM 存档芯片，到各类"增强处理器"（Enhancement Processors）。文章迅速在 Hacker News 引发热议，获得 548 分与 153 条评论，核心原因并非怀旧情绪，而是它揭示了一种今天已经几乎消失的硬件扩展范式。

---

## 2) 核心观点 / 产品机制

文章的核心发现是：**SNES 卡带本质上是一个硬件扩展平台**，而非单纯的 ROM 存储器。

### 2.1 CIC 防盗芯片
SNES 采用双芯片锁步验证机制——主机和卡带各有一个 CIC 芯片，互相通信验证。如果验证失败，主机会重置所有处理器。有趣的是，未授权游戏如《Super 3D Noah's Ark》没有 CIC，玩家需要先在主机插入该卡，再在上方叠加一个正版卡带，让 CIC 总线从正版卡"借道"通过。

### 2.2 ROM 容量的多样性
Sanglard 自制了完整数据库。最小的《Super Mario World》仅 512KB（4Mb），而最大的《Star Ocean》和《Tales of Phantasia》达到 6.3MB（48Mb）。文章特别指出，当年游戏 ROM 大小以"位（bit）"而非"字节"为单位宣传，这一历史细节引发评论区热烈讨论。

### 2.3 SRAM + 电池存档
部分游戏通过 SRAM 芯片实现存档功能，由电池在关机时维持低功耗模式供电。《Zelda III》的 PCB 照片清楚展示了 CIC、ROM、SRAM 和 MAD-1 地址解码芯片的完整布局。

### 2.4 增强处理器——卡带即扩展
这是文章最精彩的部分。SNES 卡带中内置了 **13 种不同的增强芯片，覆盖 72 款游戏**：

- **SA-1（Super Accelerator 1）**：被文章称为"MVP"，内置 65C816 CPU（与 SNES 同款），但主频 10.74MHz 是主机 4 倍，还集成 2KiB SRAM 和 CIC。34 款游戏使用它，包括《Super Mario RPG》。SA-1 可与 SNES CPU 并行工作，理论性能提升 5 倍。令社区惊叹的是，爱好者们近年仍在为《Super Mario World》《Gradius III》《Contra III》等老游戏制作 SA-1 补丁，彻底消除原版卡顿。
- **CX4（Capcom）**：专为《Mega Man X2/X3》设计，支持 3D 线框渲染、向量运算、三角函数和精灵旋转/缩放——不仅用于特效，而是全程处理所有精灵渲染。
- **CS-DD1**：精灵解压芯片，用于《Star Ocean》和《Street Fighter Alpha 2》，能直接向 PPU VRAM 输送解压后的图像数据。
- **DSP-1 系列**：19 款游戏使用，经典如《Super Mario Kart》和《Pilotwings》。提供快速 16 位乘法、逆运算、sin/cos 投影、向量旋转等，对 Mode 7 伪 3D 效果至关重要。
- **Super FX（GSU-1/GSU-2）**：《Star Fox》的 3D 引擎。GSU-1 带 512 字节指令缓存，渲染帧缓冲到卡带 SRAM 再同步到 VRAM。GSU-2 频率翻倍至 21.47MHz，用于《Yoshi's Island》和《DOOM》。社区甚至将 GSU-2 超频到 32MHz，把《DOOM》帧率从 10-11fps 提升到 14-15fps。
- **MSU-1**：非官方芯片，由已故的 Near（RIP）设计，面向 MOD 社区。支持 CD 音质音频、FMV 播放和最高 4GB 存储访问。让社区感慨的是，2020 年仍有一些最冷门的增强芯片尚未被完全逆向工程。

---

## 3) 社区热议与争议点

### 争议 1：现代游戏体积膨胀 vs 过去极致优化

**正方（怀念旧日优化精神）：**
- 用户 **RetroTechie** 直言："优化体积、榨干每一字节的精神，2024 年谁还在做？游戏大小应该与细节复杂度成正比，而不是与开发者填满空间的容易程度成正比。"
- **JohnBooty** 补充："对许多工程师来说，这是工程师思维的一部分。看到游戏工程的这一面相对灭绝，确实有点悲伤。" **bdw5204** 更尖锐："这是近年来几个糟糕范式流行起来导致软件指数级变差的直接结果。"

**反方（时代不同，不可同日而语）：**
- **fennecfoxy** 反驳："持这种观点的人通常只是精英主义。现代游戏的资产规模和技术栈根本不可与 8 位主机的车库项目相提并论。" **eru** 进一步指出："但这就是进步！当年你需要成为巫师才能在 Atari 2600 上做任何事。如今游戏开发对越来越多的人变得可及。"
- **VS1999** 以发展的眼光看问题："也许 20 年后人们会抱怨游戏占 10TB，然后有人会说'当年还有人抱怨 20GB 补丁呢'。每一代人都讨厌无意义的膨胀，但时代的标准在变化。"

### 争议 2：SlowROM 是硬件限制还是任天堂宰客？

这是文章未深入但社区激烈辩论的话题。

**认为任天堂有意降速/宰客：**
- **jsheard** 披露细节："即使没有增强芯片的卡带也有性能分级。Nintendo 提供'FastROM'和'SlowROM'两种规格，SlowROM 更便宜但会把 CPU 从 3.58MHz 降频到 2.68MHz。" **whaleofatw2022** 举例：《Out Of This World》开发商称任天堂不允许他们用 FastROM，因为"每卡带能省整整 50 美分"。
- **beeboobaa3** 直接质问："这到底是硬件原因，还是任天堂在 gouging（宰割）消费者？"

**认为是真实硬件成本差异：**
- **masklinn** 给出技术解释："ROM 芯片本身确实规格不同。FastROM 芯片制造商担保在 120ns 内稳定响应，而 SlowROM 是 200ns。这是真实的成本差异，不是任天堂凭空编造的。" **MBCook** 补充："当时 ROM 产能紧张，有时买不到 Fast 但可以用 Slow。"
- **easyThrowaway** 仍存疑："但说到底所有 SNES 卡带用的都是 mask ROM，最终数据读取速度是否有本质差别？"

### 争议 3：卡带增强 vs 主机外设的商业模式

**支持卡带增强路线：**
- **amlib** 提出替代方案思考："为什么任天堂不能提供第二个卡带槽卖增强卡？Nintendo 自己的高销量游戏可以'播种'这些增强卡，比世嘉 Mega CD（$150）等主机外设更容易普及。"

**反对外设碎片化：**
- **giantrobot** 以世嘉惨痛经历反驳："这就是 SegaCD-32x 的问题。Genesis 卖了数千万台，SegaCD 卖了几百万，32x 不到一百万。需要同时配备两者的游戏，目标市场比纯 32x 游戏还小。我为那些工作室感到惋惜——他们不可能在这种濒临淘汰的罕见配置上做出畅销游戏。"

### 争议 4：CIC 保护如何被破解

**技术怀旧派：**
- **TacticalCoder** 回忆："当年我们都有 SNES 的'备份设备'——带软驱的拷贝机。只需要一张正版卡带插在拷贝机上，设备就会复用那张卡的 CIC 芯片。" **cdchn** 补充："Tengen 甚至自己仿制了 CIC 芯片，还做了独特的塑料外壳。"

**道德与法律视角：**
- **bityard** 讲述了一个有趣的灰色地带："《Super 3D Noah's Ark》是唯一幸存到现代的宗教主题未授权游戏。任天堂不高兴但知道起诉宗教游戏开发商会带来极坏的公关，于是改为向大型零售商施压。" 这揭示了技术保护机制背后的商业博弈，而非单纯的技术对抗。

---

## 4) 行业影响与未来展望

### 4.1 一个已消失的硬件范式
SNES 卡带代表了一种独特的硬件哲学：**通过外设接口将计算能力"外包"到卡带中**。这与今天的软件 DLC、云游戏或订阅模式完全不同。文章揭示的 13 种增强芯片证明，任天堂和第三方开发商曾在硬件层面进行了大量创新投资。

### 4.2 对现代开发者的启示
- **JohnBooty** 对 Fortnite 动画数据结构的解释（~120KB/5秒骨骼动画）与 SNES 时代形成了鲜明对照——今天的"优化"已从字节级压榨转向了数据管道和 GPU 并行计算的效率。
- 然而 **eru** 指出的进步也有道理：Hitman 3 反而利用 SSD 普及缩小了安装体积，因为"不需要再为 HDD 的随机读取速度优化"。这说明优化并未消失，只是优化目标随硬件进化而转移。

### 4.3 逆向工程与文化遗产保护
- 文章最令人动容的部分是对已故的 **Near**（RIP）的致敬。MSU-1 芯片和 Ars Technica 上的精确模拟器文章都是遗产。
- 社区仍在活跃：2024 年仍在为 30 年前的游戏消除卡顿、超频芯片、逆向未解密芯片。**wk_end** 的话最具代表性："SNES 模拟器现在已经极其精确——任何现代/有能力的模拟器都能正确处理这些。"

### 4.4 未来展望
卡带增强模式在今天几乎不可能复现——USB/PCIe 接口的角色更接近，但游戏软件已完全脱离物理媒介。然而，这种"计算能力分散到边缘设备"的哲学，在边缘计算、AI 推理芯片和模块化硬件中仍有回声。SNES 卡带或许是最早的"模块化算力扩展"实践之一。

---

## 5) 附带链接

- **原始文章**：https://fabiensanglard.net/snes_carts/
- **HN 讨论帖（主帖，548 points）**：https://news.ycombinator.com/item?id=40111274
- **HN 讨论帖（任务指定 ID，160 points）**：https://news.ycombinator.com/item?id=47906161
- **作者 ROM 大小数据库（Google Sheets）**：https://docs.google.com/spreadsheets/d/1XH9xKZFQ09lLWfFzo4Y9-1FUAqSTnH6FPrQUINa__Lw/edit?usp=sharing
- **SNES 增强芯片完整列表（Wikipedia）**：https://en.wikipedia.org/wiki/List_of_Super_NES_enhancement_chips
- **SNES Central 芯片资料站**：https://snescentral.com/chiplisting.php
- **SA-1 消除 Super Mario World 卡顿项目**：https://github.com/VitorVilela7/SMW-SA1-Pack
- **Ars Technica：精确 SNES 模拟器的历史（Near 撰文）**：https://arstechnica.com/gaming/2011/08/accuracy-takes-power-one-mans-3ghz-quest-to-build-a-perfect-snes-emulator/
- **Super Mario World 2 卡带 PCB 照片**：https://snescentral.com/pcbboards.php?chip=SHVC-1CB5B-01
- **Mega Man X2 卡带 PCB 照片**：https://snescentral.com/pcbboards.php?chip=SHVC-2DC0N-01

---

*调研完成时间：2026-04-28*  
*调研工具：web_fetch（文章全文 + Algolia HN API 评论）, browser（HN Algolia 搜索）*
