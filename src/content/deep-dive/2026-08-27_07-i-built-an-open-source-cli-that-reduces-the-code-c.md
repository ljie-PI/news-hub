---
title: "I built an open-source CLI that reduces the code context you send to AI when debugging Python errors"
date: "2026-08-27"
generated: "2026-08-27 07:00"
source: "Reddit"
slug: "2026-08-27_07-i-built-an-open-source-cli-that-reduces-the-code-c"
summary: "八月二十六日，作者发布 errd 0.1.0，并在约两小时后发帖：面对 Python 报错，不再把大半仓库直接交给 Claude、GPT 或 Cursor，而先在本机筛出相关代码。Atom 条目的帖子编号、标题与冻结候选一致；工具本身不修错，只生成可粘贴的调试材料。"
---

# I built an open-source CLI that reduces the code context you send to AI when debugging Python errors

## 事件背景

八月二十六日，作者发布 errd 0.1.0，并在约两小时后发帖：面对 Python 报错，不再把大半仓库直接交给 Claude、GPT 或 Cursor，而先在本机筛出相关代码。Atom 条目的帖子编号、标题与冻结候选一致；工具本身不修错，只生成可粘贴的调试材料。

## 核心观点 / 产品机制

源码显示，流水线先解析链式 traceback、定位仓库，再用 Tree-sitter 提取函数、类与导入。相关性从崩溃帧向调用栈和导入图衰减，最多追两层，给近期 Git 变更加权；随后按九成预算贪心装入代码，过大的符号缩成签名、文档串和省略号，脱敏后写出 Markdown。实跑仓库测试为一百四十三项通过、覆盖率百分之九十二；但自带小样例生成三千七百二十三词元，反高于二千五百八十四词元仓库基线，界面只报零降幅，说明“减少”不是每次都成立。

## 社区热议与争议点

本次 RSS 共五个条目：一篇主帖、四条真实评论。唯一普通评论者两次建议把 errd 做成 hol-guard 的小型命令扩展，且不要把输出文件本身纳入扩展，只覆盖“traceback 生成文件”的调用；作者两次回应接受，并称会基于 release/3.0 保持首个提交精简。这支持命令级集成价值，也限定了边界。可见子集只有一个普通账号和作者回复，没有独立反对意见、效果复现或安全审查，不能代表完整评论区或形成充分正反样本。

## 行业影响与未来展望

errd 把“提示越大越好”改成模型前的确定性上下文编译，适合成本敏感、又不愿先上传全仓库的团队。但它仅支持 Python 单仓库，导入图抓不到动态导入、运行时状态和完整调用链；词元估算依赖特定 tokenizer，脱敏也只是正则兜底。项目前景取决于公开基准能否证明缩减同时保住修复文件与函数召回率；README 明确称 SWE-bench 尚未完成。

## 附带链接

- [Reddit 原帖](https://www.reddit.com/r/opencodeCLI/comments/1vz4sp7/i_built_an_opensource_cli_that_reduces_the_code/)
- [errd PyPI](https://pypi.org/project/errd/)
- [实现仓库](https://github.com/Das-R10/errd)
