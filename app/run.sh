#!/bin/bash

# org2html
cd /opt/org
./org2html.sh linux-notes.org
./org2html.sh sync-github-and-osc.org
./org2html.sh index.org
mkdir /opt/org/html
mv *.html html/

#ruby /opt/webapp/webrick.rb
cd /opt/webapp
thin start

