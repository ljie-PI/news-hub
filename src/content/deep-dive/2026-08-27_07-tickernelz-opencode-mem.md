---
title: "tickernelz/opencode-mem"
date: "2026-08-27"
generated: "2026-08-27 07:00"
source: "GitHub"
slug: "2026-08-27_07-tickernelz-opencode-mem"
summary: "这是面向 OpenCode 的持久记忆插件：把会话中形成的技术决策、排错经验与用户偏好留到后续会话，避免编码代理每次从零理解项目。它既按项目保存可检索记忆，也维护跨项目用户画像，并提供手动增删查、时间线网页界面和自动捕获。目标用户是长期使用 OpenCode、又不愿把全部知识固化进提示词或项目文档的开发者。"
---

# tickernelz/opencode-mem

## 定位与痛点剖析
这是面向 OpenCode 的持久记忆插件：把会话中形成的技术决策、排错经验与用户偏好留到后续会话，避免编码代理每次从零理解项目。它既按项目保存可检索记忆，也维护跨项目用户画像，并提供手动增删查、时间线网页界面和自动捕获。目标用户是长期使用 OpenCode、又不愿把全部知识固化进提示词或项目文档的开发者。

## 核心架构与技术细节
当前清单为 TypeScript、Bun 与 OpenCode SDK，版本为 2.25.0。`chat.message` 钩子在对话首段检索并注入相关上下文，`session.idle` 触发结构化摘要、去重和持久化，压缩事件再恢复记忆；内部摘要代理采取工具默认拒绝与步数上限。数据按项目和用户分片，嵌入式 Turso/libSQL 以 DiskANN `vector_top_k` 做近邻搜索，无需独立向量服务。默认嵌入经 Hugging Face Transformers 与 ONNX 本地运行，也可接 OpenAI 兼容端点；迁移流程先备份、加锁、校验再替换分片。

## 竞品对比与生态站位
静态 `AGENTS.md` 适合始终生效的规则，本项目更适合从实际工作持续增长、按相关性取回的经验。其 README 明示灵感来自 [opencode-supermemory](https://github.com/supermemoryai/opencode-supermemory)；后者依赖 Supermemory 登录与远端服务，本项目把向量库留在本机，但配置、模型下载、索引维护也更重，自动提炼仍需支持结构化输出的模型提供方。

## 开发者反馈与局限性
GitHub REST 快照为 1533 星、149 个分叉。近期报告呈现了工程边界：[#277](https://github.com/tickernelz/opencode-mem/issues/277) 称在二千零四十八维嵌入下，约六百五十六条记忆产生五百四十二兆字节分片，指向 DiskANN 邻居参数未调优；[#278](https://github.com/tickernelz/opencode-mem/issues/278) 报告 Claude Code 认证链路自动捕获超时；[#253](https://github.com/tickernelz/opencode-mem/issues/253) 显示推理模型与强制工具选择存在上游兼容问题；[#263](https://github.com/tickernelz/opencode-mem/issues/263) 则反映用户画像的触发条件不够直观。这些均是具体用户报告，不能外推为普遍故障。已合并的 [#275](https://github.com/tickernelz/opencode-mem/pull/275) 发布 2.25.0，并记录完整测试通过，但开放问题仍说明本地优先并不等于零运维。

## 附带链接
- [GitHub Repo](https://github.com/tickernelz/opencode-mem)
- [README](https://github.com/tickernelz/opencode-mem/blob/main/README.md)
- [源码入口](https://github.com/tickernelz/opencode-mem/blob/main/src/index.ts)
- [包清单](https://github.com/tickernelz/opencode-mem/blob/main/package.json)
- [Issues](https://github.com/tickernelz/opencode-mem/issues)
