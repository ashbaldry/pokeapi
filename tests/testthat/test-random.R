test_that("check random_pk_id works", {
  expect_true(random_pk_id("pokemon") %in% pk_ids$pokemon$id)
  expect_true(random_pk_id("POKEMON") %in% pk_ids$pokemon$id)
})

test_that("check random_pk_id works", {
  expect_error(random_pk_id("POKSDAakdsl"))
})
