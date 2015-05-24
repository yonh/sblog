#!/bin/bash

cd $git_src_dir
#git clone https://github.com/yonh/sblog
git pull
cp -r org /opt
/opt/org/build_html.sh
