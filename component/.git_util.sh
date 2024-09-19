#!/usr/bin/env bash

# Git相关快捷命令
alias gpm="git pull origin master"
alias gp="git pull"
alias gs="git stash"
alias gsp="git stash pop"


: '
new branch with
- 创建的分支需要不存在
- 校验要有俩个参数
- 当前工作路径要在git仓库下面
使用场景：期望
'
function cherryWithNewBranch() {
    # 1. 切换到主分支
    git checkout master
    # 2. 拉最新代码
    git pull
    # 3. 创建新的分支
    git checkout -b $1
    # 4. 为新分支创建远程分支
    git push --set-upstream origin $1
    # 5. cherry-pick 指定commit
    git cherry-pick $2
}