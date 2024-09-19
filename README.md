# iywe-shell

在Shell中，用于提高工作效率的脚本。

## 项目介绍
- `init.sh`是整个项目的入口。
- `template\*`是存放一些通用的模板脚本，项目一般不会使用到这里面的脚本
  - `alias_util.sh`是项目其他功能所需要的别名，需要使用者将其复制粘贴到`person`文件夹里，并按照要求填写自己本地的地址
- `person\*`：是存放使用者自己想添加的脚本信息，不会上传到远程仓库
- `component`是项目功能模块脚本

## 模块
1、`.jdk_util.sh`
- 快速切换命令行的`jdk`版本

2、`.git_util.sh`
- `git`中常见命令的缩写

3、`.ide_util.sh`
- `idea`、`webstorm`应用的命令，用于在命令行快速打开项目

4、`.maven_util.sh`

5、`.homebrew_util.sh`

## 如何使用
1、复制`template\alias_util.sh`到`person`文件夹下，并按照要求填写信息
2、在使用的`shell`初始化脚本中执行`init.sh`
例如在`~/.bash_profile`文件夹下添加

# 未来待做
- 如何做测试，保证项目的可维护性
- 命令太多，如何做提示
