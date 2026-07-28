---
title: "dani-garcia/vaultwarden"
date: "2026-07-29"
generated: "2026-07-29 07:00"
source: "GitHub"
slug: "2026-07-29_07-vaultwarden"
summary: "Vaultwarden 是 Bitwarden 官方服务端的非官方 Rust 兼容实现（前身 bitwarden_rs）。官方 Bitwarden 服务端依赖 .NET、SQL Server 等多个容器，资源占用高、自建门槛�"
---

# dani-garcia/vaultwarden

## 1. 定位与痛点剖析
Vaultwarden 是 Bitwarden 官方服务端的非官方 Rust 兼容实现（前身 bitwarden_rs）。官方 Bitwarden 服务端依赖 .NET、SQL Server 等多个容器，资源占用高、自建门槛大。Vaultwarden 面向个人与小团队，主打「单进程、低内存、易自建」，解决了自托管密码管理器部署笨重的核心痛点。

## 2. 核心架构与技术细节
采用 Rust 编写，基于 Rocket Web 框架与 Diesel ORM，兼容 Bitwarden 官方客户端 API。数据库可选 SQLite/MySQL/PostgreSQL，SQLite 下几乎零配置。功能覆盖组织、集合、附件、Vaultwarden Send、双因素认证、Web Vault 与 Admin 管理页。单一 Docker 镜像内存占用可低至数十 MB，适合树莓派等低配设备。

## 3. 竞品对比与生态站位
相较官方 Bitwarden 自托管方案，Vaultwarden 更轻量、免付费即可解锁企业级功能（如组织、2FA）。与 KeePass、Passbolt 等相比，其最大优势是完全复用官方全平台客户端与浏览器插件生态，用户无需迁移习惯。

## 4. 开发者反馈与局限性
64500+ Star 印证其在自托管圈的高人气。局限在于：非官方项目不承担商业级安全审计责任，需自行做好 HTTPS、备份与更新；部分官方新特性存在滞后，且不建议大型企业用于生产合规场景。

## 5. 附带链接
- 仓库：https://github.com/dani-garcia/vaultwarden
- Wiki 文档：https://github.com/dani-garcia/vaultwarden/wiki
