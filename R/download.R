#' Download Party Parrots for Local Use
#'
#' @return character vector of paths to downloaded files, invisibly
#' @export
#'
#' @examples
#' parrot_download()
parrot_download <- function() {
  dir <- parrot_download_dir()

  main_page <- fs::file_temp(ext = 'html')
  curl::curl_download('https://cultofthepartyparrot.com/', main_page)
  lines <- readLines(main_page)
  patt <- 'parrots\\-.+\\.zip'
  line <- lines[grep(patt, x = lines)[1]]
  par_numb <- regmatches(line, gregexpr(patt, line))[[1]]


  def <- fs::file_temp(tmp_dir = dir, ext = 'zip')
  curl::curl_download(paste0('https://cultofthepartyparrot.com/', par_numb), destfile = def)
  utils::unzip(def, exdir = dir)
  fs::file_delete(def)

  lines <- readLines(main_page)
  patt <- 'guests\\-.+\\.zip'
  line <- lines[grep(patt, x = lines)[1]]
  gue_numb <- regmatches(line, gregexpr(patt, line))[[1]]

  guests <- fs::file_temp(tmp_dir = dir, ext = 'zip')
  curl::curl_download(paste0('https://cultofthepartyparrot.com/', gue_numb), destfile = guests)
  utils::unzip(guests, exdir = dir)
  fs::file_delete(guests)

  fs::file_delete(main_page)

  flag_page <- fs::file_temp(ext = 'html')
  curl::curl_download('https://cultofthepartyparrot.com/flags.html', flag_page)
  lines <- readLines(flag_page)
  patt <- 'flags\\-.+\\.zip'
  line <- lines[grep(patt, x = lines)[1]]
  fla_numb <- regmatches(line, gregexpr(patt, line))[[1]]

  flags <- fs::file_temp(tmp_dir = dir, ext = 'zip')
  curl::curl_download(paste0('https://cultofthepartyparrot.com/', fla_numb), destfile = flags)
  utils::unzip(flags, exdir = dir)
  fs::file_delete(flags)

  fs::file_delete(flag_page)

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
