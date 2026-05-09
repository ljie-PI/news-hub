---
title: "Deep Dive: Ghost — 开源自托管游戏服务器平台"
date: "2026-05-10"
generated: "2026-05-10 07:00"
source: "PH"
slug: "2026-05-10_07-ghost-open-source-game-servers"
summary: "| 项目 | 内容 |"
---

# Deep Dive: Ghost — 开源自托管游戏服务器平台

## 基本信息

| 项目 | 内容 |
|------|------|
| **产品名称** | Ghost |
| **Product Hunt ID** | 1141635 |
| **Slogan** | Open-source, self-hosted game servers |
| **官网** | https://useghost.sh |
| **GitHub** | https://github.com/haydenbleasel/ghost |
| **PH 投票** | 257 |
| **PH 评论** | 9 |
| **创建者** | Hayden Bleasel（澳大利亚设计工程师，现居旧金山） |

## 产品定位

Ghost 是一款**开源、端到端可自托管的专用游戏服务器平台**，主打“60 秒内启动一个游戏服务器”的极致简洁体验。用户只需选择游戏、选择区域、点击启动，即可获得一台属于自己的云服务器，无需接触终端、SSH 或 Docker 配置。

## 核心特性

### 1. 一键式极简部署
- 选择游戏 → 选择区域 → 点击启动
- 约 60 秒完成服务器部署
- 支持 6 个区域，由 Hetzner Cloud 提供基础设施

### 2. 全栈开源透明
- 整个技术栈托管在 GitHub 上
- 可阅读、Fork、自托管，无黑盒组件
- 采用 Bun 作为包管理器，221 次提交

### 3. 自带基础设施（BYOI）
- 用户需提供自己的 Hetzner Cloud API Token
- 基础设施、计费、数据完全归用户所有
- 平台仅负责“连接和配置”

### 4. 美观的管理面板
- 实时控制台：直接流式输出容器 stdout
- 活动日志：所有启动、停止、重启、配置变更均有记录
- 合理的默认配置，避免数百个开关选项

## 支持的游戏（10 款）

| 游戏 | 类型 |
|------|------|
| Minecraft | 沙盒建造 |
| Valheim | 维京生存 RPG |
| Palworld | 幻兽生存 |
| Enshrouded | 体素大陆生存 |
| V Rising | 吸血鬼哥特开放世界 |
| Rust | 硬核生存 |
| Terraria | 2D 冒险建造 |
| Satisfactory | 工厂自动化 |
| Counter-Strike 2 | 战术 FPS |
| Don't Starve Together | 合作生存 |

用户可通过 GitHub Issue 请求新增游戏。

## 技术架构

| 层级 | 技术 |
|------|------|
| 前端 | Next.js App Router |
| 认证 | Better Auth |
| 数据库 | Prisma ORM + 迁移系统 |
| 后端/代理 | Bun 构建的 TypeScript Agent（编译为 Linux 二进制） |
| 协议层 | Zod Schema + 签名验证（`protocol/` 目录共享给 Agent） |
| 基础设施 | Hetzner Cloud VM |
| 容器化 | Docker + 每游戏独立的 Compose 生成器 |
| 镜像策略 | Golden Snapshot（预烘焙快照，内含所有游戏 Docker 镜像） |

### 关键目录结构

```
app/          → Next.js UI + API
lib/          → 服务端库（数据库、Redis、Hetzner、Agent 辅助、工作流）
protocol/     → Zod Schema + 签名规范
agent/        → Bun 构建的 TypeScript Agent（编译为 Linux 二进制）
prisma/       → 数据库 Schema + 迁移
games/        → 每款游戏的 Compose 生成器
```

## 部署流程（自托管）

1. 克隆仓库并安装依赖（Bun）
2. 配置环境变量：`BOOTSTRAP_JWT_SECRET`、`BETTER_AUTH_SECRET`
3. 运行数据库迁移
4. 部署到 Vercel（预览环境需开启 Deployment Protection Bypass）
5. 登录后在 `/dashboard/account/backend` 保存 Hetzner Token
6. 点击 **Build snapshot** 烘焙 Golden Image（约 10–15 分钟）

> ⚠️ 新 Hetzner 账户默认限制每个项目最多 5 台服务器，需联系 Hetzner 提升限额。

## 添加新游戏

每款游戏需在 `games/<game>/` 目录下提供三个文件：
- `install.ts` — Docker 镜像与 Compose 构建
- `settings.ts` — 设置定义
- `index.ts` — 游戏元数据与导出

参考示例：`games/minecraft/`

添加后需重新部署并再次点击 **Build snapshot**，因为快照的 `docker pull` 列表来源于 `games[].dockerImage`。

## 亮点与差异化

| 维度 | Ghost 的做法 |
|------|-------------|
| **开源程度** | 端到端开源，包括 Agent、Web UI、部署脚本 |
| **用户体验** | 极简三步流程，面向非技术玩家 |
| **基础设施归属** | BYOI 模式，用户完全掌控服务器和账单 |
| **技术栈现代** | Next.js + Bun + Prisma + Docker + Hetzner |
| **可扩展性** | 游戏支持通过标准化接口轻松扩展 |

## 总结

Ghost 是一款由设计工程师 Hayden Bleasel 利用周末时间打造的开源游戏服务器平台。它将传统上需要 Linux 命令行、Docker 配置和网络管理的复杂流程，压缩为“选游戏、选区域、点启动”的三步操作。通过全栈开源、BYOI（自带基础设施）和预烘焙 Golden Image 的策略，Ghost 在**易用性、透明度和用户控制权**之间取得了出色平衡。对于想要快速和朋友开私服、又不想被第三方平台锁定或支付高额托管费用的玩家和开发者来说，Ghost 是一个极具吸引力的选择。

---

*本深度调研基于 Product Hunt 页面、官网 useghost.sh 及 GitHub 仓库 haydenbleasel/ghost 的公开信息整理。*
