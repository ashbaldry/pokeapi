#' Get Berry Information
#'
#' @description
#' A series of functions that pull berry data from the PokéAPI
#'
#' @inherit get_pokemon params return details
#'
#' @examplesIf interactive()
#' # Character name
#' get_berry("rawst")
#'
#' # ID
#' get_berry(1)
#'
#' @seealso \url{https://pokeapi.co/docs/v2#berries-section}
#'
#' @rdname berry_info
#' @export
get_berry <- function(id) {
  call_pk_api("berry", id)
}

#' @rdname berry_info
#' @export
get_berry_firmness <- function(id) {
  call_pk_api("berry-firmness", id)
}

#' @rdname berry_info
#' @export
get_berry_flavour <- function(id) {
  call_pk_api("berry-flavor", id)
}

#' @rdname berry_info
#' @export
get_berry_flavor <- function(id) {
  call_pk_api("berry-flavor", id)
}
