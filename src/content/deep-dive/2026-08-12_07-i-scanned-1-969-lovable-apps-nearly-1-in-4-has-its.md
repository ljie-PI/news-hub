---
title: "I scanned 1,969 Lovable apps. Nearly 1 in 4 has its .env file sitting in a public repo right now."
date: "2026-08-12"
generated: "2026-08-12 07:00"
source: "Reddit"
slug: "2026-08-12_07-i-scanned-1-969-lovable-apps-nearly-1-in-4-has-its"
summary: "发帖者称从 Lovable 自动写入的标记筛出五千二百八十六个公开仓库，以固定随机种子抽取一千九百六十九个，再用规则扫描而非人工或模型评分。作者�"
---

# I scanned 1,969 Lovable apps. Nearly 1 in 4 has its .env file sitting in a public repo right now.

## 事件背景
发帖者称从 Lovable 自动写入的标记筛出五千二百八十六个公开仓库，以固定随机种子抽取一千九百六十九个，再用规则扫描而非人工或模型评分。作者自报结果为百分之二十三点二提交了环境文件，百分之四十二点二触发硬编码凭证规则。原始逐行数据虽称可下载，本轮未取得完整报告，数字不能视为平台总体审计结论。

## 核心观点 / 产品机制
风险链条很直接：项目同步到公开仓库后，环境文件、口令或服务密钥进入历史记录，删掉当前文件也未必清除旧提交。Lovable 官方文档则说明新建仓库默认私有，并提供基础扫描、深度扫描、密钥存储及服务端函数引导；但深度扫描并非工作时自动持续运行，用户也能带着未修复问题发布。另需区分真正秘密与面向浏览器公开的配置值，单纯命中规则不等于密钥已可利用。

## 社区热议与争议点
本轮未取得逐字评论，以下为议题层面的具体正反论点。警示方认为，大样本和可复查规则比零散案例更能暴露新手发布流程的系统性缺口，公开仓库又会被自动机器人迅速索引。审慎方则指出，样本只覆盖可被标记发现的公开项目，存在选择偏差；环境文件可能仅含公开配置，硬编码规则也会误报。平台默认私有和已有扫描能力说明问题还涉及用户改公开、忽略告警及密钥轮换，而不能全部归因于生成工具。

## 行业影响与未来展望
低代码与氛围编程把部署权交给更多非安全专业用户，安全闸门必须前移。更可靠的产品应默认阻断含高置信秘密的公开同步，扫描完整提交历史，并提供一键撤销和轮换；研究者也应公开规则、命中分类与人工复核率，才能把醒目的比例转化为可行动证据。

## 附带链接
- [Reddit 原帖](https://www.reddit.com/r/vibecoding/comments/1vlqtig/i_scanned_1969_lovable_apps_nearly_1_in_4_has_its/)
- [Lovable 安全文档](https://docs.lovable.dev/features/security)
- [Lovable 与 GitHub 同步说明](https://docs.lovable.dev/integrations/github)
