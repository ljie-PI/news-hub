---
title: "pollen-robotics/microduck_rl"
date: "2026-09-01"
generated: "2026-09-01 07:00"
source: "GitHub"
slug: "2026-09-01_07-pollen-robotics-microduck-rl"
summary: "这是为约二十五厘米、八百克的双足 Microduck 定制的强化学习训练仓库：策略在仿真中以五十赫兹训练，导出为 ONNX 后交给实体机运行时。它瞄准的不是通用基准，而是微型舵机摩擦、齿隙与奖励投机造成的仿真可走、真机失效。批次快照为一千一百一十九星、一百九十三分叉，单日新增三百八十四星。"
---

# pollen-robotics/microduck_rl

## 定位与痛点剖析

这是为约二十五厘米、八百克的双足 Microduck 定制的强化学习训练仓库：策略在仿真中以五十赫兹训练，导出为 ONNX 后交给实体机运行时。它瞄准的不是通用基准，而是微型舵机摩擦、齿隙与奖励投机造成的仿真可走、真机失效。批次快照为一千一百一十九星、一百九十三分叉，单日新增三百八十四星。

## 核心架构与技术细节

项目限定 Python 3.12，固定 mjlab 1.3、MuJoCo Warp、PyTorch 与 RSL-RL 的 PPO。MJCF 模型、任务配置、奖励和事件集中在独立模块；BAM M6 模型刻画 XL330 的电压控制、反电动势及库仑、斯特里贝克摩擦，再随机化电池电压、压降、指令延迟和摩擦。每个主任务还有串联正负一度齿隙版本。所有策略共享六十一维观测契约，未用命令补零，因此步行、起身和特技能热切换；官方导出器还把观测归一化器写入图中。

## 竞品对比与生态站位

Isaac Lab 提供相机、激光雷达等传感器及三十余环境，MuJoCo Playground 横跨运动、操作与视觉，并支持 JAX、RSL-RL 和两种 MuJoCo 后端。Microduck 覆盖面明显更窄，却把专用舵机、域随机化、实体运行时和可下载策略串成完整链路，适合复现实机迁移，不适合作为多机器人通用平台。

## 开发者反馈与局限性

当前默认训练路径要求英伟达显卡，且仓库尚无 Release。开放 PR #8 报告轮滑起身任务因关节索引迁移而首步崩溃；#9 报告云训练找不到检查点、无法自动导出；#24 才提出无 CUDA 时的 CPU 调试路径。三者均未合并、无评审与状态检查，应视为贡献者报告或候选补丁，而非已确认发布修复。

## 附带链接

- [Repo](https://github.com/pollen-robotics/microduck_rl)
- [产品官网](https://pollen-robotics.com/microduck/)
- [实体运行时与架构文档](https://github.com/pollen-robotics/microduck/blob/main/docs/design/architecture.md)
- [在线模拟器](https://huggingface.co/spaces/pollen-robotics/microduck-simulator)
- [mjlab 文档](https://mujocolab.github.io/mjlab/main/index.html)
