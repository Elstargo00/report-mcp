#! /bin/bash

mkdir -p assets styles templates tmp 
touch report.md

pandoc report.md \
--template="templates/default.html" -s -o "tmp/report.html" \
--metadata title="Donaldson SVS1 Report" \
--css="styles/styles.css"

cp styles/styles.css tmp/styles.css
cp -r assets/ tmp/assets/

uv run weasyprint --stylesheet "tmp/styles.css" tmp/report.html report.pdf

rm -r tmp