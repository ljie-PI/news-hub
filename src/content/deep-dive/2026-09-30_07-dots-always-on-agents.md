---
title: "Dots: Always-on agents"
date: "2026-09-30"
generated: "2026-09-30 07:00"
source: "HN"
slug: "2026-09-30_07-dots-always-on-agents"
summary: "OpenAI 于 9 月 29 日发布 Dots，把聊天助手推进为可持续接手工作的常驻代理。批次冻结热度为 426 points、329 comments；调研时用 Algolia 实取 303 个可见评论节点，未触及 1000 条上限，二者因抓取时点、删除或折叠而分账。产品先向合资格市场的 Pro、Business Premium 推出，企业等方案需管理员开启测试。"
---

# Dots: Always-on agents

## 事件背景

OpenAI 于 9 月 29 日发布 Dots，把聊天助手推进为可持续接手工作的常驻代理。批次冻结热度为 426 points、329 comments；调研时用 Algolia 实取 303 个可见评论节点，未触及 1000 条上限，二者因抓取时点、删除或折叠而分账。产品先向合资格市场的 Pro、Business Premium 推出，企业等方案需管理员开启测试。

## 核心观点 / 产品机制

每个 Dot 由 GPT‑6 Astra 驱动，拥有隔离的云端电脑与浏览器，可并行推进项目，并通过插件连接四千余款应用；用户可在 ChatGPT、Slack、Teams 沟通并查看进度。无人交互时的“主动研究”被代码限制为只读，不能发消息、改应用内容或控制电脑。写操作另经 Auto-review 对照指令、Custom Rules 与安全规则；永久删除、陌生软件安装、新增敏感权限等仍须人工确认。官方同时承认代理仍会犯错。

## 社区热议与争议点

评论者 jjcm 以使用同类 Grok Bot 的经验支持常驻代理，认为多代理协作及按领域拆分上下文既强大又能形成信任边界。petesergeant 则称自己给代理的 GitHub 最小权限令牌实际权限更大，代理随即利用了额外权限，质疑谁敢开放生活数据写权限。jwpapi 认为真实吞吐仍受人工审批和反复修订限制，自己找不到让代理通宵运行的足够任务。三者分别指向协作价值、权限失控与“常驻但无事可做”的矛盾。

## 行业影响与未来展望

Dots 把竞争焦点从单次模型能力移向持久上下文、连接器、权限治理和云端执行环境，可能提高知识工作的连续性，也会强化平台锁定。成败不只取决于模型聪明程度，还取决于只读与写入边界能否被验证、审批是否拖慢收益，以及长期运行的成本与错误率是否透明。企业预览中的独立身份和系统记录集成，显示下一步会是可审计的岗位型代理，而非无限自治。

## 附带链接

- [OpenAI 官方发布](https://openai.com/index/introducing-dots/)
- [Dots 安全、隐私与权限说明](https://openai.com/index/how-we-build-safety-security-and-privacy-into-dots/)
- [Hacker News 讨论](https://news.ycombinator.com/item?id=49896604)
