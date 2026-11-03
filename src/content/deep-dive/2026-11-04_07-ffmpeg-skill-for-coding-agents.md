---
title: "kajisho5/ffmpeg-skill"
date: "2026-11-04"
generated: "2026-11-04 07:00"
source: "GitHub"
slug: "2026-11-04_07-ffmpeg-skill-for-coding-agents"
summary: "这是面向 Claude Code、Cursor、Codex 与 MCP 客户端的本地视频编辑层，把代理容易写错的 FFmpeg 命令收束为有类型、可复验的操作。批次快照累计 4453 stars，本周新增 1352 stars。它服务于不愿上传素材、又需要裁剪、字幕、响度、竖屏和平台导出的开发者；“42 个工具、无云端、无需 API 密钥”均属项目自报。"
---

# kajisho5/ffmpeg-skill

## 定位与痛点剖析

这是面向 Claude Code、Cursor、Codex 与 MCP 客户端的本地视频编辑层，把代理容易写错的 FFmpeg 命令收束为有类型、可复验的操作。批次快照累计 4453 stars，本周新增 1352 stars。它服务于不愿上传素材、又需要裁剪、字幕、响度、竖屏和平台导出的开发者；“42 个工具、无云端、无需 API 密钥”均属项目自报。

## 核心架构与技术细节

默认分支源码显示，项目以 Python 3.10+ 标准库封装 FFmpeg 6.1+，npm 仅承担安装。每个脚本的 `argparse` 解析器在运行时生成输入模式，机器契约再派生 MCP 工具定义，避免命令行与协议重复维护；服务默认只公布 12 个核心工具以节省上下文，但仍可按名称调用全部工具。主流程遵循“探测—编辑—检查—联系表目视复核”，并提供能力侦测、试运行及结构化结果。

## 竞品对比与生态站位

直接使用 FFmpeg 的滤镜图最灵活，却把编解码、容器和验证责任留给代理；Remotion 官方定位是用 React 组件生成视频，更适合程序化动效。该项目占据两者之间的“既有素材本地加工”层，优势是约束与复核，代价是拒绝任意滤镜参数，也不负责理解画面、自动追踪主体或判断剪辑审美。

## 开发者反馈与局限性

真实 issue #367 曾复现 MPEG-TS 裁剪丢失整条视频流却仍返回验证成功；已合并 PR #370 与 #375，加入流清单、长度和首尾解码检查，并在流丢失时改为重编码。开放 issue #143 则承认多数测试来自维护者或持续集成，真正第三方机器与三名职业剪辑师评测尚未完成；因此“可测量正确”仍不等于画面好看或跨环境充分验证。

## 附带链接

- GitHub：https://github.com/kajisho5/ffmpeg-skill
- 项目文档：https://kajisho5.github.io/ffmpeg-skill/
- 问题与修复：https://github.com/kajisho5/ffmpeg-skill/issues/367
- 外部实测缺口：https://github.com/kajisho5/ffmpeg-skill/issues/143
- Remotion 官方文档：https://www.remotion.dev/docs/
- FFmpeg 官方介绍：https://ffmpeg.org/about.html
