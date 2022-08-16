POKEAPI_BASE_URL <- "https://pokeapi.co/api/v2"
POKEAPI_VERSION <- 2

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
