@echo off
chcp 65001
set FILE=%1%
pandoc --from=docx --to=asciidoc --wrap=none --atx-headers --extract-media=extracted-media %FILE%.docx > %FILE%.asciidoc