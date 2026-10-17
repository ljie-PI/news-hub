---
title: "Llama.cpp on a jailbroken PS5: run any GGUF model natively on the console"
date: "2026-10-18"
generated: "2026-10-18 07:00"
source: "HN"
slug: "2026-10-18_07-llama-cpp-on-a-jailbroken-ps5-run-any-gguf-model-n"
summary: "PS5LM 在十月十六日发布 v0.9.0，把越狱 PS5 变成无需电脑和云账户的家庭模型服务器。它面向已有兼容主机、愿意承担越狱门槛的玩家；所谓“任意 GGUF”实际指 llama.cpp 已支持、且模型与上下文能装进可用内存的文件，并非无限制兼容。批次冻结热度为 365 points、85 comments。"
---

# Llama.cpp on a jailbroken PS5: run any GGUF model natively on the console

## 事件背景

PS5LM 在十月十六日发布 v0.9.0，把越狱 PS5 变成无需电脑和云账户的家庭模型服务器。它面向已有兼容主机、愿意承担越狱门槛的玩家；所谓“任意 GGUF”实际指 llama.cpp 已支持、且模型与上下文能装进可用内存的文件，并非无限制兼容。批次冻结热度为 365 points、85 comments。

## 核心观点 / 产品机制

项目把 llama-server 与 ggml-vulkan、PS5_Vulkan 的 RADV 静态链接进主机标题 eboot.bin，经 ShadowMountPlus 启动，统一显存堆约 11.44 GiB，并向局域网提供 OpenAI、Anthropic 接口。构建文档要求在 x86-64 Linux 交叉编译；仓库钉住 llama.cpp 提交 04f7226，本轮核验七个补丁均可干净应用。补丁会限制线程和忙等、防止断网后监听器永久退出；Mesa 补丁则让已释放缓冲区等待 GPU 完成。README 所列 9B 模型每秒 55 tokens 等数据仍是项目方实测，不是独立跑分。

## 社区热议与争议点

按指定脚本刷新后，Algolia 实取 76 个可见节点，未触及 100 上限，不能替代冻结的 85 comments。支持者 xnx 因“把封闭设备改成通用电脑”而考虑购买 PS5；none_to_remain 认为约每秒 20 tokens 的二比特 27B 模型仍适合读代码。质疑者 kadoban 指出二比特量化明显损伤能力，难替代 Claude；hypfer 则认为 11.4 GiB 太局促，README 把有趣的工程成果包装得过于实用。

## 行业影响与未来展望

它证明消费主机的统一内存和 GPU 可被重用为边缘推理节点，也为 llama.cpp 进入封闭设备提供可审计样本。但固件需处于 7.00 至 13.60、越狱链和驱动补丁复杂，模型切换还要重启应用；因此近期价值更像硬件再利用与移植实验，而非低维护的主流本地推理方案。若上游兼容、驱动稳定性和可用内存继续改善，闲置主机才可能成为更普遍的家庭算力池。

## 附带链接

- [PS5LM 原始仓库](https://github.com/cobanov/PS5LM)
- [构建文档](https://github.com/cobanov/PS5LM/blob/main/docs/BUILDING.md)
- [HN 原帖](https://news.ycombinator.com/item?id=50122431)
