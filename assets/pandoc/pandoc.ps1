# convert bibliographies to html
foreach ($file in (Get-ChildItem -Path ../publications _self-*.bib).name) {
    $name = $file -replace "^_self-(.*).bib","`$1"
    pandoc pubs.md `
        -o ../../_includes/$name.html `
        -t html `
        --bibliography=../publications/$file `
        --filter=pandoc-citeproc `
        --csl=apa.csl
}
