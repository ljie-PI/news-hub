---
title: "lde 0.11.0 - Teal & MoonScript built-in, Musl, Docker, JIT Debugger & More"
date: "2026-09-21"
generated: "2026-09-21 07:00"
source: "Reddit"
slug: "2026-09-21_07-lde-0-11-0-teal-moonscript-built-in-musl-docker-ji"
summary: "lde 是用 LuaJIT 编写的 Lua 开发环境，兼具包管理、运行、测试、打包与单文件可执行程序编译能力，前身为 lpm。作者于 9 月 18 日发布 0.11.0，称其相对 0.10.0 累积约 248 次提交，也是目前最接近稳定版的一次更新；Reddit 发帖则集中介绍了易用性、LuaRocks 兼容目标及项目更名缘由。"
---

# lde 0.11.0 - Teal & MoonScript built-in, Musl, Docker, JIT Debugger & More

## 事件背景

lde 是用 LuaJIT 编写的 Lua 开发环境，兼具包管理、运行、测试、打包与单文件可执行程序编译能力，前身为 lpm。作者于 9 月 18 日发布 0.11.0，称其相对 0.10.0 累积约 248 次提交，也是目前最接近稳定版的一次更新；Reddit 发帖则集中介绍了易用性、LuaRocks 兼容目标及项目更名缘由。

## 核心观点 / 产品机制

新版把官方 Teal、MoonScript 编译器接入运行流程，让 `.tl`、`.moon` 与 Lua 文件混用；LuaRocks 自定义后端在沙箱中运行，并由 lde 补齐所需接口。所谓 JIT Debugger 实际由 `--jit` 监测无法进入原生编译的事件，运行结束后汇总原因与源码位置，更接近 JIT 诊断器。发行面新增 x86-64、ARM64 的 musl 构建，以及 glibc、slim、Alpine 三类 GHCR 镜像；还加入热重载、覆盖率、体积分析、并行构建和七种目标的交叉编译。

## 社区热议与争议点

本轮Reddit实时评论被封，未逐字取得评论；以下为页面数据与公开资料支持的争点，并非网友引语。该帖 Atom RSS 成功返回，但仅含主帖、没有评论条目，因而不能声称形成了真实正反讨论。可核实的四个争点是：内置方言降低多语言 Lua 项目的配置成本；LuaRocks 支持虽扩展，主帖所称“完整兼容”仍是目标；“Debugger”并不提供断点和单步调试；容器与 musl 改善部署，但跨平台编译仍要求用户安装目标工具链，官方也建议交给 CI 验证。

## 行业影响与未来展望

lde 正尝试把 Lua 长期分散的包管理、测试、运行与交付链合成一个工具，若 LuaRocks 兼容和跨平台产物持续成熟，可降低脚本走向可分发应用的门槛。不过作者所说“接近 1.0”只是发布方判断；兼容广度、热重载边界及不同目标上的构建可靠性仍需更多项目实测。

## 附带链接

- [发布原文](https://lde.sh/blog/lde-0.11.0)
- [GitHub 仓库](https://github.com/lde-org/lde)
- [Reddit 讨论](https://www.reddit.com/r/lua/comments/1wlsqxn/lde_0110_teal_moonscript_builtin_musl_docker_jit/)
- [Reddit Atom RSS](https://www.reddit.com/r/lua/comments/1wlsqxn/.rss)
