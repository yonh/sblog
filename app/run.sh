#!/bin/bash

cd /git

# 提取git库名称
git_name=${git_url##*/}
git_name=${git_name%%.*}
export git_src_dir=/git/${git_name}

git clone $git_url

/opt/git_pull.sh

cd /opt/webapp
thin start