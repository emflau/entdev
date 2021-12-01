#!/bin/sh
usage() {
	echo "Usage: adoc2pdf.sh file.asciidoc"
	echo "	Convert file.asciidoc to file.pdf"
	echo "file : filename with / without .asciidoc extension"
}

if [ $# -ne 1 ]; then
	usage
	exit 1
fi

FILE=`echo $1 | awk -F.asciidoc '{ print $1 }'`
asciidoctor-pdf -r asciidoctor-diagram ${FILE}.asciidoc
