#!/bin/sh

rm -f .gitignore
find . -iname "*.jztmpl" -exec echo "{}" >> .gitignore \;
sed -E -e 's/^\.\///' -e 's/\.jztmpl$//' -i .gitignore
sort -o .gitignore .gitignore

for file in $(< .gitignore); do
    git ls-files --error-unmatch "$file" >/dev/null 2>&1 && git rm --cached "$file"
done
