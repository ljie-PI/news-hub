---
title: "We found a division by zero bug in FFmpeg with a vibecoded fuzzer"
date: "2026-08-28"
generated: "2026-08-28 07:00"
source: "HN"
slug: "2026-08-28_07-we-found-a-division-by-zero-bug-in-ffmpeg-with-a-v"
summary: "8月27日，fuzzer-tool 作者向 FFmpeg 报告：其覆盖率引导模糊测试器在 7.1.3 的索尼 PS2 VPK 解复用器中触发整数除零。报告给出21字节样本、GDB 回溯及运行数据，定性为可稳定造成拒绝服务的中危问题，而非内存破坏或代码执行。本批冻结互动为148 points、111 comments。"
---

# We found a division by zero bug in FFmpeg with a vibecoded fuzzer

## 事件背景

8月27日，fuzzer-tool 作者向 FFmpeg 报告：其覆盖率引导模糊测试器在 7.1.3 的索尼 PS2 VPK 解复用器中触发整数除零。报告给出21字节样本、GDB 回溯及运行数据，定性为可稳定造成拒绝服务的中危问题，而非内存破坏或代码执行。本批冻结互动为148 points、111 comments。

## 核心观点 / 产品机制

该工具把内存数据经自定义 AVIO 送入“探测—解复用—解码”链，并以边覆盖、Markov 生成及多种变异调度寻找新路径。作者称约49.5万次执行、10小时43分后命中：头解析时声道数有效，`avformat_find_stream_info` 失败路径却可能将其清零，末块读取再以声道数作除数。建议在 `vpk_read_packet` 拒绝零值并加回归测试。关键是这并非首次发现：OSS-Fuzz 早在2024年提交同类补丁，2026年4月又有两版；Patchwork 均仍为 New，当前主分支也仍无该保护。

## 社区热议与争议点

本次 Algolia 实取100个可见节点，已触及上限，不能等同冻结评论总数。saghm 支持以“能复现的具体输入”衡量 fuzzer；cpriest 认为亮点是廉价随机工具仍能击中古老解析器，而非 AI 光环。cptroot 质疑崩溃依赖自定义 AVIO、不能代表普通文件，inigyou 回应 VPK 是既有模块，但承认影响仅为 DoS、现实触发罕见。aeyes 则贴出旧补丁，削弱“首次发现”的叙事。

## 行业影响与未来展望

案例证明 LLM 降低了搭建复杂测试工具的门槛，却也说明“找到崩溃”不等于完成漏洞工程：还须排除测试夹具假象、用常规输入复现、核对历史补丁并推动合并。对广泛嵌入 FFmpeg 的服务，短期可只启用所需格式；长期价值取决于高质量语料、回归测试和可持续的上游审阅，而非生成代码量。

## 附带链接

- [FFmpeg 原始 issue](https://code.ffmpeg.org/FFmpeg/FFmpeg/issues/24290)
- [Hacker News 讨论](https://news.ycombinator.com/item?id=49468642)
- [fuzzer-tool 仓库](https://github.com/daedalus/fuzzer)
- [2024 年 OSS-Fuzz 补丁](https://patchwork.ffmpeg.org/project/ffmpeg/patch/20240807134246.1559-1-kasper93@gmail.com/)
