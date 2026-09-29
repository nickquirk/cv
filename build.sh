#!/bin/sh
set -e
typst compile --font-path fonts cv.typ Nick-Quirk-CV.pdf
for f in role-*.typ; do
  name="${f#role-}"
  typst compile --font-path fonts "$f" "Nick-Quirk-CV-${name%.typ}.pdf"
done
echo "Built: $(ls Nick-Quirk-CV*.pdf | tr '\n' ' ')"