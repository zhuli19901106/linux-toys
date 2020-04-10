#!/usr/bin/env bash

# Zhu Li, zhuli@4paradigm.com
# 2020.04.10, 21:19

# fail on error
set -x

# add third party repo
rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-2.el7.elrepo.noarch.rpm

# install useful stuff
yum install -y epel-release coreutils moreutils lrzsz git gcc gcc-c++ tmux screen jq bmon nc iotop bzip2

# add bash color
echo "
source /etc/bash_completion.d/git

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1='\[\033[38;5;87m\]\u\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;119m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\] [\[$(tput sgr0)\]\[\033[38;5;198m\]\t\[$(tput sgr0)\]\[\033[38;5;15m\]] {\[$(tput sgr0)\]\[\033[38;5;81m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]}$(parse_git_branch)\n\[$(tput sgr0)\]\[\033[38;5;2m\]--\[$(tput sgr0)\]\[\033[38;5;118m\]>\[$(tput sgr0)\]\[\033[38;5;15m\]\\$ \[$(tput sgr0)\]'" >> ~/.bashrc

# install ansible
yum install -y ansible

source ~/.bashrc
