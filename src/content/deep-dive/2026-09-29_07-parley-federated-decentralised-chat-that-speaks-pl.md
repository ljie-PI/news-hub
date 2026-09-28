---
title: "Parley: Federated, decentralised chat that speaks plain IRC"
date: "2026-09-29"
generated: "2026-09-29 07:00"
source: "HN"
slug: "2026-09-29_07-parley-federated-decentralised-chat-that-speaks-pl"
summary: "Parley把按域名自治的联邦聊天藏在普通IRC客户端之后。用户以`alice@foo.com`标识，无需插件即可跨实例私聊或加入共享频道。项目可完整演示并有真实实例，但仍是未经审计、协议变动中的概念验证。候选冻结热度为286 points/146 comments；调研刷新Algolia取得100个可见节点并触及上限，两者不可互换。"
---

# Parley: Federated, decentralised chat that speaks plain IRC

## 事件背景
Parley把按域名自治的联邦聊天藏在普通IRC客户端之后。用户以`alice@foo.com`标识，无需插件即可跨实例私聊或加入共享频道。项目可完整演示并有真实实例，但仍是未经审计、协议变动中的概念验证。候选冻结热度为286 points/146 comments；调研刷新Algolia取得100个可见节点并触及上限，两者不可互换。

## 核心观点 / 产品机制
实例先查DNS SRV记录，再取well-known文档中的端点与Ed25519公钥；消息成为签名JSON事件，经HTTPS投递，接收方发现密钥并校验来源。陌生实例握手后交换频道快照与节点，形成网状连接；`#`频道跨站复制，`&`频道仅留本地，SQLite保存历史并补取掉线消息。优势是复用成熟客户端；代价是按域信任：用户无独立密钥和端到端加密，运营者可读消息，全局历史也会复制。

## 社区热议与争议点
支持面上，oooyay称IRC开放、耐久、演进慢，正适合作稳定前端；singpolyma3也指出后端实际是HTTP加JSON，IRC只是可替换界面。限制面有三个具体追问：altilunium问普通人能否免自托管，提交者davidcollantes答复仍须找到实例并获账号；myaccountonhn担心垃圾信息，提交者只给出封禁用户或整站的办法；Conlectus认为它像规格不足的“半个XMPP”，质疑重复造协议。由此看，低客户端门槛并未消除服务发现、公共实例、滥用治理和既有生态兼容成本。

## 行业影响与未来展望
Parley示范保留旧客户端，把身份、同步与联邦放到服务端。若补齐版本协商、兼容测试、安全审计和细粒度治理，它可能成为轻量自托管方案；若缺少公共实例、互操作生态与端到端加密，则更可能停留在可信小社群。其价值未必是替代Matrix或XMPP，而是检验“旧客户端、新联邦后端”能否降低迁移成本。

## 附带链接
- [项目仓库](https://git.mills.io/prologic/parley)
- [协议文档](https://git.mills.io/prologic/parley/src/branch/main/docs/PROTOCOL.md)
- [认证文档](https://git.mills.io/prologic/parley/src/branch/main/docs/AUTH.md)
- [安全边界](https://git.mills.io/prologic/parley/src/branch/main/SECURITY.md)
- [Hacker News讨论](https://news.ycombinator.com/item?id=49875913)
