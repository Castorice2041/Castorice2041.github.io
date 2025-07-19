#!/bin/bash

# 构建GitBook
echo "正在构建GitBook..."
gitbook build

# 检查构建是否成功
if [ $? -ne 0 ]; then
    echo "GitBook构建失败"
    exit 1
fi

echo "构建完成！"

# 先提交源代码变更到source分支
echo "提交源代码变更..."
git add .
git commit -m "Update source files - $(date +'%Y-%m-%d %H:%M:%S')"
git push origin master:source

# 进入_book目录进行部署
cd _book

# 添加所有文件
git add .

# 提交
git commit -m "Deploy GitBook to GitHub Pages - $(date +'%Y-%m-%d %H:%M:%S')"

# 推送到main分支（GitHub Pages分支）
git push origin main

echo "部署完成！"
echo "源代码已推送到 source 分支"
echo "网站已部署到 main 分支"
echo "访问 https://castorice2041.github.io 查看您的博客"

cd ..
