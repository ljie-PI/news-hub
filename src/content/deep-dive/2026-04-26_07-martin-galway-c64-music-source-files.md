---
title: "Martin Galway 公开 1980 年代 Commodore 64 游戏音乐源代码——一段芯片音乐的活化石"
date: "2026-04-26"
generated: "2026-04-26 07:00"
source: "HN"
slug: "2026-04-26_07-martin-galway-c64-music-source-files"
summary: "2026 年 4 月 14 日，传奇 SID 音乐作曲家 **Martin Galway** 在 GitHub 上创建了仓库 [MartinGalway/C64_music](https://github.com/MartinGalway/C64_music)，将自己在 1980 年代为 Com"
---

# Martin Galway 公开 1980 年代 Commodore 64 游戏音乐源代码——一段芯片音乐的活化石

## 事件背景

2026 年 4 月 14 日，传奇 SID 音乐作曲家 **Martin Galway** 在 GitHub 上创建了仓库 [MartinGalway/C64_music](https://github.com/MartinGalway/C64_music)，将自己在 1980 年代为 Commodore 64 游戏编写的音乐播放器及乐曲源文件（6502/6510 汇编）完整公开。

Martin Galway 1966 年出生于北爱尔兰贝尔法斯特，是 C64 平台上最负盛名的 SID 芯片音乐人之一。他曾就职于英国游戏发行商 Ocean Software，为《Wizball》《Arkanoid》《Rambo: First Blood Part II》《Green Beret》《Parallax》等数十款经典游戏创作音乐。他也是公认的**第一位在 C64 音乐中使用采样鼓声**的作曲家——通过逆向一款名为 Digidrums 的鼓合成器程序，他自创了一套在 SID 芯片上回放数字采样的方法，到《Game Over》时这一技术已相当成熟。

Galway 在仓库说明中写道：公开源文件是为了让人们"阅读、分析并理解这些音乐播放器以及我的工作方式"，并鼓励社区重新汇编、修改甚至创作新音乐，只需注明原作者即可。他还特别说明，这些代码的版权已从当年的雇主 Infogrames 处回购到自己名下。

仓库中包含两代播放器引擎：**第一代**（1984–1987 年间使用，代表作《Wizball》）和**第二代**（首次用于《Athena》，后来又用于《Times of Lore》《Insects in Space》等作品）。此外还附有 Ocean Software 内部汇编器指令说明文档，为研究 1980 年代英国游戏工业的开发工具链提供了罕见的一手资料。

## 核心技术解读：SID 驱动不只是"音符"

这些源文件揭示了 C64 音乐的本质——它不是简单的"旋律+节拍"，而是一个以约 50–200 Hz 频率运行的**微型实时调度引擎**。播放器在每次中断（IRQ）中直接操纵 SID 芯片的寄存器：逐帧扫描滤波器截止频率、在音符中途重触发 ADSR 包络、在声道之间切换环形调制……正如一位 HN 评论者精辟总结的：**"声音就是寄存器调度表本身，而非其上的音符。"**

以 `wizball.asm` 为例，steve_taylor 在评论中指出，该文件的第 39 行起清楚标注了 PAL 和 NTSC 两种制式下 200 Hz 中断的定时参数。这种对硬件时序的极致把控，是 Galway 作品在 SID 芯片仅有三个声道的限制下依然音色丰富的关键。

## 社区热议与争议

该帖在 Hacker News 获得 154 分、18 条评论，讨论热度远超一般怀旧话题，围绕几个焦点展开：

**1. 能否用 AI 把汇编源码"翻译"成现代音乐格式？**

用户 ncr100 率先提问：能否将这些源码转译为 Tidal Cycles 或 Strudel JS 之类的现代模式化音乐语言？他甚至贴出了 Claude AI 生成的 Strudel 版 Wizball 主旋律，但效果差强人意。用户 talideon 直言"听起来跟 Wizball 或 Game Over 完全不像"。而 the_data_nerd 从技术层面解释了原因：**难点不在音符，而在逐帧寄存器操作**——滤波扫描、环形调制切换、ADSR 重触发等才是 Galway 音色的灵魂，简单转谱会丢失所有这些。

**2. 但 AI 也展现了惊人能力。**

cpldcpu 用 Claude 尝试了另一条路线：Claude 直接识别出源文件是什么，从网上下载了 PSID 格式文件，找到一个 WebAssembly 版 SID 播放器，并搭建了一个可在线播放的网页。GPT-5.5 则走了不同路径——编写 Python 脚本提取音乐数据，最终将汇编源码**翻译成 JavaScript 实现**并部署到 Netlify，效果"令人印象深刻"。两条路线的对比，恰好印证了 the_data_nerd 的观点：要忠实还原，必须模拟整个 SID 引擎而非仅仅转录音符。

**3. 源文件超过 C64 内存——当年怎么开发的？**

用户 layer8 敏锐地指出，这些源文件的体积超过了 C64 的 64KB RAM 上限。talideon 回应说，当时很多公司使用 Tatung Einstein 或 Atari ST 等外部机器作为交叉开发平台，源码在宿主机上编辑和汇编，再传输到 C64 运行。这一细节引发了 flopsamjetsam 的感慨："我从 Amiga 时代入坑，用的都是 SoundTracker 文件，完全不知道音乐竟然是这样手写代码的。"

**4. 纯粹的怀旧与致敬。**

MrScruff 回忆小时候最爱 Wizball 和 Parallax 的配乐，还曾尝试自己用汇编写播放器（"又一个没完成的项目"）。TacticalCoder 讲述了疫情期间独自回到儿时老屋，从阁楼翻出 C128，清洁并给磁盘驱动器上油，成功加载了《Commando》——然后让 Rob Hubbard 的开场音乐循环播放数小时。erwincoumans 则简洁有力地说："Green Beret 和 Rambo 的配乐至今仍然惊艳，Martin 是个巫师。"

## 行业影响与未来展望

Galway 此举的意义超越了怀旧。这是极少数由原作者亲自公开、并附有完整技术说明的 1980 年代游戏音乐源码。它为以下方向提供了宝贵资源：

- **数字音乐考古**：研究者第一次可以在源码级别分析 SID 音乐驱动的完整设计，而非通过逆向工程猜测
- **AI 辅助的遗产保存**：HN 讨论已经证明，现代 LLM 能够理解这些汇编代码并进行有意义的翻译或模拟，为芯片音乐的跨平台保存开辟新路
- **创作教育**：Galway 明确鼓励修改和再创作，这为学习低级硬件编程和音频合成的开发者提供了来自大师的真实教材
- **版权回归的范例**：Galway 从 Infogrames 手中回购了自己作品的版权，这一举动对游戏行业创作者权益保护具有示范意义

在一个 AI 生成音乐泛滥的时代，这些 40 年前一帧一帧手工调教寄存器的源文件，既是对"约束催生创造力"的最好注脚，也是对工匠精神的无声致敬。

---

**链接**

- 原始仓库：[MartinGalway/C64_music (GitHub)](https://github.com/MartinGalway/C64_music)
- HN 讨论：[Hacker News #47900398](https://news.ycombinator.com/item?id=47900398)
- 在线试听 Wizball：[DeepSID](https://deepsid.chordian.net/?file=/MUSICIANS/G/Galway_Martin/Wizball.sid&subtune=4)
- SID 音乐电台：[SLAY Radio](https://slayradio.org)
