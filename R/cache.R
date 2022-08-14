#' PokéAPI Cache
#'
#' @description
#' To reduce the amount of API calls, successful results will be stored
#' in a cache and can be retrieved with subsequent calls to the API.
#'
#' @details
#' If you want to call the API each time, set the environment
#' variable `R_POKEAPI_CACHE = FALSE`
#'
#' @param version Version of PokéAPI to use. Default is set to current
#' version available.
#'
#' @return
#' If a cache exists then `clear_pokeapi_cache` will delete all previous data
#' pulls from the PokéAPI.
#'
#' @rdname pokeapi_cache
#' @export
clear_pk_cache <- function(version = POKEAPI_VERSION) {
  cache_dir <- get_pk_cache(version = version)

  if (dir.exists(cache_dir)) {
    cache_files <- list.files(cache_dir, recursive = TRUE, full.names = TRUE)

    sure <- ""
    while (!sure %in% c("Y", "n", "N")) {
      sure <- readline("Are you sure? (Y/n): ")
    }
    if (sure == "Y") {
      unlink(cache_files, recursive = TRUE, force = TRUE)
    }
  } else {
    warning("Unable to find cached directory")
  }
}

#' @noRd
check_pk_cache <- function(category, id, subcategory = NULL) {
  if (use_pk_cache()) {
    id_num <- name_to_id(id, category)
    file.exists(get_pk_cache(category, paste0(id_num, ".rds"), subcategory))
  } else {
    FALSE
  }
}

#' @noRd
read_pk_cache <- function(category, id, subcategory = NULL) {
  id_num <- name_to_id(id, category)
  cache_file <- get_pk_cache(category, paste0(id_num, ".rds"), subcategory)
  readRDS(cache_file)
}

#' @noRd
update_pk_cache <- function(pk_info, category, id, subcategory = NULL) {
  id_num <- name_to_id(id, category)

  cache_dir <- get_pk_cache(category, subcategory)
  if (!dir.exists(cache_dir)) {
    dir.create(cache_dir, recursive = TRUE)
  }
  cache_file <- file.path(cache_dir, paste0(id_num, ".rds"))

  saveRDS(pk_info, cache_file)
}

#' @noRd
get_pk_cache <- function(..., version = POKEAPI_VERSION) {
  cache_dir <- rappdirs::user_cache_dir(
    appname = "pokeapi",
    appauthor = "r-pokeapi",
    version = paste0("v", version)
  )

  subdir <- list(...)
  subdir <- subdir[!vapply(subdir, is.null, logical(1))]

  do.call(file.path, c(list(cache_dir), subdir))
}

#' @noRd
use_pk_cache <- function() {
  isTRUE(as.logical(Sys.getenv("R_POKEAPI_CACHE", "TRUE")))
}
