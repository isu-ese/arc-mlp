#!/bin/sh

markdown-pp report.mdpp -e latexrender -o report.gen.md
sed -e "s/^/    /" < abstract.md > indented-abstract.gen.md
markdown-pp metadata.yml.mdpp -o metadata.gen.yml
pandoc report.gen.md --metadata-file=metadata.gen.yml --template=../templates/ieee.latex --top-level-division=section --pdf-engine=xelatex -F pandoc-crossref -F pandoc-citeproc -f markdown+fenced_code_attributes -f markdown+multiline_tables -o report.gen.pdf
