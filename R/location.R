#' Get Location Information
#'
#' @description
#' A series of functions that pull Pokémon locations data from the PokéAPI
#'
#' @inherit get_pokemon params return details
#'
#' @examplesIf interactive()
#' # Character name
#' get_location("celadon-city")
#'
#' # ID
#' get_location(67)
#'
#' @seealso \url{https://pokeapi.co/docs/v2#locations-section}
#'
#' @encoding UTF-8
#' @rdname location_info
#' @export
get_location <- function(id) {
  call_pk_api("location", id)
}

#' @rdname location_info
#' @export
get_location_area <- function(id) {
  call_pk_api("location-area", id)
}

#' @rdname location_info
#' @export
get_pal_park_area <- function(id) {
  call_pk_api("pal-park-area", id)
}
