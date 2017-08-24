class RenameUsersTeams < ActiveRecord::Migration[5.1]
  def change
  	rename_table :users_teams, :teams_users
  end
end
