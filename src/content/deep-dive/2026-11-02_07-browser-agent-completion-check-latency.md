---
title: "same task, same model: 40 seconds one run, 261 the next. my own \"is it done?\" check was rejecting the right answer"
date: "2026-11-02"
generated: "2026-11-02 07:00"
source: "Reddit"
slug: "2026-11-02_07-browser-agent-completion-check-latency"
summary: "作者称在单张3090上运行三比特量化的本地27B浏览器代理，让它去韩国书店搜索“python”，把前三本书的标题、作者和价格制表。同一提示三次耗时40、176、261秒。这些数字及后续归因都来自作者自测，本轮没有独立复现。"
---

# same task, same model: 40 seconds one run, 261 the next. my own "is it done?" check was rejecting the right answer

## 事件背景

作者称在单张3090上运行三比特量化的本地27B浏览器代理，让它去韩国书店搜索“python”，把前三本书的标题、作者和价格制表。同一提示三次耗时40、176、261秒。这些数字及后续归因都来自作者自测，本轮没有独立复现。

## 核心观点 / 产品机制

作者逐层排查脚手架：思考模式切换会改变提示前缀并重建缓存；按131K而非实际192K窗口设置的历史上限会过早折叠记录；抽取器还把约一万八千字符的隐藏菜单当正文。真正拉长慢速运行的是完成判定器：它把“列出三本书”误解为“分别打开三个详情页”，即使第五步已有全部字段仍拒绝结束。改成按列表中实际可见字段判定后，作者报告三次为60、64、44秒；旧新规则回放2810条请求仅14条改变，仍属作者口径。

## 社区热议与争议点

Atom源取得11个条目：主帖、一个自动机器人和九名普通用户评论，没有作者回复。True-Barber7392赞成并排记录模型输出与判定器缺项理由，认为回放历史请求比凭感觉调参可靠；Low_Rush_8535提出反例：若列表缺某位作者，规则仍应进入详情页，停止条件应看字段是否真的已观察到；AdEvening3382建议只在“输入齐全但结论错误”的样本上比较深度思考；slugfingers-kun则主张稳定前缀、记录缓存命中并直接校验三行字段。样本真实但规模小，支持意见占多数，不能视为广泛共识。

## 行业影响与未来展望

案例提示代理评测要把模型推理、网页抽取、缓存、历史压缩与终止规则分账，并同时记录成功率、步骤数、重读词元和墙钟。结构化结果校验可减少无效探索，但过度简化会漏掉必须访问详情页的字段；更可靠的方向是字段级证据追踪、负例回放和多次受控实验，而非只比较单次延迟。

## 附带链接

- [Reddit 原帖](https://www.reddit.com/r/AI_Agents/comments/1xlah7g/same_task_same_model_40_seconds_one_run_261_the/)
- [逐帖 Atom RSS](https://www.reddit.com/r/AI_Agents/comments/1xlah7g/.rss)
