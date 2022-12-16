#!/bin/bash

md_file=""
pdf_file=""

if [[ -z $1 ]]; then
    md_file="cv.md"
else
    md_file=$1
fi

pdf_file="${md_file[@]:0:${#md_file}-3}.pdf"

/usr/local/bin/pandoc \
    --pdf-engine=xelatex \
    --template=eisvogel.tex \
    --listings \
    $md_file -o $pdf_file

echo "::set-output name=pdf_file::$pdf_file"
