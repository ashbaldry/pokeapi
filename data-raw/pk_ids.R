## code to prepare `DATASET` dataset goes here
devtools::load_all()

# Going by API v2 Docs
groups <- c(
  "berry", "berry-firmness", "berry-flavor",
  "contest-type",
  "encounter-method", "encounter-condition", "encounter-condition-value",
  "evolution-trigger",
  "generation", "pokedex", "version", "version-group",
  "item", "item-attribute", "item-category", "item-fling-effect", "item-pocket",
  "location", "location-area", "pal-park-area", "region",
  "move", "move-ailment", "move-battle-style", "move-category", "move-damage-class",
  "move-learn-method", "move-target",
  "ability", "egg-group", "gender", "growth-rate", "nature", "pokeathlon-stat",
  "pokemon", "pokemon-color", "pokemon-form", "pokemon-habitat", "pokemon-shape", "pokemon-species",
  "stat", "type"
)

pk_ids <- lapply(groups, \(group) {
  Sys.sleep(2)
  cat(group, "\n")
  get_category_ids(group)[, c("id", "name")]
})
pk_ids <- setNames(pk_ids, groups)

usethis::use_data(pk_ids, overwrite = TRUE, internal = TRUE)
