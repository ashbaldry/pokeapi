#' API Call Wrapper
#'
#' @description
#' A basic wrapper that can handle all category and ID queries from the
#' PokéAPI.
#'
#' @details
#' This function also handles looking at the cache to see whether the
#' data has already been pulled and can easily be loaded rather than
#' call the API each time.
#'
#' @param category Name of the category endpoint to pull data from
#' @param id Either the numeric ID or the name of the item required from `category`
#'
#' @return
#' A named list of all related data to the requested category and ID
#'
#' @examplesIf interactive()
#' # Pokemon
#' call_pk_api("pokemon", "bulbasaur")
#'
#' # Generation 7
#' call_pk_api("generation", 7)
#'
#' @export
call_pk_api <- function(category, id = NULL) {
  id_num <- name_to_id(id, category)

  if (check_pk_cache(category, id_num)) {
    return(read_pk_cache(category, id_num))
  }

  response <- httr2::request(POKEAPI_BASE_URL) |>
    httr2::req_url_path_append(category, id_num) |>
    httr2::req_perform() |>
    httr2::resp_body_json(simplifyVector = TRUE, simplifyDataFrame = TRUE)

  if (use_pk_cache()) {
    update_pk_cache(response, category, id_num)
  }

  response
}

#' @export
call_pk_resource_list <- function(endpoint, limit, offset) {

}
