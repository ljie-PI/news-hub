---
title: "Backblaze 停止备份 OneDrive 和 Dropbox 文件夹"
date: "2026-04-15"
source: "HN"
slug: "2026-04-15_09-13_backblaze_onedrive_dropbox"
summary: "**得分：947 | 评论：579 | 作者：rrreese**"
---

# Backblaze 停止备份 OneDrive 和 Dropbox 文件夹

**得分：947 | 评论：579 | 作者：rrreese**

---

## 事件背景

长期 Backblaze 用户 Ryan Reese 发现 Backblaze 在未经通知的情况下，悄然停止备份 OneDrive、Google Drive、Dropbox、Box、iDrive 等云存储提供商的本地同步文件夹。这个变化被埋在版本 9.2.2.877 的"改进"列表里——措辞为"防止性能问题、过多数据使用和意外上传"。文章标题《Backblaze 已悄然停止备份你的数据》击中了用户的痛处，在 HN 引爆了 579 条评论，显示出极高的情绪共鸣度。

---

## 核心观点 / 产品机制

**用户的愤怒核心**：
Ryan 有一个 383GB 的 OneDrive 文件夹。Backblaze 决定停止备份这个文件夹，但**从未发送邮件、推送通知或任何形式的告知**。他是在 Reddit 上的其他用户帖子中偶然发现这个问题的。

**"同步不等于备份"的关键论点**：
- OneDrive、Dropbox 只是**文件同步服务**，不是真正的备份
- 云同步提供商的删除文件保留只有 30 天（部分付费版更长），Backblaze 原本提供 1 年或无限保留
- 如果微软或 Dropbox 封禁你的账户，你的"同步"数据立即消失
- 版本历史：Dropbox 免费版只保留 30 天，而 Backblaze 提供的是真正的历史版本备份

**Backblaze 的辩护**（来自 release notes）：
> "避免性能问题、过多数据使用和来自 OneDrive、Google Drive、Dropbox 等服务的意外上传……与 Backblaze 只备份本地和直连存储的政策保持一致。"

用户认为这是一个单方面改变服务内容的"降级"，绝非"改进"。

---

## 社区热议与争议点

**"消费者备份软件的系统性问题"**：
- **Terr_** 提出了最获认可的评论：这是所有消费者在线备份软件的系统性问题——他们总是在找借口**不**备份东西。最好的情况是为了向普通用户显示"快速进度条"；最坏的情况是悄悄食言"无限"容量的承诺。
- **Terr_** 还讲述了自己的解决方案：迁移到 Linux 后改用 Restic + Backblaze B2，每月只需 1-2 美元备份约 200GB，完全透明可控。

**替代方案讨论**：
- restic、Borg、Duplicati 等开源备份工具获得大量推荐，配合 Backblaze B2 对象存储使用比 Backblaze Personal Backup 更透明可靠
- **aitchnyu** 询问 Vorta（Borg 的 GUI）；**Terr_** 解释他更倾向于 CLI 方案，因为不想要专有服务器端 daemon，希望目标存储可以是任何可挂载文件系统或 S3 兼容 bucket

**关于用 AI/LLM 扫描排除列表的建议**：少数评论者建议 Backblaze 应该提供更清晰的排除文件列表 UI，并在任何排除规则变更时主动通知用户——这是最低限度的用户信任维护。

---

## 行业影响与未来展望

这一事件揭示了消费者云备份市场的信任危机：用户选择"设置并遗忘"的备份服务，但服务提供商在无告知情况下缩减服务范围，使得备份实际上存在用户未知的空洞。

对行业的影响：
1. **透明度期待提升**：用户正在要求备份服务提供完整的"不备份内容"列表，并对任何变更主动通知
2. **开源工具崛起**：Restic、Borg 等工具在 HN 中获得了大量新关注，"控制权 > 便利性"的声音越来越强
3. **Backblaze 竞争压力**：这次事件可能加速用户迁移到 Duplicati、rsync.net、Hetzner Storage Box 等替代方案
4. **云同步≠云备份的教育**：这是一个需要持续向用户普及的基本概念

---

## 附带链接

- 原文：https://rareese.com/posts/backblaze/
- HN 讨论：https://news.ycombinator.com/item?id=47762864
- Backblaze release notes：https://www.backblaze.com/computer-backup/docs/backup-client-release-notes-windows
