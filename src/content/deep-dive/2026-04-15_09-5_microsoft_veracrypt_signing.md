---
title: "Microsoft 终止了 VeraCrypt 用于签名 Windows 驱动的账户"
date: "2026-04-15"
source: "HN"
slug: "2026-04-15_09-5_microsoft_veracrypt_signing"
summary: "**得分：1293 | 评论：500 | 作者：super256**"
---

# Microsoft 终止了 VeraCrypt 用于签名 Windows 驱动的账户

**得分：1293 | 评论：500 | 作者：super256**

---

## 事件背景

VeraCrypt——开源全磁盘加密工具，是已停止维护的 TrueCrypt 的继承者——在其 SourceForge 社区论坛发帖称，微软突然终止了他们用于签署 Windows 驱动程序的 EV 代码签名账户，且未给出明确解释。由于 Windows 要求内核级驱动必须有有效的数字签名，这一变化意味着 VeraCrypt 在 Windows 上的新版本驱动将无法正常安装，直接威胁到数百万用户的数据安全工具可用性。此事在 HN 上获得 1293 分和 500 条评论。

---

## 核心观点 / 产品机制

Windows 驱动签名机制要求：任何运行在 Windows 内核态的驱动程序必须持有经微软认可的有效 EV（Extended Validation）代码签名证书。如果账户被吊销或终止，已有版本的驱动仍可运行，但无法发布新的已签名驱动，新安装或更新将失败。

VeraCrypt 的情况：
- 他们的 EV 签名账户被微软单方面终止
- 原因未明确告知（微软的说法含糊）
- 已在 SourceForge 论坛公开求助，呼吁社区和微软解决
- 暂时方案：用户可以启用 Windows 测试模式（Test Mode）加载未签名驱动，但这会降低系统安全性

这一事件与 WireGuard 同期遭遇相关（另一个 HN 热门故事显示，WireGuard 随后在微软解决签名问题后发布了新 Windows 版本），说明微软账户管理系统可能存在系统性问题，影响多个开源项目。

---

## 社区热议与争议点

**核心争议：平台控制权与开源软件的生存风险**

- **jonathanstrange** 和 **politelemon** 指出：这是一个几十年来反复出现的风险——任何向封闭平台（iOS、Mac、Windows、Android）发布软件的开发者，都必须接受平台随时可以单方面终止其资格的条件。
- **shelled** 提出了更阴暗的猜测：可能是一次"shakedown"（勒索性施压）或某种"nudge"，也可能只是微软内部流程的 bug 或误触发——而大型组织往往难以承认错误并及时修复。

**对开源的特殊威胁**：
- **account42** 提出一个务实建议：对于开源用户空间程序，可以选择干脆不签名——用户已经被训练成无视 Windows 的安全警告。但内核驱动不行，不签名就是无法加载。
- 评论者们普遍认为，微软对内核驱动的签名要求本身是合理的安全措施（CrowdStrike 事件是反例教训），但账户终止流程缺乏透明度和申诉机制是不可接受的。

**技术层面**：讨论延伸到 Secure Boot、UEFI 签名、测试模式的安全隐患，以及 Linux 生态在这方面的对比——Linux 驱动签名虽然也存在，但没有如此集中的"账户"风险。

---

## 行业影响与未来展望

这一事件深刻揭示了开源软件对商业平台基础设施的依赖风险。即使软件本身完全开源，发布和分发的关键环节仍然受到微软、Apple 等公司的控制。

短期：VeraCrypt 需要重新申请并获得新的签名账户，或通过法律手段要求微软解释和恢复。中期：类似 WireGuard 的案例表明微软最终可能解决，但过程耗时且对用户造成中断。

长远来看，这一事件可能推动更多开发者讨论去中心化的软件分发和签名基础设施，以及 Linux 作为替代方案的吸引力（无需依赖单一厂商的代码签名账户）。

---

## 附带链接

- 原帖：https://sourceforge.net/p/veracrypt/discussion/general/thread/9620d7a4b3/
- HN 讨论：https://news.ycombinator.com/item?id=47686549
- 相关：WireGuard Windows 新版本：https://news.ycombinator.com/item?id=47719942
