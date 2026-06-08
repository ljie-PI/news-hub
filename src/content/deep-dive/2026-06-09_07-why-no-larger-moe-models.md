---
title: "why-no-larger-moe-models"
date: "2026-06-09"
generated: "2026-06-09 07:00"
source: "Reddit"
slug: "2026-06-09_07-why-no-larger-moe-models"
---

---
title: "Why no larger MoE models?"
date: "2026-06-09"
source: "Reddit"
subreddit: "LocalLLM"
category: "Local LLM"
slug: "why-no-larger-moe-models"
---

## 一、事件背景

r/LocalLLM 是本地大模型爱好者的核心阵地,用户多数自购消费级 GPU 或 Apple Silicon、AMD Strix Halo 等"统一内存"设备跑推理。OP 发出的这则讨论帖把矛头指向了开源社区一个明显的空档:**80B 级别、激活参数约 10–15B 的中量 MoE(Mixture-of-Experts)模型几乎绝迹**。OP 举例期待"Qwen3.6 80b a12b"这样的形态——总参数 80B、每 token 只激活 12B 专家,对拥有 64–96GB 统一内存的 Mac Studio、Framework Desktop、Strix Halo 设备而言,既能塞进显存,又能跑出比 27B 稠密模型更高的推理速度和更强的能力。

## 二、核心观点 / 主张

OP 的核心主张可拆解为三层:其一,**中量 MoE 在硬件经济学上具备甜点位**——它正好填补 24GB 显存稠密模型(7–14B)与 80GB 显存以上稠密模型(70B+)之间的鸿沟;其二,**统一内存路线正在崛起**,Apple M3/M4 Max、AMD Strix Halo 都把带宽×容量推到一个新的本地推理可行性区间,但模型供给侧并未跟进;其三,**这不是技术难题,而是供给侧选择**——OP 隐含的反问是:为什么各家厂商要么发布超小 MoE(如 Mixtral 8x7B 早期、DeepSeek-V2-Lite),要么直接上 200B+ 巨无霸(DeepSeek-V3、Kimi K2),却几乎跳过了 60–100B 区间?

## 三、社区热议与争议点

围绕这个问题,r/LocalLLM 大概率会涌现几类典型回应:

1. **训练经济学派**:有人会指出 MoE 训练对路由稳定性、负载均衡极其敏感,中等规模反而"两头不讨好"——既没有大模型的容量优势摊薄路由噪声,也没有小模型的训练成本优势,厂商不如直接 scale up。
2. **商业模型派**:阿里、Mistral、DeepSeek 等厂商的发布节奏其实由 API 商业化驱动,80B MoE 在云端推理性价比未必比稠密 32B 或巨型 MoE 更优,所以并非 OP 期待的"中量本地友好"模型的天然候选者。
3. **硬件错配派**:有评论会指出,Strix Halo 用户规模仍小,Mac 用户更偏好 Q4 量化的 70B 稠密模型——中量 MoE 的目标受众目前可能不足以让厂商专门去发布一款 SKU。Qwen3 系列已有的 30B-A3B、235B-A22B 也覆盖了大部分场景。

## 四、行业影响与未来展望

OP 的诉求实际上指向一个正在浮现的趋势:**本地推理硬件正在重新定义"理想模型尺寸"**。过去模型按"7B / 13B / 70B"分档是 NVIDIA 4090/A100 显存约束的产物;未来随着统一内存设备普及,128GB、256GB 内存将变得平价,模型档位很可能演化出"80B-a12B、120B-a15B"等新形态。已有迹象支持这一方向:GLM-4.5-Air、Qwen3-Next 80B-A3B、Llama-4 Scout 等模型正逐步填补这个区间。可以预见,2026 下半年中量 MoE 将是开源圈最热门的赛道之一,谁先发布一款真正适配 64–96GB 统一内存、激活 10–15B 的高质量 MoE,就能赢得本地玩家的强烈拥戴。

## 五、附带链接

- Reddit 讨论页: <https://www.reddit.com/r/LocalLLM/comments/1u0mfvt/why_no_larger_moe_models/>
- 相关参考:Qwen3、GLM-4.5-Air、Llama-4 Scout 的 MoE 设计文档
