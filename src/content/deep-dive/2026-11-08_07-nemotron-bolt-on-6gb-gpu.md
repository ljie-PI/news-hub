---
title: "somewhat figured out how to run nemotron bolt e4b on a 6gb gpu"
date: "2026-11-08"
generated: "2026-11-08 07:00"
source: "Reddit"
slug: "2026-11-08_07-nemotron-bolt-on-6gb-gpu"
summary: "作者延续此前求助帖，给出让 Nemotron 3.5 Bolt E4B 在六GB显卡运行的 llama.cpp 配置。官方称该模型为八十亿总参数、四十亿有效参数，推荐上下文上限六万四千词元；本帖数字均是作者单机自测，并非受控基准。"
---

# somewhat figured out how to run nemotron bolt e4b on a 6gb gpu

## 事件背景

作者延续此前求助帖，给出让 Nemotron 3.5 Bolt E4B 在六GB显卡运行的 llama.cpp 配置。官方称该模型为八十亿总参数、四十亿有效参数，推荐上下文上限六万四千词元；本帖数字均是作者单机自测，并非受控基准。

## 核心观点 / 产品机制

主权重采用 IQ3_XXS，Unsloth 文件约三点七GB：这类重要性矩阵三比特量化以质量换显存，为缓存和运行时留余量。Q8 mmproj 是约零点五六GB的多模态投影器，不是主模型；`--no-mmproj-offload` 将其留在CPU，`per_layer_token_embd=CPU`又卸载逐层词嵌入，代价是系统内存与总线延迟。作者用较小的 Gemma E4B MTP，而非独立 DFlash：草稿头最多先猜三个词元，主模型并行验收；门槛零点七会丢弃低置信草稿。主、草稿的K缓存用Q8、V缓存用Q4，压缩随上下文增长的KV占用；Flash Attention则降低注意力中间量的显存与带宽压力。作者称九千至两万上下文平均四十一点八词元每秒，之后降至三十至三十五，未验证官方六万四千上限。

## 社区热议与争议点

本轮同帖RSS仅返回一条真实评论，无法满足二至四条评论样本，不能据此概括社区共识。Meeooowz认为六GB显存更适合发到低配本地AI社区，并质疑所用量化并非Unsloth版本；这提示复现前必须写清文件来源。原帖也未披露显卡、CPU、运行时提交和提示长度，速度不可横向比较。

## 行业影响与未来展望

案例说明低显存部署已从“只压权重”转向权重、投影器、KV缓存、草稿解码和算子协同调度。但三比特质量损失、CPU卸载延迟及长上下文降速仍需同硬件对照；DFlash虽由英伟达宣称比原始MTP吞吐更高，却会增加常驻体积，六GB场景未必划算。

## 附带链接

- [Reddit 原帖](https://www.reddit.com/r/unsloth/comments/1xq9ir0/somewhat_figured_out_how_to_run_nemotron_bolt_e4b/)
- [NVIDIA 模型卡](https://huggingface.co/nvidia/NVIDIA-Nemotron-3.5-Bolt-E4B-4GB)
- [Unsloth GGUF](https://huggingface.co/unsloth/NVIDIA-Nemotron-3.5-Bolt-E4B-GGUF)
