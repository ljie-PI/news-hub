---
title: "free-job-postings-api"
date: "2026-06-08"
generated: "2026-06-08 07:00"
source: "PH"
slug: "2026-06-08_07-free-job-postings-api"
---

---
title: "深度解读：Job Postings API——一个免费聚合 180 万 + 美国职位的统一接口"
date: "2026-06-08"
generated: "2026-06-08 07:00"
source: "ProductHunt"
slug: "free-job-postings-api"
category: "deep_dive"
---

## 一、产品背景 / 发布背景

Job Postings API 由 Sam Crombie 推出，归属 bluedoor.sh 平台，发布当天位列 Product Hunt #4，收获 159 upvotes、238 followers。它瞄准开发者长期痛点：想做"求职 / 招聘趋势 / 销售线索"产品，第一步就要爬 LinkedIn、Indeed，然后每月被反爬规则打一次。Bluedoor 把 **30+ 主流 ATS（申请人追踪系统）** 的招聘数据聚合成一套统一 schema，目前覆盖 **180 万 + 在招职位、6 万 + 公司**，并完全免费提供（邮箱注册换 API Key）。默认速率 100 RPS / 500 burst，可申请提额。

## 二、产品机制 / 核心功能

数据来源是 30+ ATS 的公开职位流，**每日同步一次**——并非实时，但符合企业实际"发布与下架"的节律，对市场分析够用，对实时求职应用够及格。**历史与失效职位也会保留**，可回溯查询，让趋势分析、薪资走势、招聘周期建模成为可能。归一化目前只做高层级（公司名、职位等），细粒度对齐（职级、雇佣类型）留给消费者的 AI / 业务系统处理，Sam 表示未来会内化。字段覆盖：薪资数据在 ATS 间差异较大，结构化 + 描述文本解析合计 ~50%+ 覆盖；远程政策（onsite / remote / hybrid）跨 ATS 一致性较好。

## 三、社区反馈与争议点

讨论集中在三件事。一是**新鲜度**：Ansari Adin 指出"职位寿命短，三天前在招的可能早就被填或撤了"，每日同步对真正的实时求职是临界点。二是**归一化深度**：Habib Ferdous 直言"30+ ATS = 30+ 种表达职级和雇佣类型的方式，缺乏强意见的归一化只是把清洗问题推给下游"。三是**生态价值**：David Marko 称"统一 ATS 访问是被大众低估的部分，任何做过求职数据副业的人都知道每月修一次爬虫的痛苦——免费档对早期开发者是强信号"。

## 四、行业影响与未来展望

这一产品体现 AI 时代"数据基础设施免费化、归一化能力商业化"的新打法：先用免费 + 高额度建立开发者心智，再在 normalization、enrichment、实时性上往上叠收费层。对 jobdataapi.com、ScrapIn、ByteBricks 等竞品形成定价压力，也可能催生一批基于 LLM 做职位语义检索、薪资预测、人才情报的 AI 原生应用。未来若叠加实时 webhook、跨国覆盖、AI 字段归一化，有机会成为招聘领域的"Plaid"。

## 五、附带链接

- Product Hunt：https://www.producthunt.com/products/free-job-postings-api
- 官网：https://bluedoor.sh/apis/job-postings
