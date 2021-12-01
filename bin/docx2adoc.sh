#!/bin/sh
#chcp 65001

usage() {
	echo "$0 infile[.docx]"
	echo "\tconvert the infile.docx (MS Word doc) to infile.asciidoc (Asciidoc format)"
	echo ""
	echo "infile:	the input file"
}

if [ $# -ne 1 ]; then
	usage
	exit 1
fi

FILE=`echo $1 | awk -F.docx '{print $1}'`
pandoc --from=docx --to=asciidoc --wrap=none --atx-headers --extract-media=images ${FILE}.docx > ${FILE}.asciidoc
