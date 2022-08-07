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
  cache_dir <- get_pk_cache(version)

  if (dir.exists(cache_dir)) {
    cache_files <- list.files(cache_dir, include.dirs = TRUE)
    unlink(cache_files, recursive = TRUE, force = TRUE)
  } else {
    warning("Unable to find cached directory")
  }
}

#' @noRd
check_pk_cache <- function(category, id) {
  if (use_pk_cache()) {
    id_num <- name_to_id(id, category)
    file.exists(file.path(get_pk_cache(), category, id_num))
  } else {
    FALSE
  }
}

#' @noRd
update_pk_cache <- function(pk_info, category, id) {
  id_num <- name_to_id(id, category)

  cache_dir <- file.path(get_pk_cache(), category)
  if (!dir.exists(cache_dir)) {
    dir.create(cache_dir)
  }

  #TODO: save function - JSON or R list
}

#' @noRd
get_pk_cache <- function(version = POKEAPI_VERSION) {
  rappdirs::user_cache_dir(
    appname = "pokeapi",
    appauthor = "r-pokeapi",
    version = paste0("v", version)
  )
}

#' @noRd
use_pk_cache <- function() {
  isTRUE(as.logical(Sys.getenv("R_POKEAPI_CACHE", "TRUE")))
}
