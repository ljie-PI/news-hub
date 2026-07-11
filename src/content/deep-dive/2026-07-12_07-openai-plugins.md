---
title: "openai/plugins"
date: "2026-07-12"
generated: "2026-07-12 07:00"
source: "GitHub"
slug: "2026-07-12_07-openai-plugins"
summary: "openai/plugins 是 OpenAI 官方维护的 Codex 插件示例仓库（据 README 自报口径），旨在解决 AI 编码代理\"能力零散、难以复用\"的痛点。开发者以往需要为每个工"
---

---
title: "openai/plugins"
date: 2026-07-12
source: github
slug: openai-plugins
---

# openai/plugins

## 定位与痛点剖析

openai/plugins 是 OpenAI 官方维护的 Codex 插件示例仓库（据 README 自报口径），旨在解决 AI 编码代理"能力零散、难以复用"的痛点。开发者以往需要为每个工具链手写胶水逻辑，而该仓库提供一套标准化的插件结构，让 Codex 能通过统一清单发现并加载技能、命令与外部服务，降低扩展门槛。仓库创建于 2026 年 3 月，已获 4393 star、656 fork，热度可观。

## 核心架构与技术细节

据 README 自报口径，每个插件位于 `plugins/<name>/` 目录下，必须包含 `.codex-plugin/plugin.json` 清单，并可选配 `skills/`、`.app.json`、`.mcp.json`、`agents/`、`commands/`、`hooks.json` 及 `assets/` 等伴生文件。默认市场由 `.agents/plugins/marketplace.json` 描述并指向标准 `plugins/` 目录；API key 登录用户则使用独立的 `api_marketplace.json`。主语言为 JavaScript，仓库体积约 98MB。

据 README 自报口径，仓库亦收录了多个较丰富的实战示例：`plugins/figma` 覆盖设计到画布与设计系统规则，`plugins/notion` 面向规划、研究与知识沉淀，`plugins/build-ios-apps`、`plugins/build-macos-apps`、`plugins/build-web-apps` 分别覆盖 SwiftUI、AppKit 与 Web 部署、支付、数据库等工作流，`plugins/expo` 则支持 React Native 与 EAS 流程，另有 netlify、remotion、google-slides 等技能与 MCP 后端的插件包。

## 竞品对比与生态站位

相较于 Anthropic 的 MCP 生态与各类第三方 IDE 插件市场，该仓库通过原生集成 MCP（`.mcp.json`）实现了"官方基座加开放协议"的双重站位：一方面借力既有标准降低互操作成本，另一方面把 Codex 打造为统一编排入口，将设计、笔记、移动端、Web 部署等垂直场景收敛到同一插件框架下，生态卡位与官方背书意图明显。

## 开发者反馈与局限性

仓库关闭了 Issues（`has_issues=false`），且 PR 仅限协作者提交，普通开发者的反馈与贡献渠道相对受限；当前存在 41 个开放事项、缺失 License 声明，导致二次分发与商用的法律边界较为模糊。此外，作为定位为"示例集合"的仓库，其插件的生产级稳定性、版本兼容与长期维护承诺仍需进一步验证，使用者宜将其视为参考模板而非即插即用的成品。

## 附带链接

- 仓库主页：https://github.com/openai/plugins
- README：https://raw.githubusercontent.com/openai/plugins/main/README.md
