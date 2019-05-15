#!/bin/sh

markdown-pp proposal.mdpp -o proposal.gen.md
pandoc proposal.gen.md --template=templates/ieee.latex --top-level-division=section --pdf-engine=xelatex -f markdown+fenced_code_attributes -f markdown+multiline_tables -o proposal.pdf
