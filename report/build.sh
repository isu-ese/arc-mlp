#!/bin/sh

markdown-pp report.mdpp -e latexrender -o report.gen.md
pandoc report.gen.md --template=../templates/ieee.latex --top-level-division=section --pdf-engine=xelatex -F pandoc-crossref -F pandoc-citeproc -f markdown+fenced_code_attributes -f markdown+multiline_tables -o report.pdf
