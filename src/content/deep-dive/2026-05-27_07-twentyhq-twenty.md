---
title: "twentyhq-twenty"
date: "2026-05-27"
generated: "2026-05-27 07:00"
source: "GitHub"
slug: "2026-05-27_07-twentyhq-twenty"
---

---
title: "twentyhq/twenty"
date: "2026-05-27"
source: "GitHub"
slug: "twentyhq-twenty"
---

## 1. 定位与痛点

Twenty 自我标榜为「面向 AI 时代设计的 Salesforce 开源替代」，目标用户是希望像管理代码一样管理 CRM 的技术团队。传统 CRM（Salesforce、HubSpot）存在三大痛点：定制成本高、数据结构变更慢、AI 接入受限于厂商节奏。Twenty 把对象、视图、工作流、AI Agent 都抽象为可声明的代码资产，允许团队像版本化业务代码一样版本化 CRM，并提供 Cloud、Docker Compose 自托管与 `npx create-twenty-app` 三种使用路径。

## 2. 技术架构

技术栈 78% TypeScript + 18.5% MDX，monorepo 以 Nx 管理。后端基于 NestJS + BullMQ + PostgreSQL + Redis，提供 GraphQL API；前端使用 React + Jotai（状态）+ Linaria（CSS-in-JS）+ Lingui（i18n）。开发者通过 `twenty-sdk/define` 暴露的 `defineObject`、`FieldType` 等 DSL 声明业务模型，再通过 CLI（已改为 colon 语法，如 `twenty dev:build`、`twenty docker:start`）打包发布到工作区。最近版本升级到 Node 24，使用 oxfmt 替代 Prettier 统一格式化，并补齐 OIDC/SAML SSO；安全方面升级 esbuild ≥0.28.0 以修复 CVE-2025-68121（CVSS 10.0）。

## 3. 竞品对比

- Salesforce：功能最全但闭源、贵、低代码定制锁定 Apex；
- HubSpot：上手简单但深度定制困难；
- SuiteCRM / EspoCRM：传统开源 CRM，技术栈较老、扩展靠 PHP 模块；
- Attio、Folk：体验现代但闭源 SaaS。

Twenty 的差异化在于「CRM-as-Code + AI Agent 一等公民 + 现代 TS 全栈」，对工程团队亲和度高。

## 4. 局限性

- 仍处快速迭代期，2.x 仍在大改 CLI 与 SDK，破坏性变更频繁；
- 自托管对 Postgres/Redis 运维有要求，并非 SQLite 单文件式简易；
- 生态插件与第三方集成数量远不及 Salesforce/HubSpot；
- AI Agent 能力依赖外部 LLM 凭据，企业级合规需额外配置；
- 中文文档与本地化程度仍有限。

## 5. 附带链接

- 仓库：<https://github.com/twentyhq/twenty>
- 官网：<https://twenty.com/>
- 文档：<https://docs.twenty.com/>
- 自托管：<https://docs.twenty.com/developers/self-host/capabilities/docker-compose>
- Discord：<https://discord.gg/cx5n4Jzs57>
