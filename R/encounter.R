#' Get Encounter Information
#'
#' @description
#' A series of functions that pull encounter data from the PokéAPI
#'
#' @inherit get_pokemon params return details
#'
#' @examplesIf interactive()
#' # Character name
#' get_encounter_method("old-rod")
#'
#' # ID
#' get_encounter_method(1)
#'
#' @seealso \url{https://pokeapi.co/docs/v2#encounters-section}
#'
#' @rdname encounter_info
#' @export
get_encounter_method <- function(id) {
  call_pk_api("encounter-method", id)
}

#' @rdname encounter_info
#' @export
get_encounter_condition <- function(id) {
  call_pk_api("encounter-condition", id)
}

#' @rdname encounter_info
#' @export
get_encounter_condition_value <- function(id) {
  call_pk_api("encounter-condition-value", id)
}
