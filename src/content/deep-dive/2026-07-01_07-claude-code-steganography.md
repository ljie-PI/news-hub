---
title: "Claude Code is steganographically marking requests"
date: "2026-07-01"
generated: "2026-07-01 07:00"
source: "HN"
slug: "2026-07-01_07-claude-code-steganography"
summary: "开发者 Thereallo 出于隐私审查，反编译了本地安装的 Claude Code 2.1.196 二进制文件。他指出，编程 agent 通常被授予文件系统、shell、git 乃至 computer use 的高"
---

# Claude Code is steganographically marking requests

## 事件背景
开发者 Thereallo 出于隐私审查，反编译了本地安装的 Claude Code 2.1.196 二进制文件。他指出，编程 agent 通常被授予文件系统、shell、git 乃至 computer use 的高权限，因此承载它的客户端本身理应"无聊而透明"。然而他发现：系统提示词里那句不起眼的"Today's date is 2026-06-30."并不总是原样发送——客户端会在用户和模型几乎都察觉不到的情况下，悄悄改写其中字符。

## 核心观点 / 产品机制
这是一种"提示词隐写术"（prompt steganography），把信号藏进看似普通的英文句子。触发条件是用户设置了 `ANTHROPIC_BASE_URL`。客户端随即三重判断：若系统时区为 Asia/Shanghai 或 Asia/Urumqi，日期分隔符从 `-` 改成 `/`；若 base URL 主机名命中内置域名列表，撇号 `'` 被替换成视觉上几乎一样的 Unicode 字符（分别对应"已知域名""实验室关键词""二者皆中"）。域名与关键词列表以 base64 存储、再用密钥 91 做 XOR 解码，解出的关键词包括 deepseek、moonshot、minimax、zhipu、stepfun 等中国 AI 实验室名，域名则涵盖大量代理、转售、网关站点。Thereallo 认为借此识别 API 转售商与"蒸馏攻击"管道情有可原，但用隐写而非公开 telemetry 字段实现，是对开发者信任的损害。

## 社区热议与争议点
HN 1253 分、344 评论，火药味十足。最尖锐的追问来自 MattDamonSpace："惩罚到底是什么？"评论区猜测不一：pedropaulovc 称合法使用被误封概率上升，bakugo 推测会触发"输出投毒"或封号，realusername 担心被悄悄降级到 Fable 那样的"阉割版"模型。_alternator_ 给出更冷静的视角：单点指纹很容易绕过，但要同时打败所有技巧、还要持续追赶新二进制更新则代价高昂，自行打补丁的研究者反而会因"不一致"而暴露。反方情绪更激烈，theplumber 直言"越了解 Anthropic 越反感"；sigmoid10 认为"仅用于分析就还好"，立刻被 krupan 用斯诺登事件反驳"太天真"。也有人务实退出：wolttam 称已转向自托管 DeepSeek V4 Flash。

## 行业影响与未来展望
该事件触及厂商与用户之间的根本张力：客户端权限越大，隐蔽行为对信任的杀伤力越强。在中美模型竞争与出口管制背景下，用指纹追踪转售与蒸馏几乎是必然趋势，但手段的透明度将成为开发者选择 harness 的新标准。可以预见，本地化、可审计的开源 agent 框架会因此获得更多拥趸。

## 附带链接
- HN 讨论：https://news.ycombinator.com/item?id=48734373
- 原始新闻：https://thereallo.dev/blog/claude-code-prompt-steganography
