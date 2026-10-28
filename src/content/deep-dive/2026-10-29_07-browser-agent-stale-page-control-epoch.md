---
title: "Browser agent stale-page control epoch"
date: "2026-10-29"
generated: "2026-10-29 07:00"
source: "Reddit"
slug: "2026-10-29_07-browser-agent-stale-page-control-epoch"
summary: "OyaAI 描述人与代理共用标签页时的竞态：代理读取节点后，弹窗、接管或导航已改变页面，旧点击可能命中错误对象。重抓逐帖 Atom 后身份与标题匹配，现为十七条：主帖一、机器人一、作者回复六、普通用户九（含一条已删除），比冻结清单多一条。"
---

# Browser agent stale-page control epoch

## 事件背景

OyaAI 描述人与代理共用标签页时的竞态：代理读取节点后，弹窗、接管或导航已改变页面，旧点击可能命中错误对象。重抓逐帖 Atom 后身份与标题匹配，现为十七条：主帖一、机器人一、作者回复六、普通用户九（含一条已删除），比冻结清单多一条。

## 核心观点 / 产品机制

公开仓库确认 Mars 仍是独立开发中的 Rust 浏览器，并未接入现有 Electron 产品。每次变更入队时捕获含 owner、epoch、tab_id 的 Permit；人工接管会递增标签页 epoch。代理还须提交 control_epoch、page_id、node_id 与 expected_revision，发布前在同一短锁内复核标签身份和 owner epoch，再原子提交。修订不符返回 revision_conflict，导航后旧身份返回 invalid_target；page_diff 保留最近八次修订，供代理按差异重试。批处理逐步提交，接管会阻止下一步，却不回滚已完成动作。

## 社区热议与争议点

Minute-Carpenter9197 支持把修订校验下沉引擎，认为胜过冻结人工输入或侥幸相信页面未变。Fit-Fennel-7729 给出 CDP 实践：动作前重抓快照、合并填表提交、回读效果；作者回复明确承认已发出的 POST 无法撤销，这是作者口径。ZinchaDEV 质疑计数器会制造无关冲突；作者称当前按整页递增，以八版差异缓解，仍属作者口径。FieldNotesSportsAI 指出服务器端价格、库存或收件人变化不一定改变页面，浏览器修订无法替代业务状态版本。

## 行业影响与未来展望

该设计把代理并发化作乐观并发控制：模型重规划，引擎拒绝过期写，优于仅靠提示词。代价是整页修订增加往返和词元；部分提交、不可撤销请求及站外状态仍需幂等键、业务版本与人工确认。项目目前仅支持 macOS，网格、SVG、脚本模块仍缺，性能目标未证明，宜视作设计样本而非通用成品。

## 附带链接

- [Reddit 原帖](https://www.reddit.com/r/AI_Agents/comments/1xhx5bl/how_do_you_stop_a_browser_agent_from_acting_on_a/)
- [OyadotAI/oya-browser](https://github.com/OyadotAI/oya-browser)
- [Mars 架构文档](https://github.com/OyadotAI/oya-browser/blob/main/mars/ARCHITECTURE.md)
- [owner epoch 与 Permit 实现](https://github.com/OyadotAI/oya-browser/blob/main/mars/src/runtime/authority.rs)
- [代理工具与 revision 规则](https://github.com/OyadotAI/oya-browser/blob/main/mars/docs/agent-tools.md)
