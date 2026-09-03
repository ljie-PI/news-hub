---
title: "How an unsupported tool-call response could become “perfectly stable” in an LLM benchmark"
date: "2026-09-04"
generated: "2026-09-04 07:00"
source: "Reddit"
slug: "2026-09-04_07-how-an-unsupported-tool-call-response-could-become"
summary: "帖子审计 Agentic Determinism Index 时发现：方法文档称工具调用尚不支持，入口却未强制。作者说明仅做源码可达性分析，未在线复现；当时请求构造器不转发工具定义，既有用例不可达。维护者确认已发布基准未受影响。"
---

# How an unsupported tool-call response could become “perfectly stable” in an LLM benchmark

## 事件背景
帖子审计 Agentic Determinism Index 时发现：方法文档称工具调用尚不支持，入口却未强制。作者说明仅做源码可达性分析，未在线复现；当时请求构造器不转发工具定义，既有用例不可达。维护者确认已发布基准未受影响。

## 核心观点 / 产品机制
旧版 OpenAI 适配器把空 `content` 转为 `""`，Anthropic 只拼文本块、丢弃 `tool_use`；评分器排除显式错误，却接纳空串。重复响应遂成为一种输出、字节完全一致、众数占比 1.0。主分支修复现拒绝携带工具的旧式用例，并将空完成标为不支持、从成功样本剔除。公开制品可重算 303 个 reference 与 29 个 watch 非错误样本，均无空值；维护者所称含本地运行的 563 个样本因本地制品未公开，无法完整独立复核。后续 PR 新增 `tool_call` 类型，按工具名与参数规范化 JSON 的有序对计分，忽略 id/index；无调用计入有效样本，畸形调用失败关闭。本轮实跑 91 项单测全过，但尚无默认实时用例。

## 社区热议与争议点
RSS 返回主帖与四条回复。普通用户 usually_guilty99 认为分数可信度取决于证据管线，未知、空值与不支持须全程分离；作者 docybo 回应仅显式有效样本应进入评分。Wonderful_Gap8146 指出恒定返回“无内容”天然最大化稳定度，建议增加存活及跨提示差异检查；作者补充“非空”仍不够，还须保存默认值与回退来源。可见子集趋于共识，没有真正反方。

## 行业影响与未来展望
这暴露了评测的“幽灵指标”：适配层抹掉行为后，统计只是在测默认值。评测应保留协议能力、解析状态和输出来源，公开原始记录与重算脚本，并用负例确认不支持路径会失败。新 PR 方向合理，但真实供应商、并行调用与顺序漂移尚未实测，单测通过不等于跨平台可复现。

## 附带链接
- [Reddit 原帖](https://www.reddit.com/r/artificial/comments/1w6g2z5/how_an_unsupported_toolcall_response_could_become/)
- [漏洞讨论与维护者核验](https://github.com/lemma-ventures/agentic-determinism-index/issues/2)
- [边界修复提交](https://github.com/lemma-ventures/agentic-determinism-index/commit/16cd7a4be3ef1a0997c23b94bf3ea55cdb033d7c)
- [watch 修复提交](https://github.com/lemma-ventures/agentic-determinism-index/commit/88d514e0c3ab0259fdca7030b2728e10f4e69b75)
- [`tool_call` 后续 PR](https://github.com/lemma-ventures/agentic-determinism-index/pull/3)
