---
title: "digitalplatdev-freedomain"
date: "2026-05-27"
generated: "2026-05-27 07:00"
source: "GitHub"
slug: "2026-05-27_07-digitalplatdev-freedomain"
---

---
title: "DigitalPlatDev/FreeDomain"
date: "2026-05-27"
source: "GitHub"
slug: "digitalplatdev-freedomain"
---

## 1. 定位与痛点

DigitalPlat FreeDomain 由 Edward Hsing 于 15 岁时发起，定位是「让每个人都拥有数字身份」的免费域名注册平台。在商业域名动辄数十美元、TLD 续费持续上涨的背景下，独立开发者、学生、开源项目和小型站点对零成本可控域名的需求十分旺盛。该项目通过自持的若干二级域名（如 `.dpdns.org`、`.us.kg`、`.qzz.io`、`.xx.kg`、`.qd.je`）向社区免费分发子域名，目前已注册超过 50 万个域名，痛点击中明显。

## 2. 技术架构

仓库本身以 HTML（94%）+ JavaScript（3%）+ Python（2%）为主，对外暴露的核心入口是注册仪表盘 `dash.domain.digitalplat.org`。后端负责账号、申请审核、滥用举报与 DNS 记录写入，前端则提供文档站点（教程、FAQ、tutorial markdown）。DNS 层并不绑死供应商，用户可自由对接 Cloudflare、FreeDNS（afraid.org）、Hostry 等托管商，把所有权与 DNS 解析解耦，整体走「自营注册 + 第三方解析」的轻量架构，License 为 AGPL-3.0。

## 3. 竞品对比

相比 Freenom（已基本停止服务、口碑崩塌）、`.tk`/`.ml` 等已沦为垃圾域的免费 TLD，FreeDomain 选择了「在自己持有的真域名下分发子域」的模式，避免被注册局突然回收。与 `js.org`、`is-a.dev` 等基于 GitHub PR 申请子域的方案相比，本项目提供独立仪表盘，门槛更低、流程更自动化、可申请多种后缀；但 PR-based 方案在可审计性与去中心化上更优。

## 4. 局限性

- 子域名而非真正顶级域，部分场景（邮箱送达率、SSL EV 证书）受限；
- 项目曾遭遇 Telegram 账号被盗，README 顶部专门警告勿信 Telegram 渠道，凸显运营安全的脆弱；
- 依赖个人/小团队维护与 Hack Club 捐赠资金，长期可持续性需关注；
- 滥用治理压力大，注册量已超 50 万，反垃圾与合规需要持续投入。

## 5. 附带链接

- 仓库：<https://github.com/DigitalPlatDev/FreeDomain>
- 注册入口：<https://dash.domain.digitalplat.org/>
- 创始人故事：<https://dev.to/edwardhsing/i-bought-a-domain-at-15-now-it-powers-400000-users-7ol>
- Discord：<https://discord.gg/ma4RZzMmVW>
