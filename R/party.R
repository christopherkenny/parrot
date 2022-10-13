#' Print a Party Parrot to the Viewer
#'
#' @param parrot name of parrot gif
#' @param ... additional arguments to pass to `htmltools::div()`
#'
#' @return HTML version of the parrot
#' @export
#'
#' @examples
#' party('parrot')
#' party(c('parrot', 'sadparrot', 'zimbabweparrot'))
party <- function(parrot, ...) {
  dir <- parrot::parrot_download_dir()
  htmltools::div(
    lapply(parrot, function(x)
      htmltools::img(src = base64enc::dataURI(file = fs::path(dir, x, ext = 'gif'),
                                              mime = 'image/gif'), height = 30)
    ),...
  ) |>
    htmltools::browsable()
}
