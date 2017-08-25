class AddNoTeamNoPlayersToTornaments < ActiveRecord::Migration[5.1]
  def change
  	add_column :tournaments, :num_teams, :integer
  	add_column :tournaments, :num_players, :integer


  end
end
