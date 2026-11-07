---
title: "mbillow/localthings"
date: "2026-11-08"
generated: "2026-11-08 07:00"
source: "GitHub"
slug: "2026-11-08_07-localthings"
summary: "LocalThings 是面向 Home Assistant 的 HACS 自定义集成，让洗衣机、冰箱、空调、烤箱等三星家电走局域网控制，避开账号、云端往返与接口费用。README 自称“无需云账号”，但也明确：首台设备配置会向三星服务器读取一次公共标识，家电自身仍保留云连接；因此准确定位是“配置后的控制链路本地化”，而非让设备彻底离云。"
---

# mbillow/localthings

## 定位与痛点剖析
LocalThings 是面向 Home Assistant 的 HACS 自定义集成，让洗衣机、冰箱、空调、烤箱等三星家电走局域网控制，避开账号、云端往返与接口费用。README 自称“无需云账号”，但也明确：首台设备配置会向三星服务器读取一次公共标识，家电自身仍保留云连接；因此准确定位是“配置后的控制链路本地化”，而非让设备彻底离云。

## 核心架构与技术细节
源码显示其为 Python 3.13 项目，清单标记 `local_push`，依赖 `smartthings-local` 与 `cbor2`。`Transport` 把新机型的 CoAP/DTLS 与旧机型 TCP 8888 HTTPS 统一成读写接口；协调器用 OCF 资源发现、Observe 推送和三十秒轮询兜底，并处理 DHCP 换址、断线重连及离线快照恢复。声明式设备表再把厂商资源映射为 Home Assistant 实体，协议层与能力层由此解耦。

## 竞品对比与生态站位
Home Assistant 官方 SmartThings 集成覆盖设备与场景更广，但官方文档要求三星账号和手机应用，并说明接口已转付费；LocalThings 覆盖面更受型号、固件和凭据限制，却换来低延迟、本地数据与断网可用。`SmartThings-Local` 是其底层协议库兼 MQTT 示例，并非同等完整的原生集成；`ha-samsung-washer-local` 则只聚焦 8888 接口洗衣机，范围更窄。

## 开发者反馈与局限性
开放 issue #435 由维护者明确把 PSK 凭据获取留在集成之外：部分新机须先从其他途径取得密钥，现有文档路线甚至涉及已越狱或已 root 手机。issue #691 是多名用户对 B 系列电磁炉“无 DTLS 回应”的报告，尚不能上升为全部机型缺陷；issue #744 则报告 0.36.0 在特定微波炉状态下误判设备类型并删除声音开关。可见主要风险不是 Home Assistant 接口，而是三星固件、认证载体与型号能力碎片化。

## 附带链接
- [GitHub 仓库](https://github.com/mbillow/localthings)
- [凭据获取文档](https://github.com/mbillow/localthings/blob/main/docs/credential-acquisition.md)
- [PSK 架构 issue #435](https://github.com/mbillow/localthings/issues/435)
- [电磁炉 issue #691](https://github.com/mbillow/localthings/issues/691)
- [微波炉 issue #744](https://github.com/mbillow/localthings/issues/744)
- [Home Assistant SmartThings](https://www.home-assistant.io/integrations/smartthings)
- [SmartThings-Local](https://github.com/QuiteYellow/SmartThings-Local)
- [ha-samsung-washer-local](https://github.com/perseus177/ha-samsung-washer-local)
