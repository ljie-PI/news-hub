---
title: "Superset Mobile"
date: "2026-09-22"
generated: "2026-09-22 07:00"
source: "PH"
slug: "2026-09-22_07-superset-mobile"
summary: "Superset Mobile 于九月二十一日登上 Product Hunt 日榜第一。冻结数据为四百零六票、九十六条评论；调研时官方接口已到四百零九票。产品把桌面端多代理工作区延伸到 iPhone，官方定位是离桌后继续启动任务、跟踪运行并审阅差异，要求 iOS 二十六以上且包含在 Pro 订阅中。"
---

# Superset Mobile

## 事件背景

Superset Mobile 于九月二十一日登上 Product Hunt 日榜第一。冻结数据为四百零六票、九十六条评论；调研时官方接口已到四百零九票。产品把桌面端多代理工作区延伸到 iPhone，官方定位是离桌后继续启动任务、跟踪运行并审阅差异，要求 iOS 二十六以上且包含在 Pro 订阅中。

## 核心观点 / 产品机制

工作区仍驻留在电脑：每项任务对应独立 Git 工作树、分支、终端和端口；手机是经 Superset Relay 连接宿主服务的远程界面，代理进程、代码与原生会话文件不迁入手机。远程访问默认关闭，宿主所有者须显式开启并授权成员；官方甚至建议使用只放必要仓库和凭据的独立主机。移动端已展示启动代理、续接同一工作区和查看差异。发布文案称可合并拉取请求，但正式资料只明确差异审阅及通用分支、拉取请求流程，因此不能把手机端直接合并写成已独立验证能力。

## 社区热议与争议点

官方接口取得四十一个顶层评论、五十二个回复。其一，用户担心多文件改动在小屏难审，产品方称新拉取请求视图会改善但仍在迭代；其二，有人追问凭据，答复是复用电脑上已登录的 Claude 或 Codex 账号，却未解释更细的令牌隔离；其三，云工作区讨论中产品方澄清当前电脑必须在线并开启远程访问；其四，Android 何时上线的提问只得到“先稳定 iPhone、随后推进”，没有日期。接口身份统一脱敏，故不猜测评论者姓名。

## 行业影响与未来展望

移动端把代理等待确认、状态检查和代码审阅变成碎片化操作，可能提高长任务吞吐；代价是把手机变成可触达文件、终端和代理的高权限入口。后续竞争重点将从“能否遥控”转向最小授权、断线恢复、大差异审阅质量，以及合并前强制检查能否清晰执行。

## 附带链接

- [Product Hunt 产品页](https://www.producthunt.com/products/superset-5)
- [Superset Mobile 官网](https://superset.sh/mobile)
- [App Store](https://apps.apple.com/app/id6788926383)
- [远程工作区文档](https://docs.superset.sh/remote-workspaces)
- [工作区文档](https://docs.superset.sh/workspaces)
- [公开仓库](https://github.com/superset-sh/superset)
