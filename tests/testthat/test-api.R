test_that("All API endpoint calls work", {
  skip_on_cran()
  Sys.setenv(R_POKEAPI_CACHE = FALSE)

  endpoint_calls <-  ls("package:pokeapi", pattern = "^get_")
  endpoint_calls <- setdiff(endpoint_calls, c("get_category_ids", "get_pk_cache"))

  for (endpoint_call in endpoint_calls) {
    Sys.sleep(2)

    endpoint_func <- getFromNamespace(endpoint_call, "pokeapi")
    response <- endpoint_func(1)

    expect_type(response, "list")
    # Different results for get_pokemon_location_area than the other endpoints
    if (endpoint_call != "get_pokemon_location_area") expect_equal(response$id, 1)
  }
})

test_that("get_category_ids API works", {
  skip_on_cran()
  Sys.setenv(R_POKEAPI_CACHE = FALSE)

  Sys.sleep(2)
  response <- get_category_ids("pokemon")
  expect_s3_class(response, "data.frame")
})

test_that("list_categories prints all categories", {
  list_categories_output <- capture_output(list_categories())
  for (category in paste0("\\b", CATEGORIES, "\\b")) {
    expect_match(list_categories_output, category)
  }
})
