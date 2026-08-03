---
title: "firecrawl/pdf-inspector"
date: "2026-08-04"
generated: "2026-08-04 07:00"
source: "GitHub"
slug: "2026-08-04_07-pdf-inspector"
summary: "pdf-inspector 是 Firecrawl 开源的一款高性能 Rust 库，专注于 PDF 的分类、文本抽取与 Markdown 转换。它要解决的核心痛点很具体：在大规模文档处理流水线里�"
---

---
title: "firecrawl/pdf-inspector"
date: 2026-08-04
source: github
slug: pdf-inspector
---
# firecrawl/pdf-inspector

## 定位与痛点剖析

pdf-inspector 是 Firecrawl 开源的一款高性能 Rust 库，专注于 PDF 的分类、文本抽取与 Markdown 转换。它要解决的核心痛点很具体：在大规模文档处理流水线里，把所有 PDF 一律送进 OCR 服务既昂贵又慢，而实际上很大一部分 PDF 本身就是文本型、根本不需要 OCR。该库先用极低成本判断 PDF 是「文本型/扫描型/图片型/混合型」，对文本型直接本地抽取，仅把真正需要的页面路由到 OCR。目标用户是搭建文档解析、RAG、爬虫与知识库管线的后端与 AI 工程师。

## 核心架构与技术细节

技术栈为纯 Rust，仅依赖 `lopdf` 做底层解析，不含任何 ML 模型或外部服务，因此体积轻、部署简单。分类逻辑巧妙：只解析 xref 表和页面树，不做全对象加载，通过在内容流中采样 `Tj`/`TJ`（文本算子）与 `Do`（图像算子）来判定类型，据称可在毫秒级处理 300+ 页文档，并返回 0.0–1.0 置信度及 `pages_needing_ocr` 页级路由清单。抽取端具备坐标感知、多栏阅读顺序、CID 字体（ToUnicode CMap、Identity-H）解码、编码异常检测等能力。Markdown 转换覆盖标题分级、列表、代码块、表格（矩形绘制+文本对齐双模式）、财务表、脚注等。文档解析一次并在检测与抽取间共享，避免重复 I/O。此外还提供 Python、Node.js 与浏览器 WebAssembly 三套绑定。

## 竞品对比与生态站位

同类方案包括 pymupdf4llm、markitdown、liteparse、opendataloader 等。据 README 自报口径（基于 opendataloader-bench 200 篇语料、Apple M4 Pro、关闭 OCR），pdf-inspector 综合分 0.875、阅读顺序 0.915、表格 0.814，且 200 篇仅 0.470s，明显快于 pymupdf4llm（17s）与 markitdown（16s），表格分领先尤为突出。其生态站位清晰：不是 OCR 或 ML 版面解析器的替代品，而是放在管线前端做「智能路由」的快速本地默认引擎，尤其适合报告、论文、财报、发票、法律文书等原生文本 PDF。

## 开发者反馈与局限性

项目热度不俗，约 2.5k star、193 fork、411 次提交，多语言绑定说明工程投入较大。局限性也源于其设计取舍：不做 OCR，扫描件与图片型 PDF 必须外接 OCR 服务；表格与标题识别依赖字体大小、坐标等启发式规则，面对排版怪异或字体编码损坏的 PDF 可能失准（库本身也内置编码异常检测以便回退）。基准数字均为官方自报，尚缺乏大规模第三方复现，实际效果需按自身语料验证。

## 附带链接

- GitHub 仓库：https://github.com/firecrawl/pdf-inspector
- Python 文档：https://github.com/firecrawl/pdf-inspector/blob/main/docs/python.md
- 基准复现分支：https://github.com/firecrawl/opendataloader-bench
