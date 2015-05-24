#!/bin/bash

/opt/org/build_html.sh

#ruby /opt/webapp/webrick.rb
cd /opt/webapp
thin start

