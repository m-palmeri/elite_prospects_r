

test_that("error catching", {
  expect_error(get_league_skaters(website = NULL, league = NULL, season = NULL))
  expect_error(get_league_skaters(website = "test", league = "test", season = NULL))
  expect_error(get_league_skaters(league = "NHL", season = NULL))
})


test_that("parameter check", {
  #using 2000 nhl as check
  with_website <- get_league_skaters(website = "https://www.eliteprospects.com/league/nhl/stats/2000-2001")

  with_uppercase <- get_league_skaters(league = "NHL", season = "2000-2001")

  with_lowercase <- get_league_skaters(league = "nhl", season = "2000-2001")

  comp <- load_test_rds("nhl_2000_2001_skaters.rds")

  expect_equal(with_website, comp)
  expect_equal(with_uppercase, comp)
  expect_equal(with_lowercase, comp)

})


test_that("WJC-18 2018 check", {
  wjc_2018 <- get_league_skaters(league = "wjc-18", season = "2018-2019")

  comp <- load_test_rds("wjc_2018_2019_skaters.rds")

  expect_equal(wjc_2018, comp)
})


test_that("WHA All-Time check", {
  wha_alltime <- get_league_skaters(league = "WHA", season = "all-time", force = T)

  comp <- load_test_rds("wha_alltime_skaters.rds")

  expect_equal(wha_alltime, comp)
})
