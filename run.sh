#!/bin/bash

# org2html
cd /opt/org
./org2html.sh linux-notes.org
mv *.html html/

#ruby /opt/webapp/webrick.rb
cd /opt/webapp
thin start

