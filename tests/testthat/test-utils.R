test_that("clean_category works", {
  expect_identical(clean_category("Pokemon"), "pokemon")
  expect_identical(clean_category("PoKEmoN"), "pokemon")
  expect_identical(clean_category("Evolution Chain"), "evolution-chain")
})
