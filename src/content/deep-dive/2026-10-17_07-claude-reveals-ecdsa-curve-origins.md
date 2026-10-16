---
title: "Claude reveals ECDSA curve origins"
date: "2026-10-17"
generated: "2026-10-17 07:00"
source: "HN"
slug: "2026-10-17_07-claude-reveals-ecdsa-curve-origins"
summary: "NIST于2000年在FIPS 186-2中标准化多条ECDSA曲线，却未解释NSA提供的种子如何产生；Dual_EC_DRBG往事又放大了“参数暗藏后门”的猜疑。2026年10月，Anthropic公布Claude追溯结果。本批冻结为544 points、234 comments，勿与动态接口混用。"
---

# Claude reveals ECDSA curve origins

## 事件背景

NIST于2000年在FIPS 186-2中标准化多条ECDSA曲线，却未解释NSA提供的种子如何产生；Dual_EC_DRBG往事又放大了“参数暗藏后门”的猜疑。2026年10月，Anthropic公布Claude追溯结果。本批冻结为544 points、234 comments，勿与动态接口混用。

## 核心观点 / 产品机制

内部研究模型没有沿用“幽默短语经哈希”的旧线索，而是假设生成程序调用九十年代C库伪随机数。它扫描34种生成器与输出切片组合，从部分种子的最高位恒为零识别出`lrand48`，再用穷举和LLL格基约简恢复被截断的48位状态，并逆推到`srand48`的初始化形态。十条素数曲线种子对应1997至1998年的Unix时间戳，四条二进制曲线亦复现；原文附验证代码。但B-163、四条较新素数曲线的基点来源，以及为何跳过少量合格候选，仍未解释。

## 社区热议与争议点

调研时Algolia实际取得100个可见节点并触及本次上限，不应用它覆盖冻结口径。tptacek认为熟悉椭圆曲线研究者本就不信种子后门，但直接证据终于能终结低效争论；EGreg则看好P-256在区块链验签中的采用阻力下降。反方焦点转向能力分配：slowin担忧内部模型能做而公众会被安全过滤，形成研究鸿沟；Retr0id以亲历反驳绝对化说法——他曾用Claude尝试同一任务，未被阻止，只是没有成功。

## 行业影响与未来展望

这不是密码破解，也无需迁移现有系统；其价值是把参数谱系变成可复算证据，并展示模型把历史线索、代码搜索与格算法串成研究流程。尚存缺口提醒业界：结果提高可信度，却不是对全部参数来源的证明。未来标准应同时公开生成算法、原始输入、筛选规则和可重复脚本，避免安全性争论再次依赖个人记忆。

## 附带链接

- [Hacker News 原帖](https://news.ycombinator.com/item?id=50122800)
- [Anthropic 原文与复现代码](https://www.anthropic.com/research/ecdsa-curve-origins)
- [NIST FIPS 186-2](https://csrc.nist.gov/files/pubs/fips/186-2/final/docs/fips186-2.pdf)
- [Koblitz 与 Menezes：A Riddle Wrapped in an Enigma](https://eprint.iacr.org/2015/1018.pdf)
- [NIST 椭圆曲线种子悬赏背景](https://words.filippo.io/seeds-bounty/)
