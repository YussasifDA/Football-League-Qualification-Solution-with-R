# Create a list of teams with their data
teams <- list(
  Team_A = c(goals_scored = 10, goals_conceded = 5, yellow_cards = 3, red_cards = 1),
  Team_B = c(goals_scored = 8, goals_conceded = 4, yellow_cards = 2, red_cards = 0),
  Team_C = c(goals_scored = 12, goals_conceded = 8, yellow_cards = 4, red_cards = 2),
  Team_D = c(goals_scored = 6, goals_conceded = 7, yellow_cards = 1, red_cards = 0),
  Team_E = c(goals_scored = 7, goals_conceded = 9, yellow_cards = 3, red_cards = 1),
  Team_F = c(goals_scored = 9, goals_conceded = 6, yellow_cards = 2, red_cards = 0)
)

# Define the point system
goals_scored_points <- 1
goals_conceded_points <- -1
yellow_card_points <- -1
red_card_points <- -2

# Calculate points for each team
for (team_name in names(teams)) {
  team <- teams[[team_name]]
  total_points <- (
    team["goals_scored"] * goals_scored_points +
      team["goals_conceded"] * goals_conceded_points +
      team["yellow_cards"] * yellow_card_points +
      team["red_cards"] * red_card_points
  )
  teams[[team_name]]$total_points <- total_points
}

# Convert the list of teams to a data frame
teams_df <- data.frame(
  Team = names(teams),
  Total_Points = sapply(teams, function(team) team$total_points)
)

# Sort teams based on total points
sorted_teams <- teams_df[order(teams_df$Total_Points, decreasing = TRUE), ]

# Select the top 4 teams as qualified
qualified_teams <- sorted_teams[1:1, ]

# Display qualification status
qualified_teams$Qualification_Status <- "Qualified"
teams_df$Qualification_Status <- ifelse(teams_df$Team %in% qualified_teams$Team, "Qualified", "Not Qualified")

print(teams_df)
