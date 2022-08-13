#' Get Pokémon Information
#'
#' @description
#' A series of functions that pull data from the PokéAPI
#'
#' @param id Either the numeric ID of the required item from the category,
#' or the character string of the item
#'
#' @details
#' If you type the wrong name and it's close enough to one of the available
#' names, then the error message will give you the correct spelling.
#'
#' @return
#' A named list of all related data to the requested entity
#'
#' @examplesIf interactive()
#' # Character name
#' get_pokemon("bulbasaur")
#'
#' # ID
#' get_pokemon(1)
#'
#' @seealso \url{https://pokeapi.co/docs/v2}
#'
#' @rdname pokemon
#' @export
get_pokemon <- function(id) {
  call_pk_api("pokemon", id)
}

#' @rdname pokemon
#' @export
get_pokemon_ability <- function(id) {
  call_pk_api("ability", id)
}

#' @rdname pokemon
#' @export
get_pokemon_characteristic <- function(id) {
  call_pk_api("characteristic", id)
}

#' @rdname pokemon
#' @export
get_egg_group <- function(id) {
  call_pk_api("egg-group", id)
}

#' @rdname pokemon
#' @export
get_pokemon_gender <- function(id) {
  call_pk_api("gender", id)
}
