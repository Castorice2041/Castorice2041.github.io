# GitBook 构建脚本

# 如果GitHub Actions继续有问题，您可以在本地运行这个脚本

#!/bin/bash

set -e

echo "开始构建GitBook..."

# 检查Node.js版本
node_version=$(node -v)
echo "当前Node.js版本: $node_version"

# 构建GitBook
echo "构建GitBook..."
gitbook build

# 检查构建结果
if [ -f "_book/index.html" ]; then
    echo "✅ 构建成功！"
    echo "📁 输出目录: _book/"
    ls -la _book/
else
    echo "❌ 构建失败！"
    exit 1
fi

echo "🎉 GitBook构建完成！"
