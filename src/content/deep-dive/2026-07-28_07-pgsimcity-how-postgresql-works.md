---
title: "PGSimCity - How PostgreSQL Works"
date: "2026-07-28"
generated: "2026-07-28 07:00"
source: "HN"
slug: "2026-07-28_07-pgsimcity-how-postgresql-works"
summary: "PostgreSQL 专家 Nikolay Samokhvalov（samokhvalov）发布了 PGSimCity——一个把 PostgreSQL 内部运行机制以「3D 城市」方式呈现的交互式可视化项目。作者坦言这一切�"
---

---
title: PGSimCity - How PostgreSQL Works
date: 2026-07-28
source: hackernews
slug: pgsimcity-how-postgresql-works
---
# PGSimCity - How PostgreSQL Works

## 事件背景

PostgreSQL 专家 Nikolay Samokhvalov（samokhvalov）发布了 PGSimCity——一个把 PostgreSQL 内部运行机制以「3D 城市」方式呈现的交互式可视化项目。作者坦言这一切源于周末的一次好奇心："想看看 Opus 5 能做什么"，从单个提示词起步，随后花数小时打磨。项目登上 Hacker News 后获得 879 分、85 条评论，反响热烈。

## 核心观点/产品机制

PGSimCity 把数据库拆解成城市中的"建筑"与"机器"，实时展示 TPS、缓存命中率（98.4%）、WAL 写入速率、脏页采样、复制延迟与检查点倒计时等核心指标。它内置十余种场景（Scenario），如"检查点风暴""缓存抖动""膨胀与 VACUUM""XMIN 视界""锁堆积""复制延迟""顺序扫描 vs 索引扫描"等，覆盖 PostgreSQL 运行中的典型状态。用户可通过"Run a query"触发查询、按 T 键启动导览，并调整仿真速度（低至 0.1×）来观察数据流动。

## 社区热议与争议点

好评方面，loveparade 称"虽不完全看懂但极其惊艳"，Curtis_Guan 认为它把复杂的数据库调度机制以引人入胜的方式呈现。批评则集中在信息过载：titzer 指出"80% 视觉空间被弹窗遮挡了精彩的 3D"，layoric 与 npunt 建议砍掉约一半 UI 并改善镜头控制。jedberg 作为熟悉内核者也感到"太busy、看不懂"，希望能逐条触发事务观察流动。此外争议点在于"vibe-coding"：notachatbot123 质疑不到 48 小时 AI 生成的内容是否准确可信，j1436go 称这削弱了信息可信度；也有人提醒 SimCity 仍是 EA 商标，建议改名。

## 行业影响与未来展望

该项目被视为 AI 辅助教育工具的范例。skreem 表示要用同样方式生成自己的学习材料，num42 想做 CPU 模拟器，tptacek 则想用 Factorio 可视化 Fly.io 部署。争议也折射出对 LLM 生成技术内容准确性的持续担忧。作者持开放态度回应反馈、修复 z-fighting 等问题，未来方向指向更强的交互性与叙事化——让用户亲手发起查询，看数据在系统中流转。

## 附带链接

- HN 讨论：https://news.ycombinator.com/item?id=49063754
- 项目地址：https://nikolays.github.io/PGSimCity/
