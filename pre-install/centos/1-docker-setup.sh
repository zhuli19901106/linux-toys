#!/usr/bin/env bash
# https://docs.docker.com/engine/install/centos/

# Zhu Li, zhuli@4paradigm.com
# 2020.04.08, 08:42

# docker version
DOCKER_VERSION=18.09.1

# fail on error
set -x

# remove legacy docker installation
yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine

# install basic utils
yum install -y yum-utils

# add docker repo
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

# install Docker engine and CLI
yum install -y docker-ce-$DOCKER_VERSION docker-ce-cli-$DOCKER_VERSION containerd.io

# start docker service
systemctl start docker

# test docker 101
docker run hello-world

# add docker autocompletion
echo "
source /usr/share/bash-completion/completions/docker" >> ~/.bashrc

source ~/.bashrc
