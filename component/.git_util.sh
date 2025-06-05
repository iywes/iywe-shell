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

:'
清理git本地分支
'
function cleanLocalBranch() {
  # 1. 当前不能删除的分支
  notDeleteBranches=(`git branch --show-current` 'master' 'main' 'release'
   'develop_monthly_first' 'develop_monthly_mid' 'develop_monthly_third' 'develop_monthly_dev')
  # 2. 计算要删除的本地分支
  branches=()
      while IFS= read -r -d $'\n' line; do
          # 提取分支名（去除当前分支标记*和首尾空格）
          branch_name=$(sed -E 's/^\*?[[:space:]]+//' <<< "$line")
          # 过滤掉空行和 detached HEAD 行
          flag=0
          for notDelete in $notDeleteBranches; do
              if [[ $notDelete == $branch_name ]]; then
                flag=1
              fi
          done
          if [[ $flag == 0 ]]; then
            branches+=("$branch_name")
          fi
      done < <(git branch --no-color 2>/dev/null)
  echo "$branches"
  # 3. 删除本地分支
  for branch in $branches; do
    `git branch -d $branch`
    if [[ $? == 0 ]]; then
      echo "delete branch $branch success"
    else
      echo "delete branch $branch fail"
    fi
  done;
}

