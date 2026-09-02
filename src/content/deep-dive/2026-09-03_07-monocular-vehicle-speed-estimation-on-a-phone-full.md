---
title: "Monocular vehicle speed estimation on a phone, fully offline: YOLO nano + Kalman + optical-flow ego-motion compensation. Where does this break?"
date: "2026-09-03"
generated: "2026-09-03 07:00"
source: "Reddit"
slug: "2026-09-03_07-monocular-vehicle-speed-estimation-on-a-phone-full"
summary: "作者Policy56称用十八个月做出安卓与苹果双端、完全离线的手持单目车速估计，希望社区检查工程盲点。方案避免上传视频，适合低时延和隐私敏感场景；但作者承认尚无雷达测速枪对照的公开误差基准，当前单一速度数字也没有不确定度。"
---

# Monocular vehicle speed estimation on a phone, fully offline: YOLO nano + Kalman + optical-flow ego-motion compensation. Where does this break?

## 事件背景
作者Policy56称用十八个月做出安卓与苹果双端、完全离线的手持单目车速估计，希望社区检查工程盲点。方案避免上传视频，适合低时延和隐私敏感场景；但作者承认尚无雷达测速枪对照的公开误差基准，当前单一速度数字也没有不确定度。

## 核心观点 / 产品机制
管线以三百二十像素方形输入运行轻量YOLO，安卓走TFLite、苹果走Core ML；类别过滤、非极大值抑制和C++跟踪尽量留在原生层，卡尔曼滤波维持框中心轨迹。标题所称光流自运动补偿并未真正随安卓版本交付：作者在回复中纠正，位移累加仍固定为零。现行尺度来自人工标定和车辆高度先验，以约一米六车高及框高推深度、横向米制比例，再对约二十个样本求速度。

## 社区热议与争议点
每帖Atom源核得主帖及三条可见评论。普通评论者指出单目系统的致命处始终是尺度；稳定接地点或有帮助，但手持光流噪声可能抵消收益。作者回复承认补偿只是占位实现，并判断车顶、阴影和遮挡引起的框高抖动才是主要噪声，计划用同段轨迹比较中心点与底边，并以已知GPS车速复算。另一名普通用户要求作者“去掉大模型腔”，提示披露方式也影响技术可信度；该子集很小，不能代表完整社区意见。

## 行业影响与未来展望
端侧小模型证明检测与跟踪可塞进手机，但测量可信度不由推理帧率决定。远处小车会受低分辨率漏检，手持还叠加滚动快门、防抖、变焦、视差、弱光、帧间隔和热降频。下一步应在雷达或同步GNSS真值上按距离、角度和机型报告误差，输出置信区间；静态模式可用路面单应性，手持模式则需真实自运动估计及失败拒绝机制。

## 附带链接
- [Reddit 原帖](https://www.reddit.com/r/computervision/comments/1w53q7b/monocular_vehicle_speed_estimation_on_a_phone/)
- [端侧车速估计研究](https://arxiv.org/abs/2505.01203)
- [单目测速方法参考](https://www.nature.com/articles/s41598-025-87077-6)
