#!/bin/bash

ROOT=$(pwd)
md=""
pdf=""

if [[ -z $1 ]]; then
    md="cv.md"
else
    md=$1
fi

pdf="${md[@]:0:${#md}-3}.pdf"

docker run --rm \
    --volume "`pwd`:/data" \
    --user `id -u`:`id -g` \
    kakalin/pandoc:2.19_textlive --pdf-engine=xelatex \
    --template=eisvogel.tex \
    --listings \
    $md -o $pdf
