---
title: "southleft/figma-console-mcp"
date: "2026-11-06"
generated: "2026-11-06 07:00"
source: "GitHub"
slug: "2026-11-06_07-figma-console-mcp"
summary: "它把设计系统包装成可读写的 MCP 接口，面向需要让 AI 在 Figma 与代码之间同步令牌、组件和规范的设计系统团队。相较只把画布转成上下文，它强调结构化数据、确定性审计及回写，减少模型猜测样式、设计与实现漂移，以及批量维护变量的成本。批次快照为 3136 星、当日新增 242 星；当前接口查询为 3137 星。"
---

# southleft/figma-console-mcp

## 定位与痛点剖析

它把设计系统包装成可读写的 MCP 接口，面向需要让 AI 在 Figma 与代码之间同步令牌、组件和规范的设计系统团队。相较只把画布转成上下文，它强调结构化数据、确定性审计及回写，减少模型猜测样式、设计与实现漂移，以及批量维护变量的成本。批次快照为 3136 星、当日新增 242 星；当前接口查询为 3137 星。

## 核心架构与技术细节

TypeScript 服务分本地与云端两路：本地 MCP 走标准输入输出，可选 Streamable HTTP；桌面桥插件经 9223—9232 端口的 WebSocket 接收命令，再以消息转发调用 Figma Plugin API。云端由 Cloudflare Worker、Durable Object 中继与配对插件组成，读取还结合 Figma REST API。连接器接口统一两条链路，写工具得以复用；令牌层支持 DTCG 双向导入导出并保留变量标识。README 自报本地提供 130 个工具。最新稳定版 1.46.0 新增着色器、网格布局、广色域颜色与可变字体能力。

## 竞品对比与生态站位

Figma 官方 MCP 更强在托管接入、Code Connect、由实时界面生成设计及原生文件创建；Framelink 更聚焦压缩布局上下文以辅助编码。本项目的差异位是开源自托管、专用写工具、令牌回环、设计代码一致性与历史审计；代价是桌面桥和个人访问令牌带来更多部署面，宜与官方服务互补而非简单替代。

## 开发者反馈与局限性

公开 issue #155 报告多会话占满十个固定端口后无明显提示，长任务还缺少分块或落盘输出；该报告暂无维护者确认。issue #80 则显示大型节点遍历可能长时间占用插件；维护者说明同步遍历无法被超时抢占，1.42.1 已让后续请求快速返回“忙碌”，但未取消原任务。近期合并的 PR #140 修复 Windows 客户端退出后孤儿进程继续占端口，说明维护节奏活跃，也说明连接生命周期仍是主要工程边界。README 与架构文档对云端工具数还存在 105 和 102 的口径漂移。

## 附带链接

- [GitHub 仓库](https://github.com/southleft/figma-console-mcp)
- [技术架构](https://docs.figma-console-mcp.southleft.com/architecture)
- [v1.46.0 发布记录](https://github.com/southleft/figma-console-mcp/releases/tag/v1.46.0)
- [issue #155](https://github.com/southleft/figma-console-mcp/issues/155)
- [issue #80](https://github.com/southleft/figma-console-mcp/issues/80)
- [官方 Figma MCP](https://developers.figma.com/docs/figma-mcp-server/)
- [Framelink](https://github.com/GLips/Figma-Context-MCP)
