---
title: "r/GithubCopilot：Opus 4.6 又回 Pro 套餐？一次未经证实的「灰度」目击"
date: "2026-05-25"
generated: "2026-05-25 07:00"
source: "Reddit"
slug: "2026-05-25_07-opus-46-back-on-pro-plan"
summary: "u/vicayareddit 在 r/GithubCopilot 发帖 *Anyone else got Opus 4.6 back on their pro plan?*，声称在自己的 GitHub Copilot Pro 套餐里看到 **Claude Opus 4.6 重新可选**，以 3× premium "
---

---
title: 'r/GithubCopilot：Opus 4.6 又回 Pro 套餐？一次未经证实的「灰度」目击'
date: '2026-05-25'
generated: '2026-05-25 07:00'
source: 'Reddit'
slug: 'opus-46-back-on-pro-plan'
---

# r/GithubCopilot：Opus 4.6 又回 Pro 套餐？一次未经证实的「灰度」目击

## 1. 事件背景

u/vicayareddit 在 r/GithubCopilot 发帖 *Anyone else got Opus 4.6 back on their pro plan?*，声称在自己的 GitHub Copilot Pro 套餐里看到 **Claude Opus 4.6 重新可选**，以 3× premium request multiplier 计费，并怀疑这是个 glitch。背景是过去几个月 GitHub Copilot 在「高端模型可见性」上反复横跳：先把 Opus 系列设为「仅 Enterprise / Business」，再因社区压力放回 Pro，再因成本压力收紧——开发者对自己界面里到底能看见什么模型已经形成「赌博式」期待。

## 2. 核心观点 / 产品机制

GitHub Copilot 自 2025 年改用 **premium request multiplier 模型**，每月给 Pro 用户固定数量的「premium request quota」，不同模型按倍率扣减（GPT-4o 1×、Claude Sonnet 1×、o1 类推理模型常见 10×、Opus 一度高达 10–30×）。OP 看到的 **3× Opus 4.6** 显著低于此前的定价，因此他自己的第一反应也是「这可能是 glitch」。如果属实，意味着 Anthropic 与 GitHub 之间做了新的批发价谈判，或 Copilot 正在试验把 Opus 推到「日常可用」档位。

## 3. 社区热议与争议点

帖子目前 1 分、2 条评论，社区反应冷淡而务实：
- **u/PuzzleheadedLaugh931**：「能贴个截图吗？」——直接要求证据；
- **u/FunkyMuse（Full Stack Dev flair）**：「我这边看不到」——立刻否定可复现性。
正反对立浓缩成一句话：**未截图、不可复现 = 暂作 UI glitch 或局部灰度处理**。社区学聪明了，对「我看到 X 模型回来了」类型的帖子默认怀疑，要求截图 + 区域 / 账户类型信息，避免又一次集体兴奋后被回滚打脸。

## 4. 行业影响与未来展望

这条小帖折射出 2026 年 AI coding 工具的一个共性问题：**模型可见性 ≠ 模型可用性 ≠ 模型经济性**。Copilot、Cursor、Windsurf 都在反复调整「Pro 看得到哪些模型 / 按什么倍率扣」，导致开发者难以建立稳定的使用预期。短期看，3× Opus 即便属实，也可能只是 A/B 实验或区域灰度；中长期看，premium request 这一计价机制本身需要更透明的公告与可预测的倍率表，否则 r/GithubCopilot 会继续充斥这类「目击体」帖子。

## 5. 附带链接

- 原帖：https://www.reddit.com/r/GithubCopilot/comments/1tmqsi1/anyone_else_got_opus_46_back_on_their_pro_plan/
