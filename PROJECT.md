# GitBook 博客部署指南

本项目使用 GitBook 构建个人技术博客，并自动部署到 GitHub Pages。

## 项目结构

```
├── README.md           # 项目说明
├── book.json          # GitBook 配置文件
├── SUMMARY.md         # 博客目录结构
├── FOOTER.md          # 页脚内容
├── package.json       # Node.js 依赖配置
├── deploy.sh          # 部署脚本
├── .gitignore         # Git 忽略文件
├── _book/             # 构建输出目录（自动生成）
├── CS-basics/         # 计算机基础文章
├── CS186/             # CS186 课程笔记
├── MIT6.824/          # MIT6.824 分布式系统
├── jdk/               # JDK 源码分析
├── tech/              # 技术分享
├── interview/         # 面试经历
├── redis-mini/        # Redis-mini 项目
└── chatting/          # 随笔
```

## 使用方法

### 1. 本地开发和预览

```bash
# 安装依赖插件
gitbook install

# 本地服务器预览（默认端口 4000）
gitbook serve

# 构建静态文件
gitbook build
```

### 2. 部署到 GitHub Pages

```bash
# 执行部署脚本
./deploy.sh
```

这将：
1. 构建 GitBook
2. 将源代码推送到 `source` 分支
3. 将构建后的文件推送到 `main` 分支（GitHub Pages）

### 3. 访问博客

部署完成后，访问：https://castorice2041.github.io

## 分支说明

- `main`: GitHub Pages 部署分支（存放构建后的 HTML 文件）
- `source`: 源代码分支（存放 Markdown 源文件和配置）

## 添加新文章

1. 在相应目录下创建 `.md` 文件
2. 更新 `SUMMARY.md` 添加新文章链接
3. 运行 `./deploy.sh` 部署

## 插件功能

本博客配置了以下插件，提供丰富的功能：

- **hide-element**: 隐藏 GitBook 链接
- **chapter-fold**: 章节折叠功能
- **katex**: 数学公式支持
- **alerts**: 提示框样式
- **emphasize**: 文本高亮
- **prism**: 代码语法高亮
- **mermaid-gb3**: 流程图支持
- **accordion**: 折叠面板
- **search**: 全文搜索
- **fontsettings**: 字体设置
