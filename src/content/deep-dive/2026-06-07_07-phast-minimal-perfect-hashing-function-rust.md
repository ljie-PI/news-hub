---
title: "phast-minimal-perfect-hashing-function-rust"
date: "2026-06-07"
generated: "2026-06-07 07:00"
source: "Reddit"
slug: "2026-06-07_07-phast-minimal-perfect-hashing-function-rust"
---

---
title: "announcing PHast - fast to evaluate, minimal perfect hashing function"
date: "2026-06-07"
source: "Reddit"
category: "编程语言"
subreddit: "rust"
slug: "phast-minimal-perfect-hashing-function-rust"
url: "https://www.reddit.com/r/rust/comments/1tytdyv/announcing_phast_fast_to_evaluate_minimal_perfect/"
---

## 1. 事件背景

r/rust 上,BSuccinct 项目作者 Piotr Beling 宣布:Rust 的 `ph` crate 中新加入了一个名为 **PHast(Perfect Hashing made fast)**的最小完美哈希函数(MPHF)实现。论文 [arXiv:2504.17918](https://arxiv.org/abs/2504.17918) 同步发布,已被 SIAM ALENEX26 接收。最小完美哈希这种"老派"数据结构在 Rust 社区不算热门话题,但因为其在数据库、编译器符号表、键值存储索引中的关键地位,这次更新立刻吸引到性能党的注意。

## 2. 核心观点 / 产品机制

MPHF 的定义是:为一组 key 提供一个唯一的、连续的、零冲突整数编号 `0..n-1`,通常用极少的位数表示。PHast 的两大卖点:① **每次评估平均仅 1.01 次 cache miss**——几乎是访问哈希表的理论下界,意味着查表速度接近"一次内存访问",非常贴近 L3 友好的工作负载;② **每个 key 仅约 1.9 bits 的存储**,逼近 MPHF 理论下界 1.44 bits/key。配合 Rust 的零成本抽象与 SIMD,PHast 在大规模(10⁹ 级)key 上的构建与查询都比经典 BBHash、PTHash 等更快,并保持极小内存占用。整个 BSuccinct 项目本质是一套用 Rust 写的"succinct data structures"工具箱,目标对标 C++ 老牌项目 sdsl-lite。

## 3. 社区热议与争议点

- **正面 A(性能数据漂亮)**:高赞回复称"1.01 cache miss 是真神仙数字",有人立刻贴出自己 KV 引擎里用 boomphf 时的瓶颈,准备迁移过来。
- **正面 B(论文 + 代码同步)**:研究背景受好评——开源项目少有同时配学术论文与可复现 benchmark 的,作者还提供了 Rust crate `ph`,降低尝鲜成本。
- **质疑 A(适用场景)**:也有人指出 MPHF 只对**只读、键集固定**的场景有意义,任何插入/删除都得整体重建,意味着它替代不了 HashMap,只是补充。
- **质疑 B(构建时间 vs 查询时间)**:有评论翻论文后提出,虽然查询只需 1.01 cache miss,但构建过程在亿级 key 上仍要数十秒,有热数据动态变化的场景不如 cuckoo / robin hood 实用。还有人吐槽 API 文档偏学术,普通 Rust 用户上手成本高。

## 4. 行业影响与未来展望

PHast 不会改变日常 Rust 应用的写法,但在三类场景能直接带来性能跃迁:**编译器符号表、向量数据库的 ID 索引层、静态语料服务(如词典/搜索引擎反向索引)**。结合 Rust 在系统编程领域的进一步渗透,BSuccinct 有望成为继 `fst`、`roaring` 之后又一个被广泛 reuse 的底层 crate。未来可关注:① `ph` 是否会被 tantivy、qdrant 等明星项目采纳;② 是否会出现 GPU/SIMD 加速的 PHast+ 变体。

## 5. 附带链接

- Reddit 原帖:https://www.reddit.com/r/rust/comments/1tytdyv/announcing_phast_fast_to_evaluate_minimal_perfect/
- 论文 (arXiv 2504.17918):https://arxiv.org/abs/2504.17918
- ph crate:https://crates.io/crates/ph
- BSuccinct 论文(SoftwareX):https://www.sciencedirect.com/science/article/pii/S2352711024000529
