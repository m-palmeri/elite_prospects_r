

test_that("Connor McDavid Tests", {
  player_info <- get_player_info("https://www.eliteprospects.com/player/183442/connor-mcdavid")

  expect_equal(player_info$height, 185)
  expect_equal(player_info$draft_year, 2015)
  expect_equal(player_info$draft_team, "Edmonton Oilers")
  expect_na(player_info$status)
})



test_that("Nicholas West Tests", {
  player_info <- get_player_info("https://www.eliteprospects.com/player/289172/nicholas-west")

  expect_na(player_info$height)
  expect_na(player_info$weight)
  expect_na(player_info$cap_hit)
  expect_na(player_info$draft_year)
  expect_na(player_info$agency)
  expect_equal(player_info$status, "Retired")
})



test_that("Filip Forsberg Tests", {
  player_info <- get_player_info("https://www.eliteprospects.com/player/29626/filip-forsberg")

  expect_equal(player_info$height, 187)
  expect_equal(player_info$youth_team, "Leksands IF")
  expect_equal(player_info$shoots, "R")
})



test_that("John Blum Tests", {
  player_info <- get_player_info("https://www.eliteprospects.com/player/68038/john-blum")

  expect_equal(player_info$position, "D")
  expect_na(player_info$cap_hit)
  expect_na(player_info$draft_year)
  expect_na(player_info$agency)
  expect_equal(player_info$status, "Retired")
  expect_equal(player_info$staff_id, 2321)
  expect_match(player_info$staff_link, "john-blum")
})

test_that("Pekka Rinne Tests", {
  player_info <- get_player_info("https://www.eliteprospects.com/player/4282/pekka-rinne")

  expect_equal(player_info$position, "G")
  expect_equal(player_info$youth_team, "Kempeleen Kiekko-Ketut")
  expect_equal(player_info$draft_year, 2004)
  expect_equal(player_info$staff_id, 5510)
})

test_that("Tommy Green Tests", {
  player_info <- get_player_info("https://www.eliteprospects.com/player/96540/tommy-green")

  expect_equal(player_info$position, "G")
  expect_na(player_info$height)
  expect_na(player_info$place_of_birth)
  expect_na(player_info$draft_round)
  expect_na(player_info$staff_id)
  expect_na(player_info$staff_link)
})
