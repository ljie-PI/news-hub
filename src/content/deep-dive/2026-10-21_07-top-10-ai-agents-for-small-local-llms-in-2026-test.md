---
title: "Top 10 AI agents for small local LLMs in 2026, tested on Qwen3.5-4B"
date: "2026-10-21"
generated: "2026-10-21 07:00"
source: "Reddit"
slug: "2026-10-21_07-top-10-ai-agents-for-small-local-llms-in-2026-test"
summary: "作者把十种代理接到同一Qwen3.5-4B Q4_K_M本地模型，使用隔离设置、无头模式与自动确认，并尽可能关闭遥测。五题各限十分钟，每轮重置夹具，再由脚本判定。作者自测中，七种代理全过，Pi用时一分三十六秒；Hermes和Qwen Code各过四题，Codex CLI未进入模型。"
---

# Top 10 AI agents for small local LLMs in 2026, tested on Qwen3.5-4B

## 事件背景

作者把十种代理接到同一Qwen3.5-4B Q4_K_M本地模型，使用隔离设置、无头模式与自动确认，并尽可能关闭遥测。五题各限十分钟，每轮重置夹具，再由脚本判定。作者自测中，七种代理全过，Pi用时一分三十六秒；Hermes和Qwen Code各过四题，Codex CLI未进入模型。

## 核心观点 / 产品机制

五题检查YAML端口辨认、统计脚本运行、带隐藏样例的slugify修复、三份日志的错误统计，以及跨文件改名后输出不变。`check/check.sh`而非代理自报决定成败，抓出了Hermes对可见测试过拟合和Qwen Code误计数。隔离、统一时限和新夹具控制了部分污染；但原帖未公开夹具、适配器、提示、日志或仓库，也未披露硬件、llama.cpp提交、上下文、采样、思考模式与工具解析参数，而官方模型卡明确这些设置会改变工具调用表现。

## 社区热议与争议点

Atom仅返回主帖和一条普通评论，不足以形成共识。该评论追问硬件，击中耗时榜缺少设备分母的问题。两项支持是：机械验收和隐藏样例可识别假完成与过拟合；统一模型让差异更聚焦于脚手架。两项质疑是：单次、单模型、五个微任务且无随机种子，不能证明稳定排名；Pi、OpenClaw与Cline定位和工具面不同，适配成本并不等价。Codex零分源于Responses协议与Qwen模板报错，只证明该连接组合失败，不代表解题能力垫底。

## 行业影响与未来展望

这更像小模型兼容性探针，而非产品总榜。下一版应公开材料、重复多次、固定生成参数与预算，分别报告正确率、令牌、首响应和墙钟，并把协议失败单列。当前结论只能外推到这五题、该量化模型与当时版本。

## 附带链接

- [Reddit原帖](https://www.reddit.com/r/openclaw/comments/1xb5yuw/top_10_ai_agents_for_small_local_llms_in_2026/)
- [Qwen3.5-4B模型卡](https://huggingface.co/Qwen/Qwen3.5-4B)
- [Codex弃用Chat Completions说明](https://github.com/openai/codex/discussions/7782)
- [Qwen模板与llama.cpp兼容性问题](https://github.com/ggml-org/llama.cpp/issues/27367)
- [Pi](https://pi.dev/) · [goose](https://goose-docs.ai/) · [Cline](https://cline.bot/) · [OpenClaw](https://openclaw.ai/) · [OpenCode](https://opencode.ai/)
