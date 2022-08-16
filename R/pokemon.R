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
#' @seealso \url{https://pokeapi.co/docs/v2#pokemon-section}
#'
#' @encoding UTF-8
#' @rdname pokemon_info
#' @export
get_pokemon <- function(id) {
  call_pk_api("pokemon", id)
}

#' @rdname pokemon_info
#' @export
get_ability <- function(id) {
  call_pk_api("ability", id)
}

#' @rdname pokemon_info
#' @export
get_characteristic <- function(id) {
  call_pk_api("characteristic", id)
}

#' @rdname pokemon_info
#' @export
get_egg_group <- function(id) {
  call_pk_api("egg-group", id)
}

#' @rdname pokemon_info
#' @export
get_gender <- function(id) {
  call_pk_api("gender", id)
}

#' @rdname pokemon_info
#' @export
get_growth_rate <- function(id) {
  call_pk_api("growth-rate", id)
}

#' @rdname pokemon_info
#' @export
get_nature <- function(id) {
  call_pk_api("nature", id)
}

#' @rdname pokemon_info
#' @export
get_pokeathlon_stat <- function(id) {
  call_pk_api("pokeathlon-stat", id)
}

#' @rdname pokemon_info
#' @export
get_pokemon_location_area <- function(id) {
  call_pk_api("pokemon", id, "encounters")
}

#' @rdname pokemon_info
#' @export
get_pokemon_colour <- function(id) {
  call_pk_api("pokemon-color", id)
}

#' @rdname pokemon_info
#' @export
get_pokemon_color <- function(id) {
  call_pk_api("pokemon-color", id)
}

#' @rdname pokemon_info
#' @export
get_pokemon_form <- function(id) {
  call_pk_api("pokemon-form", id)
}

#' @rdname pokemon_info
#' @export
get_pokemon_habitat <- function(id) {
  call_pk_api("pokemon-habitat", id)
}

#' @rdname pokemon_info
#' @export
get_pokemon_shape <- function(id) {
  call_pk_api("pokemon-shape", id)
}

#' @rdname pokemon_info
#' @export
get_pokemon_species <- function(id) {
  call_pk_api("pokemon-species", id)
}

#' @rdname pokemon_info
#' @export
get_stat <- function(id) {
  call_pk_api("stat", id)
}

#' @rdname pokemon_info
#' @export
get_type <- function(id) {
  call_pk_api("type", id)
}
