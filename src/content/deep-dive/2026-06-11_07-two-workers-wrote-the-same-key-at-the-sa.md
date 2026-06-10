---
title: "two-workers-wrote-the-same-key-at-the-sa"
date: "2026-06-11"
generated: "2026-06-11 07:00"
source: "Reddit"
slug: "2026-06-11_07-two-workers-wrote-the-same-key-at-the-sa"
---

---
title: "Two workers wrote the same key at the same moment. Both writes \"succeeded.\" One is gone."
date: "2026-06-11"
source: "Reddit"
category: "AI Agent"
slug: "two-workers-wrote-the-same-key-at-the-sa"
---

## 一、事件背景

在 r/AI_Agents 板块，用户 mrvladp 发表了一篇引发广泛讨论的技术贴，主题直指当下多 Agent 编排（multi-agent orchestration）系统里最棘手又最被低估的一类 bug——并行写入冲突导致的"幽灵成功"。帖子开篇就描绘了一个让无数实战派点头的场景：当你跑一个 orchestrator，让六个并行 worker 分别把结果写入一个共享 key（可能是 memory store、decisions 文档、plan 文件），运行结束后所有日志都显示 success，但某个 worker 的输出却凭空消失了。更让人头疼的是，这种事故第一反应往往是甩锅给模型——"它又幻觉了"——但作者一针见血地指出：根本不是模型的问题，是经典的分布式系统并发缺陷被搬到了 Agent 时代的舞台上。

## 二、核心观点

作者总结了两类典型失效模式。**失效一：concurrent lost update（并发丢写）**——planner 分派六个 worker 同时写同一把 key，最后一个 commit 的覆盖了前面所有人的修改，前 N-1 个 worker 的成果直接蒸发。**失效二：TOCTOU（time-of-check-to-time-of-use）窗口**——某个 worker 先读 constraint store 文件里的 epoch 号，确认匹配，再执行写入；但在"检查"和"持久化"之间，另一个 reclamation 流程已经把 epoch 号 bump 上去了，于是这次过时的写入仍然滑过守门人。作者强调，mutex / exclusive lock（他称之为 "write grant"）能解决大半问题，但不能孤立地用 check-then-write 模式，必须用 CAS（compare-and-swap）或带版本号的原子事务把检查和写入合并成单一不可分割的操作，否则锁就形同虚设。本质上，作者把数据库领域几十年前总结出的 ACID 经验重新搬回了 Agent 工程的视野。

## 三、社区热议与争议点

评论区围绕几条主线展开激烈讨论。第一类是"老酒新装派"，资深后端工程师指出这就是教科书级别的分布式一致性问题，吐槽 AI Agent 圈在重新发明 Paxos 和 Raft，建议直接上 Postgres 的 `SELECT FOR UPDATE` 或 Redis 的 `WATCH/MULTI/EXEC`，没必要造轮子。第二类是"架构反思派"，认为根源在于很多 Agent 框架默认让所有 worker 共享一个 mutable global state，本身就违反了并发安全设计原则；他们主张采用 event sourcing 或 CRDT（无冲突复制数据类型）让 worker 各自 append-only 写日志，再由 reducer 合并，从根上消除丢写。第三类是"实用派"，分享自己用 Temporal、Inngest、LangGraph checkpoint 之类成熟 workflow 引擎做事务保障的经验。少数评论质疑作者把锅推给"系统"是否过度——也有人反问：如果模型生成的 plan 本身就不可重入（non-idempotent），再强的锁也救不回来语义层的冲突。

## 四、行业影响与未来展望

这篇帖子的火爆折射出一个明显的转折信号：Agent 工程正从"prompt 调参玄学"快速过渡到"分布式系统硬功夫"。当 swarm、multi-agent、并行 sub-agent 成为主流范式后，过去被忽略的并发原语、事务隔离级别、幂等性设计正在成为 Agent 框架的核心竞争力。可以预见，未来一年里 LangGraph、CrewAI、AutoGen 等主流框架会陆续把 optimistic locking、versioned state、durable execution 作为标配；Temporal、Inngest 这类工作流引擎也会因为天然契合 Agent 长任务而获得新一波采用。对开发者而言，启示非常直接：写多 Agent 系统前先回炉补一遍《Designing Data-Intensive Applications》，把"我以为模型错了"这条直觉换成"先去翻日志看是不是有 race condition"。当 Agent 真正进入生产环境处理金额、订单、医疗等强一致性场景时，今天看似学术的 lost update 问题会演化为真金白银的损失。

## 五、附带链接

- 原帖：[Two workers wrote the same key at the same moment. Both writes "succeeded." One is gone.](https://www.reddit.com/r/AI_Agents/comments/1u26y3i/two_workers_wrote_the_same_key_at_the_same_moment/)
- 相关延伸阅读：[The Swarm Diaries: What Happens When You Let AI Agents Loose on a Codebase (Microsoft)](https://techcommunity.microsoft.com/blog/appsonazureblog/the-swarm-diaries-what-happens-when-you-let-ai-agents-loose-on-a-codebase/4501393)
- 子版块：[r/AI_Agents](https://www.reddit.com/r/AI_Agents/)
- 经典背景资料：CAS / Optimistic Concurrency Control、TOCTOU race condition、event sourcing 与 CRDT 在分布式系统中的实践
