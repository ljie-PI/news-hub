---
title: "simplex-chat"
date: "2026-06-29"
generated: "2026-06-29 07:00"
source: "GitHub"
slug: "2026-06-29_07-simplex-chat"
summary: "SimpleX Chat 自称\"全球首个无任何用户标识符的通讯网络\",约 1.49 万 stars、864 forks,以 Haskell 实现。主流私密通讯软件痛点在于身份依赖:Signal 需手机号,Sessio"
---

# simplex-chat

## 1. 定位与痛点
SimpleX Chat 自称"全球首个无任何用户标识符的通讯网络",约 1.49 万 stars、864 forks,以 Haskell 实现。主流私密通讯软件痛点在于身份依赖:Signal 需手机号,Session、Matrix、Cwtch 即便匿名也分配了随机用户 ID 或身份密钥。只要存在持久标识,服务方或观察者就能绘制社交图谱,进而去匿名化。SimpleX 连随机数都不分配,从根本上隐藏"谁在何时与谁通信"的元数据,目标是 100% 隐私且零身份。

## 2. 核心架构与技术细节
采用客户端—服务器架构,但用冗余、可丢弃的中继节点经单向(simplex)队列异步转发消息。核心是 SMP(SimpleX Messaging Protocol):每对连接用两条单向队列、成对队列标识符(iOS 推送可加第三地址),n 个用户最多产生 n×(n-1) 条队列,极难还原图谱。SMP 服务器仅用内存存储,投递后即删,服务器间互不通信、无用户记录,仅客户端持有联系人信息。加密上叠加 Signal 双棘轮端到端加密、NaCL cryptobox 额外层,并在每步棘轮引入抗量子密钥交换;支持 Tor、XFTP 大文件传输,已通过 Trail of Bits 审计。

## 3. 竞品对比
相较 Signal,SimpleX 免手机号、无中心服务器;相较 Session/Matrix/Ricochet,后者仍靠匿名身份投递,SimpleX 完全无全局标识。相较 P2P 网络,因无全局参与者标识,元数据保护更强且避开 P2P 缺陷;相较联邦网络,节点不互联、不留存,规避元数据可见性。

## 4. 开发者反馈与局限
被 Privacy Guides、Whonix 推荐,口碑佳。但约 1148 个 open issues 反映成熟度待提升:队列尚需手动轮换、缺自动轮换;大群组稳定性与公共频道仍在建设;耗电与流量偏高;服务器可用性依赖运营方,新用户上手体验较陡。

## 5. 附带链接
- 仓库: https://github.com/simplex-chat/simplex-chat
- SMP 协议: https://github.com/simplex-chat/simplexmq
- 官网: https://simplex.chat
