---
title: "shadcn/improve"
date: "2026-11-12"
generated: "2026-11-12 07:00"
source: "GitHub"
slug: "2026-11-12_07-shadcn-improve"
summary: "improve 是面向已有代码库的 Agent Skill：让高能力模型先审计、筛选高杠杆问题并写成可交接计划，再由其他代理实现。它针对“执行代理缺少审计会话上下文、容易越界或凭空补全”的痛点，适合维护者在重构、安全、性能与测试治理前使用。README 所称“昂贵模型规划、便宜模型执行”属于项目自报的成本策略，不是实测节省结论。批次快照为 10810 星、441 fork、当日新增 333 星；查询 GitHub API 时为 10814 星、441 fork，两者口径分开。"
---

# shadcn/improve

## 定位与痛点剖析

improve 是面向已有代码库的 Agent Skill：让高能力模型先审计、筛选高杠杆问题并写成可交接计划，再由其他代理实现。它针对“执行代理缺少审计会话上下文、容易越界或凭空补全”的痛点，适合维护者在重构、安全、性能与测试治理前使用。README 所称“昂贵模型规划、便宜模型执行”属于项目自报的成本策略，不是实测节省结论。批次快照为 10810 星、441 fork、当日新增 333 星；查询 GitHub API 时为 10814 星、441 fork，两者口径分开。

## 核心架构与技术细节

仓库主体不是传统程序，而是 MIT 许可的 Markdown“提示词程序”。`SKILL.md` 编排勘察、九类并行审计、证据复核、杠杆排序和计划生成；三份参考文档分别规定审计清单、交接模板及执行闭环。计划内嵌文件路径、代码摘录、验证命令、范围、停止条件与基准提交。`execute` 在隔离 worktree 派发执行者，顾问复跑验收、查范围和完整差异；`reconcile` 处理漂移、阻塞与已完成计划。

## 竞品对比与生态站位

Claude Code 官方 Plan mode 与 Codex 官方 `/plan` 都能先读库、提问和产出方案，随后在同一产品内批准执行，交互更原生。improve 的优势是基于开放 Agent Skills 格式、产物为可版本化 Markdown，可跨代理或交给人执行，并增加九类审计、依赖图和机械验收；代价是缺少宿主级强制状态机，安全边界和流程质量更依赖模型遵守文本。

## 开发者反馈与局限性

issue #2 指出隔离 worktree 若建在工作区外，会在编辑器代理中反复触发权限确认；维护者认可方案并邀请提交 PR，另有用户称本地也做了相同调整，但该 issue 仍开放。更具体的开放 issue #30 报告：执行者提交后工作区已干净，现有 `git diff --stat` 可能漏掉已提交的越界文件，说明“范围检查”尚非可靠沙箱。仓库也只有提示词与样例，没有公开行为评测；跨宿主兼容和成本收益仍需自行验证。

## 附带链接

- 仓库：https://github.com/shadcn/improve
- 核心技能：https://github.com/shadcn/improve/blob/main/skills/improve/SKILL.md
- 反馈与评论：https://github.com/shadcn/improve/issues/2
- 范围检查问题：https://github.com/shadcn/improve/issues/30
- Claude Code 计划模式：https://code.claude.com/docs/en/permission-modes
- Codex 计划模式：https://developers.openai.com/codex/learn/best-practices
- Agent Skills 规范：https://agentskills.io/specification
