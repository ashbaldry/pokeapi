## code to prepare `DATASET` dataset goes here
devtools::load_all()
req <- httr2::request(POKEAPI_BASE_URL)

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
  "egg-group", "gender", "growth-rate", "nature", "pokeathlon-stat", "pokemon",
  "pokemon-color", "pokemon-form", "pokemon-habitat", "pokemon-shape", "pokemon-species",
  "stat", "type"
)

pk_ids <- lapply(groups, \(group) {
  Sys.sleep(2)
  cat(group, "\n")
  pokemon_res <- req |>
    httr2::req_url_path_append(group) |>
    httr2::req_url_query(limit = 100000, offset = 0) |>
    httr2::req_perform()

  pokemon <- pokemon_res |>
    httr2::resp_body_json(simplifyDataFrame = TRUE) |>
    (\(x) x$results)()
  pokemon$id <- as.integer(basename(pokemon$url))
  pokemon <- pokemon[, c("id", "name")]
  pokemon
})
pk_ids <- setNames(pk_ids, groups)

usethis::use_data(pk_ids, overwrite = TRUE, internal = TRUE)
