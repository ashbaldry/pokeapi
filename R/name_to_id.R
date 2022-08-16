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

    if (any(typo_dist == tolerance)) {
      extra <- paste0(" Did you mean ", toString(categories[typo_dist <= tolerance]), "?")
    } else {
      extra <- ""
    }
    stop("Unable to find selected category.", extra)
  }
}

CATEGORIES_LIST <- list(
  Berry = c("berry", "berry-firmness", "berry-flavor"),
  Contest = c("contest-type", "contest-effect", "super-contest-effect"),
  Encounter = c("encounter-method", "encounter-condition", "encounter-condition-value"),
  Evolution = c("evolution-chain", "evolution-trigger"),
  Game = c("generation", "pokedex", "version", "version-group"),
  Item = c("item", "item-attribute", "item-category", "item-fling-effect", "item-pocket"),
  Location = c("location", "location-area", "pal-park-area", "region"),
  Machine = "machine",
  Move = c(
    "move", "move-ailment", "move-battle-style", "move-category", "move-damage-class",
    "move-learn-method", "move-target"
  ),
  Pokemon = c(
    "ability", "characteristic", "egg-group", "gender", "growth-rate", "nature", "pokeathlon-stat",
    "pokemon", "pokemon-color", "pokemon-form", "pokemon-habitat", "pokemon-shape", "pokemon-species",
    "stat", "type"
  )
)

CATEGORIES <- unlist(CATEGORIES_LIST, use.names = FALSE)

CATEGORIES_NAMED <- setdiff(
  CATEGORIES,
  c("contest-effect", "super-contest-effect", "evolution-chain", "machine", "characteristic")
)
