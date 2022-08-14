test_that("All API endpoint calls work", {
  skip_on_cran()
  Sys.setenv(R_POKEAPI_CACHE = FALSE)

  endpoint_calls <-  ls("package:pokeapi", pattern = "^get_")
  endpoint_calls <- setdiff(endpoint_calls, c("get_category_ids", "get_pk_cache"))

  for (endpoint_call in endpoint_calls) {
    Sys.sleep(2)
    cat(endpoint_call, "\n")

    endpoint_func <- get(endpoint_call)
    response <- endpoint_func(1)

    expect_type(response, "list")
    # Different results for get_pokemon_location_area than the other endpoints
    if (endpoint_call != "get_pokemon_location_area") expect_equal(response$id, 1)
  }
})
