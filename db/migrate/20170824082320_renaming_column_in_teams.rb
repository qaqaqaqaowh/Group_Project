class RenamingColumnInTeams < ActiveRecord::Migration[5.1]
  def change
  	rename_column :teams, :admin_id, :user_id
  end
end
