test_that("name_to_id returns the same value if the input is a number", {
  expect_identical(name_to_id(5, "pokemon"), 5)
  expect_identical(name_to_id(100, "pokemon"), 100)
})

test_that("name_to_id returns the right value if the input is a character", {
  expect_identical(name_to_id("bulbasaur", "pokemon"), 1L)
  expect_identical(name_to_id("voltorb", "pokemon"), 100L)
})

test_that("name_to_id returns an error if character ID and no category", {
  expect_error(name_to_id("bulbasaur"))
})

test_that("name_to_id returns an error if it doesn't recognise the name", {
  expect_error(name_to_id("bowlbasore", "pokemon"), "bowlbasore.*pokemon")
})

test_that("name_to_id returns provides a potential result if the name is similar", {
  expect_error(name_to_id("bulbasore", "pokemon"), "bulbasaur")
  expect_error(find_numeric_id("bulbasore", "pokemon", 2), ".*(?!bulbasaur)", perl = TRUE)
})

test_that("check_category returns no error if category exists", {
  expect_error(check_category("pokemon"), NA)
  expect_error(check_category("super-contest-effect"), NA)
})

test_that("check_category returns error if category doesn't exist", {
  expect_error(check_category("dsfsdfdsfsdf"))
})

test_that("check_category returns error if category exists, but doesn't include names", {
  expect_error(check_category("super-contest-effect", named = TRUE))
})

test_that("check_category returns a potential solution if it finds a similar name", {
  expect_error(check_category("pokkemon"), "pokemon")
})
