#' Get Location Information
#'
#' @description
#' A series of functions that pull Pokémon locations data from the PokéAPI
#'
#' @inherit get_pokemon params return details
#'
#' @examplesIf interactive()
#' # Character name
#' get_move("bullet-seed")
#'
#' # ID
#' get_move(331)
#'
#' @seealso \url{https://pokeapi.co/docs/v2#moves-section}
#'
#' @encoding UTF-8
#' @rdname move_info
#' @export
get_move <- function(id) {
  call_pk_api("move", id)
}

#' @rdname move_info
#' @export
get_move_ailment <- function(id) {
  call_pk_api("move-ailment", id)
}

#' @rdname move_info
#' @export
get_move_battle_style <- function(id) {
  call_pk_api("move-battle-style", id)
}

#' @rdname move_info
#' @export
get_move_category <- function(id) {
  call_pk_api("move-category", id)
}

#' @rdname move_info
#' @export
get_move_damage_class <- function(id) {
  call_pk_api("move-damage-class", id)
}

#' @rdname move_info
#' @export
get_move_learn_method <- function(id) {
  call_pk_api("move-learn-method", id)
}

#' @rdname move_info
#' @export
get_move_target <- function(id) {
  call_pk_api("move-target", id)
}
