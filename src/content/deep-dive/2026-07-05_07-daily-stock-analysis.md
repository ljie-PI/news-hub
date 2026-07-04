---
title: "ZhuLinsen/daily_stock_analysis"
date: "2026-07-05"
generated: "2026-07-05 07:00"
source: "GitHub"
slug: "2026-07-05_07-daily-stock-analysis"
summary: "这是一套 LLM 驱动的多市场股票智能分析系统，覆盖 A 股、港股、美股及日韩台市场。它每日自动分析自选股，生成含结论、评分、买卖点与风险提示的"
---

# ZhuLinsen/daily_stock_analysis

## 定位与痛点剖析
这是一套 LLM 驱动的多市场股票智能分析系统，覆盖 A 股、港股、美股及日韩台市场。它每日自动分析自选股，生成含结论、评分、买卖点与风险提示的决策看板，并推送到企业微信、飞书、Telegram 等渠道。目标是把分散的行情、新闻与研判整合成可定时运行、近乎零成本的日常投研助手，减轻散户的信息收集负担。

## 核心架构与技术细节
系统用 Python 构建，行情数据接入 AkShare、Tushare、Baostock、YFinance 等多个源，AI 侧兼容 Gemini、DeepSeek、通义千问、Claude 与本地 Ollama。它内置约十五种分析策略，涵盖均线、缠论、波浪与热点事件等，并提供 Web 与桌面工作台管理任务和历史报告。新闻检索对接 SerpAPI、Tavily 等，部署支持 GitHub Actions、Docker 与 FastAPI。

## 竞品对比与生态站位
相比单一市场或纯行情工具，本项目胜在多市场覆盖与端到端自动化，把数据、大模型研判和多渠道推送串成闭环。它面向个人投资者和量化爱好者，主打零成本云端定时运行，生态上广泛兼容国内外数据源与主流大模型，其中文财经场景的适配尤为突出，也易于二次开发。

## 开发者反馈与局限性
项目本周星标增长数千，并自称登上 Trendshift 当日 Python 榜首、获 HelloGitHub 收录，这些荣誉与数字均属自报口径。它上手门槛低、渠道丰富。局限在于分析质量高度依赖所配大模型与数据源，可能出现幻觉；股市有风险，其输出仅供参考，不构成投资建议，用户须自行甄别并承担决策后果。

## 附带链接
- [GitHub Repo](https://github.com/ZhuLinsen/daily_stock_analysis)
- [英文文档](https://github.com/ZhuLinsen/daily_stock_analysis/blob/main/docs/README_EN.md)
