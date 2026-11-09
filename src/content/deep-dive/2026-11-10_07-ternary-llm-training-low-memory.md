---
title: "You can now train your own LLMs with less memory, on your gaming GPUs"
date: "2026-11-10"
generated: "2026-11-10 07:00"
source: "Reddit"
slug: "2026-11-10_07-ternary-llm-training-low-memory"
summary: "作者 oguzeldereli 发布 TTF 三值训练工具链，旨在绕开 AdamW 主权重和动量的显存墙。项目方自报：三值权重训练期保持约一点六比特，低秩状态约每权重一字节；二百七十亿参数模型可在二十四吉字节显卡继续训练，二百三十亿参数模型可借主存卸载在十六吉字节显卡训练。上述数字未获独立复现。"
---

# You can now train your own LLMs with less memory, on your gaming GPUs

## 事件背景

作者 oguzeldereli 发布 TTF 三值训练工具链，旨在绕开 AdamW 主权重和动量的显存墙。项目方自报：三值权重训练期保持约一点六比特，低秩状态约每权重一字节；二百七十亿参数模型可在二十四吉字节显卡继续训练，二百三十亿参数模型可借主存卸载在十六吉字节显卡训练。上述数字未获独立复现。

## 核心观点 / 产品机制

TTF 用按行列分解的二阶矩归一化梯度，将证据写入低秩、带泄漏的累加器；累积越过阈值时，权重才在负一、零、正一间移动，并扣除已消费阈值。论文与仓库把训练、转换、家用入口拆开：ttf-conversion 逐层读取模型，以中心化三值 GPTQ、尺度和低秩适配器生成检查点，再蒸馏恢复；ttf-home 导出 GGUF，并构建打过补丁的 llama.cpp。自定义 TQ1_P 尚不能由主线 llama.cpp、Ollama 或 LM Studio 直接加载。主仓最新提交的 GitHub Actions 显示一百三十七项 CPU 测试通过、二十三项跳过，但 GPU、真实大模型质量与速度仍未独立复测，二百七十亿参数配方还注明验证损失上升“调查中”。

## 社区热议与争议点

RSS 实取六十三条评论。HiddenFaceOpenMouth 发现 Ollama 不兼容且可编辑安装报错；作者指向 ttf-home，并要求升级 setuptools。Hunterxmalaa 将省显存理解为吞吐提升；作者明确训练仍受算力限制，当前实现未专门优化速度。xaleel 追问从零训练时长；作者承认单卡处理约五千四百亿词元可能需多年，因此重点转向预训练模型转换。RageBucket 质疑小模型损失及零点八亿参数结果口径不一致；作者只称存在多次运行，未给出可对照配置。

## 行业影响与未来展望

该路线把消费卡训练的首要瓶颈从容量推向计算与数据，但“装得下”不等于“训得动”或“效果等同全精度”。其价值更可能先出现在三值模型研究、窄域继续训练和转换恢复；能否进入主流生态，取决于统一评测、GPU 测试覆盖、上游内核兼容与第三方复现。

## 附带链接

- [Reddit 原帖](https://www.reddit.com/r/LocalLLM/comments/1xrtfqp/you_can_now_train_your_own_llms_with_less_memory/)
- [ttf-ternary 与论文](https://github.com/oguzeldereli/ttf-ternary)
- [ttf-conversion](https://github.com/oguzeldereli/ttf-conversion)
- [ttf-home](https://github.com/oguzeldereli/ttf-home)
- [主仓测试运行](https://github.com/oguzeldereli/ttf-ternary/actions/runs/42674142431)
