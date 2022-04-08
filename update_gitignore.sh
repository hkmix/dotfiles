#!/bin/sh

rm -f .gitignore
find . -iname "*.jztmpl" -exec echo "{}" >> .gitignore \;
sed -E -e 's/^\.\///' -e 's/\.jztmpl$//' -i .gitignore
sort -o .gitignore .gitignore
