#' Get Contest Information
#'
#' @description
#' A series of functions that pull contset data from the PokéAPI
#'
#' @inherit get_pokemon params return details
#'
#' @details
#' `get_contest_effect` and `get_super_contest_effect` only take a numeric ID
#'
#' @examplesIf interactive()
#' # Character name
#' get_contest_type("cool")
#'
#' # ID
#' get_contest_type(2)
#'
#' @seealso \url{https://pokeapi.co/docs/v2#contests-section}
#'
#' @rdname contest_info
#' @export
get_contest_type <- function(id) {
  call_pk_api("contest-type", id)
}

#' @rdname contest_info
#' @export
get_contest_effect <- function(id) {
  call_pk_api("contest-effect", id)
}

#' @rdname contest_info
#' @export
get_super_contest_effect <- function(id) {
  call_pk_api("super-contest-effect", id)
}
