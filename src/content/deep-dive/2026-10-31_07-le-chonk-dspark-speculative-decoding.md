---
title: "Le Chonk UD-IQ1_S + DSpark on a Mac Studio M5 Ultra: ×1.25 to ×1.66 decode speed-up"
date: "2026-10-31"
generated: "2026-10-31 07:00"
source: "Reddit"
slug: "2026-10-31_07-le-chonk-dspark-speculative-decoding"
summary: "Mistral Large 4（Le Chonk）官方卡标约一万亿总参数，每词元激活四百九十亿（含嵌入与输出层五百二十亿），一百二十八个路由专家中激活四个、另有一个共享专家，上下文一百万。发帖者在二百五十六GB M5 Ultra上，以llama.cpp b12015运行二百三十三GB、约一点八位每权重的UD-IQ1_S；结果为作者自测，标题不是独立跑分。"
---

# Le Chonk UD-IQ1_S + DSpark on a Mac Studio M5 Ultra: ×1.25 to ×1.66 decode speed-up

## 事件背景
Mistral Large 4（Le Chonk）官方卡标约一万亿总参数，每词元激活四百九十亿（含嵌入与输出层五百二十亿），一百二十八个路由专家中激活四个、另有一个共享专家，上下文一百万。发帖者在二百五十六GB M5 Ultra上，以llama.cpp b12015运行二百三十三GB、约一点八位每权重的UD-IQ1_S；结果为作者自测，标题不是独立跑分。

## 核心观点 / 产品机制
DSpark用三层BF16稠密MLA草稿层提议三个词元，递归Markov头补入块内依赖，再由目标模型验证；接受越多，目标解码次数越少。作者结果和脚本显示：固定生成五百一十二词元、greedy，预热后各跑三次，读取服务器decode tok/s；JSON从二十一点六升至三十五点九，代码二十九点四，散文二十七点零，接受率依次百分之七十七、五十八、五十。标题的一点二五至一点六六倍即该组均值，不是新证据。官方卡称最高一点九倍，Unsloth称批量一约两倍，均限定收益随硬件和负载变化。

## 社区热议与争议点
RSS共四个entry：一条主帖、三条普通评论，无作者回复或机器人。DoubleOk2084惊叹桌面可让一万亿参数模型达到二十一点六词元每秒；Front_Eagle739称其三点六位Kimi在五百一十二GB M3 Ultra上约三十词元每秒，但预填充较慢；CryptoxPathy则质疑激进量化是否损伤过大。速度比较未经复现；RSS仅为可见子集，不代表完整评论区。

## 行业影响与未来展望
实验说明极低位量化加专用草稿头可让超大MoE在统一内存单机中加速解码，也显示接受率受输出可预测性支配：JSON明显优于散文。它未测质量、长上下文、首词延迟、预填充或端到端墙钟，且强制生成并忽略停止符；后续需在同提交上加入真实任务、质量对照、不同草稿长度和上下文，才可判断一点九至两倍能否迁移。

## 附带链接
- [Reddit 原帖](https://www.reddit.com/r/unsloth/comments/1xjlkwf/le_chonk_udiq1_s_dspark_on_a_mac_studio_m5_ultra/)
- [作者数据与脚本](https://huggingface.co/datasets/tristanbes/m5-ultra-llm-bench)
- [Mistral 模型卡](https://huggingface.co/mistralai/Mistral-Large-4-1T-A52B)
- [Unsloth GGUF](https://huggingface.co/unsloth/Mistral-Large-4-1T-A52B-GGUF)
- [llama.cpp 推测解码文档](https://github.com/ggml-org/llama.cpp/blob/master/docs/speculative.md)
