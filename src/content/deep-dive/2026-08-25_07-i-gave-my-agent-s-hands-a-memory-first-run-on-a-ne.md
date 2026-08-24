---
title: "I gave my agent's hands a memory: first run on a new app 110 s / 9 calls, second run 59.9 s / 4 calls — no API, it operates the running app itself"
date: "2026-08-25"
generated: "2026-08-25 07:00"
source: "Reddit"
slug: "2026-08-25_07-i-gave-my-agent-s-hands-a-memory-first-run-on-a-ne"
summary: "8月24日，kovavue 作者 naykip 展示桌面代理复用应用结构知识：在 Ubuntu 上操作 Telegram Desktop，打开指定聊天、粘贴并读回约1.4KB文本，首次耗时110秒、往返9次，第二次59.9秒、4次。它直接操作已登录的运行中应用，不接 Telegram API。上述数字均为作者单机自测，并非独立基准。"
---

# I gave my agent's hands a memory: first run on a new app 110 s / 9 calls, second run 59.9 s / 4 calls — no API, it operates the running app itself

## 事件背景

8月24日，kovavue 作者 naykip 展示桌面代理复用应用结构知识：在 Ubuntu 上操作 Telegram Desktop，打开指定聊天、粘贴并读回约1.4KB文本，首次耗时110秒、往返9次，第二次59.9秒、4次。它直接操作已登录的运行中应用，不接 Telegram API。上述数字均为作者单机自测，并非独立基准。

## 核心观点 / 产品机制

所谓“手部记忆”分四层：实时地图记录当前控件、状态与句柄，但随窗口消亡；变更流报告界面变化；按应用及版本持久化的词典保存控件身份；可重放操作路径保存“打开某聊天”等步骤。执行时先召回、重绑句柄、行动，并以界面状态而非回执验真；失败则退层重学。路径须带前置条件：作者曾把 shortcut 当成搜索键，焦点在编辑框时却变为“插入链接”，造成状态污染，现先退出编辑框。发送、提交等外部动作另受人工同意门控，历史许可、个人数据与活句柄都不持久化。

## 社区热议与争议点

Atom 共返回5个 entry，仅是当时可见子集：除主帖和不计观点的 AutoModerator 外，Jaded-Aside-8250 赞同每轮重新探索像“土拨鼠日”；作者回复称任务记忆可随会话消失，但控件位置应独立保存。另一条作者留言主动披露数字来自自家代理与机器，并举 shortcut 前置状态反例。后两项均属作者口径，不是社区独立复现；当前子集支持痛点，却不足以证明稳定提速或形成充分反方样本。

## 行业影响与未来展望

若可迁移，界面词典会把代理成本从反复视觉探索转向“召回—重绑定—验真”，覆盖没有 API 的原生软件。但布局漂移、无障碍树质量、焦点状态与恶意界面都可能污染路径；发布前仍需多机、多版本、重复试验，并验证门控无法被旧路径绕过。

## 附带链接

- [Reddit 原帖](https://www.reddit.com/r/AI_Agents/comments/1vxdgkh/)
- [帖子 Atom RSS](https://www.reddit.com/r/AI_Agents/comments/1vxdgkh/.rss)
- [作者方法说明](https://naykip.kovanex.dev/blog/agent-learns-an-app-once/)
