#' Download Party Parrots for Local Use
#'
#' @return character vector of paths to downloaded files, invisibly
#' @export
#'
#' @examples
#' parrot_download()
parrot_download <- function() {
  dir <- parrot_download_dir()
  def <- fs::file_temp(tmp_dir = dir, ext = 'zip')
  curl::curl_download('https://cultofthepartyparrot.com/parrots-8ed4aab076.zip', destfile = def)
  utils::unzip(def, exdir = dir)
  fs::file_delete(def)

  guests <- fs::file_temp(tmp_dir = dir, ext = 'zip')
  curl::curl_download('https://cultofthepartyparrot.com/guests-ba4e03bec0.zip', destfile = guests)
  utils::unzip(guests, exdir = dir)
  fs::file_delete(guests)

  flags <- fs::file_temp(tmp_dir = dir, ext = 'zip')
  curl::curl_download('https://cultofthepartyparrot.com/flags-1f36c9a1bd.zip', destfile = flags)
  utils::unzip(flags, exdir = dir)
  fs::file_delete(flags)

  fs::file_move(
    fs::dir_ls(path = dir, recurse = TRUE, glob = '*.gif'),
    fs::path(dir)
  )

  fs::dir_delete(fs::path(dir, c('flags', 'guests', 'parrots')))

  invisible(fs::dir_ls(path = fs::path(dir), recurse = TRUE, glob = '*.gif'))
}

#' Parrot Download Directory Path
#'
#' @return path to directory
#' @export
#'
#' @examples
#' parrot_download_dir()
parrot_download_dir <- function() {
  user_cache <- getOption('parrot.cache_dir')
  if (!is.null(user_cache)) {
    user_cache
  } else if (getOption('parrot.use_cache', FALSE)) {
    rappdirs::user_cache_dir('parrot')
  } else {
    tempdir()
  }
}
