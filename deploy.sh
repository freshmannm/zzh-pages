#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

# 生成静态文件
npm run docs:build

git add .

git commit -m 'deploy'

# 如果发布到 https://<USERNAME>.github.io/<REPO>
# 检查是否有未提交的更改
if [ -n "$(git status --porcelain)" ]; then
    # 如果有未提交的更改，则执行npm上传自动更新
    npm version patch  # 可根据需要选择 patch、minor 或者 major

    # 提交本次更改内容
    git add .
    git commit -m "Auto commit for version bump"

    # 推送更改到远程仓库
    git push origin main

    # 再次检查是否有未提交的更改
    if [ -n "$(git status --porcelain)" ]; then
        # 如果有未提交的更改，则执行自动提交
        git add .
        git commit -m "Auto commit for daily update"
        git push origin main
        echo "Daily update committed."
    else
        echo "No changes to commit today."
    fi
else
    echo "No changes to commit."
fi
