---
title: "scikit-learn/scikit-learn"
date: "2026-06-14"
generated: "2026-06-14 07:00"
source: "GitHub"
slug: "2026-06-14_07-scikit-learn-scikit-learn"
summary: "scikit-learn 是 Python 生态中最具代表性的传统机器学习库,基于 NumPy、SciPy 与 matplotlib 构建,采用 BSD-3 开源协议。项目自 2007 年由 David Cournapeau 在 Google Summer"
---

---
title: "scikit-learn/scikit-learn Deep Dive"
date: "2026-06-14"
generated: "2026-06-14 07:00"
source: "GitHub Deep Dive"
slug: "scikit-learn-scikit-learn"
---

# scikit-learn/scikit-learn

## 一、项目概况

scikit-learn 是 Python 生态中最具代表性的传统机器学习库,基于 NumPy、SciPy 与 matplotlib 构建,采用 BSD-3 开源协议。项目自 2007 年由 David Cournapeau 在 Google Summer of Code 中孕育,如今已积累 66.3k Star、27.1k Fork 和超过 3.37 万次提交,是数据科学领域事实上的标准工具之一。

## 二、本次更新亮点

仓库此次进入热榜,核心驱动来自 6 月 2 日发布的 **1.9.0 正式版**(由维护者 jeremiedbb 标签发布)。该版本支持 Python 3.11–3.14,并首次引入 **narwhals** 作为新依赖,用于统一处理 pandas、Polars、PyArrow 等多种 DataFrame 后端,显著增强了数据框互操作性。

## 三、技术细节

1.9 带来四大实质性改进:
- **Callbacks(实验性 API)**:通过 `set_callbacks` 在 estimator 拟合关键步骤注册回调,内置 `ProgressBar` 进度条与 `ScoringMonitor` 评分记录器,并可在 `GridSearchCV` 等组合场景下并发运行子任务。
- **HTML 表示增强**:`fit` 之后的可视化图增加 "Fitted attributes" 表格,直接显示 `coef_`、`mean_`、`feature_names_in_` 等属性的类型与取值,显著提升 notebook 调试体验。
- **metric_at_thresholds**:一次性计算二分类指标在所有决策阈值下的曲线,简化 PR / F1 / Accuracy 的阈值扫描。
- **稀疏接口切换**:新增 `sparse_interface` 全局配置,可生成 SciPy 的新式 `sparray` 而非 `spmatrix`,提前对接 SciPy 弃用计划。

同时,`LogisticRegression` 的 `penalty` 参数在 1.8 弃用、1.10 移除,推荐改用 `l1_ratio` + `C` 组合。

## 四、为什么现在火

发布刚满十余天,正值用户密集试用与社区文章传播期;narwhals 集成意味着 sklearn 正式拥抱"DataFrame 后端无关化"潮流,而 Callbacks API 则补齐了它相对于 PyTorch Lightning / XGBoost 长期缺失的训练可观察性。再叠加 Python 3.14 兼容性,使升级动机非常强烈,因此当日新增约 19 颗 Star。

## 五、总结评价

1.9 并非颠覆式版本,却是一次"现代化补课":数据互操作、训练可观测、稀疏类型迁移三件事同时推进,为 sklearn 在 LLM 时代继续担当结构化数据建模基石提供了扎实基础,值得生产用户尽快升级评估。
