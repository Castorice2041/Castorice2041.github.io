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

# 进入_book目录
cd _book

# 初始化git（如果需要）
if [ ! -d ".git" ]; then
    git init
    git remote add origin https://github.com/Castorice2041/Castorice2041.github.io.git
fi

# 添加所有文件
git add .

# 提交
git commit -m "Deploy GitBook to GitHub Pages - $(date +'%Y-%m-%d %H:%M:%S')"

# 强制推送到main分支（GitHub Pages默认分支）
git push -f origin master:main

echo "部署完成！访问 https://castorice2041.github.io 查看您的博客"

cd ..
