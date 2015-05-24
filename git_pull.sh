#!/bin/bash

cd $git_src_dir
#git clone https://github.com/yonh/sblog
git pull
cp -r org /opt

cd /opt/org
ruby /opt/org/build.rb
mv *.html html/
#/opt/org/build_html.sh
