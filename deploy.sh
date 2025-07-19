#!/bin/bash

set -e

echo "开始GitBook部署流程..."

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
git commit -m "Update source files - $(date +'%Y-%m-%d %H:%M:%S')" || echo "没有更改需要提交"
git push origin master:source

echo "开始部署到main分支..."

# 临时保存当前分支
current_branch=$(git branch --show-current)

# 切换到一个干净的main分支
git checkout --orphan temp-main

# 删除所有文件，只保留_book内容
git rm -rf . 2>/dev/null || true

# 复制_book内容到根目录
cp -r _book/* .
cp _book/.* . 2>/dev/null || true

# 添加.nojekyll文件
touch .nojekyll

# 添加所有文件
git add .

# 提交
git commit -m "Deploy GitBook to GitHub Pages - $(date +'%Y-%m-%d %H:%M:%S')"

# 强制推送到main分支
git push origin temp-main:main --force

# 切回原分支并删除临时分支
git checkout $current_branch
git branch -D temp-main

echo "部署完成！"
echo "源代码已推送到 source 分支"
echo "网站已部署到 main 分支"
echo "访问 https://castorice2041.github.io 查看您的博客"
