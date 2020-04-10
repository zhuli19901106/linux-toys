#!/usr/bin/env bash

# Zhu Li, zhuli@4paradigm.com
# 2020.04.10, 21:21

# fail on error
set -x

# install pyenv prerequisites
yum install -y @development zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel xz xz-devel libffi-devel findutils

if [[ ! -d ~/.pyenv ]]; then

# install pyenv
bash pyenv-installer

# add pyenv command to path
echo '
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc

fi

source ~/.bashrc
