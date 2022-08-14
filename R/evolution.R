#' Get Evolution Information
#'
#' @description
#' A series of functions that pull evolution data from the PokéAPI
#'
#' @inherit get_pokemon params return details
#'
#' @details
#' `get_evolution_chain` requires the Pokémon ID rather than the
#' name of the revelant Pokémon
#'
#' @examplesIf interactive()
#' # Character name
#' get_evolution_trigger("use-item")
#'
#' # ID
#' get_evolution_chain(1)
#'
#' @seealso \url{https://pokeapi.co/docs/v2#evolutions-section}
#'
#' @encoding UTF-8
#' @rdname evolution_info
#' @export
get_evolution_chain <- function(id) {
  call_pk_api("evolution-chain", id)
}

#' @rdname evolution_info
#' @export
get_evolution_trigger <- function(id) {
  call_pk_api("evolution-trigger", id)
}
