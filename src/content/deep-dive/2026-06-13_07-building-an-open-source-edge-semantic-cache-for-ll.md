---
title: "Edge Semantic Cache for LLMs:把语义缓存推到 PoP 边缘,24 小时省 35% Token"
date: "2026-06-13"
generated: "2026-06-13 07:00"
source: "Reddit"
slug: "2026-06-13_07-building-an-open-source-edge-semantic-cache-for-ll"
summary: "r/MachineLearning 用户 Real-Huckleberry-934 在 6 月 12 日发帖,介绍一个筹备中的开源项目:面向 LLM 网关的 **Edge Semantic Cache**,用 Rust 写、编译到 WASM,部署到 Cloudflar"
---

---
title: "Building an Open Source Edge Semantic Cache for LLMs in Rust/WASM 深度解读"
date: "2026-06-13"
generated: "2026-06-13 07:00"
source: "Reddit"
slug: "building-an-open-source-edge-semantic-cache-for-ll"
---

# Edge Semantic Cache for LLMs:把语义缓存推到 PoP 边缘,24 小时省 35% Token

## 1. 事件背景

r/MachineLearning 用户 Real-Huckleberry-934 在 6 月 12 日发帖,介绍一个筹备中的开源项目:面向 LLM 网关的 **Edge Semantic Cache**,用 Rust 写、编译到 WASM,部署到 Cloudflare Workers。痛点是 Python 网关(LiteLLM、Helicone)对流式 agent 延迟过高,集中式 GPTCache+Milvus 又有跨区 RTT。作者贴出 24 小时 beta 数据,声称省下 35% token,求架构"狠批"。

## 2. 核心观点 / 产品机制

三层架构:边缘 Worker 内嵌 WASM 模块跑量化版 MiniLM/BGE-small 算 embedding,本地 HNSW(`hnsw_rs`)做近邻检索;未命中再回源到中心向量库;最后才落到上游 LLM。比较 cosine 相似度(阈值 0.78–0.92),换种说法的同义问题也能命中。Rust/WASM 卖点是冷启动 <5ms、内存百级 KB,可在 300+ PoP 就近返回,避开 Python GIL 与跨区 RTT。相对 GPTCache 的差异在**部署形态**而非算法。

## 3. 社区热议与争议点

评论主线有三:一是质疑"35% 节省"的统计口径,要求公开阈值与 false positive 率——SAFE-CACHE 论文已指出 GPTCache 单 embedding 方案对对抗性改写脆弱,把"北京天气"与"上海天气"误判同义会出业务事故。二是提醒 Anthropic prompt caching 已能打 9 折、OpenAI 默认 5 折,前缀重复场景下应用层语义缓存边际收益锐减。三是 WASM 跑 embedding 的可行性:Workers 50ms CPU 与 128MB 内存约束明显,有人建议改 WASI+WebGPU 或让 PoP 只做 routing、把 embedding 卸到 Workers AI。

## 4. 行业影响与未来展望

语义缓存正成多层成本治理一环:provider 侧 prefix cache 负责 KV 复用,应用侧负责问题级去重,边缘语义缓存把这层下沉到最近 PoP。Rust/WASM 若能平衡准确率与冷启动,有望成 Cloudflare AI Gateway 的开源对照组,推 LLM 推理进入 CDN 化时代。

## 5. 附带链接

- [Reddit 讨论](https://www.reddit.com/r/MachineLearning/comments/1u3quwk/building_an_open_source_edge_semantic_cache_for/)
- [GPTCache 仓库](https://github.com/zilliztech/gptcache)
- [Cloudflare Workers AI Prompt Caching](https://developers.cloudflare.com/workers-ai/features/prompt-caching)
- [SAFE-CACHE 论文](https://www.nature.com/articles/s41598-026-36721-w)
