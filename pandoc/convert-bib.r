convert_bib <- function() {
  library(dplyr)
  library(purrr)
  library(readr)
  library(stringr)

  find_root <- function(current = ".") {
    files <- dir(current, "_data|_includes|_layouts")
    if (length(files) == 0) find_root(file.path(current, "..")) else current
  }

  pandoc_convert <- function(type, out_dir, bib_dir) {
    bib_file <- sprintf("_self-%s.bib", type)
    bib <- sprintf("--bibliography=%s", file.path(bib_dir, bib_file))
    out_file <- sprintf("%s.html", file.path(out_dir, type))
    csl <- "--csl=custom_apa.csl"

    call_string <- sprintf(
      "pandoc pubs_template.md -o %s -t html %s --filter=pandoc-citeproc %s",
      out_file, bib, csl
    )
    system(call_string)
  }

  # customize CSL to sort by year then author
  # don't sort descending here because "submitted" will end up at bottom
  # reverse sorting happens at the end of the walk below
  read_file("apa.csl") %>%
    str_replace(
      '(<sort>\\s+)(<key macro="author"/>\\s+)(<key macro="issued-sort" sort="ascending"/>\\s+)',
      "\\1\\3\\2"
    ) %>%
    write_file("custom_apa.csl")

  # convert files
  out_dir <- file.path(find_root(), "_includes")
  bib_dir <- file.path(find_root(), "_data", "bibtex")

  walk(c("articles", "chapters", "in-prep", "software", "posters"), function(type) {
    pandoc_convert(type, out_dir, bib_dir)
    filename <- sprintf("%s.html", file.path(out_dir, type))
    cleaned <- read_file(filename) %>%
      # strip letters from citation year
      str_replace_all(
        "(&amp; \\w+\\, \\w\\. (?:\\w\\. )*)\\((\\d{4})\\w\\)\\.",
        "\\1(\\2)."
      ) %>%

      # replace (n.d.) with "(under review)" or "(in-prep.)"
      str_replace_all(
        "\\(n\\.d\\.\\)",
        if (type == "in-prep") "(in-prep.)" else "(under review)"
      ) %>%

      # reverse sort by citation year
      ## convert citations to one-liners
      str_remove_all("\r?\n") %>%
      str_replace_all('(</p></div>|role="doc-bibliography">)', "\\1\n") %>%
      ## convert to array
      str_split("\r?\n") %>% .[[1]] %>%
      ## reverse citation order
      {idx <- 2:(length(.) - 1); .[idx] <- .[rev(idx)]; .} %>%

      # write the resulting array
      write_lines(filename)
  })
}

convert_bib()
