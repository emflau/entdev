@echo off
set FILE=%1%
asciidoctor --backend pdf %FILE%.asciidoc