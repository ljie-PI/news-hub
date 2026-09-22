---
title: "mini-AGI: Continual-learning dynamically looped transformer with evolutionary grown (on a laptop)"
date: "2026-09-23"
generated: "2026-09-23 07:00"
source: "Reddit"
slug: "2026-09-23_07-mini-agi-continual-learning-dynamically-looped-tra"
summary: "Reddit 用户 returnity 转发 mini-AGI，称它可在笔记本学习并扩容。[1]逐帖 Atom 与冻结记录均指向 `t3_1wnggz5`，标题一致；源内十二个条目中，首条是未截断正文，后十一条为真实评论子集，非完整评论区。[2]"
---

# mini-AGI: Continual-learning dynamically looped transformer with evolutionary grown (on a laptop)

## 事件背景

Reddit 用户 returnity 转发 mini-AGI，称它可在笔记本学习并扩容。[1]逐帖 Atom 与冻结记录均指向 `t3_1wnggz5`，标题一致；源内十二个条目中，首条是未截断正文，后十一条为真实评论子集，非完整评论区。[2]

## 核心观点 / 产品机制

这不是通用智能，而是个人硬件持续学习实验。配置与源码显示：输入用二百五十六个字节加九个结构标记；两层前导块后，同一循环块最多重复二十四次并按字符停止；每次路由八个专家，显存常驻三十二个、内存缓存九十六个，其余连同优化器状态分页到磁盘。专家可重组新增、按长期无人调用删除，共享主干学习率是专家的十分之一。README 自报八吉显存可训练、当前约五亿四千万参数和抗遗忘结果，但这只是单仓口径；项目也明确模型仍是玩具级、权重未发布，且无标签或正式发行版。[3]

## 社区热议与争议点

评论聚焦字节建模与可信度。RogerRamjet999 认为放弃子词会损害效率；depressedclassical 以闪米特语词根被切碎为例，认为字节方案更包容。teleprint-me 链接源码纠正“完全无 tokenizer”，发帖者随后改称固定字节映射。autisticit 因大量 AI 辅助编码而质疑成果，发帖者回应不期待革命性突破。[2]仓库议题还报告无保存读取可能改写专家、长上下文 RoPE 位置复用及语料构建缺口，修复仍以开放议题或拉取请求呈现。[4]

## 行业影响与未来展望

其价值是把循环深度、稀疏专家、三级分页和持续学习控制器组合成可审计原型，而非证明“迷你 AGI”。下一步应发布权重与固定版本测试，独立复现抗遗忘、吞吐及同算力对照；否则增长曲线只代表项目方当前一次运行，不能外推能力上限。[3]

## 附带链接

Sources:
[1] https://www.reddit.com/r/LocalLLaMA/comments/1wnggz5/miniagi_continuallearning_dynamically_looped — Reddit 原帖
[2] https://www.reddit.com/r/LocalLLaMA/comments/1wnggz5/miniagi_continuallearning_dynamically_looped/.rss — Reddit Atom 评论源
[3] https://github.com/volotat/mini-AGI — volotat/mini-AGI
[4] https://github.com/volotat/mini-AGI/issues — mini-AGI Issues
