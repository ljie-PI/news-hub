---
title: "Backdoor in Claude Code for VS Code extension on the Cursor Marketplace"
date: "2026-10-31"
generated: "2026-10-31 07:00"
source: "HN"
slug: "2026-10-31_07-claude-code-vsx-marketplace-backdoor"
summary: "10月29日约2:27—13:35（太平洋时间），Cursor扩展市场向用户提供了被篡改的Claude Code扩展。Cursor在次日更新公告后，将受影响范围明确为macOS、Windows版`Anthropic.claude-code` 2.1.312与2.1.313；恶意构建并非Anthropic制作。npm的发布时间表、OpenVSX接口均没有2.1.313记录，官方也称微软市场及OpenVSX未受影响，因此不能把早期“多市场失陷”说法当成定论。"
---

# Backdoor in Claude Code for VS Code extension on the Cursor Marketplace

## 事件背景
10月29日约2:27—13:35（太平洋时间），Cursor扩展市场向用户提供了被篡改的Claude Code扩展。Cursor在次日更新公告后，将受影响范围明确为macOS、Windows版`Anthropic.claude-code` 2.1.312与2.1.313；恶意构建并非Anthropic制作。npm的发布时间表、OpenVSX接口均没有2.1.313记录，官方也称微软市场及OpenVSX未受影响，因此不能把早期“多市场失陷”说法当成定论。

## 核心观点 / 产品机制
恶意包在正常`extension.js`前插入立即执行代码，扩展一加载便写入`svc-telemetry` SSH公钥，投放启动项，并向134.209.82[.]225建立反向隧道、回传主机信息。macOS权限检查和Windows命令存在错误，通常无法开启SSH服务，但公钥、持久化文件与侦察上报仍会落地；未开启SSH只缩小可利用面，不等于未感染。

## 社区热议与争议点
冻结热度为696 points、439 comments；本轮Algolia实际取得100个可见节点并触及上限。正面看，Anthropic员工ddworken明确限定事故只在Cursor市场；entrope认为默认约12小时更新延迟及重启要求可能减少命中。反面看，no-name-here指出Cursor宣称会做商业化恶意软件扫描，坏包仍在线约11小时；K0nserv曾以官方市场缺少2.1.313推断Anthropic失陷，随后接受“预防性跳号”解释并承认原判断过度，反映版本缺口不能单独证明来源。

## 行业影响与未来展望
Cursor已下架版本、关闭并重建市场、轮换密钥并协同关停攻击服务器，但这些动作不能清理终端。受影响主机仍应隔离，删除SSH钥匙、启动项与隧道进程，从可信设备轮换凭据和会话，必要时重装。事件也说明扩展市场需提供可验证来源、签名与可追溯发布记录，团队则应延迟自动更新、隔离开发环境并监控IDE写入SSH配置。

## 附带链接
- [原文](https://phorion.io/blog/offical-claude-code-vsx-compromise/)
- [Cursor安全公告](https://cursor.com/blog/claude-code-extension-security-notice)
- [Hacker News讨论](https://news.ycombinator.com/item?id=50300683)
