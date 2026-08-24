---
title: "Executable Is a SQLite Database"
date: "2026-08-25"
generated: "2026-08-25 07:00"
source: "HN"
slug: "2026-08-25_07-executable-is-a-sqlite-database"
summary: "法里德·扎卡里亚把博士阶段的设想做成SELF原型：可执行文件本身就是能查询、更新的SQLite库，而非描述程序的旁车数据库。该文在本批次冻结为476分、90条评论；调研时运行指定脚本，按默认长度阈值取得38个当前可见节点，两者不混算。"
---

# Executable Is a SQLite Database

## 事件背景

法里德·扎卡里亚把博士阶段的设想做成SELF原型：可执行文件本身就是能查询、更新的SQLite库，而非描述程序的旁车数据库。该文在本批次冻结为476分、90条评论；调研时运行指定脚本，按默认长度阈值取得38个当前可见节点，两者不混算。

## 核心观点 / 产品机制

SELF把元数据、可加载段及符号表写成表与索引，在文件头偏移68处写入SELF标识；Linux的binfmt_misc据魔数交给仍为ELF的self-exec，后者映射、重定位后跳转入口。动态链接既可借rtld-audit让原生加载器执行，也有用SQL解析符号的self-ld。代价是SQLite启动约固定增加5毫秒，段字节还需复制；单文件未裁剪时约为ELF两倍，但裁剪后的coreutils仅大约百分之一。合并723个程序和400个库后，数据库为611.9MiB，反小于644.4MiB原文件总量。

## 社区热议与争议点

支持者jonhohle认为，改代码段、增符号可化为行更新，并复用成熟SQLite库。反方更具体：garganzol与vlovich指出B树中的字节不能像ELF文本段直接mmap，多进程无法共享页，会增加内存与换页压力，这也正是作者承认的基准瓶颈。SmasherEpilepti核对后反驳“SQLite会驻留字符串”；重复文本实际仍重复存储，需另建字符串表去重。catlifeonmars则追问为何不只给ELF套虚拟表查询层，作者回应早先的sqlelf正是该路线，SELF是在继续检验完整替换的收益。

## 行业影响与未来展望

其价值更像可执行格式实验台：事务化修改、依赖外键和单库闭包可让Nix式部署更可审计，也可能减少重复库。不过零拷贝、共享页、安全签名，以及让编译器、链接器和调试工具原生支持新格式，仍比SQL表达力更难；近期更可能用于研究和打包工具，而非替代ELF。

## 附带链接

- [原文](https://fzakaria.com/2026/08/23/your-executable-is-a-sqlite-database)
- [Hacker News讨论](https://news.ycombinator.com/item?id=49415271)
- [SELF代码库](https://github.com/fzakaria/selfdb)
- [binfmt_misc内核文档](https://docs.kernel.org/admin-guide/binfmt-misc.html)
