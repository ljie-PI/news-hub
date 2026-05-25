---
title: "ecc-agent-harness"
date: "2026-05-26"
generated: "2026-05-26 07:00"
source: "GitHub"
slug: "2026-05-26_07-ecc-agent-harness"
---

---
title: "ECC：面向 Claude Code / Codex / Cursor 的 Agent Harness 性能优化系统"
date: 2026-05-26
source: GitHub
slug: ecc-agent-harness
---

## 一、定位与痛点

ECC（affaan-m/ECC）把自己定义为"agent harness performance optimization system"——并不是又一份 prompt 模板，而是一整套围绕 AI 编程助手运行时（harness）打造的"操作系统"。它要解决的核心痛点是：开发者在 Claude Code、Codex、Cursor、OpenCode 等多家工具间反复抄配置，结果是 skills 散落、记忆没人管、安全扫描缺位、研究流程靠人脑维持，每换一家就要重新踩坑。ECC 由 Anthropic 黑客松冠军出品，作者用了 10 个月以上日常生产实践打磨，强调"production system, not configs"。仓库当前 191k stars、29.6k forks、197 名贡献者，规模已超出多数同类项目。

## 二、架构与技术

整套系统的核心实体是 **60 个 agents、232 个 skills、75 个 commands、34 套 rules、14 个 MCP servers**，以及 Claude 8 个、Cursor 15 个、OpenCode 11 个 hook events。语言占比上 JavaScript 60%、Rust 30%、Python 5%，其中 `ecc2/` 是 Rust 写的 v2.0 control-plane 原型，`ecc_dashboard.py` 提供 Tkinter 桌面 GUI。仓库通过 `.claude/`、`.cursor/`、`.codex/`、`.opencode/`、`.gemini/`、`.zed/`、`.qwen/` 等"适配器目录"对接十余种 harness，并以 `rules/common/` + 各语言子目录（TypeScript/Python/Go/Swift/Rust/Java/Kotlin 等 12 种）实现"始终生效"的工程约束。安装路径分三档：marketplace 插件 `/plugin install ecc@ecc`、`install.sh --profile minimal/full`、`npx ecc-install`；并通过 `ECC_HOOK_PROFILE` 环境变量切换 minimal/standard/strict 三档严格度。

## 三、竞品与生态

相比 awesome-claude-prompts、cursor.directory 这类"清单仓库"，ECC 更接近 Backstage 之于内部平台——它给 agent harness 提供了 plugin/marketplace 双发行通道（GitHub + Claude marketplace `ecc@ecc` + npm `ecc-universal`），并把 hooks、MCP、rules、skills 当成一套可观测可治理的整体。生态上它覆盖了从 Anthropic 官方 Claude Code，到 OpenAI Codex、Cursor、Copilot、Gemini CLI，再到国内 CodeBuddy（腾讯）、JoyCode、Qwen CLI，是少数明确把"跨 harness 等价语义"作为目标的项目。

## 四、反馈与局限

README 高频出现的"⚠️ CRITICAL"提示揭示了真实痛点：**插件分发无法携带 rules**，必须手动拷贝；同时严禁"先 `/plugin install` 再 `install.sh --profile full`"叠加安装，否则会破坏配置。232 个 skills 与 75 个 commands 的体量也意味着首次接入心智成本不低，2,377+ 内部测试虽然证明覆盖度，但用户仍需自行裁剪。Rust 控制面 ecc2 仍属 alpha，Gemini/Qwen 适配为 experimental。

## 五、附带链接

- 仓库：https://github.com/affaan-m/ECC
- Claude marketplace：`ecc@ecc`
- npm：`ecc-universal`
