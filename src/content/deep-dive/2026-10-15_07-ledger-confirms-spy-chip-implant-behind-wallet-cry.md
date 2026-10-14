---
title: "Ledger confirms spy chip implant behind wallet crypto thefts"
date: "2026-10-15"
generated: "2026-10-15 07:00"
source: "HN"
slug: "2026-10-15_07-ledger-confirms-spy-chip-implant-behind-wallet-cry"
summary: "10月9日资金异常报告出现后，Ledger要求东南亚授权经销商CryptoBilis停货；BleepingComputer随后报道，Ledger只确认至少一台受影响用户设备含未授权植入物，并称当时所有已报告资金流出均关联该商家、规模“有限”。受害人数、损失额、植入发生环节及全部设备影响范围仍在调查，不能据此推成Ledger产品普遍失陷。"
---

# Ledger confirms spy chip implant behind wallet crypto thefts

## 事件背景

10月9日资金异常报告出现后，Ledger要求东南亚授权经销商CryptoBilis停货；BleepingComputer随后报道，Ledger只确认至少一台受影响用户设备含未授权植入物，并称当时所有已报告资金流出均关联该商家、规模“有限”。受害人数、损失额、植入发生环节及全部设备影响范围仍在调查，不能据此推成Ledger产品普遍失陷。

## 核心观点 / 产品机制

Tibane Labs追踪了三代Nano X植入物：附加板旁路安全芯片，窃听其送往OLED的未加密SPI像素流，识别初始化时显示的24个恢复词，再由微控制器、eSIM、LTE模组和天线外传。新版以定制柔性板藏在屏幕后，保留原电池。Ledger Donjon说明Genuine Check是服务器挑战安全芯片并验签；官方硬件完整性页也明确，原安全芯片完好时，它发现不了外围物理植入。关键边界是：Tibane两台样本来自日本拍卖和亚马逊第三方卖家，并未购自CryptoBilis，研究方明确称尚无证据把样本与该事件直接相连。

## 社区热议与争议点

批次冻结为492条评论；本轮Algolia实际取得100个可见节点，已触及上限。TacticalCoder认为字形识别加蜂窝外传让“偏执式”供应链设想变成现实；socializer反驳其并不新奇，硬件攻击早有数十年记录，难点只是成本与物流。bri3d指出Nano X总线简单、内部空间较多，且买家天然是高价值目标，不能类推到所有消费电子。dfox则把根因指向恢复词为备份而以明文经过显示链路，认为这弱于密钥不离安全边界的标准HSM模式。

## 行业影响与未来展望

事件暴露的是“安全芯片为真”不等于整机物料可信。后续防线需把显示链路、物料清单、退货与经销流转纳入验证；但现有证据仍是有限个案。相关买家应遵循Ledger建议：未初始化则停用，已显示过恢复词则在可信新设备生成新词并迁移资产。

## 附带链接

- [Hacker News讨论](https://news.ycombinator.com/item?id=50054092)
- [BleepingComputer原文](https://www.bleepingcomputer.com/news/security/ledger-confirms-hardware-wallet-spy-implant-behind-crypto-thefts/)
- [Tibane Labs拆解报告](https://www.tibane.net/research/ledger-nano-x-implant)
- [Ledger Donjon：Genuineness](https://donjon.ledger.com/threat-model/device-genuineness/)
- [Ledger：Check hardware integrity](https://support.ledger.com/article/4404382029329-zd)
