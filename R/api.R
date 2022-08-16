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
#' @param subcategory For the Pokémon category, there are some subcategories like
#' `"encounter"`. Most endpoints do not have one, so the default is `NULL`
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
#' @encoding UTF-8
call_pk_api <- function(category, id = NULL, subcategory = NULL) {
  category_clean <- clean_category(category)
  check_category(category_clean)

  id_num <- name_to_id(id, category_clean)
  subcategory_clean <- clean_category(subcategory)

  if (check_pk_cache(category_clean, id_num, subcategory_clean)) {
    return(read_pk_cache(category_clean, id_num, subcategory_clean))
  }

  response <- httr2::request(POKEAPI_BASE_URL) |>
    httr2::req_url_path_append(category_clean, id_num, subcategory_clean) |>
    httr2::req_perform() |>
    httr2::resp_body_json()

  if (use_pk_cache()) {
    update_pk_cache(response, category_clean, id_num, subcategory_clean)
  }

  response
}

#' Get Category IDs
#'
#' @description
#' Find all available IDs of a particular categery/endpoint
#'
#' @details
#' The default limit and offset values should be enough for you
#' to pull all of the required IDs of any category.
#'
#' To see a list of all categories use `list_categories()`
#'
#' @param category Name of the endpoint
#' @param limit Maximum number of IDs to pull. Default is `10000`
#' @param offset Number to offset from first ID. Default is `0`
#'
#' @examplesIf interactive()
#' # Find relevant category
#' list_categories()
#'
#' # Pull IDs
#' get_category_ids("berry")
#'
#' @export
get_category_ids <- function(category, limit = 10000, offset = 0) {
  category_clean <- clean_category(category)
  check_category(category_clean)

  response <- httr2::request(POKEAPI_BASE_URL) |>
    httr2::req_url_path_append(category_clean) |>
    httr2::req_url_query(limit = limit, offset = offset) |>
    httr2::req_perform() |>
    httr2::resp_body_json(simplifyDataFrame = TRUE)

  results <- response$results
  results$id <- as.integer(basename(results$url))
  if ("name" %in% names(results)) {
    results[, c("name", "id", "url")]
  } else {
    results[, c("id", "url")]
  }
}

#' @rdname get_category_ids
#' @export
list_categories <- function() {
  categories <- vapply(
    names(CATEGORIES_LIST),
    \(x) {
      category <- paste0(x, ": ", toString(CATEGORIES_LIST[[x]]))
      category <- strwrap(category, exdent = nchar(x) + 2)
      paste(category, collapse = "\n")
    },
    character(1)
  )
  cat("Categories:\n", paste(categories, collapse = "\n"), "\n", sep = "")
}
