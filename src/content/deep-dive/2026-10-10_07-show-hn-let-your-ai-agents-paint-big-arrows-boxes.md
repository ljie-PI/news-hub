---
title: "Show HN: Let your AI agents paint big arrows, boxes and text on your screen"
date: "2026-10-10"
generated: "2026-10-10 07:00"
source: "HN"
slug: "2026-10-10_07-show-hn-let-your-ai-agents-paint-big-arrows-boxes"
summary: "这篇Show HN在本批次冻结为361分、157条评论。项目瞄准代理工作的最后一米：模型能操作终端，却常在授权、双因素认证或陌生图形界面前要求人接手；终端文字又容易被忽略。作者因此把提示从对话框搬到目标控件旁。仓库刚创建不久，热度更能说明需求共鸣，不能证明工具已被大规模采用。"
---

# Show HN: Let your AI agents paint big arrows, boxes and text on your screen

## 事件背景

这篇Show HN在本批次冻结为361分、157条评论。项目瞄准代理工作的最后一米：模型能操作终端，却常在授权、双因素认证或陌生图形界面前要求人接手；终端文字又容易被忽略。作者因此把提示从对话框搬到目标控件旁。仓库刚创建不久，热度更能说明需求共鸣，不能证明工具已被大规模采用。

## 核心观点 / 产品机制

`bigarrow`是面向macOS 14及以上版本的Swift命令行工具，并附Claude Code、Codex技能。源码显示，它用无边框、不可激活的`NSPanel`置于屏保层并加入所有Space，窗口不能成为主窗口或键盘焦点；指针不在标牌或箭身上时，鼠标事件穿透。坐标、矩形等绘制路径不申请权限；按控件文字定位会遍历Accessibility树，按窗口标题匹配则可能需要屏幕录制权限，抬升窗口还涉及辅助功能权限。README所称“无账户、无遥测、无守护进程”属于项目方口径；仓库可核实的是单一Swift可执行文件及一个参数解析依赖。

## 社区热议与争议点

正面例子中，mistersquid称已让Claude用箭头带他修改设置，并操作Compressor完成视频加速；ravila回忆学习Blender时常找不到模型所说的按钮，认为此类指引会很实用。反方更关注授权语义：tilemarch指出箭头只回答“点哪里”，不能回答“是否应该点”，可能削弱人在许可环节的判断；hn8726则担心顶层覆盖物遮住拒绝按钮或改写批准文案。项目以轮廓标记、自动消失和不代点来缓解风险，但这仍不能替代来源识别与后果说明。

## 行业影响与未来展望

它提示了一种介于全自动控制与纯文字教程之间的代理界面：代理负责定位、解释并等待，人保留最终动作。远程协助、软件教学和无障碍场景可能比“替代理点授权”更稳健。若此模式扩展，操作系统需要为代理标注提供可识别来源、不可遮蔽的安全区域和明确后果，而不能把普通置顶窗口当成可信提示层。

## 附带链接

- [项目仓库](https://github.com/franzenzenhofer/big-arrow-on-the-screen)
- [Hacker News讨论](https://news.ycombinator.com/item?id=50018817)
