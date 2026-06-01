---
title: "anthropic-verbosity-setting"
date: "2026-06-02"
generated: "2026-06-02 07:00"
source: "Reddit"
slug: "2026-06-02_07-anthropic-verbosity-setting"
---

---
title: "Hey Anthropic, we need a verbosity setting"
date: "2026-06-02"
generated: "2026-06-02 07:00"
source: "Reddit"
slug: "anthropic-verbosity-setting"
---

## 1. 帖子背景

r/ClaudeAI 用户 Bright-Celery-4058 于 6 月 1 日发帖，呼吁 Anthropic 在 Claude 中加入"冗长度（verbosity）"设置开关。发帖人指出，Claude 4.6 在输出长度和详尽度上达到了"完美平衡"，而升级到 4.7、4.8 之后输出明显变得啰嗦冗长，即便官方承认问题并尝试修复，回归 4.6 体验的状态仍未实现，被视为明显的退步。

## 2. 核心讨论点

讨论聚焦在模型行为微调的颗粒度问题：用户希望像 OpenAI 在 GPT-5 系列中提供的 `verbosity` 参数那样，由用户而非模型一刀切地决定回答风格。许多专业用户表示，4.7/4.8 在编程、代码审查等场景下会输出大量"自言自语"式说明文字、重复前言、过度的免责声明，导致信息密度下降。发帖人甚至表示同事们因此产生"心理疲劳"，部分团队已回退至 4.6 版本继续工作。

## 3. 社区反应 / 争议

评论区共鸣强烈，多位重度用户附议"4.7 之后变得难以使用"的判断。一部分人猜测冗长输出可能与新的安全/对齐训练或更激进的链式思考策略有关；也有人质疑 Anthropic 是否在通过更长输出来"展示工作"以提升用户感知价值。少数声音认为可以靠系统提示词控制，但发帖人和多数回复者认为系统提示对 4.7/4.8 的抑制效果不如对 4.6 显著，迫切需要官方层面的参数。

## 4. 行业影响

这一抱怨折射出大模型产品化的一个普遍痛点：当模型行为更新由厂商集中决定时，付费高频用户对"风格回归"的诉求会越来越高。OpenAI 已经把 `verbosity` 与 `reasoning_effort` 暴露成 API 参数，Anthropic 若不跟进，将在 agentic coding、IDE 集成（Claude Code、Cursor 等）这类对 token 成本和阅读负担敏感的场景失去竞争力。对开发者生态而言，可控冗长度直接关系到 token 计费、上下文窗口利用率与编辑器中的阅读体验。

## 5. 链接

- Permalink: https://www.reddit.com/r/ClaudeAI/comments/1tu15us/hey_anthropic_we_need_a_verbosity_setting/
- URL: (self post)
