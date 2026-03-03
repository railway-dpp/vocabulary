cp ../../../src/template.html template.html
cp ../../../src/vocabulary.yml vocabulary.yml
npx yml2vocab -c
sed -i.bak '1,/# Context files and their mentions/!d' vocabulary.ttl

cp ../../../src/class-diagram.mermaid class-diagram.mermaid
npx -p @mermaid-js/mermaid-cli mmdc -i class-diagram.mermaid -o class-diagram.svg
