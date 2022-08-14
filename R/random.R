#' Get Random Category ID
#'
#' @description
#' To make random teams/moves, use this to get a random ID to pull
#' from the PokéAPI.
#'
#' @details
#' This uses internal data, so may not include the latest information.
#'
#' @param category Name of the category endpoint to pull data from
#'
#' @encoding UTF-8
#' @export
random_pk_id <- function(category) {
  category_clean <- clean_category(category)
  check_category(category_clean)

  sample(pk_ids[[category_clean]]$id, 1)
}
