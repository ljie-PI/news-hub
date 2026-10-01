---
title: "Open model that tells how far an image is rotated (full 360-degree) and abstains when there's no clear up"
date: "2026-10-02"
generated: "2026-10-02 07:00"
source: "Reddit"
slug: "2026-10-02_07-open-model-that-tells-how-far-an-image-is-rotated"
summary: "ORTUS AI 因监控摄像机被风吹歪、维护后倒装却仍显示在线，开发 RightWayUp：仅凭单帧估计完整三百六十度滚转角，并在天空、墙面等没有明确“上方”的画面拒答。项目于九月底发布一点零版，代码、权重和逐图数据来源清单公开，代码与权重均标注 Apache 二点零许可。"
---

# Open model that tells how far an image is rotated (full 360-degree) and abstains when there's no clear up

## 事件背景
ORTUS AI 因监控摄像机被风吹歪、维护后倒装却仍显示在线，开发 RightWayUp：仅凭单帧估计完整三百六十度滚转角，并在天空、墙面等没有明确“上方”的画面拒答。项目于九月底发布一点零版，代码、权重和逐图数据来源清单公开，代码与权重均标注 Apache 二点零许可。

## 核心观点 / 产品机制
模型以 DINOv2 视觉变换器为骨干，把角度分成三百六十个一度区间，用环形高斯目标处理零度边界；置信度是预测峰值正负十度内的概率质量。六档模型中，Balanced 与 Pro 先跑 Fast，低置信样本再送 Max，最终低于按格式校准的阈值便拒答。官方密封留出集含四千七百零六张新照片：Max 十度内准确率自报百分之九十三，Woehrer 基线为百分之八十八点四；模拟监控退化后为百分之八十八点二对百分之四十九点三。仓库提供冻结记录、评测代码和结果，但仍属发布方评测。

## 社区热议与争议点
Atom 源共七个条目：一篇主帖、六条可见评论。karolosh 追问俯仰角并建议消失点算法，作者仅称会继续开发；mr_maker91 质疑为何不用陀螺仪，作者解释存量监控常无传感器，下载后的媒体也可能缺方向元数据；Vol1801 表示认可。其余仅有致谢，故该子集能证明替代方案之争，却不足以代表完整社区共识。

## 行业影响与未来展望
它把“画面在线”扩展为可量化的安装姿态健康检查，也适合照片与扫描件校正。真正门槛是跨设备校准：模型卡承认陌生热成像上置信度不可靠，小模型在干净照片上也可能落后；公开工件利于复现，但仍需第三方用真实相机、鱼眼和地区分布验证。

## 附带链接
- [Reddit 原帖](https://www.reddit.com/r/computervision/comments/1wuy15w/open_model_that_tells_how_far_an_image_is_rotated/)
- [项目说明与完整结果](https://cheqit.ortusai.io/resources/rightwayup/)
- [GitHub 仓库](https://github.com/ortusaitech/rightwayup)
- [Hugging Face 权重与模型卡](https://huggingface.co/ortusai/rightwayup)
- [数据卡](https://github.com/ortusaitech/rightwayup/blob/main/DATA-CARD.md)
