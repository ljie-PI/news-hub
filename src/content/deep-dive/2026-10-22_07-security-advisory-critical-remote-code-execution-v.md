---
title: "Security advisory: Critical remote code execution vulnerabilities, update now"
date: "2026-10-22"
generated: "2026-10-22 07:00"
source: "HN"
slug: "2026-10-22_07-security-advisory-critical-remote-code-execution-v"
summary: "PHP 于十月二十一日发布紧急公告：两项漏洞均为无需认证的远程代码执行，官方评分九点二。所有处理网络请求的 PHP 安装均在风险范围，模组路径已有业务代码启动前触发的演示。支持分支须升至八点二点三十五、八点三点三十六、八点四点二十七或八点五点十二；老版本应采用发行商回补或迁移。"
---

# Security advisory: Critical remote code execution vulnerabilities, update now

## 事件背景
PHP 于十月二十一日发布紧急公告：两项漏洞均为无需认证的远程代码执行，官方评分九点二。所有处理网络请求的 PHP 安装均在风险范围，模组路径已有业务代码启动前触发的演示。支持分支须升至八点二点三十五、八点三点三十六、八点四点二十七或八点五点十二；老版本应采用发行商回补或迁移。

## 核心观点 / 产品机制
事实层面，第一项漏洞由内存耗尽时的长跳转打断初始化，清理阶段误用无效请求数据；第二项让指向已释放内存的全局状态残留，后续请求形成释放后使用。补丁把直接退出改为可展开退出，并补齐全局量重置。关闭上传进度、限制表单体积或阻断多段请求只能缩小路径，公告明确只有升级才完整修复。

## 社区热议与争议点
本轮用官方脚本读取整棵评论树，取得六百二十个有正文的可见节点，未触及两千上限；冻结热度仍按一千五百零二分、六百五十一条评论。评论层面有四个具体例子：Gigachad 主张补丁前直接停站；aksss 建议在边缘阻断写入类请求，但主动承认不确定能否覆盖；bombcar 反对只喊停站，认为企业还需要攻击特征、日志与风险分级；hobofan 则反驳，完整细节公布后证明停站是当时唯一稳妥选择。以上均是网友判断，不是官方事实。

## 行业影响与未来展望
事件暴露异常退出、跨请求全局量与共享工作进程的组合风险。补丁涉及三百个文件，发行版、容器镜像、托管面板与长期支持渠道的同步速度将决定暴露窗口；团队应盘点版本、运行接口、可达性与回补来源。

## 附带链接
- [PHP 官方公告](https://www.php.net/archive/2026.php#2026-10-21-5)
- [内存耗尽漏洞公告](https://github.com/php/php-src/security/advisories/GHSA-w8hw-w9fx-j79w)
- [陈旧全局状态漏洞公告](https://github.com/php/php-src/security/advisories/GHSA-6wmf-4rv5-p3rp)
- [官方补丁提交](https://github.com/php/php-src/commit/3584a98bda0f2c0d367255b046798b0d3a221a19)
- [Hacker News 讨论](https://news.ycombinator.com/item?id=50172041)
