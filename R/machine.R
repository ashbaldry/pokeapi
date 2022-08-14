#' Get TM/HM Information
#'
#' @description
#' A series of functions that pull Pokémon machine data from the PokéAPI
#'
#' @inherit get_pokemon params return details
#'
#' @details
#' `get_machine` only takes a numeric ID
#'
#' @examplesIf interactive()
#' get_machine(67)
#'
#' @seealso \url{https://pokeapi.co/docs/v2#machines-section}
#'
#' @encoding UTF-8
#' @rdname machine_info
#' @export
get_machine <- function(id) {
  call_pk_api("machine", id)
}
