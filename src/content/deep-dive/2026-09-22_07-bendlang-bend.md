---
title: "bendlang/bend"
date: "2026-09-22"
generated: "2026-09-22 07:00"
source: "GitHub"
slug: "2026-09-22_07-bendlang-bend"
summary: "Bend 2 是面向后端与计算任务的纯函数式语言，试图解决“代理生成代码后，人类难以逐行审阅”的问题：开发者把约束写成 `law`，再用同名 `def` 给出证明，检查失败就阻止交付。它同时服务需要跨核或 GPU 运行分治算法的团队。本批快照显示本日新增 188 stars。所谓“阻止 AI 犯错”是项目方口径，保证只覆盖被形式化且已证明的性质，并不等于程序没有其他缺陷。"
---

# bendlang/bend

## 定位与痛点剖析

Bend 2 是面向后端与计算任务的纯函数式语言，试图解决“代理生成代码后，人类难以逐行审阅”的问题：开发者把约束写成 `law`，再用同名 `def` 给出证明，检查失败就阻止交付。它同时服务需要跨核或 GPU 运行分治算法的团队。本批快照显示本日新增 188 stars。所谓“阻止 AI 犯错”是项目方口径，保证只覆盖被形式化且已证明的性质，并不等于程序没有其他缺陷。

## 核心架构与技术细节

默认分支 `main` 的指南显示，语言采用依赖类型、纯函数与仿射值；活代码递归须证明终止，`@unsafe` 会退出证明边界。相邻调用可组成二叉 fork-join，`!` 把调用交给 GPU；编译器生成一份 C，供 clang、Metal 或 CUDA 编译，JavaScript 目标则串行。核心检查器与解释器位于 TypeScript 文件 `bend2/bend.ts`；私有 ESM 打包清单不写版本，REST Release 显示当前稳定版为 2.0.25。README 宣称的 C/CUDA 级性能仍属项目方基准口径。

## 竞品对比与生态站位

Lean 同样基于依赖类型，但官方参考手册强调最小内核、可扩展 tactic 与证明自动化；Bend 没有 tactic 或证明搜索，换来更直接的“程序即证明”工作流。Mojo 官方 GPU 教程要求显式处理设备、内存、网格与 kernel，Bend 则以纯函数调用和统一堆隐藏更多调度细节。其站位不是替代成熟证明生态或通用 GPU 工具链，而是把可执行后端、证明门禁和并行运行时压进同一种语言。

## 开发者反馈与局限性

README 明列注解冗长、基础库小、暂无 TLS、HTTP、JSON、正则与 Windows 支持，JavaScript 单核，编辑器仅格式化；Lean 形式化还落后于 TypeScript 实现。开放 issue #973 报告 2.0.25 对四行自应用输入会占满一核且不返回，报告者评论又把复现扩展到多种声明位置，尚无维护者确认。相对地，#928 的 macOS FIFO 挂起已由维护者评论确认随 2.0.25 修复并加入回归测试，说明迭代活跃，但编译器与诊断仍年轻。

## 附带链接

- [GitHub Repo](https://github.com/bendlang/bend)
- [语言指南](https://github.com/bendlang/bend/blob/main/guide/GUIDE.md)
- [开放问题 #973](https://github.com/bendlang/bend/issues/973)
- [Lean 参考手册](https://lean-lang.org/doc/reference/latest/)
- [Mojo GPU 教程](https://docs.modular.com/mojo/manual/gpu/intro-tutorial/)
