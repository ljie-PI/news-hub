---
title: "Devs shipping AI agents what does your security testing look like ?"
date: "2026-07-08"
generated: "2026-07-08 07:00"
source: "Reddit"
slug: "2026-07-08_07-devs-shipping-ai-agents-what-does-your-security-te"
summary: "一位在过去几个月里专注构建 AI agent 安全测试工具的开发者发帖，指出一个普遍现象：多数团队把 agent 搭出来后，只测准确率和幻觉，却几乎不测提示"
---

# Devs shipping AI agents what does your security testing look like ?

## 事件背景
一位在过去几个月里专注构建 AI agent 安全测试工具的开发者发帖，指出一个普遍现象：多数团队把 agent 搭出来后，只测准确率和幻觉，却几乎不测提示注入、系统提示词提取、数据外泄等安全维度，往往等到生产环境被攻破才发现问题。他坦言自己最初也天真地以为"底层大模型足够聪明、能自己扛住攻击"，并把这当成了全部的安全方案。

## 核心观点 / 产品机制
帖子的核心主张是：agent 的安全性不能寄希望于模型自身的智能，必须在上线前主动做对抗性测试。作者把攻击面拆成几类典型场景——prompt injection（通过用户输入劫持指令）、system prompt extraction（诱导模型吐出系统提示词）、data exfiltration（借工具调用把敏感数据带出）。他向社区发问：你们在发布前是否针对恶意输入做测试？如果做，具体流程是怎样的？

## 社区热议与争议点
这类话题在社区里长期存在两派对立。支持系统化红队测试的一派认为，agent 一旦接入工具、数据库和外部接口，攻击面就远超普通聊天机器人，必须像传统渗透测试那样引入自动化对抗样本、边界护栏和输出过滤，并以 OWASP LLM Top 10 作为基线。另一派则担心过度工程，认为对多数内部或低风险场景而言，搭建完整红队流水线性价比不高，靠输入校验、最小权限和人工审查即可覆盖，安全投入应与业务风险等级相匹配。

## 行业影响与未来展望
随着 agent 从演示走向生产，安全测试正从"可选项"变为"必选项"。可以预见，针对大模型的自动化红队工具、护栏框架与合规基线会加速成熟，甚至像单元测试一样被纳入发布流水线。长远看，谁能把安全左移、把对抗测试标准化，谁就更可能赢得企业级信任与规模化落地的门票。

## 附带链接
- 原帖：https://www.reddit.com/r/artificial/comments/1uq7qfl/devs_shipping_ai_agents_what_does_your_security/
