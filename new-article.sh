#!/bin/bash
# 用法: ./new-article.sh 文件名 "文章标题"
# 示例: ./new-article.sh my-thoughts "我的一些思考"

if [ $# -lt 2 ]; then
    echo "用法: ./new-article.sh <文件名> <文章标题>"
    echo "示例: ./new-article.sh my-thoughts \"我的一些思考\""
    exit 1
fi

FILENAME=$1
TITLE=$2
DATE=$(date +"%Y年%-m月")
FILE="articles/${FILENAME}.html"

if [ -f "$FILE" ]; then
    echo "错误: $FILE 已经存在"
    exit 1
fi

cat > "$FILE" << EOF
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${TITLE}</title>
    <link rel="stylesheet" href="../style.css">
</head>
<body>
    <div class="container article">
        <h1>${TITLE}</h1>
        <p class="meta">${DATE}</p>

        <p>在这里写你的文章内容...</p>

        <a href="../index.html" class="back">← 返回首页</a>
    </div>
</body>
</html>
EOF

echo "✓ 文章创建成功: $FILE"
echo "✓ 请编辑 $FILE 填写内容"
echo "✓ 别忘了在 index.html 中添加链接:"
echo "  <li><a href=\"articles/${FILENAME}.html\">${TITLE}</a> <span class=\"date\">${DATE}</span></li>"
