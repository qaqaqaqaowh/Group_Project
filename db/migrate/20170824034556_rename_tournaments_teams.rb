class RenameTournamentsTeams < ActiveRecord::Migration[5.1]
  def change
  	rename_table :tournaments_teams, :teams_tournaments
  end
end
