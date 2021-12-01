@echo off
set FILE=%1%
asciidoctor -r asciidoctor-diagram --backend html5 %FILE%.asciidoc