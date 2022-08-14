#' Get Items Information
#'
#' @description
#' A series of functions that pull Pokémon items data from the PokéAPI
#'
#' @inherit get_pokemon params return details
#'
#' @examplesIf interactive()
#' # Character name
#' get_item("old-rod")
#'
#' # ID
#' get_item(1)
#'
#' @seealso \url{https://pokeapi.co/docs/v2#items-section}
#'
#' @encoding UTF-8
#' @rdname item_info
#' @export
get_item <- function(id) {
  call_pk_api("item", id)
}

#' @rdname item_info
#' @export
get_item_attribute <- function(id) {
  call_pk_api("item-attribute", id)
}

#' @rdname item_info
#' @export
get_item_category <- function(id) {
  call_pk_api("item-category", id)
}

#' @rdname item_info
#' @export
get_item_fling_effect <- function(id) {
  call_pk_api("item-fling-effect", id)
}

#' @rdname item_info
#' @export
get_item_pocket <- function(id) {
  call_pk_api("item-pocket", id)
}
