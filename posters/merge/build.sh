#!/bin/bash

set -e

tempdir=$(mktemp -d)

latexmk -pdf main.tex -outdir=$tempdir --shell-escape
mkdir -vp ../../dist/posters
cp -v $tempdir/main.pdf ../../dist/posters/merge.pdf

rm -rf $tempdir
