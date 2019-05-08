function Convert-Absolute {
    Param ([string]$path)
    if ([System.IO.Path]::IsPathRooted($path)) {
        return $path
    }
    return Join-Path $PSScriptRoot $path
}

# general file paths
$bibDir = Convert-Absolute ../publications

# convert bibliographies to markdown
function Convert-Bib {
    Param ([string]$inFile, [string]$bibliography, [string]$outFile)
    $inFile = Convert-Absolute $inFile
    $bib = Convert-Absolute $bibliography
    $outFile = Convert-Absolute $outFile
    $csl = Convert-Absolute apa.csl
    pandoc $inFile -o $outFile -t html --bibliography=$bib --filter=pandoc-citeproc --csl=$csl
    # (Get-Content $outFile -Raw -Encoding UTF8 | Out-String) -replace "</?div.*>.*","" | Set-Content $outFile -Encoding UTF8
    # (Get-Content $outFile -Raw -Encoding UTF8) -replace "(`r?`n){2}",$([Environment]::Newline) | Set-Content $outFile -Encoding UTF8
}

foreach ($file in (Get-ChildItem -Path ../publications _self-*.bib).name) {
    $name = $file -replace "^_self-(.*).bib","`$1"
    Convert-Bib `
        pubs.md `
        ../publications/$file `
        ../../_includes/$name.html
}
