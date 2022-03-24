# alias pandocker='docker run --rm -v "$(pwd):/pandoc" -u $(id -u):$(id -g) artifactory.arionbanki.is/docker.io-remote/dalibo/pandocker'
# docker run --rm --volume "`pwd`:/data" --user `id -u`:`id -g` artifactory.arionbanki.is/docker.io-remote/pandoc/latex:latest --lua-filter=pagebreak.lua  -f markdown+hard_line_breaks -s '310.md' -t pdf -o 310_A.pdf --highlight-style tango

function doc()
{
  outext=$1
  export SOURCE_DATE_EPOCH=$(git log -1 --pretty=%ct "docs/${fullname}.md")
  echo "$SOURCE_DATE_EPOCH"
  docker run --rm -v "$(pwd):/pandoc" -u $(id -u):$(id -g) -e SOURCE_DATE_EPOCH="$SOURCE_DATE_EPOCH" kristinn/pandocker:buster-full-latest "docs/${fullname}.md" -o "Deliverables/${fullname}.${outext}" \
    --from markdown --filter pandoc-include --template 'lib/ist.tex' --listings --filter pandoc-codeblock-include --filter pandoc-crossref --filter pandoc-mustache \
    --citeproc --top-level-division=chapter --pdf-engine=xelatex \
    --variable 'mainfont:Arial' --variable 'mainfontoptions:Scale=0.94, Extension=.ttf, UprightFont=*, BoldFont=*_Bold, ItalicFont=*_Italic, BoldItalicFont=*_Bold_Italic' \
    --variable 'sansfont:Arial' --variable 'sansfontoptions:Scale=0.94, Extension=.ttf, UprightFont=*, BoldFont=*_Bold, ItalicFont=*_Italic, BoldItalicFont=*_Bold_Italic' \
    --variable 'monofont:YaHei Consolas Hybrid' --variable 'monofontoptions:Scale=1'
}

function ex()
{
  fullname=$1
  echo "$fullname"
  # artifactory.arionbanki.is/docker.io-remote/dalibo/pandocker

  doc "pdf"
  # doc "docx"
}
if [ -f "out/docs/310and313media/AuthFlow1/AuthFlow1.eps" ] 
then 
  cp "out/docs/310and313media/AuthFlow1/AuthFlow1.eps" "lib/media/authtflow1.eps"
fi
# ex "ÍST WA 316_2022 IOBWS 3.0 Technical Guidelines"
ex "ÍST TS 313_2022 Foreign payments"
ex "ÍST TS 310_2022 Domestic payments and deposits"
echo 'done'
# docker run --rm -v "$(pwd):/pandoc" -u $(id -u):$(id -g) artifactory.arionbanki.is/docker.io-remote/dalibo/pandocker 'docs/ÍST TS 313_2021 Foreign payments.md' -o 'docs/ÍST TS 313_2021 Foreign payments.pdf' --from markdown --template 'lib/ist.tex' --listings --filter pandoc-include --filter pandoc-codeblock-include --filter pandoc-crossref --filter pandoc-mustache --top-level-division=chapter
# docker run --rm -v "$(pwd):/pandoc" -u $(id -u):$(id -g) artifactory.arionbanki.is/docker.io-remote/dalibo/pandocker 'docs/ÍST TS 310_2020 Domestic payments and deposits.md' -o 'docs/ÍST TS 310_2020 Domestic payments and deposits.pdf' --from markdown --filter pandoc-include --template 'lib/ist.tex' --listings --filter pandoc-codeblock-include --filter pandoc-crossref --filter pandoc-mustache --top-level-division=chapter
# echo '313'