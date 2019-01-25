function Convert-Absolute {
    Param ([string]$path)
    if ([System.IO.Path]::IsPathRooted($path)) {
        return $path
    }
    return Join-Path $PSScriptRoot $path
}

# general file paths
$templateDir = Convert-Absolute templates/md

# ensure the build directory exists
md -Force (Convert-Absolute build/md_part) | Out-Null

# convert bibliographies to markdown
function Convert-Bib {
    Param ([string]$inFile, [string]$bibliography, [string]$outFile)
    $inFile = Convert-Absolute $inFile
    $bib = Convert-Absolute $bibliography
    $outFile = Convert-Absolute $outFile
    $csl = Convert-Absolute templates/apa.csl
    pandoc $inFile -o $outFile -t gfm --bibliography=$bib --filter=pandoc-citeproc --csl=$csl
    (Get-Content $outFile -Raw -Encoding UTF8 | Out-String) -replace "</?div.*>.*","" | Set-Content $outFile -Encoding UTF8
}

foreach ($name in (Get-ChildItem -Path $templateDir pubs*.md).name) {
    $short = $name -replace "^pubs-",""
    $bib = $short -replace "md$","bib"
    Convert-Bib `
        templates/md/pubs-$short `
        assets/publications/_self-$bib `
        build/md_part/$short
}

# build non pub parts
function Convert-MdPart {
    Param ([string]$inFile, [string]$template, [string]$outFile)
    $inFile = Convert-Absolute $inFile
    $template = Convert-Absolute $template
    $outFile = Convert-Absolute $outFile
    pandoc $inFile --metadata-file=$infile --template=$template -o $outFile
}

foreach ($name in (Get-ChildItem -Path $templateDir -Exclude pubs*.md).name) {
    Convert-MdPart assets/cv.yaml $templateDir/$name build/md_part/$name
}

# build full file
$params = (
    "general_info",
    "articles",
    "software",
    "chapters",
    "in-prep",
    "posters",
    "research_history",
    "teaching_history",
    "service",
    "honors",
    "affiliations"
) | %{Convert-Absolute "build/md_part/$_.md"}

$outputFile = Convert-Absolute build/cv.md
pandoc -o $outputFile $params
pandoc $outputFile -f markdown -t gfm -o $outputFile

# clean up newlines in the full file
(Get-Content $outputFile -Raw -Encoding UTF8) -replace "`n`n","" | Set-Content $outputFile -Encoding UTF8
Copy-Item $outputFile -Destination (Convert-Absolute index.md)
