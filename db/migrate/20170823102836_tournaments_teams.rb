class TournamentsTeams < ActiveRecord::Migration[5.1]
  def change
  	create_table :tournaments_teams do |t|
  		t.integer :tournament_id
  		t.integer :team_id
  	end
  end
end
