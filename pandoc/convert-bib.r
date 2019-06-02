convert_bib <- function() {
  # requires purrr and readr

  find_root <- function(current_dir = ".") {
    files <- dir(current_dir, "_data|_includes|_layouts")
    if (length(files) == 0) {
      current_dir <- find_root(file.path(current_dir, ".."))
    }
    current_dir
  }

  pandoc_convert <- function(type, out_dir, bib_dir) {
    bib_file <- sprintf("_self-%s.bib", type)
    bib <- sprintf("--bibliography=%s", file.path(bib_dir, bib_file))
    out <- sprintf("-o %s.html", file.path(out_dir, type))
    csl <- "--csl=apa.csl"

    call_string <- sprintf(
      "pandoc pubs_template.md %s -t html %s --filter=pandoc-citeproc %s",
      out, bib, csl
    )
    system(call_string)
  }

  fix_nd <- function(type, replacement, html_dir) {
    html_file <- sprintf("%s.html", file.path(html_dir, type))
    raw_text <- readr::read_file(html_file)
    mod_text <- gsub("\\(n\\.d\\.\\)", sprintf("(%s)", replacement), raw_text)
    readr::write_file(mod_text, html_file)
  }

  root_dir <- find_root()
  out_dir <- file.path(root_dir, "_includes")
  bib_dir <- file.path(root_dir, "_data", "bibtex")

  purrr::walk(c("articles", "chapters", "in-prep", "software", "posters"),
              pandoc_convert, out_dir = out_dir, bib_dir = bib_dir)
  purrr::walk2(c("articles", "in-prep"), c("under review", "in-prep."),
               fix_nd, html_dir = out_dir)

  invisible(NULL)
}

convert_bib()
