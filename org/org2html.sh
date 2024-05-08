#!/bin/sh

name=`basename "$1"`
tmp_file=./$name.html
#echo $tmp_file
#emacs --batch  -infile "$1" -outfile ${tmp_file}
# emacs --batch --script ./org2html.el -infile "$1" -outfile ${tmp_file}

#./org2html.el -infile "$1" -outfile ${tmp_file}

#cat ${tmp_file}
rm -f ${tmp_file}
emacs -l htmlize.el "$1" --batch --eval "(org-html-export-to-html)"
