#!/bin/bash

set -e

mkdir -p ./img
pp $1.md > $1.gen.md

pandoc $1.gen.md \
  --template=../assets/templates/ieee.latex \
  --top-level-division=section \
  --bibliography=../isu-ese.json \
  --csl=../assets/csl/ieee.csl \
  --toc \
  --toc-depth=2 \
  -F pandoc-crossref -M "crossrefYaml=../config/crossref/crossrefIEEE.yml" \
  -f markdown+fenced_code_attributes+multiline_tables+tex_math_single_backslash+fenced_divs \
  -o $1.gen.tex \
  --listings
