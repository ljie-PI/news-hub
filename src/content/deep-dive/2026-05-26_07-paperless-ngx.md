---
title: "paperless-ngx"
date: "2026-05-26"
generated: "2026-05-26 07:00"
source: "GitHub"
slug: "2026-05-26_07-paperless-ngx"
---

---
title: "Paperless-ngx：社区接力的开源文档管理 DMS"
date: 2026-05-26
source: GitHub
slug: paperless-ngx
---

## 一、定位与痛点

Paperless-ngx 把自己定位为"community-supported supercharged document management system"，目标人群是那些被纸质合同、发票、报销单、学校通知淹没的家庭用户和小型组织。痛点很直接：扫描件堆在硬盘里没有元数据，找一张三年前的保单等于翻箱倒柜；商业 DMS（DocuWare、M-Files）价格高、数据在云端、迁移难。Paperless-ngx 接过了原始 Paperless 与 Paperless-ng 的衣钵，由分布式社区团队维护，目标是让用户在自家小服务器上把所有纸质资料"扫一次、终身可搜"。仓库 40.9k stars、2.7k forks、GPL-3.0、累计 149 个 release，最新 v2.20.15，活跃度极高。

## 二、架构与技术

技术栈是经典的 **Django（Python 57.9%）+ Angular（TypeScript 32.5%）+ HTML/SCSS** 前后端分离架构，配合 PostgreSQL、Redis、OCR 引擎（Tesseract 系）以及消费者目录监听机制。文档进入"consume"目录后，会自动走 OCR → 全文索引 → 分类/标签/通讯方 自动匹配的流水线，并生成 PDF/A 归档版本。机器学习模块负责训练 tags、document type、correspondent 三类分类器，越用越准。部署上官方主推 `docker compose`，compose 文件在 `/docker/compose` 目录，镜像托管在 GitHub Container Registry，一行安装脚本即可拉起：`bash -c "$(curl -L .../install-paperless-ngx.sh)"`。从 Paperless-ng 升级只需替换镜像即可，迁移阻力极低。

## 三、竞品与生态

同赛道的开源对手包括 Mayan EDMS（功能更"企业"，但部署重）、Teedy（Java 栈，UI 较旧）以及 Docspell（Scala，OCR 强但社区小）。Paperless-ngx 的优势是文档清晰、Docker 一键起、前端 Angular UI 体验现代、社区翻译通过 Crowdin 覆盖大量语种。生态上有官方 Demo 站 `demo.paperless-ngx.com`、Matrix `#paperless` 房间、GitHub Discussions 功能投票，以及 Wiki 上用户维护的"Related Projects"清单（包括移动 App、Paperless-AI 等第三方扩展）。topics 涵盖 pdf、ocr、archiving、dms、django、angular，定位非常聚焦。

## 四、反馈与局限

README 在显眼位置警告："Paperless-ngx should never be run on an untrusted host"——数据库以明文存储文档内容，不做应用层加密，因此官方推荐"放在家里本地服务器并做好备份"。这一点对企业用户是硬约束。其它常见反馈包括：OCR 对竖排中文/手写仍弱、首次训练分类器需要积累数百份样本、Docker 部署对小白仍有门槛、备份/恢复需要用户自己脚本化。

## 五、附带链接

- 仓库：https://github.com/paperless-ngx/paperless-ngx
- 文档：https://docs.paperless-ngx.com/
- Demo：https://demo.paperless-ngx.com （demo/demo）
- Matrix：#paperless:matrix.org
