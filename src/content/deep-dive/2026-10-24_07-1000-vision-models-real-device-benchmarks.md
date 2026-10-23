---
title: "Over 1000 vision models compiled and measured on real devices"
date: "2026-10-24"
generated: "2026-10-24 07:00"
source: "Reddit"
slug: "2026-10-24_07-1000-vision-models-real-device-benchmarks"
summary: "Embedl于2026年10月21日开放Jetson模型平台，官方宣称已编译、上机测量逾千个模型。两天后，其员工在Reddit披露利益关系并给出AGX Thor样例。Atom源核对到同一帖子ID与标题，共13个条目：完整主帖加12条真实评论。数量、性能提升及设备农场结果均属公司自测，并非独立横评。"
---

# Over 1000 vision models compiled and measured on real devices

## 事件背景

Embedl于2026年10月21日开放Jetson模型平台，官方宣称已编译、上机测量逾千个模型。两天后，其员工在Reddit披露利益关系并给出AGX Thor样例。Atom源核对到同一帖子ID与标题，共13个条目：完整主帖加12条真实评论。数量、性能提升及设备农场结果均属公司自测，并非独立横评。

## 核心观点 / 产品机制

流程从Hugging Face、timm或torchvision取模型，先在PyTorch中做算子融合和硬件约束，再插入量化Q/DQ、导出ONNX，并由TensorRT生成特定“模型—设备”引擎。公开ViT教程固定批量一、CUDA图并排除传输：FP16中位延迟1.402毫秒，FP8混合精度1.065毫秒；ImageNette全验证集Top-1由86.0%变为86.2%。RF-DETR页面则同时列出纯GPU引擎2.29毫秒与含预处理、拷贝和后处理的端到端15.6毫秒，说明不同延迟口径不能混比。教程代码可见，但官方安装文档称正式轮子位于需账户密钥的私有索引；本轮也无法从GitHub解析到官方仓库，复现开放度仍有限。

## 社区热议与争议点

评论子集出现四个具体追问：Big-Charge-8833质疑ResNet-50从0.60降到0.33毫秒不像“仅编译”，作者承认使用自家量化版本；dn8034问Sparse4D骨干，作者答ResNet-50；其进一步要求把SAM与Sparse4D结合，未获实质答复；paypaytr追问缺少SAM3.1和视频变体，也暂无回应。讨论既肯定目录覆盖，也暴露版本、新组合与优化细节不足。

## 行业影响与未来展望

价值不只是排行榜，而是把模型来源、精度、运行时和目标板卡绑定，降低边缘选型成本。但逾千条目跨任务、数据集和输入尺寸，不能按单一速度榜排序。若要成为可信公共基准，仍需发布冻结版本、功耗温度、重复次数、原始日志，并由第三方在同款设备复跑。

## 附带链接

- [Reddit原帖](https://www.reddit.com/r/computervision/comments/1xd9j1w/over_1000_vision_models_compiled_and_measured_on/)
- [Embedl发布说明](https://embedl.com/news/hugging-face-to-jetson-in-one-step)
- [FP8 ViT教程](https://docs.embedl.com/embedl-deploy/latest/auto_tutorials/thor_fp8_vit.html)
- [RF-DETR实机页面](https://embedl.com/embedl/rf-detr-base/thor)
