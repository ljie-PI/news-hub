---
title: "EvanZhouDev/openai-oauth"
date: "2026-07-27"
generated: "2026-07-27 07:00"
source: "GitHub"
slug: "2026-07-27_07-openai-oauth"
summary: "该项目主打「用你的 ChatGPT 账号免费调用 AI」，解决的核心痛点是：ChatGPT Plus/Pro 用户已经付了月费，却无法像 API Key 那样在自己的应用或脚本里调用官"
---

# EvanZhouDev/openai-oauth

## 定位与痛点剖析

该项目主打「用你的 ChatGPT 账号免费调用 AI」，解决的核心痛点是：ChatGPT Plus/Pro 用户已经付了月费，却无法像 API Key 那样在自己的应用或脚本里调用官方模型。openai-oauth 复用 Codex CLI 的 OAuth 登录态，把订阅账号包装成一个 OpenAI 兼容端点，让开发者无需额外购买 API 额度即可访问 gpt-5.6、gpt-image-2 等最新模型。v2 更进一步推出「Sign in with ChatGPT」按钮，允许终端用户在第三方应用里自带账号消费。

## 核心架构与技术细节

项目为 TypeScript 编写的 monorepo，围绕两个抽象展开：**Credential Sources**（凭证源，如 `@openai-oauth/local` 读取 `~/.codex` 本地凭证、`@openai-oauth/react` 通过浏览器 IndexedDB + WebCrypto 加密存储用户凭证）与 **Client Adapters**（客户端适配器，覆盖 Vercel AI SDK、OpenAI 官方 client 及任意兼容 baseURL/fetch 的客户端）。CLI `npx openai-oauth` 默认在 `127.0.0.1:10531` 起一个本地代理，上游指向 `chatgpt.com/backend-api/codex`，支持 Detached 后台模式、`/v1/responses`、`/v1/chat/completions`、流式、工具调用与推理轨迹。

## 竞品对比与生态站位

相较 LiteLLM、one-api 等聚合网关侧重多厂商 Key 管理，openai-oauth 独辟蹊径直接「盗用」订阅登录态，无需 API Key，成本为零。它深度绑定 Codex 认证体系与 Vercel AI SDK 生态，并以「Sign in with ChatGPT」切入 BYO-account 场景，站位介于开发工具与身份组件之间，独特性较强。

## 开发者反馈与局限性

961 星、单日 +109，热度陡增，但 Issue 区暴露隐忧：多条「dont work any more」「sign-in request expired」反映登录态易失效；置顶问题直指「是否会被封号」的合规与账号风险；图像生成端点返回 Forbidden。社区呼声集中在 Docker 支持（已有 PR）。项目虽已换 Apache-2.0 许可，但绕开官方计费的灰色性质使其长期稳定性存疑。

## 附带链接

- 仓库：https://github.com/EvanZhouDev/openai-oauth
- 在线体验：https://openai-oauth.vercel.app
- NPM：https://www.npmjs.com/package/openai-oauth
