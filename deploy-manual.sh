#!/bin/bash

set -e

echo "🚀 开始部署GitBook到GitHub Pages..."

# 先提交源代码变更到source分支
echo "📝 提交源代码变更..."
git add .
if git commit -m "Update source files - $(date +'%Y-%m-%d %H:%M:%S')"; then
    echo "✅ 源代码已提交"
else
    echo "ℹ️  没有源代码变更需要提交"
fi
git push origin master:source

# 构建GitBook
echo "🔨 构建GitBook..."
gitbook build

# 检查构建结果
if [ ! -f "_book/index.html" ]; then
    echo "❌ 构建失败！"
    exit 1
fi

echo "✅ 构建成功！"

# 进入_book目录
cd _book

# 初始化git（如果需要）
if [ ! -d ".git" ]; then
    git init
    git remote add origin https://github.com/Castorice2041/Castorice2041.github.io.git
fi

# 配置git
git config user.name "华深"
git config user.email "your-email@example.com"

# 切换到main分支
git checkout -B main

# 添加.nojekyll文件
echo "" > .nojekyll

# 添加所有文件
git add .

# 提交
git commit -m "Deploy GitBook to GitHub Pages - $(date +'%Y-%m-%d %H:%M:%S')"

# 强制推送到main分支
echo "🚀 推送到GitHub Pages..."
git push origin main --force

cd ..

echo "🎉 部署完成！"
echo "📱 网站地址: https://castorice2041.github.io"
echo "⏰ 通常需要5-10分钟生效"
