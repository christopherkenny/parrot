#' Print a Party Parrot to the Viewer
#'
#' @param parrot name of parrot gif
#' @param ... additional arguments to pass to `htmltools::div()`
#' @param height height of the parrots. Default is 30. Larger may work well for HD parrots.
#'
#' @return HTML version of the parrot
#' @export
#'
#' @examples
#' party('parrot')
#' party(c('parrot', 'sadparrot', 'zimbabweparrot'))
party <- function(parrot, ..., height = 30) {
  dir <- parrot::parrot_download_dir()
  htmltools::div(
    lapply(parrot, function(x)
      htmltools::img(src = base64enc::dataURI(file = fs::path(dir, x, ext = 'gif'),
                                              mime = 'image/gif'), height = height)
    ),...
  ) |>
    htmltools::browsable()
}

#' Return HTML format of Party Parrots
#'
#' @param parrot name of parrot(s) gif
#' @param ... additional arguments to pass to `htmltools::div()`
#' @param height height of the parrots. Default is 30. Larger may work well for HD parrots.
#'
#' @return HTML div containing parrots
#' @export
#'
#' @examples
#' party_html('parrot')
#' party_html(c('parrot', 'sadparrot', 'zimbabweparrot'))
party_html <- function(parrot, height = 30) {
  dir <- parrot::parrot_download_dir()
  htmltools::div(
    lapply(parrot, function(x)
      htmltools::img(src = base64enc::dataURI(file = fs::path(dir, x, ext = 'gif'),
                                              mime = 'image/gif'), height = 30)
    )
  )
}

#' Return Markdown format of Party Parrots
#'
#' @param parrot name of parrot(s) gif
#' @param ... additional arguments to pass to `htmltools::div()`
#' @param height height of the parrots. Default is 30. Larger may work well for HD parrots.
#'
#' @return HTML div containing parrots
#' @export
#'
#' @examples
#' party_md('parrot')
#' party_md(c('parrot', 'sadparrot', 'zimbabweparrot'))
party_md <- function(parrot, height = 30) {
  dir <- parrot::parrot_download_dir()
  vapply(parrot, function(x) {paste0("![](", fs::path(dir, x, ext = 'gif'), ")")}, FUN.VALUE = character(1))
}
