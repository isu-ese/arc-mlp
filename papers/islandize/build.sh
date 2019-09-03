#!/bin/bash

set -e

if [ $1 == 'proposal' ]; then
  ./build_latex.sh proposal
  tempdir=$(mktemp -d)

  latexmk -pdf proposal -outdir=$tempdir
  cp $tempdir/proposal.pdf ../../dist/proposals/islandize.pdf

  rm -rf $tempdir
  rm proposal.gen.md
  rm proposal.tex
elif [ $1 == 'paper' ]; then
  ./build_latex.sh paper
  tempdir=$(mktemp -d)

  latexmk -pdf paper -outdir=$tempdir
  cp $tempdir/paper.pdf ../../dist/papers/islandize.pdf

  rm -rf $tempdir
  rm paper.gen.md
  rm paper.tex
elif [ $1 == 'presentation' ]; then
  pp presentation.md > presentation.gen.md
  pandoc $1.gen.md --verbose \
    --template=../../assets/templates/presentation.latex \
    -t beamer \
    --slide-level 1 \
    --pdf-engine=xelatex \
    -f markdown+fenced_code_attributes \
    -f markdown+multiline_tables \
    -o ../../dist/presentations/islandize.pdf
  rm presentation.gen.md
fi
