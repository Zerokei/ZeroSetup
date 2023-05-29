#!/bin/bash

# 设置工作目录
WORKING_DIR=$1

# Install fish
# sudo apt install -y software-properties-common
# sudo add-apt-repository -y ppa:neovim-ppa/stable
# sudo apt update
sudo apt install -y fish

# Install vim and config vimrc
sudo apt install -y vim
# 如果 ~/.vimrc 存在或为链接，则删除
if [ -f ~/.vimrc ] || [ -L ~/.vimrc ]; then
    rm ~/.vimrc
fi
ln -s $WORKING_DIR/.vimrc ~/.vimrc