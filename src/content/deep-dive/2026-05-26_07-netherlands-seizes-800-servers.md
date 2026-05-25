---
title: "netherlands-seizes-800-servers"
date: "2026-05-26"
generated: "2026-05-26 07:00"
source: "HN"
slug: "2026-05-26_07-netherlands-seizes-800-servers"
---

---
title: "荷兰查封 800 台服务器、逮捕 2 人：MIRhosting 与 Stark Industries 的制裁规避网络被打掉"
date: 2026-05-26
source: Hacker News
slug: netherlands-seizes-800-servers
---

## 事件背景

2026 年 5 月 18 日，荷兰金融犯罪调查机构 FIOD 在 Enschede、Almere 的 3 处办公点以及位于 Dronten 与 Schiphol-Rijk 的 2 个数据中心同时执法，查扣 **800 余台服务器**及大量笔记本、手机，并以"违反欧盟制裁法、向受制裁的俄罗斯实体提供基础设施"为由逮捕两人：

- **Andrey Nesterenko**，39 岁，俄罗斯出生，荷兰托管商 **MIRhosting** 创始人；
- **Youssef Zinad**，57 岁，居住于阿姆斯特丹。

由于查扣范围极广，被托管在这些服务器上的**客户数据已被宣告无法恢复**。Brian Krebs 在 5 月 25 日撰文披露了案件细节，相关报道在 Hacker News 上引发广泛讨论。

## 核心观点

案件背后是 **Stark Industries Solutions** 这家在俄乌战争爆发前 2 周突然成立的"防弹托管商"。它长期被用于针对欧洲的 DDoS 攻击和俄罗斯国家级网络行动，并于 2025 年 5 月被欧盟制裁。Stark 最初依赖两条上游链路：

1. 摩尔多瓦兄弟 Ivan 与 Yuri Neculiti 运营的 **PQHosting**（同样被制裁）；
2. Nesterenko 的 **MIRhosting**（当时未被制裁）。

制裁消息在正式公布前 2 周泄露，Stark 趁机把网络资产从 PQHosting 转移到了新成立的 **the[.]hosting**，其运营方是荷兰公司 **WorkTitans BV**——而 WorkTitans 由 Nesterenko 与 Zinad 控制，且唯一的上游链路就是 MIRhosting。检方认定，这是一场典型的**制裁规避操作**。

更具杀伤力的指控来自荷兰《de Volkskrant》：在 2025 年 11 月丹麦市政选举期间，WorkTitans 与 MIRhosting 是亲俄攻击丹麦政府机构时**使用最频繁的两个网络**。

MIRhosting 公开否认，称"初步调查未发现我们控制的服务被用于干预丹麦选举"，并暂停了对 WorkTitans 的服务。Nesterenko 也辩称硬件与客户在制裁公布前就已转移给 WorkTitans，"并非为了规避制裁"。但 Krebs 指出，Zinad 持有 @mirhosting.com 邮箱、在 Almere 办公点担任 MIRhosting 官方联系人，二人关系远比"B2B 承包商"更紧密。

## 社区热议

HN 讨论集中在几条线索上：

- **客户数据连坐**问题被反复提及——合法客户的业务因执法而蒸发，被称为"防弹托管的反噬效应"，也再次引发"服务器扣押时是否应做镜像而非物理拉走"的争论。
- 多名长期关注俄语托管生态的评论者指出，**Stark / PQHosting / MIRhosting** 的人员循环早已是公开秘密，2008 年俄格战争中托管 stopgeorgia.ru 的 Innovation IT Solutions 正是 Nesterenko 的母公司。
- 有人提醒：这是欧盟首次对**托管商上游**而非僵尸网络运营者本身的实质性打击，可能成为模板。

## 行业影响

- **欧盟制裁向"基础设施层"延伸**：以往制裁多瞄准最终攻击者，本案则把矛头对准提供 IP、机房和带宽的中间商，对欧洲所有 IaaS / 数据中心提出了更高的 KYC 要求。
- **"防弹托管"的庇护成本上升**：连锁清算和数据不可恢复的风险，会让 Stark 类客户更难找到愿意接盘的欧盟内部上游。
- **合规重构**：欧盟数据中心可能需要建立类似金融行业的"受益所有人 + 制裁名单"双重核查流程，并保留可被监管查询的接入日志。
- **地缘网络战格局**：丹麦选举攻击的归因再次表明，俄罗斯网络行动高度依赖西欧合法注册的基础设施，未来类似的跨境联合执法将更频繁。

## 链接

- 原文：https://krebsonsecurity.com/2026/05/netherlands-seizes-800-servers-arrests-2-for-aiding-cyberattacks/
- HN 讨论：https://news.ycombinator.com/item?id=48266906
