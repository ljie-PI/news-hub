---
title: "I used Qwen3.8 Flash-Next to reverse-engineer an Android car stereo"
date: "2026-11-04"
generated: "2026-11-04 07:00"
source: "Reddit"
slug: "2026-11-04_07-qwen-car-stereo-reverse-engineering"
summary: "作者把一台廉价安卓车机装进2010款普锐斯后，不满预装臃肿界面，遂让本地模型经无线ADB调查设备。Atom源核对到帖子ID、标题与作者一致；作者称三天约八小时后已做出可运行的极简启动器，但仍是未公开复现材料的个人记录。"
---

# I used Qwen3.8 Flash-Next to reverse-engineer an Android car stereo

## 事件背景
作者把一台廉价安卓车机装进2010款普锐斯后，不满预装臃肿界面，遂让本地模型经无线ADB调查设备。Atom源核对到帖子ID、标题与作者一致；作者称三天约八小时后已做出可运行的极简启动器，但仍是未公开复现材料的个人记录。

## 核心观点 / 产品机制
作者配置为Qwen3.8-Flash-Next-IQ3_XXS、Strata v0.1.44.1与Pi，主机是锐龙7700X、16GB显存的4060 Ti和64GB内存。代理枚举软件包、系统属性和车机组件，发现标称安卓版本与实际构建不符，遂配置相符SDK；又抓取屏幕供视觉检查，以Kotlin和Jetpack Compose迭代启动器。Qwen官方资料显示原模型为多模态MoE，主模型1250亿参数、每词元激活60亿；具体量化效果、速度和“从未卡住”仅有作者自述。

## 社区热议与争议点
RSS取证时共有10个条目：主帖一条、普通评论七条、作者回复两条、无机器人，仅代表可见子集。Ithron_Morn赞其修复厂商糟糕体验；mechkbfan以自己车机菜单、蓝牙故障追问倒车摄像头，作者承认尚未连接，并强调改动可逆；thisonehereone分享用Claude和DeepSeek修改仪表固件的类似经历；Lewinator56则反驳这只是开发并替换启动器，称不上逆向工程。

## 行业影响与未来展望
案例说明本地模型可把设备盘点、截图理解、工具链配置和应用开发串成现场工作流，但模型实际跑在桌面主机，并非车机端侧。更可靠的下一步是公开脚本、提交记录与可回滚镜像，独立验证蓝牙、导航、摄像头及重启稳定性；在此之前，不能把单次成功外推为通用车载逆向能力。

## 附带链接
- [Reddit原帖](https://www.reddit.com/r/LocalLLM/comments/1xn2q8a/i_used_qwen38_flashnext_to_reverseengineer_an/)
- [Qwen官方介绍](https://qwen.ai/blog?id=qwen3.8-flash-next)
- [Strata仓库](https://github.com/Niko1221/Strata)
