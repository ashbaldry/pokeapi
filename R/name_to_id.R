#' @noRd
name_to_id <- function(id, category) {
  if (is.numeric(id)) {
    id
  } else {
    find_numeric_id(id, category)
  }
}

#' @noRd
find_numeric_id <- function(id_char, category) {
  category_clean <- clean_category(category)
  categories <- names(pk_ids)

  if (isFALSE(category_clean %in% categories)) {
    typo_dist <- adist(category_clean, categories)[1, ]

    if (any(typo_dist == 1)) {
      extra <- paste0(" Did you mean ", toString(categories[typo_dist == 1]), "?")
    } else {
      extra <- ""
    }
    stop("Unable to find selected category.", extra)
  }

  category_df <- pk_ids[[category_clean]]
  values <- category_df$name
  id_row <- subset(category_df, values == id_char)

  if (nrow(id_row) == 1) {
    id_row$id
  } else {
    typo_dist <- adist(id_char, values)[1, ]

    if (any(typo_dist == 1)) {
      extra <- paste0(" Did you mean ", toString(values[typo_dist == 1]), "?")
    } else {
      extra <- ""
    }
    stop("Unable to find ",  id_char, " in the ", category, " dataset.", extra)
  }
}
