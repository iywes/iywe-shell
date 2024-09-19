#!/usr/bin/env bash

SHELL_FOLDER=$(cd "$(dirname "$0")";pwd)
# 刷新后面脚本所需要用到的别名
source $SHELL_FOLDER/person/alias_util.sh

# 刷新需要的模块功能
source $SHELL_FOLDER/component/.jdk_util.sh
source $SHELL_FOLDER/component/.git_util.sh
source $SHELL_FOLDER/component/.ide_util.sh
source $SHELL_FOLDER/component/.maven_util.sh

# HomeBrew
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
# HomeBrew END