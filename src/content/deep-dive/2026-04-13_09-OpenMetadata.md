---
title: "OpenMetadata — 统一元数据平台"
date: "2026-04-13"
source: "GitHub"
slug: "2026-04-13_09-OpenMetadata"
summary: "**仓库**: https://github.com/open-metadata/OpenMetadata  "
---

# OpenMetadata — 统一元数据平台

**仓库**: https://github.com/open-metadata/OpenMetadata  
**今日新增 Star**: +162  
**日期**: 2026-04-13

---

## 定位与痛点剖析

现代数据驱动组织面临"数据迷雾"问题：数据散落在数十个系统（数据仓库、数据湖、BI 工具、数据库、机器学习管道），没有人知道"这张表是谁拥有的"、"这个字段的计算口径是什么"、"这条数据流经了哪些步骤"。数据工程师浪费大量时间寻找数据资产，数据分析师不确定数据质量，合规团队无法追踪敏感数据的流向。

`OpenMetadata` 是一个**统一元数据平台**，将数据发现（Data Discovery）、数据可观测性（Data Observability）和数据治理（Data Governance）整合在单一平台，通过一个中央元数据图谱（Unified Metadata Graph）将组织内所有数据资产的上下文连接起来。

---

## 核心架构与技术细节

### 核心架构：统一元数据图谱（Unified Metadata Graph）

OpenMetadata 的架构核心是一个基于图数据库的**元数据图谱**，将数据资产（表、仪表板、管道、ML 模型、话题、容器等）与其相关联的所有上下文连接起来：

```
数据资产 ←→ 所有者/团队
数据资产 ←→ 血缘关系（上下游）
数据资产 ←→ 标签/分类
数据资产 ←→ 数据质量检查结果
数据资产 ←→ 使用频率/热度
数据资产 ←→ 文档/描述
```

### 功能模块

**1. 数据发现（Data Discovery）**

- 全文搜索：搜索表名、字段名、描述、标签
- 资产目录：浏览所有数据资产，按类型、所有者、标签筛选
- 使用统计：根据查询频率显示数据资产的热度
- 智能推荐：基于使用模式推荐相关数据资产

**2. 列级数据血缘（Column-Level Lineage）**

这是 OpenMetadata 的核心技术亮点之一——不只追踪表级别的上下游关系，而是精确到**每一列的来源和去向**。例如：
- `revenue` 列 = `orders.amount` × `exchange_rates.rate`
- 当上游 `orders` 表的 schema 变更时，可以追踪影响范围

支持来源：SQL 查询解析、dbt、Spark、Flink 等。

**3. 数据质量监控**

- 定义质量规则（非空检查、值域范围、唯一性等）
- 调度自动化质量检查
- 质量趋势追踪和告警
- 与数据血缘结合，追踪质量问题的传播路径

**4. 数据治理**

- 数据域（Data Domains）和数据产品（Data Products）定义
- 所有者和利益相关者分配
- 分类标签（Tags）和术语表（Glossary Terms）
- 基于角色的访问控制（RBAC）
- 敏感数据标注（PII 等合规需求）

**5. 团队协作**

- 数据资产讨论（内嵌评论系统）
- 任务分配（"请补充这个表的文档"）
- 关注订阅（数据资产变更通知）
- 数据 Owner 联系方式

### 连接器生态

OpenMetadata 支持 **80+ 数据源连接器**，包括：

| 类型 | 示例 |
|------|------|
| 数据仓库 | Snowflake、BigQuery、Redshift、Databricks |
| 数据库 | PostgreSQL、MySQL、MongoDB、Elasticsearch |
| BI 工具 | Tableau、Looker、Power BI、Metabase |
| 数据管道 | Airflow、dbt、Spark、Kafka |
| ML 平台 | MLflow、SageMaker |
| 对象存储 | S3、GCS、Azure Blob |

### 技术栈

- **后端**：Java（Spring Boot），RESTful API 设计
- **前端**：React TypeScript
- **搜索引擎**：Elasticsearch / OpenSearch
- **数据库**：MySQL（元数据存储）
- **图引擎**：自研图遍历层（基于 MySQL 图关系查询）
- **部署**：Docker Compose（本地）、Helm Charts（Kubernetes）
- **认证**：Google/GitHub/LDAP/SAML SSO

---

## 竞品对比与生态站位

| 产品 | 开源 | 血缘粒度 | 数据质量 | 连接器数量 | 定价 |
|------|------|---------|---------|-----------|------|
| **OpenMetadata** | ✅（Apache 2.0） | 列级 | ✅（内置） | 80+ | 开源免费 / 云托管 |
| DataHub（LinkedIn） | ✅ | 列级 | 插件 | 50+ | 开源免费 |
| Atlan | ❌ | 列级 | ✅ | 150+ | 商业（高价） |
| Alation | ❌ | 表级 | ✅ | 多 | 商业（高价） |
| Apache Atlas | ✅ | 有限 | 有限 | Hadoop生态 | 免费 |
| Amundsen（Lyft） | ✅ | 有限 | ❌（内置） | 30+ | 开源免费 |

OpenMetadata 在开源元数据平台中与 DataHub 并列为最成熟的选择。对比 DataHub：
- **优势**：更完整的内置数据质量功能、更好的 UI/UX、更强的协作功能
- **劣势**：DataHub 在大型企业的生产部署中更成熟，社区规模更大

---

## 开发者反馈与局限性

**正面**：
- 列级血缘是真实数据工程痛点，OpenMetadata 的实现被业界认可
- UI 设计（相比 Apache Atlas、Amundsen 等旧工具）现代化程度高
- 活跃维护，版本迭代频繁（v1.12.x 已发布）

**局限**：
1. **部署复杂度**：生产级部署需要 Elasticsearch + MySQL + 多个微服务，运维负担重
2. **Java 技术栈**：相比 Python 生态数据工具，Java 后端对数据工程团队改造成本高
3. **资源消耗**：全栈部署内存需求高（推荐 16GB+ 生产环境）
4. **连接器质量参差不齐**：80+ 连接器中，核心连接器质量高，长尾连接器社区维护不稳定
5. **自动 schema 检测局限**：对于非结构化数据源（如 S3 上的文件）的元数据抽取能力有限

---

## 附带链接

- **GitHub**: https://github.com/open-metadata/OpenMetadata
- **官方网站**: https://open-metadata.org/
- **文档**: https://docs.open-metadata.org/
