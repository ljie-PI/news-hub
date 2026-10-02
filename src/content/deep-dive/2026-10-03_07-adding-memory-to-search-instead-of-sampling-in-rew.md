---
title: "Adding memory to search instead of sampling in reward maximization tasks [R]"
date: "2026-10-03"
generated: "2026-10-03 07:00"
source: "Reddit"
slug: "2026-10-03_07-adding-memory-to-search-instead-of-sampling-in-rew"
summary: "作者于十月二日在机器学习版介绍论文FLEET，质疑最佳若干次生成只会反复采样、却不记得前次答案所得奖励。论文、仓库身份相符，代码以MIT许可证发布。"
---

# Adding memory to search instead of sampling in reward maximization tasks [R]

## 事件背景

作者于十月二日在机器学习版介绍论文FLEET，质疑最佳若干次生成只会反复采样、却不记得前次答案所得奖励。论文、仓库身份相符，代码以MIT许可证发布。

## 核心观点 / 产品机制

FLEET用中间层经词表投影后的熵与熵方差定位高不确定词位，把归一化隐藏状态按余弦相似度聚成VectorDSU节点，保存令牌、转移、访问次数和整段奖励。下一轮以语言模型概率作先验计算改造后的树搜索分数，惩罚已探索但较差的令牌，再交给原解码器。论文在单一Llama三十亿参数模型上报告：真实验证下，代码榜三十二次预算由百分之五十九点九升至六十六点二；数学集仅多解七题。仓库源码与该流程一致，但没有测试目录。

## 社区热议与争议点

本轮Reddit实时评论被封，未逐字取得评论；以下为页面数据与公开资料支持的争点，并非网友引语。订阅源仅一个主帖条目、零条评论，因此没有普通用户正反样本。可核验的两个社区例子是：发帖作者称代码榜可到零点六九，但论文显示这是奖励模型引导后由真实答案评估候选池的结果，奖励模型实际选中仅百分之二十五点二二；作者还称记忆可作并行查询表，而论文明确并行加速尚待量化。抱脸社区只出现自动荐文机器人，不能算独立复现。

## 行业影响与未来展望

它把推理扩展从独立抽签改成可积累奖励的词级搜索，适合有程序验证器的本地代码或数学任务，也能产出微调轨迹。但方法需白盒隐藏状态、任务奖励和模型补丁；论文只测两套基准、一个稠密模型，并承认反思型模型可能受损且偶发乱码。跨任务先验、并行收益与训练价值都未实证，现阶段更像有代码的研究原型，而非通用采样替代品。

## 附带链接

- [Reddit 原帖](https://www.reddit.com/r/MachineLearning/comments/1wvs12j/adding_memory_to_search_instead_of_sampling_in/)
- [arXiv 论文](https://arxiv.org/abs/2609.27657)
- [GitHub 仓库](https://github.com/Alexiush/fleet)
- [Hugging Face 论文页](https://huggingface.co/papers/2609.27657)
