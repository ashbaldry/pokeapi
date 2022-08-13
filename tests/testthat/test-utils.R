test_that("clean_category works", {
  expect_identical(clean_category("Pokemon"), "pokemon")
  expect_identical(clean_category("PoKEmoN"), "pokemon")
  expect_identical(clean_category("Evolution Chain"), "evolution-chain")
})

test_that("Americanising clean_category works", {
  expect_identical(clean_category("Berry Flavor"), "berry-flavor")
  expect_identical(clean_category("Berry Flavour"), "berry-flavor")
  expect_identical(clean_category("Pokemon Colour"), "pokemon-color")
})
