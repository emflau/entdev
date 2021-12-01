#!/bin/sh
usage() {
	echo "Usage: adoc2html5.sh file.asciidoc"
	echo "	Convert file.asciidoc to file.html using html5"
	echo "file : filename with / without .asciidoc extension"
}

if [ $# -ne 1 ]; then
	usage
	exit 1
fi

FILE=`echo $1 | awk -F.asciidoc '{ print $1 }'`
asciidoctor -r asciidoctor-diagram --backend html5 ${FILE}.asciidoc
