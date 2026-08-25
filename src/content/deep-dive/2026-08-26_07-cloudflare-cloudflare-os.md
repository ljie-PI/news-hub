---
title: "cloudflare/cloudflare-os"
date: "2026-08-26"
generated: "2026-08-26 07:00"
source: "GitHub"
slug: "2026-08-26_07-cloudflare-cloudflare-os"
summary: "Cloudflare OS 是用 TypeScript、Workers 构建的企业 AI 工作空间，不是桌面操作系统。它把代理聊天、公司上下文和可生成的小应用统一起来，面向既想让员工自助造工具、又担心代理获得过宽权限的组织。每位用户运行独立的“Gadget”应用副本，可分享代码蓝图或协作实例；“Cloudflare 大量员工每日使用”等采用量属于 README 自报，不能视为独立验证。"
---

# cloudflare/cloudflare-os

## 定位与痛点剖析

Cloudflare OS 是用 TypeScript、Workers 构建的企业 AI 工作空间，不是桌面操作系统。它把代理聊天、公司上下文和可生成的小应用统一起来，面向既想让员工自助造工具、又担心代理获得过宽权限的组织。每位用户运行独立的“Gadget”应用副本，可分享代码蓝图或协作实例；“Cloudflare 大量员工每日使用”等采用量属于 README 自报，不能视为独立验证。

## 核心架构与技术细节

每个工作空间对应一个 Durable Object，负责有状态会话与协作；每个 Gadget 服务端运行于 Dynamic Worker 的 Facet，禁用直接外网访问，客户端置于受 CSP 和 iframe sandbox 约束的沙箱，两端通过 Cap'n Web RPC 通信。Gatekeeper 也向工作空间安装 Facet：它封装外部 API、OAuth、资源级授权与操作日志，副作用先模拟并排队，之后由人批量批准。默认“无能力”，需把具体资源显式介绍给代理或 Gadget，构成能力安全边界。

## 竞品对比与生态站位

相较预先给代理暴露宽泛工具的 MCP 配置，Gatekeeper 增加资源级授权、审计和延迟人工审批；但项目也支持 MCP，二者不是简单替代。相较固定 SaaS，它以可改代码的个人 Gadget 副本取代统一应用实例。相较通用编码代理，它把代码执行、应用 API、实时协作和 Workers 沙箱绑在同一运行时；README 所称“更快、更省 token”没有公开基准，仅属自报。

## 开发者反馈与局限性

README 明示 2026 年 8 月版本仍是早期访问，尚有粗糙边角；自托管生产文档仍标注“即将推出”，第三方 Gatekeeper 还需配置 OAuth。开放的 issue #338 报告长寿命 RPC 让闲置 Durable Object 持续计费，维护者仅请求修正复现链接，尚未确认根因；issue #327 报告 MCP 图片结果在文本化执行链中丢失，当前仍开放且无评论。PR #334 已合并，补上断线后的动作流续传；安全模型在演进，PR #340 的受限数据共享重构处于开放、阻塞状态。仓库也明确暂不寻求大型外部贡献。

## 附带链接

- [GitHub Repo](https://github.com/cloudflare/cloudflare-os)
- [官方部署入口](https://os.cloudflare.app/deploy)
- [Durable Objects 文档](https://developers.cloudflare.com/durable-objects/)
- [issue #338](https://github.com/cloudflare/cloudflare-os/issues/338) · [issue #327](https://github.com/cloudflare/cloudflare-os/issues/327)
- [PR #334](https://github.com/cloudflare/cloudflare-os/pull/334) · [PR #340](https://github.com/cloudflare/cloudflare-os/pull/340)
