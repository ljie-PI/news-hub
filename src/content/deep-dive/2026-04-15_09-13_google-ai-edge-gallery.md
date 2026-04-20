---
title: "13 · google-ai-edge/gallery"
date: "2026-04-15"
source: "GitHub"
slug: "2026-04-15_09-13_google-ai-edge-gallery"
summary: "**Google AI Edge Gallery** 是 Google 官方出品的端侧 AI 展示应用，让用户在手机本地运行开源 LLM（主打 Gemma 系列），**无网络连接、零隐私泄露、响应低延迟*"
---

# 13 · google-ai-edge/gallery

> ⭐ 2,671 stars / week | 21,056 total | 2026-04-15

## a. 定位与痛点剖析

**Google AI Edge Gallery** 是 Google 官方出品的端侧 AI 展示应用，让用户在手机本地运行开源 LLM（主打 Gemma 系列），**无网络连接、零隐私泄露、响应低延迟**。

核心痛点：
1. **云端 AI 的隐私问题**：ChatGPT/Gemini 等云端服务需要将数据发送到服务器，企业和注重隐私的用户不接受
2. **普通用户无法体验端侧 LLM**：Ollama 等工具面向技术用户，普通人无法直接下载并运行模型
3. **开发者缺乏端侧 AI 参考实现**：如何在 Android/iOS 上高效运行 LLM、做 RAG、执行设备控制，缺乏官方示例

Gallery 的定位是**既是用户 App 又是开发者参考实现**。

## b. 核心架构与技术细节

**技术栈**：Android（Kotlin）+ iOS（Swift），基于 Google AI Edge SDK（LiteRT 运行时）

**核心技术组件**：
- **LiteRT**：Google 的轻量推理运行时（原 TFLite 演进版），优化为移动端 NPU/GPU 执行
- **Hugging Face 集成**：直接从 HF 浏览、下载、管理模型（GGUF/LiteRT 格式）
- **FunctionGemma 270M**：专为设备控制微调的超小型模型，只有 270M 参数但支持工具调用

**六大功能模块**：

1. **Agent Skills（代理技能）**：
   - Wikipedia 实时查询（事实核查）
   - 交互式地图
   - 社区 Skill 加载（URL 或 GitHub Discussions）

2. **AI Chat + Thinking Mode**：
   - 多轮对话，Gemma 4 支持显示推理过程（Chain-of-Thought 可视化）
   - Thinking Mode：展示模型逐步推理步骤

3. **Ask Image（多模态）**：调用设备相机/相册，对图片进行识别/描述/解答

4. **Audio Scribe**：实时语音转文字 + 翻译（完全本地，无需网络）

5. **Mobile Actions（设备控制）**：
   - FunctionGemma 270M 微调模型
   - 用自然语言控制设备操作（实验性）

6. **Tiny Garden（趣味实验）**：自然语言种植虚拟花园，FunctionGemma 270M 驱动

**模型支持**：
- Gemma 4（最新，支持 Thinking Mode）
- 支持加载自定义模型（GGUF 等格式）
- 内置 Benchmark 测试（对比不同模型在你设备上的性能）

**系统要求**：Android 12+ / iOS 17+

## c. 竞品对比与生态站位

| 工具 | 官方背书 | 端侧推理 | 设备控制 | 易用性 | 开源 |
|------|---------|---------|---------|--------|------|
| Google AI Edge Gallery | Google | ✅ LiteRT | ✅ FunctionGemma | ⭐⭐⭐⭐ | ✅ |
| Ollama（移动版）| 无官方 | ✅ | ❌ | ⭐⭐⭐ | ✅ |
| LM Studio Mobile | 无 | ✅ | ❌ | ⭐⭐⭐⭐ | ❌ |
| Apple Intelligence | Apple | ✅ | ✅(有限) | ⭐⭐⭐⭐⭐ | ❌ |

Gallery 是 Google 在端侧 AI 生态圈地的重要布局——Gemma 4 + LiteRT + 官方 App，形成完整的竞争壁垒。

## d. 开发者反馈与局限性

**正面**：
- Google Play + App Store 双平台正式上架，降低用户获取门槛
- 官方参考实现帮助 Android/iOS 开发者快速接入端侧 AI
- Thinking Mode 对用户理解模型推理过程很有教育价值

**局限性**：
- 模型性能受限于手机硬件，旗舰机才能流畅运行 Gemma 4
- FunctionGemma 270M 的设备控制能力非常有限，实际用途还很窄
- 仍是 Beta 版，稳定性不足以作为主力工具
- Gemma 系列模型在中文能力上与 Qwen/Kimi 等有差距
- 国内 Google Play 不可用，需要 APK 侧载

## e. 附带链接
- GitHub: https://github.com/google-ai-edge/gallery
- Google Play: https://play.google.com/store/apps/details?id=com.google.ai.edge.gallery
- App Store: https://apps.apple.com/us/app/google-ai-edge-gallery/id6749645337
- LiteRT: https://github.com/google-ai-edge/LiteRT-LM
