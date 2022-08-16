#' Find Category ID
#' @noRd
name_to_id <- function(id, category) {
  if (is.numeric(id) || is.null(id)) {
    id
  } else {
    find_numeric_id(id, category)
  }
}

#' @noRd
find_numeric_id <- function(id_char, category, tolerance = 3) {
  category_clean <- clean_category(category)
  check_category(category_clean, tolerance = tolerance, named = TRUE)

  category_df <- pk_ids[[category_clean]]
  values <- category_df$name
  id_row <- subset(category_df, values == id_char)

  if (nrow(id_row) == 1) {
    id_row$id
  } else {
    typo_dist <- adist(id_char, values)[1, ]

    if (any(typo_dist <= tolerance)) {
      extra <- paste0(" Did you mean ", toString(values[typo_dist <= tolerance]), "?")
    } else {
      extra <- ""
    }
    stop("Unable to find ",  id_char, " in the ", category, " category.", extra)
  }
}

#' @noRd
check_category <- function(category, tolerance = 3, named = FALSE) {
  if (named) {
    categories <- CATEGORIES_NAMED
  } else {
    categories <- CATEGORIES
  }

  if (isFALSE(category %in% categories)) {
    typo_dist <- adist(category, categories)[1, ]

    if (any(typo_dist <= tolerance)) {
      extra <- paste0(" Did you mean ", toString(categories[typo_dist <= tolerance]), "?")
    } else {
      extra <- ""
    }
    stop("Unable to find selected category.", extra)
  }
}
