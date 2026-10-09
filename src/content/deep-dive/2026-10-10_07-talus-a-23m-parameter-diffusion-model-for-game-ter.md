---
title: "Talus: a 23M-parameter diffusion model for game terrain, evaluated against a real-vs-real noise floor, running in the browser on WebGPU [P]"
date: "2026-10-10"
generated: "2026-10-10 07:00"
source: "Reddit"
slug: "2026-10-10_07-talus-a-23m-parameter-diffusion-model-for-game-ter"
summary: "Talus把游戏地形生成做成小模型与浏览器工具：输出覆盖四公里、最高一千二百米的六十四乘六十四高度图。作者用自制程序生成器产出的四万五千张地图训练，跨版本在单张八吉显存显卡上约耗四点五小时。关键边界是训练和测试均来自同一程序分布，并非真实地球地形。"
---

# Talus: a 23M-parameter diffusion model for game terrain, evaluated against a real-vs-real noise floor, running in the browser on WebGPU [P]

## 事件背景
Talus把游戏地形生成做成小模型与浏览器工具：输出覆盖四公里、最高一千二百米的六十四乘六十四高度图。作者用自制程序生成器产出的四万五千张地图训练，跨版本在单张八吉显存显卡上约耗四点五小时。关键边界是训练和测试均来自同一程序分布，并非真实地球地形。

## 核心观点 / 产品机制
模型是二千三百万参数的像素空间扩散网络，采用速度预测、余弦调度和条件引导；正式评分用五十步采样，网页默认二十五步。地形类型外，平均高程、起伏、坡度、水域比例和频谱斜率均可留空，由“未知”嵌入处理；相对高度机制再恢复高程与起伏。浏览器以运行时和图形接口执行导出模型。所谓“真实对真实噪声下限”，实为两组留出程序地图的统计距离基线；一点五一倍综合距离、九点一倍频谱差距均属作者自评，并非独立测评。

## 社区热议与争议点
同帖公开订阅源取得四个条目：主帖、一个已删除回复、作者回复及一条普通评论，只是可见子集。具体有三组讨论：普通用户建议加入频域损失，认为不增参数也可补高频；作者指出山地过平而平原已过碎，统一增强高频可能顾此失彼；作者还解释留空条件会随种子补值，却承认仅给水域条件能否稳定生成好山地尚未验证。他披露当前无判别器损失，只有逐层条件调制，没有独立粗到细方案。优点是失败方向披露透明，局限是缺少独立复现与充分正反样本。

## 行业影响与未来展望
它证明小型生成模型可成为本地、确定性的游戏资产工具；但当前分辨率、程序数据域及崎岖地形频谱缺口，限制其替代成熟程序流程。后续价值取决于真实高程数据、跨尺度拼接和第三方复现。

## 附带链接
- Reddit 原帖：https://www.reddit.com/r/MachineLearning/comments/1x1v71p/talus_a_23mparameter_diffusion_model_for_game/
- 在线演示：https://talus.tersa.tech/
- 代码、权重与评分材料：https://github.com/osfv/talus
