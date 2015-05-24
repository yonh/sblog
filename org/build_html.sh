#!/bin/sh
/opt/git_pull.sh
# org2html
cd /opt/org
ruby /opt/org/build.rb
#./org2html.sh linux-notes.org
#./org2html.sh sync-github-and-osc.org
#./org2html.sh index.org
#mkdir /opt/org/html
mv *.html html/
