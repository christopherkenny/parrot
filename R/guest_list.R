#' List Available Gifs in Parrot Directory
#'
#' @return character vector of available gifs
#' @export
#'
#' @examples
#' guest_list()
guest_list <- function() {
  dir <- parrot_download_dir()
  fs::dir_ls(path = dir, recurse = TRUE, glob = '*.gif') |>
    fs::path_file() |>
    fs::path_ext_remove()
}
