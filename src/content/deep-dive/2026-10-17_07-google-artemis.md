---
title: "google/artemis"
date: "2026-10-17"
generated: "2026-10-17 07:00"
source: "GitHub"
slug: "2026-10-17_07-google-artemis"
summary: "ARTEMIS 是面向移动测试工程师与编码代理的自然语言 Android 自动化框架，目标是把“描述任务—操作真机—采集截图、轨迹与 Logcat—生成诊断”串成闭环，降低跨应用流程依赖脆弱脚本和固定坐标的维护成本。当前 GitHub REST 元数据显示默认分支为 main、以 Python 为主、采用 Apache-2.0，选中时与查询时均为 12,040 stars；开放 issue/PR 合计 139 个。"
---

# google/artemis

## 定位与痛点剖析

ARTEMIS 是面向移动测试工程师与编码代理的自然语言 Android 自动化框架，目标是把“描述任务—操作真机—采集截图、轨迹与 Logcat—生成诊断”串成闭环，降低跨应用流程依赖脆弱脚本和固定坐标的维护成本。当前 GitHub REST 元数据显示默认分支为 main、以 Python 为主、采用 Apache-2.0，选中时与查询时均为 12,040 stars；开放 issue/PR 合计 139 个。

## 核心架构与技术细节

清单要求 Python 3.12，并组合 LangGraph、LangChain、MCP、UIAutomator2、FastAPI 与图像处理栈。源码中的 Pro 图依次编排 Planner、感知、Operator、执行检查、Validator 与 Summarizer；感知节点同时取截图、XML 层级和 OCR，Accessibility Helper 失效时可退回 UIAutomator2。Flash 是压缩历史的快速反应循环，Pro 则维护计划并在动作前后校验；MCP 将异步任务、设备状态、轨迹检查和诊断暴露给编码助手。README 宣称 AndroidWorld 任务完成率超过 99%，但默认分支仅见排行榜图片，未见评测脚本，因此只能视为项目自报口径。

## 竞品对比与生态站位

Appium 以 W3C WebDriver、跨平台驱动、客户端和插件生态见长，适合确定性回归；uiautomator2 则是轻量的 Android 端 HTTP 服务加 Python 客户端。ARTEMIS 的差异在自然语言、多模态定位、长任务记忆及 MCP 闭环，代价是 Python 3.12、模型服务、ADB 与辅助功能授权带来的部署面更宽；iOS 仍列在路线图，平台覆盖暂不及 Appium。

## 开发者反馈与局限性

issue #138 报告：配置 OpenAI 兼容端点后，Flash 的摘要器和记忆分块仍硬编码 Gemini，任务会在首步前失败。评论指向修复 PR #168；该 PR 引入按 provider 路由，作者评论说明改动由大模型辅助、已人工复核并本地测试，但目前仍为 open 且 blocked，不能算默认分支已修复。这也说明多模型兼容声明仍有实现缝隙；加上基准复现材料不足，生产采用前应自行跑设备、弹窗和长流程回归。

## 附带链接

- [GitHub 仓库](https://github.com/google/artemis)
- [项目 README](https://github.com/google/artemis/blob/main/README.md)
- [issue #138](https://github.com/google/artemis/issues/138) / [PR #168](https://github.com/google/artemis/pull/168)
- [Appium](https://github.com/appium/appium) / [uiautomator2](https://github.com/openatx/uiautomator2)
- [AndroidWorld](https://github.com/google-research/android_world)
