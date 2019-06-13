#!/bin/bash

set -e

pp $1.md -img=img.gen.pp > $1.gen.md

pandoc $1.gen.md \
  --template=../templates/ieee.latex \
  --top-level-division=section \
  --bibliography=../isu-ese.json \
  --csl=../ieee.csl \
  -F pandoc-crossref \
  -f markdown+fenced_code_attributes+multiline_tables+tex_math_single_backslash+fenced_divs \
  -o $1.gen.tex
