get_league_teams <- function(website = NULL,
                             league = NULL,
                             season = NULL,
                             force = F) {

  function_call <- match.call()
  website <- .website_parameter_check(website, league, season, "league",
                                      function_call, "/", force)

  page <- rvest::read_html(website)

  table_setup <- page %>%
    rvest::html_elements("div[id='standings']") %>%
    rvest::html_elements("table")
  temp_table <- table_setup %>%
    rvest::html_table() %>%
    magrittr::extract2(1)

  rename_temp <- .rename_df_helper(temp_table)
  numeric_cols <- rename_temp[[2]]

  team_links <- .get_table_links(table_setup, "team")
  team_ids <- .get_website_id(team_links)

  league_standings <- rename_temp[[1]] %>%
    dplyr::select(-`#`) %>%
    dplyr::rename_with(tolower) %>%
    dplyr::filter(!.is_coerce_numeric(games_played)) %>%
    dplyr::mutate(team_link = team_links,
                  team_id = team_ids) %>%
    replace(., . == "-", NA_character_) %>%
    dplyr::select(team_id, team, team_link, tidyselect::everything()) %>%
    dplyr::mutate(dplyr::across(tidyselect::all_of(numeric_cols), as.numeric),
                  dplyr::across(dplyr::where(is.character), trimws)) %>%
    dplyr::rename(goal_differential = plus_minus) %>%
    dplyr::arrange(-points_per_game, -goal_differential)

  return(league_standings)
}
