---
title: "Qwen3.8-Flash-Next on 2x RTX 3090s, 33-43 tok/s"
date: "2026-08-28"
generated: "2026-08-28 07:00"
source: "Reddit"
slug: "2026-08-28_07-qwen3-8-flash-next-on-2x-rtx-3090s-33-43-tok-s"
summary: "作者用两张无NVLink的24GB RTX 3090、64GB内存和llama.cpp测试新发布的Qwen3.8-Flash-Next。官方模型卡显示，它是125B参数、每词元激活6B的混合专家模型，另含51B级n-gram嵌入与4B MTP，原生上下文为262144；它仍是面向下一代架构的实验预览。帖中宣称IQ4约33词元每秒、Q2最高约43，证明消费级双卡能运行，但不是官方跑分。"
---

# Qwen3.8-Flash-Next on 2x RTX 3090s, 33-43 tok/s

## 事件背景

作者用两张无NVLink的24GB RTX 3090、64GB内存和llama.cpp测试新发布的Qwen3.8-Flash-Next。官方模型卡显示，它是125B参数、每词元激活6B的混合专家模型，另含51B级n-gram嵌入与4B MTP，原生上下文为262144；它仍是面向下一代架构的实验预览。帖中宣称IQ4约33词元每秒、Q2最高约43，证明消费级双卡能运行，但不是官方跑分。

## 核心观点 / 产品机制

关键不只在量化，而在放置。作者称IQ4版GGUF共93.67GB，其中28.8GB查表型n-gram张量可映射到CPU与NVMe；再用`-ot`把第0—8、25—31层专家分两段留在CPU，使两卡各占约20—21GB。相比`--n-cpu-moe`只卸载开头连续层，这避免一张卡闲置。32K配置使用分层切分、Flash Attention及F16缓存；65K提示则须把22层专家移至CPU并把微批降至1024，解码降至约22词元每秒、首词等待约182秒。

## 社区热议与争议点

RSS取得主帖及九条可见回复，其中一条为机器人。Sevealin_追问27B配置并称自己的INT8可到262K；作者随后纠正，所谓接近100词元每秒来自vLLM加MTP，不是llama.cpp。jacek2023追问版本，作者承认使用当天较早构建，合并后的内存修复可能抬高上限。AppealSame4367也建议更新并调整CPU卸载。讨论显示复现兴趣很强，但数字随运行时提交、量化和卸载策略显著漂移；RSS仅是可见评论子集。

## 行业影响与未来展望

这次实验说明超大稀疏模型可借助张量级放置进入旧双卡工作站，却也把“能加载”和“适合代理循环”分开：33—43是热身后512词元解码，不含长提示端到端代价。作者的32K检索为自建合成测试，虽90/90命中，20题质量比较仍无结论；结果还基于支持合并前提交，不能外推为普遍性能。

## 附带链接

- [Reddit原帖](https://www.reddit.com/r/LocalLLM/comments/1w069fh/qwen38flashnext_on_2x_rtx_3090s_3343_toks/)
- [作者基准仓库](https://github.com/ruashots/flashnext-2x3090)
- [官方模型卡](https://huggingface.co/Qwen/Qwen3.8-Flash-Next)
- [llama.cpp支持合并](https://github.com/ggml-org/llama.cpp/pull/27742)
