#!/bin/bash

set -e

if [ "$1" = 'proposal' ]; then
  ./build_latex.sh proposal
  tempdir=$(mktemp -d)

  latexmk -pdf proposal -outdir=$tempdir
  cp -v $tempdir/proposal.pdf ../../dist/proposals/normalize.pdf

  rm -rf $tempdir
  rm -v proposal.gen.md
  rm -v proposal.tex
elif [ "$1" = 'paper' ]; then
  ./build_latex.sh paper
  tempdir=$(mktemp -d)

  latexmk -pdf paper -outdir=$tempdir
  cp -v $tempdir/paper.pdf ../../dist/papers/normalize.pdf

  rm -vrf $tempdir
  rm -v paper.gen.md
  rm -v paper.tex
elif [ "$1" = 'presentation' ]; then
  pp presentation.md > presentation.gen.md
  pandoc $1.gen.md --verbose \
    --template=../../assets/templates/presentation.latex \
    -t beamer \
    --slide-level 1 \
    --pdf-engine=xelatex \
    -f markdown+fenced_code_attributes \
    -f markdown+multiline_tables \
    -o ../../dist/presentations/normalize.pdf
  rm presentation.gen.md
else
  echo "please specify whether to build proposal, paper, or presentation"
fi
