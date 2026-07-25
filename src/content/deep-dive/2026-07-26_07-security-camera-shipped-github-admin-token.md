---
title: "My Security Camera Shipped a GitHub Admin Token in Its Login Page"
date: "2026-07-26"
generated: "2026-07-26 07:00"
source: "HN"
slug: "2026-07-26_07-security-camera-shipped-github-admin-token"
summary: "一位安全研究者（博客 hhh.hn 作者）因关注监控摄像头安全，注意到韩国企业 Hanwha Vision（前身为三星 Techwin，隶属韩华集团）在官网公开提供各型号摄�"
---

# My Security Camera Shipped a GitHub Admin Token in Its Login Page

## 1. 事件背景

一位安全研究者（博客 hhh.hn 作者）因关注监控摄像头安全，注意到韩国企业 Hanwha Vision（前身为三星 Techwin，隶属韩华集团）在官网公开提供各型号摄像头固件。他下载固件后逐层解密，最终在根文件系统里发现了一个被复制到约 30 个文件中的 GitHub token——而该 token 对其 GitHub 组织的数百个仓库拥有管理员权限。更耐人寻味的是，环境变量里还出现了归属美国国防部（DoD）的 IP 地址段。

## 2. 核心观点/产品机制

作者用 binwalk 拆解固件，借助 Matt Brown 的已有研究破解了第一层加密（口令为 `HTW`+ 型号）。第二层加密方案不同，他把 `fwupgrader` 二进制丢给 Claude Code 分析，发现 Hanwha 做了混淆：AES 密钥与二进制中一张静态小密钥表异或后运行时重组，IV 则明文存放，程序直接调用 openssl CLI。拿到根文件系统后，trufflehog 立刻扫出那枚 GitHub token。泄露根因是：摄像头 UI 用 Vite 构建时，某变量在构建期被赋值为整个 `process.env`，导致 CI 任务的全部环境变量（含 `GITHUB_NPM_TOKEN`）被写进前端文件——意味着访问管理界面的人可能通过网络收到该 token。作者随后爬取约 500 个固件，62% 可解密，仅 3 个含 token 且为同一枚。他上报后 Hanwha 在 12 小时内吊销了 token。

## 3. 社区热议与争议点

评论区一条主线是"这类事有多普遍"。**RyJones** 讲述当年大量 OBD-II 车载适配器共用同一 MAC 地址，配套 App 竟以 MAC 作为身份凭据，买一个便宜 dongle 就能获得对一堆网站的认证（反方 **londons_explore** 反驳称他买的 3 个不同厂商的 dongle MAC 各不相同，多为蓝牙转串口芯片默认值）——正反双方就"共用 MAC"现象是否普遍展开拉锯。另一条主线是那些 DoD IP 地址：**grommz** 认为"固件里烧进美国国防部 IP 才是更大的新闻，提醒自己别买韩国安防产品"；作者 **hhh** 亲自回复澄清，他知道至少一家公司把整个 DoD IP 段拿来做内部黑洞地址，所以才加了推测警告。**kotaKat** 坦言自己也"滥用"22.0.0.0/8 等 DoD 段做家庭网络，因为这些段永远不会出现在公网上；**walrus01** 则调侃"10/8、172.16/12、192.168/16 还不够你家用？"，引出一串关于多站点自托管为何需要非常规内网段的讨论。

## 4. 行业影响与未来展望

随着 AXIS 等推动摄像头成为可运行 Linux 应用的"真正端点"，监控设备正成为企业环境中需按漏洞与凭据管理标准对待的严肃目标。本案暴露了 CI/CD 构建流程把敏感环境变量泄进前端产物的经典反模式，以及固件混淆无法替代密钥管理的教训。值得肯定的是 Hanwha 12 小时响应吊销，堪称业界罕见的高效披露闭环。作者的调侃"我们真该少犯这种错，我还怎么睡得着"道出了 IoT 供应链安全的普遍焦虑。

## 5. 附带链接

- 原文：https://hhh.hn/hanwha-github-token/
- HN 讨论：https://news.ycombinator.com/item?id=49034292
