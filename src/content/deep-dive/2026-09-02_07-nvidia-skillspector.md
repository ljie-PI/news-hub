---
title: "NVIDIA/SkillSpector"
date: "2026-09-02"
generated: "2026-09-02 07:00"
source: "GitHub"
slug: "2026-09-02_07-nvidia-skillspector"
summary: "SkillSpector 是面向 Claude Code、Codex 等代理技能的安全扫描器，主攻提示注入、数据外泄、危险代码和供应链风险。它接受仓库、网址、压缩包与本地文件，适合技能作者、目录维护者及准入流水线。README 自报对四万余技能的研究中，存在漏洞和疑似恶意意图的比例分别为百分之二十六点一、百分之五点二；这些是项目方研究口径，并非独立复测。"
---

# NVIDIA/SkillSpector

## 定位与痛点剖析
SkillSpector 是面向 Claude Code、Codex 等代理技能的安全扫描器，主攻提示注入、数据外泄、危险代码和供应链风险。它接受仓库、网址、压缩包与本地文件，适合技能作者、目录维护者及准入流水线。README 自报对四万余技能的研究中，存在漏洞和疑似恶意意图的比例分别为百分之二十六点一、百分之五点二；这些是项目方研究口径，并非独立复测。

## 核心架构与技术细节
默认分支为 `main`，主体是 Python 3.12+ 与 LangGraph。流程先解析输入、构建文件与清单上下文，再并行运行二十二个分析节点；静态层组合正则、Python AST、污点追踪、YARA、MCP 权限检查及 OSV 依赖查询，可选大模型层过滤和补充语义判断，最后生成风险分、建议及终端、JSON、Markdown、SARIF。README 所称“十七类、七十一种模式”属自报。扫描不执行技能；但默认语义分析会向所选模型发送合格文件内容，关闭大模型后仍会向 OSV 发送依赖坐标。

## 竞品对比与生态站位
Cisco Skill Scanner 同样强调预提交与 GitHub 代码扫描，Snyk Agent Scan 则覆盖本机代理、MCP 服务和技能发现。SkillSpector 的差异在于进入 NVIDIA Verified Skills 的扫描、评估与签名链，并提供基线抑制和集成输出；代价是其规则精度、模型成本和网络依赖都需要使用者自行校准，而非一次扫描即可证明安全。

## 开发者反馈与局限性
公开问题显示边界仍在收敛：[#464](https://github.com/NVIDIA/SkillSpector/issues/464) 报告反引号变量会误触解析上限并把扫描降为部分覆盖；[#458](https://github.com/NVIDIA/SkillSpector/issues/458) 指出三条触发滥用规则依赖规范中不存在的字段；[#460](https://github.com/NVIDIA/SkillSpector/issues/460) 报告六十秒总预算令大型技能截断，已有开放的 [#468](https://github.com/NVIDIA/SkillSpector/pull/468) 处理配置化。另一方面，[#408](https://github.com/NVIDIA/SkillSpector/pull/408) 已合并隐藏指令归一化修复，说明社区能推动改进。官方还明确承认非英文、图像、二进制及运行时行为覆盖不足；它是纵深防御，不是沙箱。

## 附带链接
- [GitHub Repo](https://github.com/NVIDIA/SkillSpector)
- [官方扫描文档](https://docs.nvidia.com/skills/scanning-agent-skills)
- [架构开发指南](https://github.com/NVIDIA/SkillSpector/blob/main/docs/DEVELOPMENT.md)
