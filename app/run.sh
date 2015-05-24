#!/bin/bash

cd /git

git clone $git_url

/opt/git_pull.sh

#ruby /opt/webapp/webrick.rb
cd /opt/webapp
thin start

