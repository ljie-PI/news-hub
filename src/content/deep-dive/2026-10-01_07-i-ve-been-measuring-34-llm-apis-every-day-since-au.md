---
title: "I've been measuring 34 LLM APIs every day since August to see when they quietly change. One did."
date: "2026-10-01"
generated: "2026-10-01 07:00"
source: "Reddit"
slug: "2026-10-01_07-i-ve-been-measuring-34-llm-apis-every-day-since-au"
summary: "作者称自8月20日起，以同一组私有探针对15家实验室的34个模型接口逐日测量，只让模型与自身历史比较。9月10日，DeepSeek Reasoner在相同任务上的思考词元突然约增至此前的10—12倍；能力未必下降，但延迟与账单可能先恶化。公开材料能证明读数变化，不能证明供应商改了模型或路由。"
---

# I've been measuring 34 LLM APIs every day since August to see when they quietly change. One did.

## 事件背景
作者称自8月20日起，以同一组私有探针对15家实验室的34个模型接口逐日测量，只让模型与自身历史比较。9月10日，DeepSeek Reasoner在相同任务上的思考词元突然约增至此前的10—12倍；能力未必下降，但延迟与账单可能先恶化。公开材料能证明读数变化，不能证明供应商改了模型或路由。

## 核心观点 / 产品机制
Seismograph把固定探针当“尺子”：代码机械判分，不用模型裁判；读数写入公开仓库，并以电池哈希、代码版本和Rekor时间见证固化来源。检测需至少7次基线，滚动窗口最多14次；通过率用双比例检验及BH假发现率校正，思考词元则用相对阈值，后者不是显著性检验。动态层按种子生成新算术、格式和工具调用题，用固定层与动态层持续差距排查记忆或评测投机。

## 社区热议与争议点
RSS当时仅返回主帖、1条普通评论和1条作者回复，是可见子集而非完整舆情。普通评论者回忆生产接口曾突然变得冗长，认可时间戳基线能把“体感”变成证据；作者则推测别名在V4.1 Flash发布日被重映射或提高默认推理量，并称外部账单约增至3倍，但这属于作者解释，尚无供应商确认或独立复现。现有评论因缺少真正反方，不能据此形成社区共识。

## 行业影响与未来展望
这类纵向探针可把模型别名视为会漂移的外部依赖，接入成本告警、回归门禁和供应商切换流程。边界同样关键：固定电池与原始回答不公开，外部只能审计摘要和见证链；它只覆盖特定API与固定参数，不覆盖上层产品提示、路由或客户端映射。本轮仓库63项离线测试通过，只验证实现路径，不能替代真实接口复测。

## 附带链接
- [Reddit 原帖](https://www.reddit.com/r/LLM/comments/1wugztj/ive_been_measuring_34_llm_apis_every_day_since/)
- [piperoll/seismograph 仓库](https://github.com/piperoll/seismograph)
- [实时看板与方法说明](https://seismo.piperoll.org)
