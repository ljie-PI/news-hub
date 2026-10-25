---
title: "An AI agent hit my site, read a note hidden from humans, and did exactly what it said 61 minutes later"
date: "2026-10-26"
generated: "2026-10-26 07:00"
source: "Reddit"
slug: "2026-10-26_07-ai-agent-hidden-note-61-minutes"
summary: "冻结raw确认帖子ID为1xfddh7、作者KnowledgeOk7634。逐帖Atom复核标题并取得37个条目：一个完整主帖及36条当时可见评论。作者称，十月二十四日06:42 UTC有访客打开被robots.txt列为禁止抓取、含隐藏口令的诱饵页；07:43另一IP以iPhone用户代理访问回报地址，并携带该口令。"
---

# An AI agent hit my site, read a note hidden from humans, and did exactly what it said 61 minutes later

## 事件背景

冻结raw确认帖子ID为1xfddh7、作者KnowledgeOk7634。逐帖Atom复核标题并取得37个条目：一个完整主帖及36条当时可见评论。作者称，十月二十四日06:42 UTC有访客打开被robots.txt列为禁止抓取、含隐藏口令的诱饵页；07:43另一IP以iPhone用户代理访问回报地址，并携带该口令。

## 核心观点 / 产品机制

这可作为“网页文本被读取后触发后续请求”的相关性线索，却不能证实未知访问者就是AI代理，更不能证明两次请求属于同一任务链。IP、时间间隔、用户代理均可变化或伪装；帖子未公开可独立复核的原始日志、代理身份或受控复现实验。OWASP把模型从网页等外部来源读入并误当指令称为间接提示注入；RFC 9309同时明确robots.txt不是访问授权机制。

## 社区热议与争议点

普通用户fireduck支持风险判断，以SQL参数化对比模型难分“数据与指令”；SpanglerBQ反驳“服从无害口令就会服从有害口令”并无证明；horrificammonia质疑这是为工具造势。作者回复承认推广自家扫描器，称日志真实，并建议网页文本只作数据、调用工具前另设检查。支持与质疑都仍基于作者叙述。

## 行业影响与未来展望

工程重点应从猜测代理品牌转向可审计控制：标记外部内容为不可信，限制工具权限，对外发请求或敏感动作二次确认，并保存可复现日志。爬虫身份也不应仅凭UA；Google官方以UA、来源IP和反向DNS组合核验。此帖适合作为蜜罐告警案例，不足以成为特定代理越权的归因报告。

## 附带链接

- [Reddit原帖](https://www.reddit.com/r/AI_Agents/comments/1xfddh7/an_ai_agent_hit_my_site_read_a_note_hidden_from/)
- [逐帖Atom](https://www.reddit.com/r/AI_Agents/comments/1xfddh7/an_ai_agent_hit_my_site_read_a_note_hidden_from/.rss)
- [OWASP提示注入说明](https://genai.owasp.org/llmrisk/llm01-prompt-injection/)
- [RFC 9309](https://www.rfc-editor.org/rfc/rfc9309.html)
- [Google爬虫身份核验](https://developers.google.com/crawling/docs/crawlers-fetchers/overview-google-crawlers)
