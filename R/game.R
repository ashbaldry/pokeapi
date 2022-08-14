#' Get Games Information
#'
#' @description
#' A series of functions that pull Pokémon games data from the PokéAPI
#'
#' @inherit get_pokemon params return details
#'
#' @examplesIf interactive()
#' # Character name
#' get_generation("generation-iii")
#'
#' # ID
#' get_generation(3)
#'
#' @seealso \url{https://pokeapi.co/docs/v2#games-section}
#'
#' @encoding UTF-8
#' @rdname game_info
#' @export
get_generation <- function(id) {
  call_pk_api("generation", id)
}

#' @rdname game_info
#' @export
get_pokedex <- function(id) {
  call_pk_api("pokedex", id)
}

#' @rdname game_info
#' @export
get_version <- function(id) {
  call_pk_api("version", id)
}

#' @rdname game_info
#' @export
get_version_groups <- function(id) {
  call_pk_api("version-group", id)
}
