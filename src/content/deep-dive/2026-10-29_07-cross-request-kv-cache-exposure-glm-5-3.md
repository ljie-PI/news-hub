---
title: "Cross-request KV cache exposure in the GLM-5.3 Workers AI model (155 responses)"
date: "2026-10-29"
generated: "2026-10-29 07:00"
source: "HN"
slug: "2026-10-29_07-cross-request-kv-cache-exposure-glm-5-3"
summary: "Cloudflare披露，8月27日至9月9日，Workers AI 的 `@cf/zai-org/glm-5.3` 有155个响应夹带较早客户请求的数据，均由超过681,280词元的提示触发。研究员 Gadi Evron 报告后，平台下线、修正配置后同日恢复；官方称未发现蓄意利用，其他模型未受影响。本批冻结热度为181分、79条评论；调研时 Algolia 实取69个可见节点。标题中的155是受影响响应数，不是评论数。"
---

# Cross-request KV cache exposure in the GLM-5.3 Workers AI model (155 responses)

## 事件背景

Cloudflare披露，8月27日至9月9日，Workers AI 的 `@cf/zai-org/glm-5.3` 有155个响应夹带较早客户请求的数据，均由超过681,280词元的提示触发。研究员 Gadi Evron 报告后，平台下线、修正配置后同日恢复；官方称未发现蓄意利用，其他模型未受影响。本批冻结热度为181分、79条评论；调研时 Algolia 实取69个可见节点。标题中的155是受影响响应数，不是评论数。

## 核心观点 / 产品机制

端点允许1,048,576词元，但预填充 GPU 的 KV 池仅容纳681,280词元。SGLang 分离式预填充/解码路径把超容量请求标为拒绝并换成单词元占位，却仍视为存活：解码端预留整段页面，预填充端经 Mooncake/RDMA 只写入一页便报告完成，注意力遂读取未被覆盖的旧页面。修复将池扩至约204万词元，并让拒绝请求在引导、分配和传输前退出；上游补丁还校验传输数量，官方建议升级至0.5.22以上。

## 社区热议与争议点

支持面上，kami23称赞复盘承认测试缺口且迅速停服。质疑面上，Graziano_M指出只看成功状态可能把已泄露但连贯的输出当成通过，这与官方承认未检查输出一致。jacquesm认为标题会把平台配置问题归咎于模型；Cloudflare作者 kflansburg回应，列模型名是为标明受影响端点。alxsm则担心百万词元提示可能含仓库、配置或密钥，并追问客户通知；这是风险推测，复盘未披露泄露内容。

## 行业影响与未来展望

事件说明共享且不清零的缓存页并非天然漏洞，安全边界是所有权、生命周期和跨节点状态一致性。部署方应把容量断言、拒绝路径、延迟释放与传输完整性纳入上线闸门，而非仅验HTTP成功。Cloudflare称页标签原型开销低于1%，但因可靠性问题已停用；形式化验证仍属计划，不是既成保障。

## 附带链接

- [Cloudflare一手复盘](https://blog.cloudflare.com/kv-cache-exposure-remediation/)
- [SGLang协同披露](https://www.lmsys.org/blog/2026-10-26-cf-security/)
- [Hacker News讨论](https://news.ycombinator.com/item?id=50252159)
- [SGLang拒绝路径补丁](https://github.com/sgl-project/sglang/pull/38935)
