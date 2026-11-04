---
title: "Madura: A different kind of Hermetic Java"
date: "2026-11-05"
generated: "2026-11-05 07:00"
source: "Reddit"
slug: "2026-11-05_07-madura-hermetic-java"
summary: "11月3日，Elide成员Sam在Java板块发布Madura：把JDK 25的`javac`做成无需目标机JRE或`JAVA_HOME`的自包含编译器，并增加只分析、不生成字节码的`check`模式。本批原始数据没有分数或评论总数；Atom首条的帖子ID、标题与作者均匹配，以下讨论仅代表该源返回时的可见子集。"
---

# Madura: A different kind of Hermetic Java

## 事件背景

11月3日，Elide成员Sam在Java板块发布Madura：把JDK 25的`javac`做成无需目标机JRE或`JAVA_HOME`的自包含编译器，并增加只分析、不生成字节码的`check`模式。本批原始数据没有分数或评论总数；Atom首条的帖子ID、标题与作者均匹配，以下讨论仅代表该源返回时的可见子集。

## 核心观点 / 产品机制

源码显示Kotlin入口直接调用`javac`，GraalVM Native Image把可达代码、运行时和预初始化堆编成原生镜像，`jlink`另备`modules`与`ct.sym`。两份AMD64、ARM64镜像静态链接Cosmopolitan Libc，再由`apelink`合成APE fat binary，运行时选择对应代码段；仓库工作流与约四十一兆字节的发布资产证实这一产物。作者称两架构可共享预初始化heap，但仓库没有分段尺寸或测试独立证明共享比例，宜视为作者口径。

## 社区热议与争议点

Bobby_Bonsaimind认为“一次构建、单件分发”补上现有AOT方案的缺口。idontlikegudeg追问双架构体积、JavaFX与签名；作者答压缩包不足四十兆字节，却承认暂无图形支持。Ok-Scheme-913质疑Cosmo像技巧性编码且不宜生产依赖；作者明确Madura尚不适合生产，甚至还不能供终端用户使用，并把动态JNI、图形与Truffle JIT列为边界。Atom共二十四条entry：一条主帖、十二条普通评论、十一条作者回复、无机器人；它不是完整评论区。

## 行业影响与未来展望

若Cosmo后端进入上游，Java CLI可减少按操作系统和架构重复构建、打包与安装JRE的成本。不过Graal PR仍为开放、冲突且被要求修改，README也标注“不稳定”；现阶段更像可下载实验和工具链验证，不是通用生产Java。仓库已有JAR反射元数据缺失的修复记录，开放的体积闸门也说明兼容与尺寸仍在收敛。

## 附带链接

- [Reddit原帖](https://www.reddit.com/r/java/comments/1xn860a/madura_a_different_kind_of_hermetic_java/)
- [Madura仓库](https://github.com/elide-dev/madura)
- [GraalVM Cosmo PR](https://github.com/oracle/graal/pull/12865)
- [APE规范](https://github.com/jart/cosmopolitan/blob/master/ape/specification.md)
